<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>����ͼ��</title>
</head>
<body bgcolor=NavajoWhite>
	<h2>����ͼ��</h2>
	<hr>
	<script type="text/javascript">
		function checkBookForm()
		{
			
			if (document.bookForm.ISBN.value =="" || document.bookForm.Title.value=="" || document.bookForm.AuthorID.value=="" || document.bookForm.Publisher.value=="" || document.bookForm.PublishDate.value=="" || document.bookForm.Price.value=="")
			{
				alert("������������Ϣ��");
				return false;
			}
			var strDate = document.bookForm.PublishDate.value.split("-");
			if (strDate.length != 3 )
				{
				alert("��������ȷ�����ڸ�ʽ��YYYY-MM-DD");
				return false;
				}
			var year = parseInt(strDate[0],10);
			var month= parseInt(strDate[1],10);
			var day  = parseInt(strDate[2],10);
			if (isNaN(year) || isNaN(month) || isNaN(day))
				{
				alert("���ڸ�ʽ���������ձ���Ϊ�����֣�");
				return false;
				}
			if(month>12 || month<1) { 
				alert("�·ݱ������1-12֮�䣡");
				return false; 
				} 
			if((month==1||month==3||month==5||month==7 
				||month==8||month==10||month==12) 
				&&(day>31||day<1)) { 
				alert("���µ�����Ӧ����1-31֮�䣡");
				return false;
				} 
			if((month==4||month==6||month==9||month==11) 
				&&(day>30||day<1)) { 
				alert("С������Ӧ����1-30֮�䣡");
				return false;
				} 
			if(month==2)
			{ 
				if(day < 1) 
				{ 
				alert("���ڴ���");
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
						alert("����2��С�ڵ���29�죡");
						return false;
					} 
				}
				else	
					{ 
						if(day > 28)
						{ 
						alert("������2��С�ڵ���28�죡");
						return false;
						} 
					} 
				return true;
			} 
		}
	</script>
	<center>
	<s:form name="bookForm" action="insert" method="post" onsubmit="return checkBookForm();" target="top">
	<s:textfield name="ISBN" label="���ʱ�׼���" value=""/>
	<s:textfield name="Title" label="����" value=""/>
	<s:textfield name="AuthorID" label="���߱��" value=""/>
	<s:textfield name="Publisher" label="������" value=""/>
	<s:textfield name="PublishDate" label="��������" value=""/>
	<s:textfield name="Price" label="�۸�" value=""/>
	<s:submit value="ȷ��"/>
	</s:form>
	</center>
</body>
</html>