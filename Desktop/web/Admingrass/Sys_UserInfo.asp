<!--#include File="CheckLogin.asp"-->
<!--#include File="../Config/Config.asp"-->
<!--#include File="../Include/Class_Function.asp"-->
<%
Call ISPopedom(UserName,"Sys_UserInfo")
If Request("Action")="Save" Then
Birthday=Request("Birthday")
Question=Request("Question")
Answer=Request("Answer")
Set Rs=Server.CreateObject("Adodb.RecordSet")
Sql="Select * From Admin Where UserName='"&UserName&"'"
Rs.Open Sql,Conn,1,3
Rs("Birthday")=Birthday
Rs("Question")=Question
Rs("Answer")=Answer
Rs.Update
Rs.Close
Set Rs=Nothing
Conn.Close
Set Conn=Nothing
Response.Write("<script>alert('\u7ba1\u7406\u5458\u4fe1\u606f\u4fee\u6539\u64cd\u4f5c\u6210\u529f\u3002');window.location.href='Sys_UserInfo.asp';</script>")
Response.End()
End If
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=SiteName%></title>
<link href="Style/Main.css" rel="stylesheet" type="text/css" />
<link href="Style/PopCalender.css" rel="stylesheet" type="text/css" />
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
//这段脚本如果你的页面里有，就可以去掉它们了
//欢迎访问我的网站queyang.com
var ie =navigator.appName=="Microsoft Internet Explorer"?true:false;
function $(objID){
	return document.getElementById(objID);
}
</script>
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">管理系统</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
    
    <table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<td style="border-bottom:solid 1px #dde4e9;height:30px">当前位置：管理员信息维护</td>
</tr>
<tr>
<td height="80">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="60"><img src="Images/SiteInfo.jpg" width="60" height="61"></td>
<td width="90%" valign="top">以下各项信息仅用于管理员忘记需要进行重置密码操作，保存之后立即生效。<br>
注意：请牢记密码取回答案和出生日期，输入正确后才能进行密码重置操作。</td>
</tr>
</table></td>
</tr>
<tr>
<td valign="top">
<%
Set Rs=Server.CreateObject("Adodb.RecordSet")
Sql="Select * From Admin Where UserName='"&UserName&"'"
Rs.Open Sql,Conn,1,1
If Not (Rs.Eof Or Rs.Bof) Then
Birthday=Year(Rs("Birthday"))&"-"&Month(Rs("Birthday"))&"-"&Day(Rs("Birthday"))
Question=Rs("Question")
Answer=Rs("Answer")
End If
Rs.Close
Set Rs=Nothing
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Form">
<form id="form1" name="form1" method="post" action="?action=Save">
<tr>
<th colspan="2">管理员信息维护</th>
</tr>
<tr>
<td class="Right" align="right">登录账号名称：</td>
<td><%=UserName%></td>
</tr>
<!--<tr>
<td class="Right" align="right">您的出生日期：</td>
<td>
<div style="float:left;width:140px;height:30px;line-height:30px; padding-top:3px;"><input type="text" id="Birthday" name="Birthday" value="<%=Birthday%>" class="Input300px" style="width:140px" readonly></div>
<div style="float:left; padding-top:8px;width:25px"><img src="Images/Calender.gif" align="absmiddle" onClick="showcalendar(event, $('Birthday'));" onFocus="showcalendar(event, $('Birthday'));if($('Birthday').value=='0000-00-00')$('Birthday').value=''"></div>
<div style="float:left">日期格式为2009-01-01</div></td>
</tr>-->
<tr>
<td width="25%" class="Right" align="right">密码取回问题：</td>
<td width="75%"><input type="text" id="Question" name="Question" value="<%=Question%>" class="Input300px"></td>
</tr>
<tr>
<td class="Right" align="right">密码取回答案：</td>
<td><input type="text" id="Answer" name="Answer" value="<%=Answer%>" class="Input300px"></td>
</tr>
<tr>
<td class="Right" align="right">&nbsp;</td>
<td><input type="submit" value="保 存" class="Button"> <input type="button" value="关闭窗口" class="Button" onClick="top.DeleteTabTitle('Sys_UserInfo')"></td>
</tr>
</form>
</table>
</td>
</tr>
</table>
    
    
    </td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>

<script language="javascript" type="text/javascript" src="Common/PopCalender.js"></script>
</body>
</html>