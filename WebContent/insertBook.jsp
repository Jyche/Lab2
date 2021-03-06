<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>新增图书</title>
</head>
<body bgcolor=NavajoWhite>
	<h2>新增图书</h2>
	<hr>
	<script type="text/javascript">
		function checkBookForm()
		{
			
			if (document.bookForm.ISBN.value =="" || document.bookForm.Title.value=="" || document.bookForm.AuthorID.value=="" || document.bookForm.Publisher.value=="" || document.bookForm.PublishDate.value=="" || document.bookForm.Price.value=="")
			{
				alert("请输入完整信息！");
				return false;
			}
			var strDate = document.bookForm.PublishDate.value.split("-");
			if (strDate.length != 3 )
				{
				alert("请输入正确的日期格式：YYYY-MM-DD");
				return false;
				}
			var year = parseInt(strDate[0],10);
			var month= parseInt(strDate[1],10);
			var day  = parseInt(strDate[2],10);
			if (isNaN(year) || isNaN(month) || isNaN(day))
				{
				alert("日期格式错误：年月日必须为纯数字！");
				return false;
				}
			if(month>12 || month<1) { 
				alert("月份必须介于1-12之间！");
				return false; 
				} 
			if((month==1||month==3||month==5||month==7 
				||month==8||month==10||month==12) 
				&&(day>31||day<1)) { 
				alert("大月的日期应介于1-31之间！");
				return false;
				} 
			if((month==4||month==6||month==9||month==11) 
				&&(day>30||day<1)) { 
				alert("小月日期应介于1-30之间！");
				return false;
				} 
			if(month==2)
			{ 
				if(day < 1) 
				{ 
				alert("日期错误！");
				return false;
				} 
				var boolLeapYear = false; 
				if((year%100) == 0)
				{ 
				if((year%400) == 0) 
				boolLeapYear = true; 
				} 
				else
				{ 
				if((year % 4) == 0) 
				boolLeapYear = true; 
				} 
				if(boolLeapYear)
				{ 
					if(day > 29)
					{ 
						alert("闰年2月小于等于29天！");
						return false;
					} 
				}
				else	
					{ 
						if(day > 28)
						{ 
						alert("非闰年2月小于等于28天！");
						return false;
						} 
					} 
				return true;
			} 
		}
	</script>
	<center>
	<s:form name="bookForm" action="insert" method="post" onsubmit="return checkBookForm();" target="top">
	<s:textfield name="ISBN" label="国际标准书号" value=""/>
	<s:textfield name="Title" label="书名" value=""/>
	<s:textfield name="AuthorID" label="作者编号" value=""/>
	<s:textfield name="Publisher" label="出版商" value=""/>
	<s:textfield name="PublishDate" label="出版日期" value=""/>
	<s:textfield name="Price" label="价格" value=""/>
	<s:submit value="确定"/>
	</s:form>
	</center>
</body>
</html>