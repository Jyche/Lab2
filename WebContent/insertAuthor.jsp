<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>添加作者</title>
</head>
<body bgcolor=NavajoWhite>
	<h2>添加作者</h2>
	<hr>
		<script type="text/javascript">
		function checkAuthorForm()
		{
			if (document.authorForm.Name.value=="" || document.authorForm.Age.value=="" || document.authorForm.Country.value=="")
			{
				alert("请输入完整信息！");
				return false;
			}
			
		}
	</script>
	<center>
	<s:form name="authorForm" action="insertAuthor" method="post" onsubmit="return checkAuthorForm();" target="top">
	<s:textfield name="AuthorID" label="作者编号" readonly="true"/>
	<s:textfield name="Name" label="姓名" value=""/>
	<s:textfield name="Age" label="年龄" value=""/>
	<s:textfield name="Country" label="国籍" value=""/>
	<s:submit value="确定"/>
	</s:form>
	</center>
</body>
</html>