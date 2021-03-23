package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dao.CotationDao;
import entity.Cotation;


@WebServlet(name = "dollar", urlPatterns = { "/viewdollar/dollar" })
public class DollarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	
	private CotationDao cotationDao;
	
    public DollarServlet() {
       this.cotationDao = new CotationDao();
    }
    
    private static HttpURLConnection connection;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sURL = "https://economia.awesomeapi.com.br/json/all"; //just a string

	    // Connect to the URL using java's native library
	    URL url = new URL(sURL);
	    URLConnection json = url.openConnection();
	    json.connect();

	    // Convert to a JSON object to print data
	    JsonParser jp = new JsonParser(); //from gson
	    JsonElement root = jp.parse(new InputStreamReader((InputStream) json.getContent())); //Convert the input stream to a json element
	    JsonObject rootobj = root.getAsJsonObject(); //May be an array, may be an object. 
	    JsonElement code = rootobj.get("USD"); // pegar valor por código.	
	    
	    //Get values by name from CODIGO 
	    JsonElement codein = ((JsonObject) code).get("code");
		JsonElement name = ((JsonObject) code).get("name");
	    JsonElement price = ((JsonObject) code).get("high");
	    JsonElement buying = ((JsonObject) code).get("bid");
	    JsonElement selling = ((JsonObject) code).get("ask");
	    JsonElement variation_high = ((JsonObject) code).get("high");
	    JsonElement variation_low = ((JsonObject) code).get("low");
	    JsonElement date = ((JsonObject) code).get("create_date");
	    
	    //Convert values to String 
	    String getcodein = codein.toString();
	    String getname = name.toString();
	    String getprice = price.toString();
	    String getbuying = buying.toString();
	    String getselling = selling.toString();
	    String getvariation_high = variation_high.toString();
	    String getvariation_low = variation_low.toString();
	    
	    Cotation newCotation = new Cotation(getcodein, getname, getprice,  getbuying, getselling, getvariation_high , getvariation_low);
       cotationDao.store(newCotation);
        
        
//		  JsonElement name = ((JsonObject) code).get("name");
//		    JsonElement price = ((JsonObject) code).get("high");
//		    JsonElement buying = ((JsonObject) code).get("bid");
//		    JsonElement selling = ((JsonObject) code).get("ask");
//		    JsonElement variation_high = ((JsonObject) code).get("high");
//		    JsonElement variation_low = ((JsonObject) code).get("low");
//		    JsonElement date = ((JsonObject) code).get("create_date");
	    
	    //response.getWriter().append(code+""+ name + price + buying + selling + variation_high + variation_low + date);

	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
