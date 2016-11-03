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
	classid=58
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
<div class="Navigation_top">你所在的位置：<a href="index.asp" title="首页">首页</a> <%=GetPageNavPath3("User_PageCategory",classid)%></div>

<table width="1004" border="0" cellspacing="0" cellpadding="0"  class="" align="center">
  <tr>
    <td width="221" align="left" valign="top" ><div style="height:auto;">
        <div class="Navigation"></div>
        <div class="left">
          <ul class="LM">
            <%
					  set rs=server.CreateObject("ADODB.Recordset")
					  sql="select * from User_PageCategory where User_NavParent=43 "
					  rs.open sql,conn,1,1
					  Total=Rs.RecordCount
					  if Total=0 then
					  response.Write("<li>") 
					  response.Write("无记录...") 
					  response.Write("</li>")
					  else
					  if not(rs.eof and rs.bof) then
					  do while not rs.eof
					 %>
            <li class="<%if cstr(classid)=cstr(rs("id")) then%>LM1<%else%>LM2<%end if%>" title="<%=rs("User_NavTitle")%>" target="_self"><a href="About.asp?classid=<%=rs("ID")%>"><%=rs("User_NavTitle")%></a></li>
                   <%
					rs.movenext()
					If rs.Eof Then Exit Do
					loop
					end if
					end if 
				   %>
          </ul>
        </div>
      </div>
      <div class="kf"></div></td>
    <td width="5"></td>
    <td valign="top" ><div class="right_frame">
     <div class="right_top">>图片新闻</div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr >
            <td align="left" style='line-height:31px; background:url(Images/ind/right_top_bg.gif) top left no-repeat; padding-left:10px;'></td>
          </tr>
        </table>
        <div style="padding-left:25px;"><%=GetPageContent1("SiteExplain",classid,"NavContent")%></div>
      </div></td>
  </tr>
</table>

<!--#include file="Include/bottom.asp"-->
</body>
</html>
