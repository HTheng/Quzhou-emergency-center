<table width='1200' border='0' align='center' cellpadding='0' cellspacing='0' style=" background: url(images/ind/top_bg.gif) repeat-y;">
<tr><td width='587' align="right"><img src="/Images/ind/logo.gif" width="489" height="110" /></td>
<td align="right" valign="bottom">
<div class="r_120"><img src="/Images/ind/r_120.gif" width="354" height="42" /></div>
</td>
</tr></table>

<table width=1200  height=40  border=0  cellpadding=0 cellspacing=0 align=center >
<tr><td>
 <div class='blue'><div id='slatenav'>
  <ul id="nav">
      <li><a href="Index.asp"  title="">网站首页</a></li>
     <li><a href="About.asp"  title="">中心简介</a>
        <ul>
			  <%
					  set rs=server.CreateObject("ADODB.Recordset")
					  sql="select * from User_PageCategory where User_NavParent=43 "
					  rs.open sql,conn,1,1
					  Total=Rs.RecordCount
					  if Total=0 then
					  response.Write("<li>") 
					  response.Write("无记录...") 
					  response.Write("</li>")
					  else
					  if not(rs.eof and rs.bof) then
					  do while not rs.eof
					 %>
            <li title="<%=rs("User_NavTitle")%>" target="_self"><a href="About.asp?classid=<%=rs("ID")%>"><%=rs("User_NavTitle")%></a></li>
                   <%
					rs.movenext()
					If rs.Eof Then Exit Do
					loop
					end if
					end if 
				   %>
		</ul>

     </li>
           
     <li><a href="Dynamic.asp"  title="">急救动态</a></li>
      <li><a href="Inform.asp" title="" >政务信息</a></li>
     <li ><a href="Dynamic_knowledge.asp"  title="">急救知识</a></li>
     <li ><a href="Training.asp" title="">培训教育</a></li>
     <li ><a href="Party.asp"  title="">党团建设</a></li>
     <li ><a href="Contact.asp" title="">联系我们</a></li>
     <li ><a href="Service.asp" title="">为您服务</a></li>
     <li ><a href="Picture.asp" title="">图片新闻</a></li>
	</ul>
  </div></div>
</td></tr></table>

 
<div id="flow_wbox">
            这是一个悬浮窗口
</div>