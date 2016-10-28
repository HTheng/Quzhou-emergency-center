<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="Include/Class_Function.asp"-->
<!--#include File="Config/Config.asp"-->
<%
 classid= ReplaceBadChar(Trim(Request("classid")))
 if classid<>"" then
 	if IsNumeric(classid)=false  then
		Response.Write("<script>alert('参数错误，确定后返回前页！');history.back();</script>")
		Response.End()
	end if 
	else
	classid=86
	end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  href="css/content.css" rel="stylesheet" type="text/css">
<link  href="css/footer.css" rel="stylesheet" type="text/css">
<link href="images/zhirui.css" rel="stylesheet" type="text/css" />
<meta name="keywords" content="<%=SiyeKeys%>" />
<META name="Description" content="<%=SiteDes%>">
<meta name="Author" content="<%=SiteAuthor%>" />
<title><%=SiteName%></title>
</head>
<body>

<!--#include file="Include/head.asp"-->
<div style="width:1004px; margin:8px auto;"><img src="Images/ind/banner2.gif" width="1004" height="137" /></div>
<div class="Navigation_top">你所在的位置：<a href="index.asp" title="首页">首页</a> <%=GetNavnews2("newsclass",classid)%></div>
<!--#include file="Include/bottom.asp"-->
</body>
</html>
