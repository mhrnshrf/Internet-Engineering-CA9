package far;

import java.io.*;
import java.net.*;
import java.util.*;
import com.sun.net.httpserver.*;
//import ir.ramtung.coolserver.*;

public class IOCRequest extends Request{
	public IOCRequest(int id, String symbolName, int quantity, int price, int customerID, String type){
		this.s = symbolName;
		this.quantity = quantity;
		this.id = id;
		this.price = price;
		this.customerID = customerID;
		this.type = type;
		this.status = "IOC";
	}
	public Request copyRequest(){
		return new IOCRequest(id, s, quantity, price, customerID, type);
	}
	public void updatePrice(){}
	public void addToList(){
		if (type.equals("sell"))
			Symbol.getSymbol(s).sell.add(0,this);
		else
			Symbol.getSymbol(s).buy.add(0,this);

	}
	public String checkOrder(){
		if (type.equals("sell")) {
			if(Symbol.getSymbol(s).buy.size()==0){
				Customer.getCustomer(getID()).addRejected(this);
				Symbol.getSymbol(s).sell.remove(0);
				return "Order is declined";
			}
			int sumStock = 0;
			for (int i =0; i < Symbol.getSymbol(s).buy.size() && Symbol.getSymbol(s).buy.get(i).getPrice() >= getPrice(); i++){
				Customer c = Customer.getCustomer(Symbol.getSymbol(s).buy.get(i).getID());
				if (c.getCash() < Symbol.getSymbol(s).buy.get(i).getPrice() *Symbol.getSymbol(s).buy.get(i).getQuant()) {
					Symbol.getSymbol(s).buy.remove(i);
					i--;
					continue;
				}
				sumStock += Symbol.getSymbol(s).buy.get(i).getQuant();
			}

			if (sumStock < getQuant()) {
				Customer.getCustomer(getID()).addRejected(this);
				Symbol.getSymbol(s).sell.remove(0);
				return "Order is declined";
			}
		}
		else{
			if (Symbol.getSymbol(s).sell.size() == 0) {
				Customer.getCustomer(getID()).addRejected(this);
				Symbol.getSymbol(s).buy.remove(0);
				return "Order is declined";
			}
			int sumStock = 0;
			int sumPrice = 0;
			for (int i = 0; i < Symbol.getSymbol(s).sell.size() && Symbol.getSymbol(s).sell.get(i).getPrice() <= getPrice(); i++){
				int oldSum = sumStock;
				sumStock += Symbol.getSymbol(s).sell.get(i).getQuant();
				if (sumStock >= getQuant()) {
					sumPrice += (getQuant() - oldSum)*getPrice();
					break;
				}
				sumPrice += Symbol.getSymbol(s).sell.get(i).getQuant()*getPrice();
			}
			if (sumStock < getQuant() || sumPrice > Customer.getCustomer(getID()).getCash()) {
				Customer.getCustomer(getID()).addRejected(this);
				Symbol.getSymbol(s).buy.remove(0);
				return "Order is declined";
			}

		}
		return "";
	}
}
