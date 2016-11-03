<!--#include File="../Config/Config.asp"-->
<!--#include File="../Include/Class_Function.asp"-->
<!--#include File="../Include/Class_Md5.asp"-->
<%
If Request("Action")="Login" Then

UserName=ReplaceBadChar(Trim(Request("UserName")))
UserPass=ReplaceBadChar(Trim(request("UserPass")))

If UserName="" Or UserPass="" Then
Response.Write("<Script>alert('\u767b\u5f55\u5e10\u53f7\u53ca\u767b\u5f55\u5bc6\u7801\u4e0d\u80fd\u4e3a\u7a7a');history.go(-1);</Script>")
Response.End()
End If

UserPass=MD5(UserPass,32)
Set Rs=Server.CreateObject("Adodb.RecordSet")
Sql="Select * From Admin Where UserName='"&UserName&"' And UserPass='"&UserPass&"'"
Rs.Open Sql,Conn,1,1
If Not (Rs.Eof And Rs.Bof) Then
Response.Cookies("CNVP_CMS2")("UserName") = UserName
if cstr(Rs("ISAdmin"))="999" then
	Permissions="超级管理员"
	Response.Cookies("CMS_CNVP")("ISAdmin")="true"
else
	Permissions="管理员"
	Response.Cookies("CMS_CNVP")("ISAdmin")="false"
end if

