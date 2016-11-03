<!--#include File="CheckLogin.asp"-->
<!--#include File="../Config/Config.asp"-->
<!--#include File="../Include/Class_Function.asp"-->
<% 
if request("action")="Delete" then
 ID=ReplaceBadChar(Trim(Request("ID"))) 
 Conn.Execute("Delete * From order_number Where ID="&ID)
 end if
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
<td style="border-bottom:solid 1px #dde4e9;height:30px;width:80%">当前位置： 信息分类维护</td>
</tr>
<tr>
<td height="80" colspan="2">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="60"><img src="Images/SiteInfo.jpg" width="60" height="61"></td>
<td width="90%" valign="top">以下为所有信息分类的信息列表，点击"+"或"分类名称"继续添加分类。<br>
注意：您可以进行添加、修改、删除等操作，保存之后立即生效。</td>
</tr>
</table>
</td>
</tr>
<tr>
<td colspan="2" valign="top">
<form id="form1" name="form1" method="post" action="?action=aa">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Form" id="GridView1">
<tr>
<th width="3%" class="Right">ID</th>
<th width="4%" class="Right"><input type="checkbox" name="chkSelectAll" onclick="doCheckAll(this)" /></th>
<th colspan="2" class="Right">订单编号<a href="Order_classAdd.asp?ID=<%=ID%>">[+]</a></th>
<th width="32%" class="Right">时间</th>
<th width="13%">管理操作</th>
</tr>
<%
Set Rs=Server.CreateObject("Adodb.RecordSet")
Sql="Select * From order_number Order By posttime Asc"
Rs.Open Sql,Conn,1,1
Dim Page
Page=Request("Page")                            
PageSize = 10                                      
Rs.PageSize = PageSize               
Total=Rs.RecordCount               
PGNum=Rs.PageCount               
If Page="" Or clng(Page)<1 Then Page=1               
If Clng(Page) > PGNum Then Page=PGNum               
If PGNum>0 Then Rs.AbsolutePage=Page                         
i=0
Do While Not Rs.Eof And i<Rs.PageSize
%>
<tr onmouseover="this.bgColor='#EEF2FB'" onmouseout="this.bgColor=''">
<td class="Right"><%=Rs("ID")%></td>
<td class="Right"><input type="checkbox" name="ID" value="<%=Rs("ID")%>" /></td>
<td colspan="2" class="Right"><a href="Order_classContentEdit.asp?ID=<%=Rs("ID")%>&Page=<%=Page%>">
<%	 
 Response.Write(Rs("number"))	 
%>
</a></td>
<td class="Right"><%=Rs("posttime")%>&nbsp;</td>
 
<td><a href="Order_classContentEdit.asp?ID=<%=Rs("ID")%>&Page=<%=Page%>">编辑</a>┊<a href="?Action=Delete&ID=<%=Rs("ID")%>&Page=<%=Page%>&ParentID=<%=ID%>" onclick="if(!confirm('\u786e\u8ba4\u8981\u5c06\u8be5\u4fe1\u606f\u5206\u7c7b\u5220\u9664\u5417\uff1f')) return false;">删除</a></td>
</tr>
<%
i=i+1
Rs.MoveNext
Loop
%>
<tr>
<th colspan="4" style="font-weight:normal">操作：<a href="javascript:ChangeParent();" style="font-weight:normal">转移</a></th>
<th colspan="3" style="font-weight:normal;text-align:right"><a href="javascript:Delete();" style="font-weight:normal">删除</a>&nbsp;┊&nbsp;共<%=Rs.PageCount%>页&nbsp;第<%=Page%>页&nbsp;<%=PageSize%>条/页&nbsp;共<%=Total%>条&nbsp;
<%if Page=1 then%>
首 页&nbsp;上一页&nbsp;
<%Else%>
<a href="?Page=1">首 页</a>&nbsp;<a href="?Page=<%=Page-1%>">上一页</a>&nbsp;
<%End If%>
<%If Rs.PageCount-Page<1 Then%>下一页&nbsp;尾 页&nbsp;
<%Else%><a href="?Page=<%=Page+1%>">下一页</a>&nbsp;<a href="?Page=<%=Rs.PageCount%>">尾 页</a>&nbsp;
<%End If%></th>
<th width="12%">
<select style="FONT-SIZE: 9pt; FONT-FAMILY: 宋体;width:90%;" onChange="location=this.options[this.selectedIndex].value" name="Menu_1"> 
<%For Pagei=1 To Rs.PageCount%>
<%if Cint(Pagei)=Cint(Page) Then%>
<option value="?Page=<%=Pagei%>" selected="selected">第<%=Pagei%>页</option>
<%Else%>
<option value="?Page=<%=Pagei%>">第<%=Pagei%>页</option>
<%End If%>
<%Next%>
</select></th>
</tr>
</table>
</form>
</td>
</tr>
</table>
<script language="javascript" type="text/javascript">
function ChangeParent()
{
	var l = GetAllChecked();
    if (l == "") {
        alert("\u4f60\u8fd8\u6ca1\u6709\u9009\u62e9\u8981\u64cd\u4f5c\u7684\u8bb0\u5f55\uff01");
        return;
    }
    if (confirm('\u786e\u5b9a\u8981\u66f4\u6539\u9009\u4e2d\u7684\u7c7b\u522b\u7684\u6240\u5c5e\u7236\u7c7b\u522b\u5417\uff1f')) {
        window.location.href = 'News_ClassParent.asp?ID='+l;
    }
}
function Delete() {
    var l = GetAllChecked();
    if (l == "") {
        alert("\u4f60\u8fd8\u6ca1\u6709\u9009\u62e9\u8981\u64cd\u4f5c\u7684\u8bb0\u5f55\uff01");
        return;
    }
    if (confirm('\u786e\u8ba4\u8981\u5c06\u9009\u4e2d\u7684\u7c7b\u522b\u5220\u9664\u5417\uff1f')) {
        window.location.href = '?Action=Delete&ID='+l+'&Page=<%=Page%>&ParentID=<%=ID%>';
    }
}
</script>
</body>
</html>