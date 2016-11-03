<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script src="js/prototype.lite.js" type="text/javascript"></script>
<script src="js/moo.fx.js" type="text/javascript"></script>
<script src="js/moo.fx.pack.js" type="text/javascript"></script>
<style>
body {
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin: 0px;
}
#container {
	width: 182px;
}
H1 {
	font-size: 12px;
	margin: 0px;
	width: 182px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;	
}
H1 a {
	display: block;
	width: 182px;
	color: #000;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	background-image: url(images/menu_bgS.gif);
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;

}
.content{
	width: 182px;
	height: 26px;
	
}
.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;

}
.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 182px;
	padding-left: 0px;
	text-align:left;
	
}
.MM {
	width: 182px;
	margin: 0px;
	padding: 0px;
	padding-left:0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px,0px,0px,0px);
}
.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	
	margin: 0px;
	padding: 0px 0px 0px 55px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	display: block;
    padding: 0px 0px 0px 55px;
	margin: 0px;

	height: 26px;
	width: 182px;
	text-decoration: none;
}
.MM a:active {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
    padding: 0px 0px 0px 55px;
	margin: 0px;

	overflow: hidden;
	text-decoration: none;
}
.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	font-weight: bold;
    padding: 0px 0px 0px 55px;	
	background-image: url(images/menu_bg2.gif) ;
	background-repeat:no-repeat;
	COLOR: #669a01;
		 

	display: block;
	margin: 0px;

	height: 26px;
	width: 182px;
	text-decoration: none;
}
</style>
</head>

<body>
<table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
  <tr>
    <td width="182" valign="top"><div id="container">
      <h1 class="type"><a href="javascript:void(0)">系统维护</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="Sys_SiteInfo.asp" target="main">站点基本信息维护</a></li>
          <li><a href="Sys_UserInfo.asp" target="main">管理员信息维护</a></li>
          <li><a href="Sys_ChangePass.asp" target="main">更改登录密码</a></li>
         <!-- <li><a href="Sys_CreateUser.asp" target="main">添加管理员</a></li>
          <li><a href="Sys_UserList.asp" target="main">管理员列表</a></li>-->
         <!--  <li><a href="AD_Banner.asp" target="main">横幅广告</a></li>-->
         </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">内容管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <!--<li><a href="Nav_Content.asp" target="main">导航条内容维护</a></li>-->
          <li><a href="ClassPage.asp" target="main">单页类别管理</a></li>
          <li><a href="Nav_Explain.asp" target="main">单页内容管理</a></li>
        </ul>
      </div>
    <!-- <h1 class="type"><a href="javascript:void(0)">商品管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
		  <li><a href="Pro_ContentAdd.asp" target="main">添加图片</a></li>
          <li><a href="Pro_ContentListIn.asp" target="main">上架图片维护</a></li>
          <li><a href="Pro_ContentListOut.asp" target="main">下架商品维护</a></li>
          <li><a href="Pro_Class.asp" target="main">商品类别维护</a></li>
          <li><a href="Pro_Comment.asp" target="main">商品评论管理</a></li>
          <li><a href="Pro_ChangeClass.asp" target="main">商品转移</a></li>
          <li><a href="Pro_OrderList.asp" target="main">订单管理</a></li>
          
        </ul>
      </div>-->
     <h1 class="type"><a href="javascript:void(0)">信息管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="News_ContentAdd.asp" target="main">添加信息</a></li>
          <li><a href="News_List.asp" target="main">信息内容维护</a></li>
          <li><a href="News_Class.asp" target="main">信息分类维护</a></li>
          <!--<li><a href="News_Comment.asp" target="main">信息评论维护</a></li>-->
         
        </ul>
      </div>
    </div>
       <!-- <h1 class="type"><a href="javascript:void(0)">会员管理</a></h1>
      <div class="content">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
            </tr>
          </table>
        <ul class="MM">
            <li><a href="Member_Add.asp" target="main">添加会员</a></li>
          <li><a href="Member_List.asp" target="main">会员列表</a></li>
          
        </ul>
      </div>-->
      </div>
<!--       <h1 class="type"><a href="javascript:void(0)">广告管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="AD_Banner.asp" target="main">横幅广告</a></li>
          <li><a href="AD_Picture.asp" target="main">图片广告</a></li>
          <li><a href="AD_Fonts.asp" target="main">文字广告</a></li>
          <li><a href="AD_Pop.asp" target="main">弹出广告</a></li>
          <li><a href="AD_Float.asp" target="main">浮动广告</a></li>
          
        </ul>
      </div>-->
    </div>
    <h1 class="type"><a href="javascript:void(0)">在线招聘</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="Job_ContentAdd.asp" target="main">添加职位</a></li>
          <li><a href="Job_Class.asp" target="main">职位类别管理</a></li>
          <li><a href="Job_List.asp" target="main">职位管理</a></li>
         
             
        </ul>
      </div>
    </div>
   <h1 class="type"><a href="javascript:void(0)">留言管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="GuestBook_Filter.asp" target="main">过滤关键字设置</a></li>
          <li><a href="GuestBook.asp" target="main">访客留言</a></li>
                     
        </ul>
      </div>
    </div>
    <h1 class="type"><a href="javascript:void(0)">友情链接</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="FirendLinkAdd.asp" target="main">友情链接添加</a></li>
          <li><a href="FirendLink.asp" target="main">友情链接管理</a></li>
                   
        </ul>
      </div>
    </div>
        <script type="text/javascript">
		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('type');
	
		var myAccordion = new fx.Accordion(
			toggles, contents, {opacity: true, duration: 400}
		);
		myAccordion.showThisHideOpen(contents[0]);
	</script>
        </td>
  </tr>
</table>
</body>
</html>
