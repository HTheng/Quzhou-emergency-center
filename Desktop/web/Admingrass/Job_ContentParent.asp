﻿<!--#include File="CheckLogin.asp"-->
<!--#include File="../Config/Config.asp"-->
<!--#include File="../Include/Class_Function.asp"-->
<%
Call ISPopedom(UserName,"OnLineJobs")
ID=ReplaceBadChar(Trim(Request("ID")))
Action=ReplaceBadChar(Trim(Request("Action")))
ClassID=ReplaceBadChar(Trim(Request("ClassID")))
If Action="Save" Then
	AryID = Split(ID,",")
	For i = LBound(AryID) To UBound(AryID)		
		If Cstr(NavParent)<>Cstr(AryID(i)) Then
		Set Rs=Server.CreateObject("Adodb.RecordSet")
		Sql="Select * From JobInfo Where ID="&AryID(i)&""
		Rs.Open Sql,Conn,1,3
		Rs("ClassID")=ClassID
		Rs.Update
		Rs.Close
		Set Rs=Nothing
		End If
	Next
	Response.Write("<script>alert('\u6240\u5c5e\u7236\u7c7b\u79fb\u52a8\u64cd\u4f5c\u6210\u529f\u3002');window.location.href='Job_List.asp?ClassID="&ClassID&"';</script>")
	Response.End()
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=SiteName%></title>
<link href="Style/Main.css" rel="stylesheet" type="text/css" />
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="Common/Jquery.js"></script>
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
<td style="border-bottom:solid 1px #dde4e9;height:30px;width:80%">当前位置：信息管理 >> 更改信息所属父类别</td>
<td style="border-bottom:solid 1px #dde4e9;height:30px;width:20%; text-align:right">&nbsp;</td>
</tr>
<tr>
<td height="80" colspan="2">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="60"><img src="Images/SiteInfo.jpg" width="60" height="61"></td>
<td width="90%" valign="top">您可以调整以下导航条的所属父类别，保存之后立即生效。<br>
注意：调整类别之后将直接影响其子类别展示顺序。</td>
</tr>
</table></td>
</tr>
<tr>
<td colspan="2" valign="top">
<form id="form1" name="form1" method="post" action="?Action=Save">
<input type="hidden" id="ID" name="ID" value="<%=ID%>"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Form">
<tr>
<th colspan="2">更改信息所属父类</th>
</tr>
<tr>
<td class="Right" width="25%" align="right">信息标题：</td>
<td width="75%" style="line-height:150%">
<%
AryID = Split(ID,",")
For i = LBound(AryID) To UBound(AryID)
	If IsNumeric(AryID(i))=True Then
		Set Rs=Server.CreateObject("Adodb.RecordSet")
		Sql="Select Jobs From JobInfo Where ID="&AryID(i)&""
		Rs.Open Sql,Conn,1,3
		Response.Write(Rs("Jobs")&",&nbsp;&nbsp;")
		Rs.Close
		Set Rs=Nothing
	End If
Next
%>
</td>
</tr>
<tr>
<td class="Right" width="25%" align="right">新的父类别：</td>
<td width="75%">
<select id="ClassID" name="ClassID" style="width:200px;">
<%=GetSelect("JobClass",0)%>
</select></td>
</tr>
<tr>
<td class="Right" width="25%" align="right">&nbsp;</td>
<td width="75%"><input type="submit" value="保 存" class="Button"> <input type="button" value="返 回" class="Button" onClick="window.location.href='News_List.asp'"></td>
</tr>
</table>
</form>
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

</body>
</html>