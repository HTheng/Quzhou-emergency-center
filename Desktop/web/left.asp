<div class="left">
        <div class="left_title">Products</div>
        <div class="left_1">
           <ul class="Pro">
             <%
				 set rsa=server.CreateObject("ADODB.Recordset")
				 sql="select * from ShopClass where Navparent=55"
				 rsa.open sql,conn,1,1
				 if not(rsa.eof and rsa.bof) then
				 do while not rsa.eof
				   %>
				   <li><a href="Products.asp?classid=<%=rsa("ID")%>" style="color:#ffffff;"><%=rsa("NavTitle")%> </a> </li>
				   <%
				   rsa.movenext()
				   if rsa.eof then exit do
				   loop
				   end if
			%>
           </ul>
        </div><!--left_1-->
        <div class="contact">
                ADD : No.5 LongTeng Road,CengNan Lnd<br/>
                ustral Area,LongYou City,ZheJiang,China<br/>
                TEL : 86-0570-7255577<br/>
                FAX : 86-0570-7255399<br/>
                M.T : 13335707555<br/>
                Http : //www.tebang.cn<br/>
                E-mail : tebang@tebang.cn
     <div style=" position:absolute; right:1px; bottom:1px;">  
  <img src="images/MSN.jpg" width="57" height="35" border="0" usemap="#Map2" />
  <map name="Map2" id="Map2">
    <area shape="rect" coords="7,2,45,32" href="msnim:chat?contact=xie_wansong@hotmail.com" />
  </map>
  </div></div>
     <div style="clear:both;"></div>
      </div><!--left-->