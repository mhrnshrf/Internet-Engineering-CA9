package far;

import java.io.*;
import java.net.*;
import java.util.*;
import com.sun.net.httpserver.*;
import java.sql.*;
//import ir.ramtung.coolserver.*;

public class GTCRequest extends Request{
	public GTCRequest(int id ,String symbolName, int quantity, int price, int customerID, String type){
		this.id = id;
		this.s = symbolName;
		this.quantity = quantity;
		this.price = price;
		this.customerID = customerID;
		this.type = type;
		this.status = "GTC";
	}
	public Request copyRequest(){
		return new GTCRequest(id, s, quantity, price, customerID, type);
	}
	public void updatePrice(){}
	public void addToList(){
		if (type.equals("sell")) {
			int i;
			for (i = 0; i < Symbol.getSymbol(s).sell.size() ; i++) {
				if(price < Symbol.getSymbol(s).sell.get(i).getPrice())
					break;

			}
			Symbol.getSymbol(s).sell.add(i,this);
		}
		else{
			int i;
			for (i = 0; i < Symbol.getSymbol(s).buy.size() ; i++) {
				if(price > Symbol.getSymbol(s).buy.get(i).getPrice())
					break;

			}

			Symbol.getSymbol(s).buy.add(i,this);
		}
		// try{
		// 	Database.getDB().insertReq(this);
		//
		// }
		// catch(SQLException e){
		// 	System.err.println("unable to insert req");
		// }
	}
	public String checkOrder(){
		if (Symbol.getSymbol(s).buy.size() == 0 || Symbol.getSymbol(s).sell.size() == 0)
			return "Order is queued";
		return "";
	}

}
