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
	 $(".menu a").eq(2).removeClass("li3").addClass("li31");
	 $(".menu a").eq(3).hover( function(){$(this).removeClass("li4").addClass("li41"); },function(){ $(this).removeClass("li41").addClass("li4");});   
	 $(".menu a").eq(4).hover( function(){$(this).removeClass("li5").addClass("li51"); },function(){ $(this).removeClass("li51").addClass("li5");});
	 $(".menu a").eq(5).hover( function(){$(this).removeClass("li6").addClass("li61"); },function(){ $(this).removeClass("li61").addClass("li6");});
     $(".menu a").eq(6).hover( function(){$(this).removeClass("li7").addClass("li71"); },function(){ $(this).removeClass("li71").addClass("li7");});
     $(".menu a").eq(7).hover( function(){$(this).removeClass("li8").addClass("li81"); },function(){ $(this).removeClass("li81").addClass("li8");});
	})
</script>
<%
 classid= ReplaceBadChar(Trim(Request("classid")))
 if classid<>"" then
 	if IsNumeric(classid)=false  then
		Response.Write("<script>alert('参数错误，确定后返回前页！');history.back();</script>")
		Response.End()
	end if 
	else
	classid=71
	end if
%>
</head>
<body>
<div class="big">
   	<!--#include file="top1.asp"-->
      <div class="run"><!--#include file="Run.asp"--></div>
    <div class="content">
      <!--#include file="left.asp"-->
      <div class="right">
         <div class="c_title"> Products</div>
         <div class="Pro_content">
             <ul>
                 <%
					set rs=server.CreateObject("ADODB.Recordset")
					sql="select * from shopinfo where classid="&classid&" order by ShopOrder desc"
					rs.open sql,conn,1,1
					Dim Page
					Page=Request("Page")                            
					PageSize =pagesizes                         
					Rs.PageSize = 16               	  
					Total=Rs.RecordCount               
					PGNum=Rs.PageCount               
					If Page="" Or clng(Page)<1 Then Page=1               
					If Clng(Page) > PGNum Then Page=PGNum              
					If PGNum>0 Then Rs.AbsolutePage=Page                         
					i=0   
					if Total=0 then
					response.Write("<li>") 
					response.Write("No record...") 
					response.Write("</li>")
					else
					if not(rs.eof and rs.bof) then
					do while not rs.eof And i<rs.PageSize
				 %>       
                          <li><a href="Products_detail.asp?id=<%=rs("id")%>&classid=<%=rs("classid")%>&ShopOrder=<%=rs("ShopOrder")%>" title="<%=rs("ShopName")%>" target="_blank"><img src="<%=rs("ShopSPic")%>" width="132" height="132" border="1"/></a>
                         <div><a href="Products_detail.asp?ID=<%=rs("ID")%>&classid=<%=rs("classid")%>&ShopOrder=<%=rs("ShopOrder")%>" title="<%=rs("ShopName")%>" target="_blank"  style="color:#000000;"><%=rs("shopname")%></a></div>
                          </li>
							 <%
                                i=i+1
                                if i mod 1=0 then
                                end if
                                rs.movenext()
                                If rs.Eof Then Exit Do
                                loop
                                end if
                                end if
                             %>
                               </ul>
                                <div style="clear:both"></div>
                   <div class="page"><%=GetPage1("where 1=1 and classid="&classid&"","shopinfo",16,1)%></div>
          
         </div>
      </div>
     
       <div style="clear:both"></div>
    </div>
   <div style="clear:both"></div>
   <!--#include file="footer.asp"-->  
</div> 
</body>
</html>
