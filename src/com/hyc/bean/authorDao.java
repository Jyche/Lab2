package com.hyc.bean;

import java.sql.*;
import java.util.ArrayList;
public class authorDao
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
	public void closeConnection()
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
	
	public boolean updateByID(String AuthorID,String Name,int Age,String Country)
	{
		String sql = "update Author set Name=?, Age=?, Country=? where AuthorID=?";
		try
		{
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, Name);
			pre.setInt(2, Age);
			pre.setString(3, Country);
			pre.setString(4, AuthorID);
			int count = pre.executeUpdate();
			pre.close();
			return count>0?true:false;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}
	public boolean insert(String AuthorID,String Name,int Age,String Country)
	{
		String sql = "insert into Author values(?,?,?,?)";
		try
		{
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, AuthorID);
			pre.setString(2, Name);
			pre.setInt(3, Age);
			pre.setString(4, Country);
			int count = pre.executeUpdate();
			pre.close();
			return count>0?true:false;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
	}
	public authorVo selectOne(String AuthorID)
	{
		authorVo vo = new authorVo();
		String sql = "select * from Author where AuthorID=?";
		try
		{
			PreparedStatement pre = con.prepareStatement(sql);
			pre.setString(1, AuthorID);
			ResultSet rs = pre.executeQuery();
			if (rs.next())
			{
				vo.setAuthorID(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setAge(rs.getInt(3));
				vo.setCountry(rs.getString(4));
				return vo;
			}
			rs.close();
			pre.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return null;
	}

}
