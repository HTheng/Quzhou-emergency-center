
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


<div style=" background:url(../Images/ind/bottom_bg.gif) top left no-repeat; width:1004px; height:32px; margin-left:auto; margin-right:auto; color:#ffffff; line-height:32px;">
<div style="float:left; padding-left:13px;" class="bt"><a href="#" onclick="setHomePage(this);" title="设置首页" >设置首页</a></div>    <div style="float:left; padding-left:32px;">
 <a href="javascript:addFavorite();" title="收藏本站"  >收藏本站</a></div>   
 <div style="float:left; padding-left:35px;">版权声明</div>    
 <div style="float:left; padding-left:32px;">联系我们</div>   
  <div style="float:left; padding-left:30px;"> 人民医院 </div>
   <div style="float:left; padding-left:30px;">   人医急诊</div>    
</div>