<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>�������</title>
</head>
<body bgcolor=NavajoWhite>
	<h2>�������</h2>
	<hr>
		<script type="text/javascript">
		function checkAuthorForm()
		{
			if (document.authorForm.Name.value=="" || document.authorForm.Age.value=="" || document.authorForm.Country.value=="")
			{
				alert("������������Ϣ��");
				return false;
			}
			
		}
	</script>
	<center>
	<s:form name="authorForm" action="insertAuthor" method="post" onsubmit="return checkAuthorForm();" target="top">
	<s:textfield name="AuthorID" label="���߱��" readonly="true"/>
	<s:textfield name="Name" label="����" value=""/>
	<s:textfield name="Age" label="����" value=""/>
	<s:textfield name="Country" label="����" value=""/>
	<s:submit value="ȷ��"/>
	</s:form>
	</center>
</body>
</html>