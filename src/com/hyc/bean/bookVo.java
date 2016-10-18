package com.hyc.bean;

//import java.util.Date;
import java.sql.*;
public class bookVo 
{
	private String ISBN;      //国际标准书号
	private String Title;     //书名
	private String AuthorID;  //作者编号
	private String Publisher; //出版商
	private Date PublishDate; //出版日期
	private float Price;      //单价  
	public void setISBN(String ISBN)
	{
		this.ISBN = ISBN;
	}
	public String getISBN()
	{
		return ISBN;
	}
	public void setTitle(String Title)
	{
		this.Title = Title;
	}
	public String getTitle()
	{
		return Title;
	}
	public void setAuthorID(String AuthorID)
	{
		this.AuthorID = AuthorID;
	}
	public String getAuthorID()
	{
		return AuthorID;
	}
	public void setPublisher(String Publisher)
	{
		this.Publisher = Publisher;
	}
	public String getPublisher()
	{
		return this.Publisher;
	}
	public void setPublishDate(Date PublishDate)
	{
		this.PublishDate = PublishDate;
	}
	public Date getPublishDate()
	{
		return this.PublishDate;
	}
	public void setPrice(float Price)
	{
		this.Price = Price;
	}
	public float getPrice()
	{
		return this.Price;
	}
}
