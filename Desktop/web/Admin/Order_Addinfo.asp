<!--#include File="CheckLogin.asp"-->
<!--#include File="../Config/Config.asp"-->
<!--#include File="../Include/Class_Function.asp"-->
<!--#Include File="../Editor/fckeditor.asp"-->
<%
If ReplaceBadChar(Trim(Request("Action")))="Save" Then
	numbers=(Trim(Request("number")))
	posttime=ReplaceBadChar(Trim(Request("posttime")))
	img=(Trim(Request("img")))
	recordContent=Trim(Request("recordContent"))
	 
	 
	Set Rs=Server.CreateObject("Adodb.RecordSet")
	Sql="Select * From order_file"
	Rs.Open Sql,Conn,1,3
	Rs.AddNew
	Rs("number")=numbers
	Rs("posttime")=posttime
	Rs("img")=img
	Rs("recordContent")=recordContent
	Rs.Update
	Conn.Close
	Set Conn=Nothing
	Response.Write("<script>alert('\u4fe1\u606f\u5206\u7c7b\u4fe1\u606f\u6dfb\u52a0\u64cd\u4f5c\u6210\u529f\u3002');window.location.href='Order_info.asp';</script>")
	Response.End()
 
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=SiteName%></title>
<link href="Style/Main.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="Common/Jquery.js"></script>
<script language="javascript" type="text/javascript" src="Common/Common.js"></script>
 
</head>
<body>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<td style="border-bottom:solid 1px #dde4e9;height:30px;width:80%">当前位置：</td>
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

<form id="form1" name="form1" method="post" action="?Action=Save" >
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Form">
<tr>
<td colspan="4"><input type="submit" value="保 存" class="Button"> <input type="button" value="关闭窗口" class="Button" onClick="top.DeleteTabTitle('Pro_ContentAdd')"></td>
</tr>
<tr>
<th colspan="4">添加图片</th>
</tr>
<tr>
  <td width="11%" align="right" class="Right">订单编号：</td>
  <td width="60%" class="Right">
  
  <div class="float_left_210txt">
  <select id="ClassID" name="number" style="width:200px;">
  <option value="0">|--请选择订单编号</option>
   <%
      set rs1=server.CreateObject("ADODB.Recordset")
	  sql1="select * from order_number"
	  rs1.open sql1,conn,1,1
	  do while not rs1.eof
   %> 
   <option value="<%=rs1("number")%>"><%=rs1("number")%></option>
   <%
     rs1.movenext()
	 loop
	 
   %>
  </select>
  </div>
  </td>
</tr>
<tr>
 <td   align="right" class="Right">维护时间：</td>
  <td width="60%"> 
    <div class="float_left_210" >
  <input type="text" id="posttime" name="posttime" value="" class="Input200px"  />
   </div>(格式：2012-3-18)
       </td>
</tr>
<tr>
  <td class="Right" align="right">图片：</td>
  <td colspan="3" class="Right"><div class="float_left_250txt"><input type="text" id="img" name="img" value="" class="Input200px"/>    
    <a href="javascript:OpenImageBrowser('img');">浏览...</a></div>
   <div class="picsize_left_90" style="width:150px; font-size:10px;">图片大小：250*260 </div></td>
  </tr> 
<tr>
  <td align="right" class="Right">红豆杉数据：</td>
  <td colspan="3" align="left" valign="top">     
		<div class="float_left_90">中文描述</div>
		<%=Editor2("recordContent","")%><span id="timemsg"></span><span id="msg2"></span><span id="msg"></span>
		 
 
     </td>
</tr>

<tr>
<td class="Right" align="right">&nbsp;</td>
<td colspan="3"><input type="submit" value="保 存" class="Button"> <input type="button" value="关闭窗口" class="Button" onClick="top.DeleteTabTitle('Pro_ContentAdd')"></td>
</tr>
</table>
</form>
</td>
</tr>
</table>
</body>
</html>