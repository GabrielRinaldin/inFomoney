package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.Dao;
import entity.Moedas;

public class CotationDao extends Dao{
	
	private static final String INSERT = "INSERT INTO Moedas (code,codein,name,high,low,varBid,ask,pctChange,bid,timestamp,create_date) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
	private static final String SELECTCODE = "SELECET * FROM Moedas WHERE code = ?";
	private static final String DELETE = "DELETE FROM VALUES_COTATION WHERE ID = ?";

	 
	//Salva no banco
	public void store(Moedas cotation){

		try (Connection connection = this.conectar();
			PreparedStatement pst = connection.prepareStatement(INSERT);) {
		
			pst.setString(1, cotation.getCode());
			pst.setString(2, cotation.getCodein());
			pst.setString(3, cotation.getName());
			pst.setFloat(4, cotation.getHigh());
			pst.setFloat(5, cotation.getLow());
			pst.setFloat(6, cotation.getVarBid());
			pst.setFloat(7, cotation.getPctChange());
			pst.setFloat(8, cotation.getBid());
			pst.setFloat(9, cotation.getAsk());
			pst.setLong(10, cotation.getTimestamp());
			pst.setString(11, cotation.getCreate_date());
			pst.executeUpdate();	
			
			System.out.println("Salvou");

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Não Salvou");
		}

	}
	
	//Select pela id
	public Moedas selectCotation(int id) {
		Moedas moedas = null;
		
		try(Connection connection = this.conectar();
				PreparedStatement pst = connection.prepareStatement(SELECTCODE);)
		{
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				moedas = new Moedas();					
				moedas.setCode(rs.getString("code"));
				
			}		
			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return moedas;
	}
	
	//list All
	
	public  ArrayList<Moedas> selectAllCotation() {
		String sql = "SELECT  * FROM MOEDAS ORDER BY NAME";
		ArrayList<Moedas> listCotation = new ArrayList<Moedas>();
		
		try(Connection connection = this.conectar();
				PreparedStatement pst = connection.prepareStatement(sql);)
		{
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				Moedas cotation = new Moedas();
				cotation.setId(rs.getInt("id"));
				cotation.setCode(rs.getString("code"));
				cotation.setCodein(rs.getString("codein"));
				cotation.setName(rs.getString("name"));
				cotation.setHigh(rs.getFloat("high"));
				cotation.setLow(rs.getFloat("low"));
				cotation.setVarBid(rs.getFloat("varBid"));
				cotation.setPctChange(rs.getFloat("pctChange"));
				cotation.setBid(rs.getFloat("bid"));
				cotation.setAsk(rs.getFloat("ask"));
				cotation.setTimestamp(rs.getLong("timestamp"));
				cotation.setCreate_date(rs.getString("create_date"));	
				
				listCotation.add (cotation);
			}		
			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return listCotation;
	}
	
	//Delete
	public void deleta(Moedas cotation)
	{
		try (Connection connection = this.conectar();
			PreparedStatement pst = connection.prepareStatement(DELETE);)
		{
			pst.setInt(1, cotation.getId());
			pst.executeUpdate();
			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}	 
		
	}	
	
	
	
}
