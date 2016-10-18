package com.hyc.action;

import com.opensymphony.xwork2.ActionSupport;

import java.sql.Date;
import java.util.ArrayList;

import com.hyc.bean.*;

public class bookOperationAction extends ActionSupport
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String Name;
	private int Age;
	private String Country;
	private ArrayList<bookVo> bookList;
	private String ISBN;
	private String Title;
	private String AuthorID;
	private String Publisher;
	private Date PublishDate;
	private float Price;
	private String string;
	private String temp;
	public void serTemp(String temp)
	{
		this.temp = temp;
	}
	public String getTemp()
	{
		return this.temp;
	}
	public void setString(String string)
	{
		this.string = PublishDate.toString();
	}
	public String getString()
	{
		return this.string;
	}
	public void setName(String Name)
	{
		this.Name = Name;
	}
	public String getName()
	{
		return this.Name;
	}
	public void setAge(int Age)
	{
		this.Age = Age;
	}
	public int getAge()
	{
		return Age;
	}
	public void setCountry(String Country)
	{
		this.Country = Country;
	}
	public String getCountry()
	{
		return this.Country;
	}
	public void setBookList()
	{
		bookList = new ArrayList<bookVo>();
	}
	public ArrayList<bookVo> getBookList()
	{
		return bookList;
	} 
	public void setISBN(String ISBN)
	{
		this.ISBN = ISBN;
	}
	public String getISBN()
	{
		return this.ISBN;
	}
	public void setTitle(String Title)
	{
		this.Title = Title;
	}
	public String getTitle()
	{
		return this.Title;
	}
	public void setAuthorID(String AuthorID)
	{
		this.AuthorID = AuthorID;
	}
	public String getAuthorID()
	{
		return this.AuthorID;
	}
	public void setPublisher(String Publisher)
	{
		this.Publisher = Publisher;
	}
	public String getPublisher()
	{
		return this.Publisher;
	}
	public void setPublishDate(String PublishDate)
	{
		Date date = Date.valueOf(PublishDate);
		this.PublishDate = date;
	}
	public Date getPublishDate()
	{
		return this.PublishDate;
	}
	public void setPrice(String Price)
	{
		this.Price = Float.parseFloat(Price);
	}
	public float getPrice()
	{
		return this.Price;
	}
	public String showInfo()    //展示全部的图书
	{
		bookDao bdao = new bookDao();
		bdao.openConnection();
		bookList = bdao.selectAll();
		bdao.closeConnection();
		return "success";
	}
	public String showBookInfo()
	{
		bookDao bdao = new bookDao();
		bdao.openConnection();
		bookVo bvo = bdao.selectOne(ISBN);
		bdao.closeConnection();
		this.setTitle(bvo.getTitle());
		this.setAuthorID(bvo.getAuthorID());
		this.setPublisher(bvo.getPublisher());
		this.setPublishDate(bvo.getPublishDate().toString());
		this.setPrice(String.valueOf(bvo.getPrice()));
		
		authorDao adao = new authorDao();
		adao.openConnection();
		authorVo avo = adao.selectOne(AuthorID);
		adao.closeConnection();
		this.setName(avo.getName());
		this.setAge(avo.getAge());
		this.setCountry(avo.getCountry());
		return "success";
	}
	public String insert()
	{
		bookDao bdao = new bookDao();	
		bdao.openConnection();
		if (!bdao.insertIntoServlet(ISBN, Title, AuthorID, Publisher, PublishDate, Price))
			return "fail";
		else
		{
			authorDao adao = new authorDao();
			adao.openConnection();
			authorVo avo = adao.selectOne(AuthorID);
			adao.closeConnection();
			if (avo == null)
			{
				this.setAuthorID(AuthorID);
				return "insertAuthor";
			}
		}
		bookList = bdao.selectAll();
		bdao.closeConnection();
		return "success";
	}
	public String insertAuthor()
	{
		authorDao adao = new authorDao();
		adao.openConnection();
		if (!adao.insert(AuthorID, Name, Age, Country))
			return "fail";
		adao.closeConnection();
		bookDao bdao = new bookDao();
		bdao.openConnection();
		bookList = bdao.selectAll();
		bdao.closeConnection();
		return "success";
	}
	public String showAccordingToName()   //根据作者的名字展示所有图书信息
	{
		bookDao dao = new bookDao();
		dao.openConnection();
		bookList = dao.selectByName(Name);
		dao.closeConnection();
		return "success";
	}
	public String delete()
	{
		boolean flag;
		bookDao dao = new bookDao();
		dao.openConnection();
		flag = dao.deleteByISBN(ISBN);
		bookList = dao.selectAll();
		dao.closeConnection();
		if (flag)
			return "success";
		else
			return "fail";
	}
	public String updateInfo()
	{
		boolean flagBook;
		boolean flagAuthor;
		bookDao bdao = new bookDao();
		bdao.openConnection();
		flagBook = bdao.updateByISBN(ISBN, Publisher, PublishDate, Price);
		authorDao adao = new authorDao();
		adao.openConnection();
		flagAuthor = adao.updateByID(AuthorID, Name, Age, Country);
		bookList = bdao.selectAll();
		bdao.closeConnection();
		adao.closeConnection();
		if (flagBook && flagAuthor)
			return "success";
		else
			return "fail";
	}
	@Override
	public String execute() throws Exception
	{
		// TODO Auto-generated method stub
		//return super.execute();
		return "success";
	}

}
