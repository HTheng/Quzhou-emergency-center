﻿<!--#include File="CheckLogin.asp"-->
<!--#include File="../Config/Config.asp"-->
<!--#include File="../Include/Class_Function.asp"-->
<!--#Include File="../Editor/fckeditor.asp"-->
<%
Call ISPopedom(UserName,"Pro_ContentAdd")
Action=ReplaceBadChar(Trim(Request("Action")))
ClassID=ReplaceBadChar(Trim(Request("ClassID")))
If ClassID="" Then
	ClassID="0"
End If
If Action="Save" Then
	ShopName=ReplaceBadChar(Trim(Request("ShopName")))
	EnShopName=Trim(Request("EnShopName"))
	ClassID=ReplaceBadChar(Trim(Request("ClassID")))
	ShopSPic=Trim(Request("ShopSPic"))
	ShopBPic=Trim(Request("ShopBPic"))
	ShopSerial=ReplaceBadChar(Trim(Request("ShopSerial")))
	ShopFactory=ReplaceBadChar(Trim(Request("ShopFactory")))
	EnShopFactory=Trim(Request("EnShopFactory"))
	ShopSpec=ReplaceBadChar(Trim(Request("ShopSpec")))
	EnShopSpec=Trim(Request("EnShopSpec"))
	ShopModel=ReplaceBadChar(Trim(Request("ShopModel")))
	ShopMPrice=ReplaceBadChar(Trim(Request("ShopMPrice")))
	ShopSPrice=ReplaceBadChar(Trim(Request("ShopSPrice")))
	ShopContent=Trim(Request("ShopContent"))
	EnShopContent=Trim(Request("EnShopContent"))
	ShopLock=ReplaceBadChar(Trim(Request("ShopLock")))	
	ShopVisit=ReplaceBadChar(Trim(Request("ShopVisit")))
	'获取导航条的排序值
	Set Rs=Server.CreateObject("Adodb.RecordSet")
	Sql="Select ShopOrder From ShopInfo Order By ShopOrder Desc"
	Rs.Open Sql,Conn,1,1
	If Not (Rs.Eof Or Rs.Bof) Then
		ShopOrder=Cstr(Trim(Rs("ShopOrder")))+1
	Else
		ShopOrder=1
	End If
	Rs.Close
	Set Rs=Nothing
	Set Rs=Server.CreateObject("Adodb.RecordSet")
	Sql="Select * From ShopInfo"
	Rs.Open Sql,Conn,1,3
	Rs.AddNew
	Rs("ShopName")=ShopName
	Rs("EnShopName")=EnShopName
	Rs("ClassID")=ClassID
	Rs("ShopSPic")=ShopSPic
	Rs("ShopBPic")=ShopBPic
	Rs("ShopSerial")=ShopSerial
	Rs("ShopFactory")=ShopFactory
	Rs("EnShopFactory")=EnShopFactory
	Rs("ShopSpec")=ShopSpec
	Rs("EnShopSpec")=EnShopSpec
	Rs("ShopModel")=ShopModel
	Rs("ShopMPrice")=ShopMPrice
	Rs("ShopSPrice")=ShopSPrice
	Rs("ShopContent")=ShopContent
	Rs("EnShopContent")=EnShopContent
	Rs("ShopClick")=1
	Rs("ShopLock")=0
	Rs("ShopOrder")=ShopOrder
	Rs("ShopVisit")=0
	Rs("ShopIndex")=0
	Rs("PostTime")=Now()
	Rs.Update
	Rs.Close
	Set Rs=Nothing
	if len(Trim(Request.Cookies("CNVP_CMS2")("attributeValue")))>0 then
		Set Rs2=Server.CreateObject("Adodb.RecordSet")
		Sql2="Select top 1 ID From ShopInfo Order By ID Desc"
		Rs2.Open Sql2,Conn,1,1
		if not Rs2.eof then
			Set Rs=Server.CreateObject("Adodb.RecordSet")
			Sql="Select * From ShopAttribute"
			Rs.Open Sql,Conn,1,3
			Rs.AddNew
			Aryfieldname=Split(Trim(Request.Cookies("CNVP_CMS2")("fieldname")),",")
			AryValue=Split(Trim(Request.Cookies("CNVP_CMS2")("attributeValue")),",")
			For i = LBound(AryValue) To UBound(AryValue)
				if Request(AryValue(i))<>"" then
					Rs(Aryfieldname(i))=Request(AryValue(i))
				else
					Rs(Aryfieldname(i))=0
				end if
			Next
			Rs("ProID")=Rs2("ID")
			Rs.Update
			Rs.Close
			Set Rs=Nothing
		end if
		Rs2.Close
		Set Rs2=Nothing
	end if
	Conn.Close
	Set Conn=Nothing
	Response.Write("<script>alert('\u5546\u54c1\u4fe1\u606f\u6dfb\u52a0\u64cd\u4f5c\u6210\u529f\u3002');window.location.href='Pro_ContentAdd.asp?classid="&ClassID&"';</script>")
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
<script language="javascript" type="text/javascript" src="Common/Common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#ClassID").val("<%=ClassID%>");
});
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
<td style="border-bottom:solid 1px #dde4e9;height:30px;width:80%">当前位置：图片管理 >> 添加图片</td>
<td style="border-bottom:solid 1px #dde4e9;height:30px;width:20%; text-align:right">&nbsp;</td>
</tr>
<tr>
<td height="80" colspan="2">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="60"><img src="Images/SiteInfo.jpg" width="60" height="61"></td>
<td width="90%" valign="top">以下所有项目均不能为空，请准确真实的填写相关信息。<br>
注意：不想对外发布的图片可以设置成下架状态。</td>
</tr>
</table></td>
</tr>
<tr>
<td colspan="2" valign="top">
<script language="javascript" type="text/javascript">
function CheckForm()
{
	if ($("#EnShopName").val()=="")
	{
		alert("\u5546\u54c1\u540d\u79f0\u4e0d\u80fd\u4e3a\u7a7a\u3002");
		return false;
	}
	if ($("#ClassID").val()==0)
	{
		alert("\u8bf7\u9009\u62e9\u680f\u76ee\u0021");
		$("#ClassID").focus();
		return false;
	}
	return true;	
}
</script>
<form id="form1" name="form1" method="post" action="?Action=Save" onSubmit="return CheckForm();">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Form">
<tr>
<td colspan="4"><input type="submit" value="保 存" class="Button"> <input type="button" value="关闭窗口" class="Button" onClick="top.DeleteTabTitle('Pro_ContentAdd')"></td>
</tr>
<tr>
<th colspan="4">添加图片</th>
</tr>
<tr>
  <td width="10%" align="right" class="Right">图片名称：</td>
  <td class="Right">
  <%if Request.Cookies("CNVP_CMS2")("SiteVersion")="Chiness" then%>
  <div class="float_left_210txt">
  <input type="text" id="ShopName" name="ShopName" value="" class="Input200px"/>
  </div>
  <%end if%>
  <%if Request.Cookies("CNVP_CMS2")("SiteVersion")="English" then%>
    <div class="float_left_210txt">
    <input type="text" id="EnShopName" name="EnShopName" value="" class="Input200px"/>
    </div>
   <%end if%>
    <%if Request.Cookies("CNVP_CMS2")("SiteVersion")="CAndE" then%>
    <div class="float_left_210txt">
      <input type="text" id="ShopName" name="ShopName" value="" class="Input200px"/>
    </div>
    <div class="float_left_90">（中文名称）</div>
    <div class="float_left_210txt">
    <input type="text" id="EnShopName" name="EnShopName" value="" class="Input200px"/>
    </div>
    <div class="float_left_90">（英文名称）</div>
   <%end if%>  </td>
  <td width="10%" align="right" class="Right">图片类别：</td>
  <td width="39%">
    <%if Request.Cookies("CNVP_CMS2")("SiteVersion")="Chiness" or Request.Cookies("CNVP_CMS2")("SiteVersion")="CAndE" then%>
    <div class="float_left_210">
  <select id="ClassID" name="ClassID" style="width:200px;">
  <option value="0">|--请选择栏目</option>
  <%=GetSelect32("ShopClass",0,request("ClassID"))%>
  </select>
   </div>
    <%end if%>
    <%if Request.Cookies("CNVP_CMS2")("SiteVersion")="English" then%>
    <div class="float_left_210">
  <select id="ClassID" name="ClassID" style="width:200px;">
  <option value="0">|--请选择栏目</option>
  <%=GetSelect2("ShopClass",0)%>
  </select>
   </div>
    <%end if%>    </td>
