<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="Include/Class_Function.asp"-->
<!--#include File="Config/Config.asp"-->
<%
 classid= ReplaceBadChar(Trim(Request("classid")))
 if classid<>"" then
 	if IsNumeric(classid)=false  then
		Response.Write("<script>alert('参数错误，确定后返回前页！');history.back();</script>")
		Response.End()
	end if 
	else
	classid=91
	end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link  href="css/content.css" rel="stylesheet" type="text/css">
<link  href="css/footer.css" rel="stylesheet" type="text/css">
<link href="images/zhirui.css" rel="stylesheet" type="text/css" />
<meta name="keywords" content="<%=SiyeKeys%>" />
<META name="Description" content="<%=SiteDes%>">
<meta name="Author" content="<%=SiteAuthor%>" />
<title><%=SiteName%></title>
</head>
<body>

<!--#include file="Include/head.asp"-->
<div style="width:1004px; margin:8px auto;"><img src="Images/ind/banner2.gif" width="1004" height="137" /></div>
<div class="Navigation_top">你所在的位置：<a href="index.asp" title="首页">首页</a> <%=GetNavnews2("newsclass",classid)%></div>
<div class="right_frame_2">
                  <div class="right_top_2">>党团建设</div>
                      <div class="news_content">
                         <ul class="new_ul">
						  <%
                         set rs=server.CreateObject("ADODB.Recordset")
                         sql="select * from newsinfo where classid="&classid&" order by NewsOrder DESC"
                         rs.open sql,conn,1,1
                         Dim Page
                            Page=Request("Page")                            
                            PageSize =10                         
                            Rs.PageSize = PageSize               
                            Total=Rs.RecordCount               
                            PGNum=Rs.PageCount               
                            If Page="" Or clng(Page)<1 Then Page=1               
                            If Clng(Page) > PGNum Then Page=PGNum              
                            If PGNum>0 Then Rs.AbsolutePage=Page                         
                            k=0   
                            if Total=0 then
                            response.Write("<li>") 
                            response.Write("无记录...") 
                            response.Write("</li>")
                            else
                             if not(rs.eof and rs.bof)  then
                             do while not rs.eof And k<Rs.PageSize
                        %>  
                             <li><span style=" float:right;"><%=GetPostTimeL(rs("ID"))%></span><a href="Party_detail.asp?id=<%=rs("id")%>&classid=<%=rs("classid")%>" title="<%=rs("NewsTitle")%>" target="_blank"><%
                                        if len(rs("NewsTitle"))>34 then
                                        response.Write(left(rs("NewsTitle"),30)&"...")
                                        else
                                        response.Write(rs("NewsTitle"))
                                        end if
                                     %></a></li>
                         <%
                            k=k+1
                            if k mod 1=0 then
                            end if
                            rs.movenext()
                            If Rs.Eof Then Exit Do
                            loop
                            end if
                            end if
                        %>
                         </ul>
                              <div class="page1"><%=GetPage1("where 1=1 and classid="&classid&"","newsinfo",10,0)%></div>
                      </div>
                  

        
        
      </div>
<!--#include file="Include/bottom.asp"-->
</body>
</html>
