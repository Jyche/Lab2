<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ͼ�����ϵͳ</title>
<style type="text/css">
	body{background-image:url(��.jpg);
        background-repeat:no-repeat;
         background-size:cover;
         opacity:0.8;
         overflow-x:hidden;
         overflow-y:hidden;}
    h1{font-family:����;font-size:40px;font-weight:bolder;text-align:center}
</style>

</head>

<body>
	<h1>ͼ�����ϵͳ</h1>
	<div style="position:relative;right:-900px;top:5px">
		<s:form name="search" action="showAccordingToName" method="post" theme="simple" labelposition="right" target="top">
		<s:textfield name="Name" />
		<s:submit value="����" />
		</s:form>
	</div>
	<div>
	</div>
	<hr>
	<s:form action="showInfo" method="post" target="top">
	<s:submit value="ͼ���б�" />
	</s:form>
	<s:form action="insertAction" method="post" target="top">
	<s:submit value="����ͼ��" />
	</s:form>
	<script type="text/javascript">
	  	function resize(obj)
	  	{ 
  			var ifrm=obj.contentWindow.document.body; 
  			ifrm.style.cssText="margin:0px;padding:0px;overflow:hidden"; 
 			var div=document.createElement("img"); 
 			div.src=obj.src; 
 			obj.height=div.height; 
 			obj.width=div.width; 
 		 } 
	  </script>
	<center>
	<iframe src="��.jpg" name="top" scrolling="yes" width="780px" height="450px" frameborder="1">
	</iframe>
	</center>
</body>
</html>