</tr>
<tr>
  <td class="Right" align="right">小图：</td>
  <td class="Right"><div class="float_left_250txt"><input type="text" id="ShopSPic" name="ShopSPic" value="" class="Input200px"/>    
  <a href="javascript:OpenImageBrowser('ShopSPic');">浏览...</a></div>
  <div class="picsize_left_90">155*175/荣誉334×220</div></td>
  <td class="Right" align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td class="Right" align="right">大图：</td>
  <td class="Right"><div class="float_left_250txt"><input type="text" id="ShopBPic" name="ShopBPic" value="" class="Input200px"/>    
   <a href="javascript:OpenImageBrowser('ShopBPic');">浏览...</a></div>
  <div class="picsize_left_90">宽不超过500</div></td>
  <td class="Right" align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<!--<tr>
  <td align="right" class="Right">链接地址：</td>
  <td class="Right"><input type="text" id="ShopSerial" name="ShopSerial" value="" class="Input200px"/></td>
  <td align="right" class="Right">生产厂家：</td>
  <td>
    <%if Request.Cookies("CNVP_CMS2")("SiteVersion")="Chiness" then%>
    <div class="float_left_210txt">
      <input type="text" id="ShopFactory" name="ShopFactory" value="" class="Input200px"/>
      </div>
    <%end if%>
    <%if Request.Cookies("CNVP_CMS2")("SiteVersion")="English" then%>
    <div class="float_left_210txt">
      <input type="text" id="EnShopFactory" name="EnShopFactory" value="" class="Input200px"/>
      </div>
    <%end if%>
    <%if Request.Cookies("CNVP_CMS2")("SiteVersion")="CAndE" then%>
    <div class="float_left_210txt">
      <input type="text" id="ShopFactory" name="ShopFactory" value="" class="Input200px"/>
      </div>
    <div class="float_left_90">(中文)</div>
    <div class="float_left_210txt">
      <input type="text" id="EnShopFactory" name="EnShopFactory" value="" class="Input200px"/>
      </div>
    <div class="float_left_90">（英文）</div>
    <%end if%>    </td>
