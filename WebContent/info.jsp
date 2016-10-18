<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="/struts-tags" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>图书信息</title>
</head>
<body bgcolor=NavajoWhite>
	<script type="text/javascript">
	function check()
	{
		if (document.InfoForm.Publisher.value=="" || document.InfoForm.PublishDate.value=="" || document.InfoForm.Price.value=="" || document.InfoForm.Name.value=="" || document.InfoForm.Age.value=="" || document.InfoForm.Country.value=="")
		{
			alert("请完善信息！");
			return false;
		}
	}
	</script>
	<h2>详细信息(部分信息可直接修改)</h2>
	<hr>
	<center>
	<s:form name="InfoForm" action="updateInfo" onsubmit="return check();" method="post" target="top">
	<s:textfield name="ISBN" label="国际标准书号" readonly="true"/>
	<s:textfield name="Title" label="书名" readonly="true"/>
	<s:textfield name="AuthorID" label="作者编号" readonly="true"/>
	<s:textfield name="Publisher" label="出版商"/> <br>
	<s:textfield name="PublishDate" label="出版日期"><s:param name="value"><s:date name="PublishDate" format="yyyy-MM-dd"/></s:param></s:textfield><br>
	<s:textfield name="Price" label="价格"/><br>
	<s:textfield name="Name" label="作者"/><br>
	<s:textfield name="Age" label="年龄"/><br>
	<s:textfield name="Country" label="国籍"/>
	<s:submit value="确认修改"/>
	</s:form>
	</center>
</body>
</html>