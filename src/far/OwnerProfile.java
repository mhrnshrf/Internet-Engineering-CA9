package far;

import java.io.*;
import java.net.*;
import java.util.*;
import com.sun.net.httpserver.*;

public class OwnerProfile extends Profile{

  public OwnerProfile(Customer c){
    this.type = "owner";

    name = c.getName();
    family = c.getFamily();
    id = c.getID();

    //???????????????????????????????????????????????//
    //System inf
  }
}
