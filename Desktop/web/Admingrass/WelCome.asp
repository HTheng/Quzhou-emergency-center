<!--#include File="CheckLogin.asp"-->
<!--#include File="../Config/Config.asp"-->
<%
	Set Rs=Server.CreateObject("Adodb.RecordSet")
	Sql="Select * From SiteVersion"
	Rs.Open Sql,Conn,1,1
	if not Rs.eof then
		if len(Trim(Rs("VersionNo")))>0 then
			Response.Cookies("CNVP_CMS2")("SiteVersion")=Rs("VersionNo")
		else
			Set Rs2=Server.CreateObject("Adodb.RecordSet")
			Sql2="Select * From SiteVersion where ID=(select top 1 ID from SiteVersion order by ID desc)"
			Rs2.Open Sql2,Conn,1,3
			Rs2("VersionNo")="Chiness"
			Rs2.UpDate
			Rs2.close
			Set Rs2=Nothing
			Response.Cookies("CNVP_CMS2")("SiteVersion")="Chiness"
		end if
	else
		Set Rs2=Server.CreateObject("Adodb.RecordSet")
		Sql2="Select * From SiteVersion"
		Rs2.Open Sql2,Conn,1,3
		Rs2.AddNew
		Rs2("VersionNo")="Chiness"
		Rs2.UpDate
		Rs2.close
		Set Rs2=Nothing
		Response.Cookies("CNVP_CMS2")("SiteVersion")="Chiness"
	end if
	Rs.close
	Set Rs=Nothing
	Conn.close
	Set Conn=Nothing
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=SiteName%></title>
<link href="Style/Main.css" rel="stylesheet" type="text/css" />
<link href="images/skin.css" rel="stylesheet" type="text/css" />
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">欢迎界面</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="60%" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td style="font-size:14px;font-weight:bolder;color:#224d7e;height:35px">欢迎登E－草网络工作室管理系统！</td>
</tr>
<tr>
<td style="color:#808080">E－草网络工作室管理系统已全面升级，您现在使用的是<span style="color:#F90;">CMS 2.0正式版</span>，如果您有何疑问请致电E－草网络工作室客服部进行咨询。
</td>
</tr>
<tr>
<td height="35">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="20%">空间使用情况：</td>
<td width="80%">
<div style="float:left;width:300px;height:15px;background:url(Images/Loading_Bg.gif);border:1px solid #426a98;">
<div style="margin:0px;padding:0px;">
<div style="position:absolute;text-align:center;height:13px;line-height:13px;width:300px;color:#FFFFFF; margin:0px;padding:0px;font-size:9px;">60MB/100MB(60%)</div>
<div style="background:url(images/loading_bg2.gif);width:60%;height:13px;line-height:13px;"></div>
</div>
</div>
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td height="250" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="25">
<span style="height:25px;width:80px; line-height:25px; text-align:center;background:#e2e7eb; font-weight:bolder">主机参数</span><span style="height:25px;line-height:25px;width:80px; text-align:center;background:#e9f1f7"><a href="http://www.e-grass.net/" style="color:#000" target="_blank">官方网站</a></span></td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="235" bgcolor="#e2e7eb" style="padding:5px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:solid 1px #cdd8df;height:100%; background:#f1f4f7">
<tr>
<td align="center">
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="25%">服务器名：</td>
    <td width="25%"><%=Request.ServerVariables("SERVER_NAME")%></td>
    <td width="20%">服务器端口：</td>
    <td width="30%"><%=Request.ServerVariables("SERVER_PORT")%></td>
  </tr>
  <tr>
    <td>服务器IP：</td>
    <td><%=Request.ServerVariables("LOCAL_ADDR")%></td>
    <td>服务器时间：</td>
    <td><%=now%></td>
  </tr>
  <tr>
    <td>IIS版本：</td>
    <td><%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
    <td>脚本超时时间：</td>
    <td><%=Server.ScriptTimeout%> 秒</td>
  </tr>
  <tr>
    <td>Application变量：</td>
    <td><%Response.Write(Application.Contents.Count & "个")%></td>
    <td>Session变量：</td>
    <td><%Response.Write(Session.Contents.Count&"个 ")%></td>
  </tr>
  <tr>
    <td>所有服务器参数：</td>
    <td><%Response.Write(Request.ServerVariables.Count&"个")%></td>
    <td>服务器环境变量：</td>
    <td><%
On Error Resume Next
dim WshShell,WshSysEnv
Set WshShell = server.CreateObject("WScript.Shell")
Set WshSysEnv = WshShell.Environment
if err then
Response.Write("服务器不支持WScript.Shell组件")
err.clear
else
Response.Write(WshSysEnv.count &"个 ")
if WshSysEnv.count>0 then Response.Write("[<a href=""?action=showwsh"">遍历环境变量</a>]") 
end if
%></td>
  </tr>
  <tr>
    <td>本文件实际路径：</td>
    <td colspan="3"><%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
    </tr>
</table></td>
</tr>
</table>
</td>
</tr>
</table></td>
</tr>
</table>
</td>
<td width="10" valign="top" align="right">
<td width="38%" valign="top">
<table width="300" border="0" cellspacing="0" cellpadding="0" style="border:solid 1px #c5cdd4;">
<tr style="background:url(Images/Info-List-Bg.gif);font-weight:bolder;height:32px; line-height:32px">
<td>&nbsp;&nbsp;最新案例</td>
<td align="right"><a href="http://www.e-grass.net/2009" style="color:#000000; font-weight:normal" target="_blank"x>[更多]</a>&nbsp;&nbsp;</td>
</tr>
<tr>
<td colspan="2" valign="top" style="background:#f4f6f9;height:336px">&nbsp;</td>
</tr>
</table>
</td>
</tr>
</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<td height="20">&nbsp;</td>
</tr>
</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<td style="background:#cdd8df;height:1px"></td>
</tr>
</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<td height="25" style="padding-top:10px;"><img src="images/icon-mail2.gif" align="absMiddle" />&nbsp;&nbsp;客户服务信箱：<span><a href="mailto:###########" style="color:#5e8e00;">e-grass@hotmail.com
</a>
</td>
</tr>
<tr>
<td height="25"><img src="images/icon-phone.gif" width="17" height="14" align="absMiddle" />&nbsp;&nbsp;客户服务QQ：<span style="color:#5e8e00;">1137579657</span></td>
</tr>
</table></td>
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