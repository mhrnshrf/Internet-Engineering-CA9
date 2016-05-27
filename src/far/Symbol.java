package far;

import java.io.*;
import java.net.*;
import java.util.*;
import com.sun.net.httpserver.*;
//import ir.ramtung.coolserver.*;
import java.lang.reflect.*;
import java.sql.*;

public class Symbol{
	String name;
	public ArrayList<Request> buy;
	public ArrayList<Request> sell;
	// public static ArrayList<Symbol> list = new ArrayList<Symbol>();
	public Symbol(String name){
		this.name = name;
		buy = new ArrayList<Request>();
		sell = new ArrayList<Request>();
	}

	public Symbol(String name, ArrayList<Request> b, ArrayList<Request> s){
		this.name = name;
		buy = b;
		sell = s;
	}

	public String getName(){return name;}

	public static boolean exist(String n){
		Database db = Database.getDB();
		try{
			if(db.findSymbolByName(n) != null)
				return true;
		}
		catch(SQLException se) {
			System.err.println("Not Found");
		}
		return false;
	}

	public static Symbol getSymbol(String n){
		try{
			return Database.getDB().findSymbolByName(n);
		}
		catch (SQLException se){
			System.err.println("Not Found");
			return null;
		}
	}

	public String updateList(int id, String instrument, int price, int quantity, String type, String req){

		/*Class co = ReqContainer.loadClass("./class", type);
		if (co != null) {
			try{
				System.err.println(co.getName());
				r = (Request)co.getDeclaredConstructor(String.class, int.class, int.class, int.class, String.class).newInstance(instrument, quantity, price, id, req);

			}
			catch(Exception ex){

			}
		}
*/
		Request r;
		if(type.equals("GTC"))
			r = new GTCRequest(0,instrument, quantity, price, id, req);
		else if(type.equals("MPO"))
			r = new MPORequest(0,instrument, quantity, price, id, req);
		else if(type.equals("IOC"))
			r = new IOCRequest(0,instrument, quantity, price, id, req);
		else
			return "invalid type";


		if (req.equals("sell")) {
			if(id!=1 && quantity > Customer.getCustomer(id).stocks.get(instrument))
				return "Not enough share";
			try{
				Database.getDB().insertReq(r);
				sell = Database.getDB().findSymbolByName(name).sell;
			}
			catch(SQLException s){
				System.err.println("req did not add to DB");
			}
			r.addToList();
		}
		if (req.equals("buy")) {
			if(quantity*price > Customer.getCustomer(id).getCash())
				return "Not enough money";
			try{
				Database.getDB().insertReq(r);
				buy = Database.getDB().findSymbolByName(name).buy;
			}
			catch(SQLException s){
				System.err.println("req did not add to DB");
			}
			r.addToList();
		}
		return bargain(r);
	}
	public String bargain(Request r){
		String ans = r.checkOrder();
		if (ans.length() != 0)
			return ans;
		StringBuilder response = new StringBuilder();
		System.err.println(name + ": sell size: " + sell.size() + " buy size: " + buy.size());
		while(sell.size()!= 0 && buy.size() != 0 && sell.get(0).getPrice() <= buy.get(0).getPrice()){
			int q = buy.get(0).getQuant() - sell.get(0).getQuant();
			Request b = buy.get(0).copyRequest();
			Request s = sell.get(0).copyRequest();
			int stockNum;
			int sellerID = sell.get(0).getID();
			int buyerID = buy.get(0).getID();
			int p = buy.get(0).getPrice();
			if(q < 0){

				stockNum = buy.get(0).getQuant();
				s.setQuant(buy.get(0).getQuant());
				buy.get(0).setQuant(0);
				sell.get(0).setQuant((-1)*q);
				Customer.getCustomer(buy.get(0).getID()).update(b, "buy");
				Customer.getCustomer(sell.get(0).getID()).update(s, "sell");
//Buyer, Seller, instrument, type of trade, quantity, Buyer Remained Money, Seller Current Money
				Transaction.list.add(
					new Transaction(
						buyerID,
						sellerID,
						name,
						buy.get(0).getType(),
						(-1)*q,
						Customer.getCustomer(buy.get(0).getID()).getCash(),
						Customer.getCustomer(sell.get(0).getID()).getCash()));
				buy.remove(0);
			}
			else{

				b.setQuant(sell.get(0).getQuant());
				stockNum = sell.get(0).getQuant();
				buy.get(0).setQuant(q);
				sell.get(0).setQuant(0);
				Customer.getCustomer(buy.get(0).getID()).update(b, "buy");
				Customer.getCustomer(sell.get(0).getID()).update(s, "sell");
				sell.remove(0);
				if (q == 0)
					buy.remove(0);
			}
			// ‫‪123‬‬ ‫‪sold‬‬ ‫‪40‬‬ ‫‪shares‬‬ ‫‪o‬‬ ‫‪f‬‬ ‫‪RANA1‬‬ ‫‪@130‬‬ ‫‪to‬‬ ‫‪345‬‬
			if(response.length()!=0)
				response.append("<br>");
			response.append(sellerID);
			response.append(" sold ");
			response.append(stockNum);
			response.append(" shares of ");
			response.append(name);
			response.append(" @");
			response.append(p);
			response.append(" to ");
			response.append(buyerID);
			System.err.println(response);
			if (buy.size() == 0 || sell.size() == 0)
				break;
			// if (buy.size() != 0 && buy.get(0).getType().equals("MPO"))
			// 	buy.get(0).setPrice(sell.get(0).getPrice());
			// else if (buy.size() != 0 && sell.get(0).getType().equals("MPO"))
			// 	sell.get(0).setPrice(buy.get(0).getPrice());

			buy.get(0).updatePrice();
			sell.get(0).updatePrice();
		}
		if (response.length() == 0)
			return "Order is queued";
		return response.toString();
	}
}
