package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dao.CotationDao;
import entity.Moedas;


@WebServlet(name = "dollar", urlPatterns = { "/viewdollar/dollar" })
public class DollarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	
	private CotationDao cotationDao;
	
    public DollarServlet() {
       this.cotationDao = new CotationDao();
    }
    
//    private static HttpURLConnection connection;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
//		 System.out.println("Chamando Método Get");
//		    CotationDao contatoDAO = new CotationDao();
//
		ArrayList<Moedas> lista = cotationDao.selectAllCotation();
//
//		    //Atribuir a Lista no request
//		    request.setAttribute("lista", lista );
//
//		    //Encaminhando para o JSP
//		    RequestDispatcher saida= request.getRequestDispatcher("/viewdollar/exibeContations.jsp");
//		    saida.forward(request, response);
//		    System.out.println("saida Get" + lista);
		    
		// encaminhar a lista de moedas para a tela 
		
		request.setAttribute("teste", lista);
		RequestDispatcher rd = request.getRequestDispatcher("/viewdollar/exibeContations.jsp");
		rd.forward(request, response);
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
	    JsonElement code = rootobj; // Get value by code name

	   Gson gson = new GsonBuilder().setPrettyPrinting().create();
	   
	   //Convertendo um objeto Java para JSON e retorna uma String JSON formatada.
	   String JsonConvertido = gson.toJson(code);
	   
	   
	   JSONObject jsonObjectMoedas = new JSONObject(JsonConvertido);

	   List<Moedas> listaDeMoedas = new ArrayList<Moedas>();
	   
	   
	   Iterator<String> iteratormoedas = jsonObjectMoedas.keys();
	   while (iteratormoedas.hasNext()) {
		   
	      JSONObject dadosMoedas = jsonObjectMoedas.getJSONObject(iteratormoedas.next());

	      Moedas moedas = new Moedas();
	      moedas.setCode(dadosMoedas.getString("code"));
	      moedas.setCodein(dadosMoedas.getString("codein"));
	      moedas.setName(dadosMoedas.getString("name"));
	      moedas.setHigh(dadosMoedas.getFloat("high"));
	      moedas.setLow(dadosMoedas.getFloat("low"));
	      moedas.setVarBid(dadosMoedas.getFloat("varBid"));
	      moedas.setPctChange(dadosMoedas.getFloat("pctChange"));
	      moedas.setBid(dadosMoedas.getFloat("bid"));
	      moedas.setAsk(dadosMoedas.getFloat("ask"));
	      moedas.setTimestamp(dadosMoedas.getLong("timestamp"));
	      moedas.setCreate_date(dadosMoedas.getString("create_date"));

	      listaDeMoedas.add(moedas);
	      cotationDao.store(moedas);
	   }  
	}
	
	
	

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
