package com.hyc.bean;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class bookDao
{
	private Connection con;
	public void openConnection()
	{
		try
		{
			if (con == null)
			{
				Class.forName("com.mysql.jdbc.Driver");
				//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hycSQL","root","123456");
				con = DriverManager.getConnection("jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_hycbookdb","mn1n3zkkyy","535zjyj4lk5wj330lxhl2k0w431x4zm5h4kzjzki");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	public void closeConnection()    //¹Ø±ÕÊý¾Ý¿â
	{
		try
		{
			if (con != null)
			{
				con.close();
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	public ArrayList<bookVo> selectAll()
	{
		ArrayList<bookVo> list = new ArrayList<bookVo>();
		String sql = "select * from Book";
		try
		{
			Statement sta = con.createStatement();
			ResultSet rs = sta.executeQuery(sql);
			while (rs.next())
			{
				bookVo vo = new bookVo();
				vo.setISBN(rs.getString(1));
				vo.setTitle(rs.getString(2));
				vo.setAuthorID(rs.getString(3));
				vo.setPublisher(rs.getString(4));
				vo.setPublishDate(rs.getDate(5));
				vo.setPrice(rs.getFloat(6));
				list.add(vo);
			}
			if (rs != null)
				rs.close();
			if (sta != null)
				sta.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return list;
	}
	public ArrayList<bookVo> selectByName(String Name)
	{
		ArrayList<authorVo> authorList = new ArrayList<authorVo>();
		String sql_author = "select * from Author where Name = ?";
		
		ArrayList<bookVo> list = new ArrayList<bookVo>();
		String sql = "select * from Book where AuthorID=?";
		try
		{
			PreparedStatement pre_author = con.prepareStatement(sql_author);
			pre_author.setString(1, Name);
			ResultSet rs_author = pre_author.executeQuery();
			while (rs_author.next())
			{
				authorVo vo = new authorVo();
				vo.setAuthorID(rs_author.getString(1));
				vo.setName(rs_author.getString(2));
				vo.setAge(rs_author.getInt(3));
				vo.setCountry(rs_author.getString(4));
				authorList.add(vo);
			}
			if (rs_author != null)
				rs_author.close();
			if (pre_author != null)
				pre_author.close();
			
			for (authorVo author:authorList)
			{
				PreparedStatement pre = con.prepareStatement(sql);
				pre.setString(1, author.getAuthorID());
				ResultSet rs = pre.executeQuery();
				while (rs.next())
				{
					bookVo vo = new bookVo();
					vo.setISBN(rs.getString(1));
					vo.setTitle(rs.getString(2));
					vo.setAuthorID(rs.getString(3));
					vo.setPublisher(rs.getString(4));
					vo.setPublishDate(rs.getDate(5));
					vo.setPrice(rs.getFloat(6));
					list.add(vo);
				}
				if (rs != null)
					rs.close();
				if (con != null)
					con.close();
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
		return list;
	}
	public boolean deleteByISBN(String ISBN)
	{
		String sql = "delete from Book where ISBN = ?";
		try
		{
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, ISBN);
			int count = pre.executeUpdate();
			if (pre != null)
				pre.close();
			return count>0?true:false;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}
	public bookVo selectOne(String ISBN)
	{
		bookVo vo = new bookVo();
		String sql = "select * from Book where ISBN=?";
		try
		{
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, ISBN);
			ResultSet rs = pre.executeQuery();
			while(rs.next())
			{
				vo.setISBN(rs.getString(1));
				vo.setTitle(rs.getString(2));
				vo.setAuthorID(rs.getString(3));
				vo.setPublisher(rs.getString(4));
				vo.setPublishDate(rs.getDate(5));
				vo.setPrice(rs.getFloat(6));
			}
			rs.close();
			pre.close();
			return vo;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
	}
	public boolean insertIntoServlet(String ISBN,String Title,String AuthorID,String Publisher,Date PublishDate,float Price)
	{
		//String sql = "insert into Book values(ISBN=?,Title=?,AuthorID=?,Publisher=?,PublishDate=?,Price=?)";
		String sql = "insert into Book values(?,?,?,?,?,?)";
		try
		{
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, ISBN);
			pre.setString(2, Title);
			pre.setString(3, AuthorID);
			pre.setString(4, Publisher);
			pre.setDate(5, PublishDate);
			pre.setFloat(6, Price);
			int count = pre.executeUpdate();
			if (pre != null)
				pre.close();
			return count>0?true:false;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}
	public boolean updateByISBN(String ISBN,String publisher,Date publishDate,float price)
	{
		//String sql = "update Book set Title=?, AuthorID=?, publisher=?, publishDate=?, publishDate=? where ISBN=?";
		String sql = "update Book set publisher=?, publishDate=?, price=? where ISBN=?";
		try
		{
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, publisher);
			pre.setDate(2, publishDate);
			pre.setFloat(3, price);
			pre.setString(4, ISBN);
			int count = pre.executeUpdate();
			if (pre != null)
				pre.close();
			return count>0?true:false;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}
}