</tr>-->
<!--
<tr>
  <td align="right" class="Right">图片规格：</td>
  <td class="Right">
   <%if Request.Cookies("CNVP_CMS2")("SiteVersion")="Chiness" then%>
    <div class="float_left_210txt">
      <input type="text" id="ShopSpec" name="ShopSpec" value="" class="Input200px"/>
      </div>
    <%end if%>
    <%if Request.Cookies("CNVP_CMS2")("SiteVersion")="English" then%>
    <div class="float_left_210txt">
      <input type="text" id="EnShopSpec" name="EnShopSpec" value="" class="Input200px"/>
      </div>
    <%end if%>
    <%if Request.Cookies("CNVP_CMS2")("SiteVersion")="CAndE" then%>
    <div class="float_left_210txt">
      <input type="text" id="ShopSpec2" name="ShopSpec2" value="" class="Input200px"/>
    </div>
    <div class="float_left_90">(中文)</div>
    <div class="float_left_210txt">
      <input type="text" id="EnShopSpec" name="EnShopSpec" value="" class="Input200px"/>
      </div>
    <div class="float_left_90">（英文）</div>
    <%end if%>  </td>
  <td align="right" class="Right">图片型号：</td>
  <td><input type="text" id="ShopModel" name="ShopModel" value="" class="Input200px"/></td>
</tr>
<tr>
  <td class="Right" align="right">市场价格：</td>
  <td class="Right"><input type="text" id="ShopMPrice" name="ShopMPrice" value="" class="Input200px"/> 元</td>
  <td align="right" class="Right">商城价格：</td>
  <td><input type="text" id="ShopSPrice" name="ShopSPrice" value="" class="Input200px"/> 元</td>
