<link rel="stylesheet" href="css/top.css" type="text/css" />
<script type="text/javascript">
<!--设置首页或收藏配置脚本(兼容IE和Firefox)-->
//设置首页函数
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
alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将[signed.applets.codebase_principal_support]设置为'true'"); 
}
var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
prefs.setCharPref('browser.startup.homepage',vDomainName);
}
}
if(window.netscape)alert("设置首页成功！");
}
//加入收藏函数
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

<div class="top1">
  <div class="logo">
    <ul id="logo">
      <li><img src="images/top1.jpg" width="102" height="61" alt="" /></li>
      <li><a href="Index.asp" title="首页"><img src="images/top2.jpg" width="346" height="61" alt="" border="0"/></a></li>
      <li style=" padding-left:62px;"><img src="images/top3.jpg" alt="" width="180" height="61" border="0" usemap="#Map" />
        <map name="Map" id="Map">
          <area shape="rect" coords="4,35,84,54" href="#" onclick="setHomePage(this);" title="设为首页"/>
          <area shape="rect" coords="98,36,173,55" href="javascript:addFavorite();" title="加入收藏"  />
        </map>
      </li>
    </ul>
  </div>

 <div class="menu">
   <ul id="menu">
     <li ><a href="Index.asp" class="li1" ><span style="width:87px; height:28px; display:block;">&nbsp;</span></a></li>
     <li ><a href="About.asp" class="li2"><span style="width:87px; height:28px; display:block;">&nbsp;</span></a></li>
     <li style="margin-left:10px;"><a href="Products.asp" class="li3"><span style="width:87px; height:28px; display:block;">&nbsp;</span></a></li>
     <li style="margin-left:15px;"><a href="NewProducts.asp" class="li4"><span style="width:105px; height:28px; display:block;">&nbsp;</span></a></li>
     <li ><a href="Environment.asp" class="li5"><span style="width:87px; height:28px; display:block;">&nbsp;</span></a></li>
     <li ><a href="Honor.asp" class="li6"><span style="width:87px; height:28px; display:block;">&nbsp;</span></a></li>
     <li ><a href="Message.asp" class="li7"><span style="width:87px; height:28px; display:block;">&nbsp;</span></a></li>
     <li ><a href="Contact_us.asp" class="li8"><span style="width:87px; height:28px; display:block;">&nbsp;</span></a></li>
   </ul>
 </div>
 


</div> 


