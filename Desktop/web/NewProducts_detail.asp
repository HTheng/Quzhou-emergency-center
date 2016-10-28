<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="Include/Class_Function.asp"-->
<!--#include File="Config/Config.asp"--> 

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css" />
<link rel="stylesheet" href="css/top.css" type="text/css" />
<link rel="stylesheet" href="css/content.css" type="text/css">
<link rel="stylesheet" href="css/footer.css" type="text/css">
<meta name="keywords" content="<%=SiyeKeys%>" />
<META name="Description" content="<%=SiteDes%>">
<meta name="Author" content="<%=SiteAuthor%>" />
<title><%=SiteName%></title>
<%
 classid= ReplaceBadChar(Trim(Request("classid")))
 if classid<>"" then
 	if IsNumeric(classid)=false  then
		Response.Write("<script>alert('参数错误，确定后返回前页！');history.back();</script>")
		Response.End()
	end if 
	 
	end if
 ShopOrder= ReplaceBadChar(Trim(Request("ShopOrder")))
 if ShopOrder<>"" then
 	if IsNumeric(ShopOrder)=false  then
		Response.Write("<script>alert('参数错误，确定后返回前页！');history.back();</script>")
		Response.End()
	end if 
	end if

%>

<%
 id= ReplaceBadChar(Trim(Request("id")))
 if id<>"" then
 	if IsNumeric(id)=false  then
		Response.Write("<script>alert('参数错误，确定后返回前页！');history.back();</script>")
		Response.End()
	end if 
	end if
	
	
Set Rs=Server.CreateObject("Adodb.RecordSet")
Sql="Select * From [shopInfo] where id="&id&""
rs.open sql,conn,1,1
If Not (Rs.Eof Or Rs.Bof) Then
shopname=Rs("shopname") 
shopbspic=rs("shopbpic")
shopmodel=rs("shopmodel")
shopcontent=rs("shopcontent")
Rs.Close
Set Rs=Nothing
Else
Response.Write("<script>alert('参数错误，确定后返回前页！');history.back();</script>")
Response.End()
End If
%> 
<script language="javascript" type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script language="javascript" type="text/javascript">
$(function(){
	 $(".menu a").eq(0).hover( function(){$(this).removeClass("li1").addClass("li11"); },function(){ $(this).removeClass("li11").addClass("li1");});
	 $(".menu a").eq(1).hover( function(){$(this).removeClass("li2").addClass("li21"); },function(){ $(this).removeClass("li21").addClass("li2");}); 
	 $(".menu a").eq(2).hover( function(){$(this).removeClass("li3").addClass("li31"); },function(){ $(this).removeClass("li31").addClass("li3");}); 
	 $(".menu a").eq(3).removeClass("li4").addClass("li41");
	 $(".menu a").eq(4).hover( function(){$(this).removeClass("li5").addClass("li51"); },function(){ $(this).removeClass("li51").addClass("li5");});
	 $(".menu a").eq(5).hover( function(){$(this).removeClass("li6").addClass("li61"); },function(){ $(this).removeClass("li61").addClass("li6");});
     $(".menu a").eq(6).hover( function(){$(this).removeClass("li7").addClass("li71"); },function(){ $(this).removeClass("li71").addClass("li7");});
     $(".menu a").eq(7).hover( function(){$(this).removeClass("li8").addClass("li81"); },function(){ $(this).removeClass("li81").addClass("li8");});
	})
</script>
</head>
<body>
<div class="big">
   	<!--#include file="top1.asp"-->
    <div class="content1">
      <!--#include file="left1.asp"-->
      <div class="right1">
         <div class="run1"> <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="738" height="232">
               <param name="movie" value="Flash/banner2.swf" />
               <param name="quality" value="high" />
               <param name="wmode" value="opaque" />
               <embed src="Flash/banner2.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="738" height="232"></embed>
             </object></div>
         <div class="c_title1"> New Products</div>
         <div class="Pro_content1">
             <table width="100%" border="0">
                            <tr>
                            <td  valign="top" align="center" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                            <td height="30" align="right" style=" padding-right:20px;">【<a href='javascript:window.close()' style="color:#747474;">关闭本页</a>】</td>
                            </tr>
                            <tr>
                            <td align="center"> <img src="<%=shopbspic%>" border="0"   width="650"  style="margin-bottom:30px;" /> </td>
                            </tr>
                            </table></td>
                            </tr>
                            <tr>
                            <td ><table width="650" align="center" cellpadding="4" cellspacing="1" bgcolor="#CCCCCC">
                            <tr>
                            <td width="120" height="25" align="left" bgcolor="#F4f4f4">&nbsp;Product name:</td>
                            <td width="530" height="25" align="left" bgcolor="#FFFFFF"><span class="hei">&nbsp;<%=shopname%></span></td>
                            </tr>
                            <tr>
                            <td height="25" align="left" bgcolor="#F4f4f4">&nbsp;Product description:   </td>
                        <td height="25" align="left" bgcolor="#F4f4f4"><div style="margin-left:6px;"><%=shopcontent%></div>
                        </td>
                            </tr>
                            </table> </td>
                            </tr> 
                            </table>    
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="50" align="center">
       <%
                       Set Rs=Server.CreateObject("Adodb.RecordSet")
                      Sql="Select Top 1 *  From [ShopInfo] Where ShopOrder>"&ShopOrder&"  and classid="&classid&"  order by ShopOrder asc"
                      Rs.Open Sql,Conn,1,1
                      if Rs.Recordcount>0 then
                      %>
                Previous:&nbsp;<a href="NewProducts_detail.asp?ID=<%=Rs("id")%>&classid=<%=Rs("classid")%>&ShopOrder=<%=rs("ShopOrder")%>"><%=Rs("ShopName")%></a>
                     <% else %> &nbsp;&nbsp;&nbsp;
                    Previous:&nbsp;
                    <% Response.write("No information") %>
                      
                     <% End if %>
                      <%
                        
                      
                        Set Rs=Server.CreateObject("Adodb.RecordSet")
                        Sql="Select Top 1 *  From [ShopInfo] Where ShopOrder<"&ShopOrder&" and classid="&classid&" order by ShopOrder desc"
                        Rs.Open Sql,Conn,1,1
                        if Rs.recordcount>0 then%>
                       Next:&nbsp;<a href="NewProducts_detail.asp?id=<%=Rs("id")%>&classid=<%=Rs("classid")%>&ShopOrder=<%=rs("ShopOrder")%>"><%=Rs("ShopName")%></a>
                        <% Else %>
                      Next:&nbsp;
                      <% Response.write("No information") %>
                        <%end if%>
    </td>
  </tr>
</table>
         </div>
      </div>
     
       <div style="clear:both"></div>
    </div>
   <div style="clear:both"></div>
   <!--#include file="footer.asp"-->  
</div> 
</body>
</html>
