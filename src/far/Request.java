package far;

import java.io.*;
import java.net.*;
import java.util.*;
import com.sun.net.httpserver.*;
//import ir.ramtung.coolserver.*;


public abstract class Request{
	protected int id;
	protected String s;
	protected int quantity;
	protected int price;
	protected int customerID;
	protected String type;
	protected String time;
	protected String status;
		
	// concept of "type" is changed!!!!!!!!!!!!!!!!!!!!!
	public abstract Request copyRequest();
	public int getPrice(){return price;}
	public int getCode(){return id;}
	public int getQuant(){return quantity;}
	public int getID(){return customerID;}
	public String getStat(){return status;}
	public String getTime(){return time;}
	public String getType(){return type;}
	public String getSymbol(){return s;}
	public void setQuant(int q){quantity = q;}
	public void setPrice(int p){price = p;}
	public void setCode(int c){id = c;}
	public void setCustID(int i){customerID = i;}
	public void setStat(String s){status = s;}
	public void setTime(String ts){time = ts;}
	public abstract void updatePrice();
	public abstract void addToList();
	public abstract String checkOrder();
}
