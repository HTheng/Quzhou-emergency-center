<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="Include/Class_Function.asp"-->
<!--#include File="Config/Config.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="css/footer.css" type="text/css">
<link href="css/content.css" rel="stylesheet" type="text/css" />
<link href="images/zhirui.css" rel="stylesheet" type="text/css" />

<meta name="keywords" content="<%=SiyeKeys%>" />
<META name="Description" content="<%=SiteDes%>">
<meta name="Author" content="<%=SiteAuthor%>" />
<title><%=SiteName%></title>
<style>

#move{background:#cc0;width:662px; z-index:-1;}
#move a{position:absolute;}
#move img{width:662px; height:234px;}
.num { position:absolute; bottom:10px; right:10px; z-index:5;}
.num a { float:left; display:block;margin:1px;width:20px;height:20px;text-align:center;font:700 12px/20px "宋体",sans-serif;color:#fff;text-decoration:none;background:#666;border:1px solid #fff;filter:alpha(opacity=40);opacity:.4;   }
.num a:hover {background:#000}
</style>
<SCRIPT language="javascript" src="Include/js.js"></SCRIPT>
</head>
<body>

   	<!--#include file="Include/head.asp"-->
	<div class="index_body">
    <table width="1004" border="0" cellspacing="0" cellpadding="0">
        <tr>
        <td width="662" valign="top">
        <div style="position:relative; height:234px;">
        <div class="num">
	    <a class="act" id=a0 onmouseover=clearAuto(); onclick=Mea(0); onmouseout=setAuto() href="#" target=_self>1</a> 
		<a class="nor" id=a1 onmouseover=clearAuto(); onclick=Mea(1); onmouseout=setAuto() href="#" target=_self>2</a> 
		<a class="nor" id=a2 onmouseover=clearAuto(); onclick=Mea(2); onmouseout=setAuto() href="#" target=_self>3</a>
		<a class="nor" id=a3 onmouseover=clearAuto(); onclick=Mea(3); onmouseout=setAuto() href="#" target=_self>4</a>
		<a class="nor" id=a4 onmouseover=clearAuto(); onclick=Mea(4); onmouseout=setAuto() href="#" target=_self>5</a>
	  </div>
    
	<div id="move">
        <%
                         set rs=server.CreateObject("ADODB.Recordset")
                         sql="select * from SiteAds order by AdsRemark"
                         rs.open sql,conn,1,1
                         Dim Page12
                            Page12=Request("Page")                            
                            PageSize =5                  
                            Rs.PageSize = PageSize               
                            Total=Rs.RecordCount               
                            PGNum=Rs.PageCount               
                            If Page12="" Or clng(Page12)<1 Then Page12=1               
                            If Clng(Page12) > PGNum Then Page12=PGNum              
                            If PGNum>0 Then Rs.AbsolutePage=Page12                         
                            k=0   
                            if Total=0 then
                            else
                             if not(rs.eof and rs.bof)  then
                             do while not rs.eof And k<Rs.PageSize
                        %>  
                         <a href="javascript:;" target="_self"><img id="pc_<%=rs("AdsRemark")%>" style="DISPLAY: block" src="<%=rs("AdsPicUrl")%>"/></a>
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
              
  
	</div>
   </div>
     </td>
        <td width="342" valign="top">
        <div class="ind_title"><div style=" margin-left:4px;">>通知公告</div></div>
         <div class="ind_notice">
                         <ul class="ind_li">
						  <%
                         set rs=server.CreateObject("ADODB.Recordset")
                         sql="select * from newsinfo where classid=87 order by NewsOrder DESC"
                         rs.open sql,conn,1,1
                         Dim Page
                            Page=Request("Page")                            
                            PageSize =8                        
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
                             <li><span style="float:right;"><%=GetPostTimeL(rs("ID"))%></span><a href="Inform_detail.asp?id=<%=rs("id")%>" title="<%=rs("NewsTitle")%>" target="_blank"><%
                                        if len(rs("NewsTitle"))>18 then
                                        response.Write(left(rs("NewsTitle"),18)&"...")
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
                             
                      </div>
                      <div class="lowerRight"><a href="Inform.asp" title="更多" target="_self">更多</a></div>
        </td>
        </tr>
    </table>
      <div>
   		<div style="width:334px; height:auto; float:left;">
        	<div class="ind_title">>中心简介</div>
            <div class="ind_img_01"></div>
            <div class="ind_notice">
                <ul class="ind_li">
						  <%
                         set rs=server.CreateObject("ADODB.Recordset")
                         sql="select * from newsinfo where classid=87 order by NewsOrder DESC"
                         rs.open sql,conn,1,1
                         Dim Page1
                            Page1=Request("Page")                            
                            PageSize =8                     
                            Rs.PageSize = PageSize               
                            Total=Rs.RecordCount               
                            PGNum=Rs.PageCount               
                            If Page1="" Or clng(Page)<1 Then Page1=1               
                            If Clng(Page1) > PGNum Then Page1=PGNum              
                            If PGNum>0 Then Rs.AbsolutePage=Page1                        
                            k=0   
                            if Total=0 then
                            response.Write("<li>") 
                            response.Write("无记录...") 
                            response.Write("</li>")
                            else
                             if not(rs.eof and rs.bof)  then
                             do while not rs.eof And k<Rs.PageSize
                        %>  
                             <li><span style="float:right;"><%=GetPostTimeL(rs("ID"))%></span><a href="Inform_detail.asp?id=<%=rs("id")%>" title="<%=rs("NewsTitle")%>" target="_blank"><%
                                        if len(rs("NewsTitle"))>18 then
                                        response.Write(left(rs("NewsTitle"),18)&"...")
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
            </div>
            <div class="lowerRight"><a href="Inform.asp" title="更多" target="_blank">更多</a></div>
        </div>
        <div style="width:334px; float:left;">
        	<div class="ind_title">>急救动态</div>
            <div class="ind_img_02"></div>
            <div class="ind_notice">
               <ul class="ind_li">
						  <%
                         set rs=server.CreateObject("ADODB.Recordset")
                         sql="select * from newsinfo where classid=86 order by NewsOrder DESC"
                         rs.open sql,conn,1,1
                         Dim Page2
                            Page2=Request("Page")                            
                            PageSize =8                    
                            Rs.PageSize = PageSize               
                            Total=Rs.RecordCount               
                            PGNum=Rs.PageCount               
                            If Page2="" Or clng(Page2)<1 Then Page2=1               
                            If Clng(Page2) > PGNum Then Page2=PGNum              
                            If PGNum>0 Then Rs.AbsolutePage=Page2                         
                            k=0   
                            if Total=0 then
                            response.Write("<li>") 
                            response.Write("无记录...") 
                            response.Write("</li>")
                            else
                             if not(rs.eof and rs.bof)  then
                             do while not rs.eof And k<Rs.PageSize
                        %>  
                             <li><span style="float:right;"><%=GetPostTimeL(rs("ID"))%></span><a href="Dynamic_detail.asp?id=<%=rs("id")%>" title="<%=rs("NewsTitle")%>" target="_blank"><%
                                        if len(rs("NewsTitle"))>18 then
                                        response.Write(left(rs("NewsTitle"),18)&"...")
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
            </div>
            <div class="lowerRight"><a href="Dynamic.asp" target="_self" title="更多">更多</a></div>
        </div>
        <div style="width:334px; float:right;">
        	<div class="ind_title">>政务信息</div>
            <div class="ind_img_03"></div>
            <div class="ind_notice">
                <ul class="ind_li">
						  <%
                         set rs=server.CreateObject("ADODB.Recordset")
                         sql="select * from newsinfo where classid=88 order by NewsOrder DESC"
                         rs.open sql,conn,1,1
                         Dim Page3
                            Page3=Request("Page")                            
                            PageSize =8                      
                            Rs.PageSize = PageSize               
                            Total=Rs.RecordCount               
                            PGNum=Rs.PageCount               
                            If Page3="" Or clng(Page3)<1 Then Page3=1               
                            If Clng(Page3) > PGNum Then Page3=PGNum              
                            If PGNum>0 Then Rs.AbsolutePage=Page3                         
                            k=0   
                            if Total=0 then
                            response.Write("<li>") 
                            response.Write("无记录...") 
                            response.Write("</li>")
                            else
                             if not(rs.eof and rs.bof)  then
                             do while not rs.eof And k<Rs.PageSize
                        %>  
                             <li><span style="float:right;"><%=GetPostTimeL(rs("ID"))%></span><a href="Inform_detail.asp?id=<%=rs("id")%>" title="<%=rs("NewsTitle")%>" target="_blank"><%
                                        if len(rs("NewsTitle"))>18 then
                                        response.Write(left(rs("NewsTitle"),18)&"...")
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
            </div>
            <div class="lowerRight"><a href="Inform.asp" target="_self" title="更多">更多</a></div>
        </div>
      <div style=" clear:both;"></div>
      </div>
      
     <div class="ad0"><img src="images/ad.gif" width="1004" height="110" /></div>
     
     
     <div class="ind_notice">
           <div style="width:334px; float:left;">
        	<div class="ind_title">>急救知识</div>
            <div class="ind_img_01"></div>
            <div class="ind_notice">
                <ul class="ind_li">
						  <%
                         set rs=server.CreateObject("ADODB.Recordset")
                         sql="select * from newsinfo where classid=89 order by NewsOrder DESC"
                         rs.open sql,conn,1,1
                         Dim Page4
                            Page4=Request("Page")                            
                            PageSize =8                         
                            Rs.PageSize = PageSize               
                            Total=Rs.RecordCount               
                            PGNum=Rs.PageCount               
                            If Page4="" Or clng(Page)<1 Then Page4=1               
                            If Clng(Page4) > PGNum Then Page4=PGNum              
                            If PGNum>0 Then Rs.AbsolutePage=Page4                        
                            k=0   
                            if Total=0 then
                            response.Write("<li>") 
                            response.Write("无记录...") 
                            response.Write("</li>")
                            else
                             if not(rs.eof and rs.bof)  then
                             do while not rs.eof And k<Rs.PageSize
                        %>  
                             <li><span style="float:right;"><%=GetPostTimeL(rs("ID"))%></span><a href="Dynamic_knowledge_detail.asp?id=<%=rs("id")%>" title="<%=rs("NewsTitle")%>" target="_blank"><%
                                        if len(rs("NewsTitle"))>18 then
                                        response.Write(left(rs("NewsTitle"),18)&"...")
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
            </div>
            <div class="lowerRight"><a href="Dynamic_knowledge.asp" target="_self" title="更多">更多</a></div>
        </div>
        
        
        
        <div style="width:334px; float:left;">
        	<div class="ind_title">>培训教育</div>
            <div class="ind_img_01"></div>
            <div class="ind_notice">
                <ul class="ind_li">
						  <%
                         set rs=server.CreateObject("ADODB.Recordset")
                         sql="select * from newsinfo where classid=90 order by NewsOrder DESC"
                         rs.open sql,conn,1,1
                         Dim Page5
                            Page5=Request("Page")                            
                            PageSize =10                         
                            Rs.PageSize = PageSize               
                            Total=Rs.RecordCount               
                            PGNum=Rs.PageCount               
                            If Page5="" Or clng(Page)<1 Then Page5=1               
                            If Clng(Page5) > PGNum Then Page5=PGNum              
                            If PGNum>0 Then Rs.AbsolutePage=Page5                        
                            k=0   
                            if Total=0 then
                            response.Write("<li>") 
                            response.Write("无记录...") 
                            response.Write("</li>")
                            else
                             if not(rs.eof and rs.bof)  then
                             do while not rs.eof And k<Rs.PageSize
                        %>  
                             <li><span style="float:right;"><%=GetPostTimeL(rs("ID"))%></span><a href="Training_detail.asp?id=<%=rs("id")%>" title="<%=rs("NewsTitle")%>" target="_blank"><%
                                        if len(rs("NewsTitle"))>18 then
                                        response.Write(left(rs("NewsTitle"),18)&"...")
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
            </div>
            <div class="lowerRight"><a href="Training.asp" target="_self" title="更多">更多</a></div>
        </div>
        
        
        <div style="width:334px; float:right;">
        	<div class="ind_title">>党团建设</div>
            <div class="ind_img_03"></div>
            <div class="ind_notice">
                <ul class="ind_li">
						  <%
                         set rs=server.CreateObject("ADODB.Recordset")
                         sql="select * from newsinfo where classid=91 order by NewsOrder DESC"
                         rs.open sql,conn,1,1
                         Dim Page6
                            Page6=Request("Page")                            
                            PageSize =4                         
                            Rs.PageSize = PageSize               
                            Total=Rs.RecordCount               
                            PGNum=Rs.PageCount               
                            If Page6="" Or clng(Page6)<1 Then Page6=1               
                            If Clng(Page6) > PGNum Then Page6=PGNum              
                            If PGNum>0 Then Rs.AbsolutePage=Page6                         
                            k=0   
                            if Total=0 then
                            response.Write("<li>") 
                            response.Write("无记录...") 
                            response.Write("</li>")
                            else
                             if not(rs.eof and rs.bof)  then
                             do while not rs.eof And k<Rs.PageSize
                        %>  
                             <li><span style="float:right;"><%=GetPostTimeL(rs("ID"))%></span><a href="Party_detail.asp?id=<%=rs("id")%>" title="<%=rs("NewsTitle")%>" target="_blank"><%
                                        if len(rs("NewsTitle"))>18 then
                                        response.Write(left(rs("NewsTitle"),18)&"...")
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
            </div>
            <div class="lowerRight"><a href="Party.asp" target="_self" title="更多">更多</a></div>
        </div>
        
     </div>
     
</div>
    <div style=" clear:both;"></div>
    <!--#include file="Include/bottom.asp"-->

</body>
</html>
