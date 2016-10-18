<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="/struts-tags" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Í¼ÊéÐÅÏ¢</title>
</head>
<body bgcolor=NavajoWhite>
	<script type="text/javascript">
	function check()
	{
		if (document.InfoForm.Publisher.value=="" || document.InfoForm.PublishDate.value=="" || document.InfoForm.Price.value=="" || document.InfoForm.Name.value=="" || document.InfoForm.Age.value=="" || document.InfoForm.Country.value=="")
		{
			alert("ÇëÍêÉÆÐÅÏ¢£¡");
			return false;
		}
	}
	</script>
	<h2>ÏêÏ¸ÐÅÏ¢(²¿·ÖÐÅÏ¢¿ÉÖ±½ÓÐÞ¸Ä)</h2>
	<hr>
	<center>
	<s:form name="InfoForm" action="updateInfo" onsubmit="return check();" method="post" target="top">
	<s:textfield name="ISBN" label="¹ú¼Ê±ê×¼ÊéºÅ" readonly="true"/>
	<s:textfield name="Title" label="ÊéÃû" readonly="true"/>
	<s:textfield name="AuthorID" label="×÷Õß±àºÅ" readonly="true"/>
	<s:textfield name="Publisher" label="³ö°æÉÌ"/> <br>
	<s:textfield name="PublishDate" label="³ö°æÈÕÆÚ"><s:param name="value"><s:date name="PublishDate" format="yyyy-MM-dd"/></s:param></s:textfield><br>
	<s:textfield name="Price" label="¼Û¸ñ"/><br>
	<s:textfield name="Name" label="×÷Õß"/><br>
	<s:textfield name="Age" label="ÄêÁä"/><br>
	<s:textfield name="Country" label="¹ú¼®"/>
	<s:submit value="È·ÈÏÐÞ¸Ä"/>
	</s:form>
	</center>
</body>
</html>