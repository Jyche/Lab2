<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="/struts-tags" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ͼ����Ϣ</title>
</head>
<body bgcolor=NavajoWhite>
	<script type="text/javascript">
	function check()
	{
		if (document.InfoForm.Publisher.value=="" || document.InfoForm.PublishDate.value=="" || document.InfoForm.Price.value=="" || document.InfoForm.Name.value=="" || document.InfoForm.Age.value=="" || document.InfoForm.Country.value=="")
		{
			alert("��������Ϣ��");
			return false;
		}
	}
	</script>
	<h2>��ϸ��Ϣ(������Ϣ��ֱ���޸�)</h2>
	<hr>
	<center>
	<s:form name="InfoForm" action="updateInfo" onsubmit="return check();" method="post" target="top">
	<s:textfield name="ISBN" label="���ʱ�׼���" readonly="true"/>
	<s:textfield name="Title" label="����" readonly="true"/>
	<s:textfield name="AuthorID" label="���߱��" readonly="true"/>
	<s:textfield name="Publisher" label="������"/> <br>
	<s:textfield name="PublishDate" label="��������"><s:param name="value"><s:date name="PublishDate" format="yyyy-MM-dd"/></s:param></s:textfield><br>
	<s:textfield name="Price" label="�۸�"/><br>
	<s:textfield name="Name" label="����"/><br>
	<s:textfield name="Age" label="����"/><br>
	<s:textfield name="Country" label="����"/>
	<s:submit value="ȷ���޸�"/>
	</s:form>
	</center>
</body>
</html>