Set Rs2=Server.CreateObject("Adodb.RecordSet")
Sql2="Select * From LoginLogInfo"
Rs2.Open Sql2,Conn,1,3
Rs2.AddNew
Rs2("UserName")=UserName
Rs2("LoginIP")=Request.ServerVariables("LOCAL_ADDR")
Rs2("Permissions")=Permissions
Rs2("Browser")=Request.ServerVariables("HTTP_USER_AGENT")
Rs2("PostTime")=Now()
Rs2.UpDate
Rs2.close
Set Rs2=Nothing
Response.Write("<script>top.window.location.href='Admin_Index.asp';</script>")
Else
Response.Write("<Script>alert('\u767b\u5f55\u5931\u8d25\uff0c\u767b\u5f55\u5e10\u53f7\u6216\u8005\u5bc6\u7801\u9519\u8bef');history.go(-1);</Script>")
Response.End()
End If
Rs.Close
Set Rs=Nothing
Conn.Close
Set Conn=Nothing
End If
%>
<script language="JavaScript">
function correctPNG()
{
    var arVersion = navigator.appVersion.split("MSIE")
    var version = parseFloat(arVersion[1])
    if ((version >= 5.5) && (document.body.filters)) 
    {
       for(var j=0; j<document.images.length; j++)
       {
          var img = document.images[j]
          var imgName = img.src.toUpperCase()
          if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
          {
             var imgID = (img.id) ? "id='" + img.id + "' " : ""
             var imgClass = (img.className) ? "class='" + img.className + "' " : ""
             var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
             var imgStyle = "display:inline-block;" + img.style.cssText 
             if (img.align == "left") imgStyle = "float:left;" + imgStyle
             if (img.align == "right") imgStyle = "float:right;" + imgStyle
             if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
             var strNewHTML = "<span " + imgID + imgClass + imgTitle
             + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
             + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
             + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" 
             img.outerHTML = strNewHTML
             j = j-1
          }
       }
    }    
}
window.attachEvent("onload", correctPNG);
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=SiteName%></title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #1D3647;
}
-->
</style>
<link href="images/skin.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="../Common/Jquery.js"></script>
</head>
<body scroll="no">
<script language="javascript" type="text/javascript">
function CheckForm()
{
	if ($("#UserName").val()=="")
	{
		alert("\u7528\u6237\u540d\u4e0d\u80fd\u4e3a\u7a7a\uff0c\u8bf7\u8f93\u5165\u540e\u91cd\u65b0\u767b\u5f55\u7cfb\u7edf\u3002");
		$("#UserName").focus();
		return false;
	}
	if ($("#UserPass").val()=="")
	{
		alert("\u5bc6\u7801\u4e0d\u80fd\u4e3a\u7a7a\uff0c\u8bf7\u8f93\u5165\u540e\u91cd\u65b0\u767b\u5f55\u7cfb\u7edf\u3002");
		$("#UserPass").focus();
		return false;
		
	}
	return true;
}
$(document).ready(function(){
	$("#UserName").focus();
});
</script>
<table width="100%" height="166" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="42" valign="top"><table width="100%" height="42" border="0" cellpadding="0" cellspacing="0" class="login_top_bg">
      <tr>
        <td width="1%" height="21">&nbsp;</td>
        <td height="42">&nbsp;</td>
        <td width="17%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg">
      <tr>
        <td width="49%" align="right"><table width="91%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg2">
            <tr>
              <td height="138" valign="top"><table width="89%" height="427" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="149">&nbsp;</td>
                </tr>
                <tr>
                  <td height="80" align="right" valign="top"><img src="images/logo.png" width="279" height="68"></td>
                </tr>
                <tr>
                  <td height="198" align="right" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="35%">&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt"><p>1- 地区商家信息网门户站建立的首选方案...</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt"><p>2- 一站通式的整合方式，方便用户使用...</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt"><p>3- 强大的后台系统，管理内容易如反掌...</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td width="30%" height="40"><img src="images/icon-demo.gif" width="16" height="16"> <a href="http://www.e-grass.net" target="_blank" class="left_txt3">E-草工作室</a> </td>
                      <td width="35%"><img src="images/icon-login-seaver.gif" width="16" height="16"><a href="http://www.e-grass.net/Contact.asp" class="left_txt3" target="_blank"> 在线客服</a></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
            
        </table></td>
        <td width="1%" >&nbsp;</td>
        <td width="50%" valign="bottom"><table width="100%" height="59" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%">&nbsp;</td>
              <td width="96%" height="38"><span class="login_txt_bt">登陆信息网后台管理</span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="21"><table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table211" height="328">
                  <tr>
                    <td height="164" colspan="2" align="middle"><form id="form1" name="form1" action="Admin_Login.asp?Action=Login" method="post" onSubmit="return CheckForm();">
                        <table cellSpacing="0" cellPadding="0" width="100%" border="0" height="143" id="table212">
                          <tr>
                            <td width="13%" height="38" class="top_hui_text"><span class="login_txt">管理员：&nbsp;&nbsp; </span></td>
                            <td height="38" colspan="2" class="top_hui_text"><input name="UserName" id="UserName"  class="editbox4" value="" size="20">                            </td>
                          </tr>
                          <tr>
                            <td width="13%" height="35" class="top_hui_text"><span class="login_txt"> 密 码： &nbsp;&nbsp; </span></td>
                            <td height="35" colspan="2" class="top_hui_text"><input class="editbox4" type="password" id="UserPass" size="20" name="UserPass">
                              <img src="images/luck.gif" width="19" height="18"> </td>
                          </tr>
                         
                          <tr>
                            <td height="35" >&nbsp;</td>
                            <td width="20%" height="35" ><input name="Submit" type="submit" class="button" id="Submit" value="登 陆"> </td>
                            <td width="67%" class="top_hui_text"><input name="cs" type="button" class="button" id="cs" value="取 消" onClick="showConfirmMsg1()"></td>
                          </tr>
                        </table>
                        <br>
                    </form></td>
                  </tr>
                  <tr>
                    <td width="433" height="164" align="right" valign="bottom"><img src="images/login-wel.gif" width="242" height="138"></td>
                    <td width="57" align="right" valign="bottom">&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
          </table>
          </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="20"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="login-buttom-bg">
      <tr>
        <td align="center"><span class="login-buttom-txt">Copyright &copy; 2009-2010 www.865171.cn</span></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>