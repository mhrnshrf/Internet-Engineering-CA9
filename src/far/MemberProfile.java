package far;

import java.io.*;
import java.net.*;
import java.util.*;
import com.sun.net.httpserver.*;

public class MemberProfile extends Profile{

  public MemberProfile(Customer c){
    this.type = "member";

    name = c.getName();
    family = c.getFamily();
    id = c.getID();

    cash = c.getCash();
    stocks = c.getStocks();
    waitings = c.getWaitings();
  }

  private int cash;
  private Map<String, Integer> stocks;
  private ArrayList<WaitingCustomer> waitings;
}
