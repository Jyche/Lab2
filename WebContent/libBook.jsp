<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Í¼ÊéÐÅÏ¢×ÜÀÀ</title>
</head>
<body bgcolor=NavajoWhite>
	<h2>Í¼ÊéÐÅÏ¢</h2>
	<hr>
	<center>
	<table border=1>
		<tr>
			<td>ISBN</td> <td>Title</td> <td>AuthorID</td> <td>Publisher</td> <td>PublishDate</td> <td>Price</td> <td>delete</td>
		</tr>
	<s:iterator value="bookList" status="book">
	<tr> 
		<td><s:property value="ISBN"/></td>
		<td><a href="showBookInfo.action?ISBN=<s:property value="ISBN"/>"><s:property value="Title"/></a></td>
		<td><s:property value="AuthorID"/></td>
		<td><s:property value="Publisher"/></td>
		<td><s:date name="PublishDate" format="yyyy-MM-dd"/></td>
		<td><s:property value="Price"/></td>
		<td><a href="delete.action?ISBN=<s:property value="ISBN"/>">delete</a></td>
	</tr>
	</s:iterator>
	
	</table>
	</center>
</body>
</html>