package far;

import java.io.*;
import java.net.*;
import java.util.*;
import com.sun.net.httpserver.*;
import java.sql.*;
//import ir.ramtung.coolserver.*;

public class Customer{
	int _id;
	public int id;
	int cash;
	public String name;
	public String family;
	String pass;
	String email;
	Map<String, Integer> stocks;

	ArrayList<Request> doneReq;
	ArrayList<Request> rejectedReq;
	ArrayList<Request> processingReq;

	public Customer(int _id, int id, String name, String family, String pass, String email){
		this._id = _id;
		this.id = id;
		this.name = name;
		this.family = family;
		this.cash = 0;
		this.pass = pass;
		this.email = email;
		try{
	 		stocks = Database.getDB().findShareByID(_id);
		} catch(SQLException s){
			System.err.println("error in Customer/findShareByID");
		}
		doneReq = new ArrayList<Request>();
		rejectedReq = new ArrayList<Request>();
		processingReq = new ArrayList<Request>();

	}

	public String getPass(){return pass;}

	public Map<String, Integer> getStocks(){
		//wrooooooooooooooonnnnnnnnnnnnnnnnnnng!!!
		//has_share table
		try{
	 		return Database.getDB().findShareByID(_id);
		} catch(SQLException s){
			System.err.println("error in getStocks/findShareByID");
			return null;
		}
	}

	public ArrayList<WaitingCustomer> getWaitings(){
		ArrayList<WaitingCustomer> w = new ArrayList<WaitingCustomer>();
		for(int i = 0; i<WaitingCustomer.waitList.size(); i++)
			if(WaitingCustomer.waitList.get(i).customer.get_ID() == _id)
				w.add(WaitingCustomer.waitList.get(i));
		return w;
	}
	//
	// public static ArrayList<Customer> list = new ArrayList<Customer>(){
	// 	{
	// 		add(new Customer(1,"admin","admin"));
	// 	}
	// };

	public static boolean exist(int id){
		Database db = Database.getDB();
		try{
			if(db.findCustByID(id) != null)
				return true;
		}
		catch(SQLException se) {
			System.err.println("Customer/exist Not Found");
		}
		return false;
	}

	public static Customer getCustomer(int id){
		try{
			return Database.getDB().findCustByID(id);
		}
		catch (SQLException se){
			System.err.println("Customer/get Not Found");
			return null;
		}
	}

	public int getID(){return id;}
	public String getName(){return name;}
	public String getFamily(){return family;}
	public String getEmail(){return email;}
	public int get_ID(){return _id;}
	public void set_ID(int i){ _id = i;}
	public void deposit(int amount){
		cash = cash + amount;
		try{
			System.err.println("in deposit bef updateCustCash cash: " + cash + " amount: " + amount);
			Database.getDB().updateCustCash(this, cash + amount);

		}
		catch (SQLException s){
			System.err.println("unable to update cash");
		}
	}
	public boolean withdraw(int amount){

		if ( cash < amount)
			return false;

		cash = cash - amount;
		return true;

	}
	public void update(Request r, String req){
		try{
			if (req.equals("buy")) {
				// cash -= r.getPrice()*r.getQuant();
				System.err.println("in buy update for req number: " + r.getID() +  ": cash:" + cash +" req price:" + r.getPrice() + " req quant: " + r.getQuant());
				Database.getDB().updateCustCash(this, cash - r.getPrice()*r.getQuant());
				// if(!stocks.containsKey(r.getSymbol()))
				// 	stocks.put(r.getSymbol(), r.getQuant());
				// else
				// 	stocks.put(r.getSymbol(), stocks.get(r.getSymbol()) + r.getQuant());
				Database.getDB().insertShare(_id, Database.getDB().findSymbolByName(r.getSymbol()), r.getQuant());
			}
			else{
				// cash += r.getPrice()*r.getQuant();
				System.err.println("in sell update for req number: " + r.getID() +  ": cash:" + cash +" req price:" + r.getPrice() + " req quant: " + r.getQuant());

				Database.getDB().updateCustCash(this, cash + r.getPrice()*r.getQuant());
				// if(!stocks.containsKey(r.getSymbol()))
				// 	stocks.put(r.getSymbol(), r.getQuant());
				// else
				// 	stocks.put(r.getSymbol(), stocks.get(r.getSymbol()) - r.getQuant());
				Database.getDB().insertShare(_id, Database.getDB().findSymbolByName(r.getSymbol()), (-1) * r.getQuant());
			}
		} catch (Exception e){
			System.err.println("error in Customer update.");
		}


		for (int i =0; i < processingReq.size() ; i++) {
			if (processingReq.get(i).getQuant() == 0)
				processingReq.remove(i);
		}
		// doneReq.add(r);
		try{
			Database.getDB().changeStat(r, "done");
		}
		catch(SQLException s){
			System.err.println(s.getMessage());
		}

	}
	public boolean canAfford(Request r){
		if (r.getQuant() * r.getPrice() > cash )
			return false;
		return true;
	}
	public int getCash(){ return cash;}
	public void addRejected(Request r){
		rejectedReq.add(r);
	}
	public int getShare(String instrument){
		if(stocks.containsKey(instrument))
			return stocks.get(instrument);
		return 0;
	}
}
