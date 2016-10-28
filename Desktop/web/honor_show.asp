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
<script language="javascript" type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script language="javascript" type="text/javascript">
$(function(){
	 $(".menu a").eq(0).hover( function(){$(this).removeClass("li1").addClass("li11"); },function(){ $(this).removeClass("li11").addClass("li1");});
	 $(".menu a").eq(1).hover( function(){$(this).removeClass("li2").addClass("li21"); },function(){ $(this).removeClass("li21").addClass("li2");}); 
	 $(".menu a").eq(2).hover( function(){$(this).removeClass("li3").addClass("li31"); },function(){ $(this).removeClass("li31").addClass("li3");}); 
	 $(".menu a").eq(3).hover( function(){$(this).removeClass("li4").addClass("li41"); },function(){ $(this).removeClass("li41").addClass("li4");});
 	 $(".menu a").eq(4).hover( function(){$(this).removeClass("li5").addClass("li51"); },function(){ $(this).removeClass("li51").addClass("li5");});
	 $(".menu a").eq(5).removeClass("li6").addClass("li61");
     $(".menu a").eq(6).hover( function(){$(this).removeClass("li7").addClass("li71"); },function(){ $(this).removeClass("li71").addClass("li7");});
     $(".menu a").eq(7).hover( function(){$(this).removeClass("li8").addClass("li81"); },function(){ $(this).removeClass("li81").addClass("li8");});
	})
</script>

<%
classid=ReplaceBadChar(Trim(request("classid")))
if classid<>"" then
if IsNumeric(classid)=false then
	Response.Write("<script>alert('参数错误，确定后返回前页！');history.back();</script>")
	Response.End()
End if
End if	

 id= ReplaceBadChar(Trim(Request("id")))
 if id<>"" then
 	if IsNumeric(id)=false  then
		Response.Write("<script>alert('参数错误，确定后返回前页！');history.back();</script>")
		Response.End()
	end if 
	end if
	
Set Rs=Server.CreateObject("Adodb.RecordSet")
Sql="Select * From [NewsInfo] where id="&id&" and classid="&classid&""
rs.open sql,conn,1,1
If Not (Rs.Eof Or Rs.Bof) Then
NewsTitle=Rs("NewsTitle") 
NewsBPic=rs("NewsBPic")
NewsContent=rs("NewsContent")
Rs.Close
Set Rs=Nothing
Else
Response.Write("<script>alert('参数错误，确定后返回前页！');history.back();</script>")
Response.End()
End If
%> 

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
         <div class="c_title1">Honor</div>
         <div class="Honor_content1">
            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="<%=NewsBPic%>" border="0" width="653"   style="margin-bottom:5px;" /></td>
  </tr>
  <tr>
    <td align="center"><%=NewsTitle%></td>
  </tr>
  <tr>
    <td align="center"><%=NewsContent%></td>
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