</tr>-->
<tr>
  <td align="right" class="Right">其它：</td>
  <td colspan="3" align="left" valign="middle" style="padding-top:1px;">
  <%
tablename="ShopAttribute"
set rs2=server.createobject("adodb.recordset")
rs2.open "select top 1 * from "&tablename,conn,3,1
if rs2.fields.count>0 then
For i=0 To rs2.fields.count-1
if Trim(rs2(i).name)<>"ID" and Trim(rs2(i).name)<>"ProID" then
%>
  <table border="0" cellspacing="0" cellpadding="0" style="border-bottom:1px solid #FFFFFF;">
  <tr>
    <td class="Right tdleft tdtop"><input type="text" id="<%="name"&i%>" name="<%="name"&i%>" readonly="readonly" value="<%=Trim(rs2(i).name)%>" class="Input200px"/></td>
    <td class="Right tdtop"><input type="text" id="<%="value"&i%>" name="<%="value"&i%>" value="" class="Input200px"/></td>
  </tr>
</table>
<%
if len(fieldname)=0 and len(attributeValue)=0 then
attributeValue="value"&i
fieldname=Trim(rs2(i).name)
else
attributeValue=attributeValue&","&"value"&i
fieldname=fieldname&","&Trim(rs2(i).name)
end if

end if
Next
Response.Cookies("CNVP_CMS2")("attributeValue")=attributeValue
Response.Cookies("CNVP_CMS2")("fieldname")=fieldname
if len(Trim(Request.Cookies("CNVP_CMS2")("attributeValue")))=0 then
	Response.Write("&nbsp;")
end if
end if
%>
  </td>
  </tr>
<tr>
  <td align="right" class="Right">图片描述：</td>
  <td colspan="3" align="left" valign="top">
    <%if Request.Cookies("CNVP_CMS2")("SiteVersion")="Chiness" then%>
		<%=Editor2("ShopContent","")%><span id="timemsg"></span><span id="msg2"></span><span id="msg"></span>
		<script src="AutoSave.asp?Action=AutoSave&amp;FrameName=ShopContent"></script>
    <%end if%>
    <%if Request.Cookies("CNVP_CMS2")("SiteVersion")="English" then%>
		<%=Editor2("EnShopContent","")%><span id="timemsg"></span><span id="msg2"></span><span id="msg"></span>
		<script src="AutoSave.asp?Action=AutoSave&amp;FrameName=ShopContent&amp;EnFrameName=EnShopContent"></script>
    <%end if%>
    <%if Request.Cookies("CNVP_CMS2")("SiteVersion")="CAndE" then%>
		<div class="float_left_90">中文描述</div>
		<%=Editor2("ShopContent","")%><span id="timemsg"></span><span id="msg2"></span><span id="msg"></span>
		<div class="float_left_90">英文描述</div>
		<%=Editor2("EnShopContent","")%><span id="timemsg3"></span><span id="msg23"></span><span id="msg3"></span>
		<script src="AutoSave.asp?Action=AutoSave&amp;FrameName=ShopContent&amp;EnFrameName=EnShopContent"></script>
    <%end if%>  </td>
</tr>
<!--<tr>
  <td class="Right" align="right">浏览人群：</td>
  <td class="Right"><input type="radio" id="ShopVisit" name="ShopVisit" value="0" checked="checked"/>所有人群<input type="radio" id="ShopVisit" name="ShopVisit" value="1"/>网站会员</td>
  <td class="Right" align="right">图片状态：</td>
  <td><input type="radio" id="ShopLock" name="ShopLock" value="0" checked="checked"/>图片上架<input type="radio" id="ShopLock" name="ShopLock" value="1"/>图片下架</td>
</tr>-->
<tr>
<td class="Right" align="right">&nbsp;</td>
<td colspan="3"><input type="submit" value="保 存" class="Button"> <input type="button" value="关闭窗口" class="Button" onClick="top.DeleteTabTitle('Pro_ContentAdd')"></td>
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