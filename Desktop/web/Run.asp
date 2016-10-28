  <div class="runimg">
<script type=text/javascript>
 var focus_width=1001
 var focus_height=230
 var text_height=0
 var swf_height = focus_height+text_height
 var imgUrl=new Array();
 var imgLink=new Array();
 var imgtext=new Array();
 <%
Set Rs=Server.CreateObject("Adodb.Recordset")
Sql="select  * from SiteAds  Order By PostTime Desc"
Rs.open Sql,Conn,1,1
i=1
Do while Not Rs.Eof And i<10
%>

imgUrl[<%=i%>]="<%=Rs("AdsPicUrl")%>";
imgLink[<%=i%>]="<%=Rs("AdsPicLink")%>";
imgtext[<%=i%>]="<%If Len(Rs("AdsName"))>10 Then
Response.Write(Left(Rs("AdsName"),10)&"...")
Else
Response.Write(Rs("AdsName"))
End If
%>";
<%
i=i+1
Rs.MoveNext
Loop
Rs.Close
Set Rs=Nothing
%>
//可编辑内容结束
var pics="", links="", texts="";
for(var i=1; i<imgUrl.length; i++){
	pics=pics+("|"+imgUrl[i]);
	links=links+("|"+imgLink[i]);
	texts=texts+("|"+imgtext[i]);
}
pics=pics.substring(1);
links=links.substring(1);
texts=texts.substring(1);
 document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
 document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="flash/focus1.swf"><param name="quality" value="high"><param name="bgcolor" value="#DBD9D9">');
 document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
 document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
 document.write('</object>');
</script> 
</div>  