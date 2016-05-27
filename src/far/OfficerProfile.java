package far;

import java.io.*;
import java.net.*;
import java.util.*;
import com.sun.net.httpserver.*;

public class OfficerProfile extends Profile{

  public OfficerProfile(Customer c){
    this.type = "officer";

    name = c.getName();
    family = c.getFamily();
    id = c.getID();

  }
}
