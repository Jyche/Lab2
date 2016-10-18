package com.hyc.bean;

public class authorVo 
{
	private String AuthorID;   //���߱��
	private String Name;       //��������
	private int Age;           //��������
	private String Country;    //���߹���
	public void setAuthorID(String AuthorID)
	{
		this.AuthorID = AuthorID;
	}
	public String getAuthorID()
	{
		return AuthorID;
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
		return this.Age;
	}
	public void setCountry(String Country)
	{
		this.Country = Country;
	}
	public String getCountry()
	{
		return this.Country;
	}
}
