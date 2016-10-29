<SCRIPT language="javascript" src="js/Flash.js"></SCRIPT>
<script type="text/javascript">
function addFavorite(){
var aUrls=document.URL.split("/");
var vDomainName="http://"+aUrls[2]+"/";
var description=document.title;
try{//IE
window.external.AddFavorite(vDomainName,description);
}catch(e){//Firefox
window.sidebar.addPanel(description,vDomainName,"");
}
}
</script>

<script type="text/javascript">

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>
<script type="text/javascript">
function setHomePage(obj){
var aUrls=document.URL.split("/");
var vDomainName="http://"+aUrls[2]+"/";
try{//IE
obj.style.behavior="url(#default#homepage)";
obj.setHomePage(vDomainName);
}catch(e){//other
if(window.netscape) {//Firefox
try {
netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
} 
catch (e) { 
alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将[signed.applets.codebase_principal_support]设置为'true'");
}
var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
prefs.setCharPref('browser.startup.homepage',vDomainName);
}
}
if(window.netscape)alert("设置首页成功！");
}
</script>

<script type="text/javascript">
$(document).ready(function(){
  $('li.mainlevel').mousemove(function(){
  $(this).find('ul').slideDown();
  });
  $('li.mainlevel').mouseleave(function(){
  $(this).find('ul').slideUp("fast");
  }); 
});

</script>

<div id="top">
    <div class="top">
             <div class="logo">
                    <a href="index.asp" title="浙江正和监管有限公司"><img src="images/index/logo.gif" width="353" height="88"/></a>
              </div>
             <div class="top_right">
                 <div class="datetime">今天是:<%=GongliStr%>&nbsp;<%=WeekdayStr%>&nbsp;<%=""&left(time,5)&""%><br /><span style=" margin-right:125px">农历:<%=NongliDayStr%></span></div>
                <div class="top_right_two">
                     <div class="link">
                     <a href="#"onclick="setHomePage(this);" style="color:#707070;">设为首页</a> | <a href="javascript:addFavorite();" style="color:#707070;">加入收藏</a> 
                </div>
                    <div class="search">
                    <form id="form1" name="form1" action="Search.asp?action=aa" method="post">
                    <input type="text" name="search" class="top_right_two_search"/>
                    <input type="image" src="images/index/search_02.gif" style="float:right;" class="top_right_two_buttom"/>
                    </form>
                </div>
                </div>
            </div>   
       <div style="clear:both"></div>
       <div class="menu">
            <ul id="nav">
                  <li class="mainlevel"><a href="index.asp" title="公司首页" ><img src="images/menu/menu_1_1.gif" id="Image1" onmouseover="MM_swapImage('Image1','','images/menu/menu_1_2.gif',1)" onmouseout="MM_swapImgRestore()" /></a></li>
                  
                  
                   <li class="mainlevel"><a href="enter_zh.asp" title="走进正和"><img style="padding-left:5px;" src="images/menu/menu_2_1.gif" id="Image2" onmouseover="MM_swapImage('Image2','','images/menu/menu_2_2.gif',1)" onmouseout="MM_swapImgRestore()" /></a>
                       <ul id="level" style="margin-left:5px;">
                           <li><a href="enter_zh.asp?classid=63">企业简介</a></li>
                           <li><a href="enter_zh.asp?classid=64">企业文化</a></li>
                           <li><a href="enter_zh.asp?classid=65">企业架构</a></li>
                           <li><a href="enter_zh.asp?classid=66">企业荣誉</a></li>
                           <li><a href="enter_zh.asp?classid=67">企业资质</a></li>
                           <li><a href="enter_zh.asp?classid=68">领导致辞</a></li>
                           <li><a href="enter_zh.asp?classid=85">公司活动</a></li>
                       </ul>                                 
                   </li>
                   
                   
                   <li class="mainlevel"><a href="news.asp" title="企业动态"><img style="padding-left:6px;" src="images/menu/menu_3_1.gif" id="Image3" onmouseover="MM_swapImage('Image3','','images/menu/menu_3_2.gif',1)" onmouseout="MM_swapImgRestore()" /></a>
                       <ul id="level" style="margin-left:6px;">
                           <li><a href="news.asp?classid=101">公司新闻</a></li>
                           <li><a href="news.asp?classid=102">行业动态</a></li>
                           <li><a href="news.asp?classid=103">通知公告</a></li>                           
                       </ul>     
                   </li>
                   
                   
                   <li class="mainlevel"><a href="per_gallery.asp" title="业绩长廊"><img style="padding-left:5px;" src="images/menu/menu_4_1.gif" id="Image4" onmouseover="MM_swapImage('Image4','','images/menu/menu_4_2.gif',1)" onmouseout="MM_swapImgRestore()" /></a>
                       <ul id="level" style="margin-left:5px;">
                           <li><a href="Per_gallery.asp?classid=72">获奖工程</a></li>
                           <li><a href="Per_gallery.asp?classid=78">历史工程</a></li>
                           <li><a href="Per_gallery.asp?classid=73">经典工程</a></li>                                                
                       </ul>     
                   </li>
                   
                   
                   
                   <li class="mainlevel"><a href="human_res.asp" title="人事管理"><img style="padding-left:6px;" src="images/menu/menu_5_1.gif" id="Image5" onmouseover="MM_swapImage('Image5','','images/menu/menu_5_2.gif',1)" onmouseout="MM_swapImgRestore()" /></a>
                       <ul id="level" style="margin-left:6px;">
                           <li><a href="human_res.asp">公司招聘</a></li>
                           <li><a href="TEA.asp?classid=80">教育培训</a></li>
                           <li><a href="TEA.asp?classid=81">考试资讯</a></li> 
                           <li><a href="TEA.asp?classid=82">职评信息</a></li>                                
                       </ul>                    
                   </li>
                   
                   
                   
                   <li class="mainlevel"><a href="laws.asp?classid=105" title="法律法规"><img style="padding-left:5px;" src="images/menu/menu_6_1.gif" id="Image6" onmouseover="MM_swapImage('Image6','','images/menu/menu_6_2.gif',1)" onmouseout="MM_swapImgRestore()" /></a>
                      <ul id="level" style="margin-left:5px;">
                           <li><a href="laws.asp?classid=105">专用法律</a></li>
                           <li><a href="laws.asp?classid=106">通用法律</a></li>
                       </ul>            
                   </li>
                   
                   
                   
                   <li class="mainlevel"><a href="contact_us.asp" title="联系我们"><img style="padding-left:7px;" src="images/menu/menu_7_1.gif" id="Image7" onmouseover="MM_swapImage('Image7','','images/menu/menu_7_2.gif',1)" onmouseout="MM_swapImgRestore()" /></a>
                      <ul id="level" style="margin-left:7px;">
                           <li><a href="contact_us.asp">联系方式</a></li>      
                           <li><a href="message.asp">访客留言</a></li>  
                       </ul>    
                   </li>
            </ul>
       </div>
    </div>     
</div>

<div class="head">
    <div class="head_show">
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="988" height="357">
        <param name="movie" value="Flash/banner.swf" />
        <param name="quality" value="high" />
        <param name="wmode" value="opaque" />
        <embed src="Flash/banner.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="988" height="357"></embed>
      </object>
    </div>
</div>
<div style="clear:both"></div>