
	<table width='1200' border='0' align='center' cellpadding='0' cellspacing='0' style=" background: url(images/ind/top_bg.gif) repeat-y;">
	<tr><td width='489'><img src="/Images/ind/logo.gif" width="489" height="110" /></td>
	<td align="right" valign="bottom">
		<div class="r_120"><img src="/Images/ind/r_120.gif" width="354" height="42" /></div>
	</td>
   </tr></table>

<table width=1200  height=40  border=0  cellpadding=0 cellspacing=0 align=center >

<tr><td>
<div class='blue'><div id='slatenav'><ul>
      <li ><a href="Index.asp"  title="">网站首页</a></li>
     <li ><a href="About.asp"  title="">中心简介</a></li>
     <li><a href="Products.asp"  title="">急救动态</a></li>
      <li><a href="NewProducts.asp" title="" >政务信息</a></li>
     <li ><a href="Environment.asp"  title="">急救知识</a></li>
     <li ><a href="Honor.asp" title="">培训教育</a></li>
     <li ><a href="Message.asp"  title="">党团建设</a></li>
     <li ><a href="Contact_us.asp" title="">联系我们</a></li>
     <li ><a href="Contact_us.asp" title="">为您服务</a></li>
     <li ><a href="Contact_us.asp" title="">图片新闻</a></li>
	</ul></div></div>
</td></tr></table>
 


<!-- 浮动广告代码开始 -->
<div id="ShowAD" style="position:absolute; z-index: 100;">
<div style="width:155;height:18px;font-size:14px;font-weight:bold;text-align:left;CURSOR: hand;" onClick="closead();">
<font color=ff0000>关闭</font></div>
<IFRAME allowTransparency="true" marginwidth=0 marginheight=0 src="topwindows.html" frameborder=0 width=155 scrolling=no 
height=530></IFRAME>
</div>
<script>
var bodyfrm = ( document.compatMode.toLowerCase()=="css1compat" ) ? document.documentElement : document.body;
var adst = document.getElementById("ShowAD").style;
	adst.top = ( bodyfrm.clientHeight -530-22 ) + "px";
	adst.left = ( bodyfrm.clientWidth -155 ) + "px";
function moveR() {
	adst.top = ( bodyfrm.scrollTop + bodyfrm.clientHeight - 530-22) + "px";
	adst.left = ( bodyfrm.scrollLeft + bodyfrm.clientWidth - 155 ) + "px";
}
setInterval("moveR();", 80);
function closead()
{
	adst.display='none';
}
</script>

<!-- 浮动广告代码结束 -->


	<!--<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
		<td>
          <%=TopHead()%>
		</td>
	  </tr>
	</table>-->