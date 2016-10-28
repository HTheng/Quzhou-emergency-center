<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="Include/Class_Function.asp"-->
<!--#include File="Config/Config.asp"--> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css" />
<link rel="stylesheet" href="css/top.css" type="text/css" />
<link rel="stylesheet" href="css/content.css" type="text/css">
<link rel="stylesheet" href="css/footer.css" type="text/css">
<meta name="keywords" content="<%=SiyeKeys%>" />
<META name="Description" content="<%=SiteDes%>">
<meta name="Author" content="<%=SiteAuthor%>" />
<title><%=SiteName%></title>
<script language="javascript" type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script language="javascript" type="text/javascript">
$(function(){
	 $(".menu a").eq(0).hover( function(){$(this).removeClass("li1").addClass("li11"); },function(){ $(this).removeClass("li11").addClass("li1");});
	 $(".menu a").eq(1).hover( function(){$(this).removeClass("li2").addClass("li21"); },function(){ $(this).removeClass("li21").addClass("li2");}); 
	 $(".menu a").eq(2).hover( function(){$(this).removeClass("li3").addClass("li31"); },function(){ $(this).removeClass("li31").addClass("li3");}); 
	 $(".menu a").eq(3).hover( function(){$(this).removeClass("li4").addClass("li41"); },function(){ $(this).removeClass("li41").addClass("li4");});
 	 $(".menu a").eq(4).hover( function(){$(this).removeClass("li5").addClass("li51"); },function(){ $(this).removeClass("li51").addClass("li5");});
	 $(".menu a").eq(5).hover( function(){$(this).removeClass("li6").addClass("li61"); },function(){ $(this).removeClass("li61").addClass("li6");});
     $(".menu a").eq(6).removeClass("li7").addClass("li71");
     $(".menu a").eq(7).hover( function(){$(this).removeClass("li8").addClass("li81"); },function(){ $(this).removeClass("li81").addClass("li8");});
	})
</script>
<%
if Request("action")="Feedback" Then
GuestbookTitle=ReplaceBadChar(Trim(Request("GuestbookTitle")))
GuestbookContent=ReplaceBadChar(Trim(Request("GuestbookContent")))
Username=ReplaceBadChar(Trim(Request("Username")))
CompanyName=ReplaceBadChar(Trim(Request("CompanyName")))
Address=ReplaceBadChar(Trim(Request("Address")))
Email=ReplaceBadChar(Trim(Request("Email")))
LinkPhone=ReplaceBadChar(Trim(Request("LinkPhone")))
ICQ=ReplaceBadChar(Trim(Request("ICQ")))
Fax=ReplaceBadChar(Trim(Request("Fax")))


Set Rs=Server.CreateObject("Adodb.RecordSet")
Sql="select * from GuestBook"
Rs.Open Sql,Conn,1,3
Rs.Addnew
Rs("GuestbookTitle")=GuestbookTitle
Rs("GuestbookContent")=GuestbookContent
Rs("UserName")=Username
Rs("CompanyName")=CompanyName
Rs("Address")=Address
Rs("ICQ")=ICQ
Rs("Email")=Email
Rs("LinkPhone")=LinkPhone 
Rs("Fax")=Fax
rs("PostTime")=now()
Rs.Update
Response.write("<script>alert('Thank you for your message!');location.href='Index.asp';</script>")
Response.end()
Rs.Close
Set Rs=Nothing
Conn.Close
Set Conn=Nothing
End if
%>

<script Language="JavaScript">
function ckform(theFrom)
{
  if (document.getElementById("GuestbookTitle").value == "")
  {
    alert("Please write the message theme!");
    document.getElementById("GuestbookTitle").focus();
    return (false);
  }  
  if (document.getElementById("GuestbookContent").value == "")
  {
    alert("Please write the message content!");
    document.getElementById("GuestbookContent").focus();
    return (false);
  }   
   if (document.getElementById("UserName").value == "")
  {
    alert("Please enter your name!");
    document.getElementById("UserName").focus();
    return (false);
  }   
   if (document.getElementById("CompanyName").value == "")
  {
    alert(" Please input the name of your company!");
    document.getElementById("CompanyName").focus();
    return (false);
  }   
  
  
  
   if (document.getElementById("LinkPhone").value == "")
  {
    alert("Please input your telephone number!");
    document.getElementById("LinkPhone").focus();
    return (false);
  }   
  
  
   if (document.getElementById("Fax").value == "")
  {
    alert("Please input your fax number!");
    document.getElementById("Fax").focus();
    return (false);
  }   
 
  
    if (document.getElementById("Email").value == "")
  {
    alert("Please fill in the email!");
    document.getElementById("Email").focus();
    return (false);
  } 
  
    if (document.getElementById("Country").value == "")
  {
    alert("Please fill in your country!");
    document.getElementById("Country").focus();
    return (false);
  } 
  
  return (true);
}
</script>


</head>
<body>
<div class="big">
   	<!--#include file="top1.asp"-->
    <div class="content1">
      <!--#include file="left1.asp"-->
      <div class="right1">
           <div class="run1"> <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="738" height="232">
               <param name="movie" value="Flash/banner2.swf" />
               <param name="quality" value="high" />
               <param name="wmode" value="opaque" />
               <embed src="Flash/banner2.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="738" height="232"></embed>
             </object></div>
      
         <div class="c_title1">Message</div>
         <div class="Message_content1">
            
         
           <table width="570" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:20px; color:#000000;" >
             <form class="cmxform" name="form1" id="form1" method="post" action="?action=Feedback" onsubmit="return ckform(this)">
               <tr>
                 <td height="40" style="background:#ffffff"><font color="#FF0000">*</font>Subject:</td>
                 <td height="30" align="left"><input id="GuestbookTitle" name="GuestbookTitle" /></td>
               </tr>
               <tr>
                 <td height="30" ><font color="#FF0000">*</font>Message:</td>
                 <td height="30" align="left"><textarea cols="" rows="" style="height:80px; width:450px;" id="GuestbookContent" name="GuestbookContent" ></textarea></td>
               </tr>
               <tr>
                 <td height="50" colspan="2" >&nbsp;Please  provide us with your contact information. </td>
               </tr>
               <tr>
                 <td width="100" height="40" ><font color="#FF0000">*</font>Name:</td>
                 <td width="488" height="30" align="left"><input id="UserName" name="UserName"  />
                   </td>
               </tr>
              
               <tr>
                 <td height="40"><font color="#FF0000">*</font>Company</td>
                 <td height="30" align="left"><input id="CompanyName" name="CompanyName" /></td>
               </tr>
                 <tr>
                 <td height="40"><font color="#FF0000">*</font>Tel:</td>
                 <td height="30" align="left"><input id="LinkPhone" name="LinkPhone" /></td>
               </tr>
               <tr>
                 <td height="40"><font color="#FF0000">*</font>Fax:</td>
                 <td height="30" align="left"><input id="Fax" name="Fax" /></td>
               </tr>
               <tr>
                 <td height="40" ><font style="font-family:Arial;">&nbsp;</font><font color="#FF0000">*</font>E-mail:</td>
                 <td height="30" align="left" ><input id="Email" name="Email"/></td>
               </tr>
               
               <tr>
                 <td height="40" ><font style="font-family:Arial;">&nbsp;</font><font color="#FF0000">*</font>Country:</td>
                 <td height="30" align="left" ><input id="ICQ" name="ICQ" /></td>
               </tr>
              
               <tr>
                 <td height="40" >&nbsp;Address:</td>
                 <td height="30" align="left" style="background:#ffffff"><input id="Address" name="Address" /></td>
               </tr>
             
               <tr>
                 <td height="50" colspan="2" align="right"><table width="350" border="0" cellspacing="0" cellpadding="0">
                   <tr>
                     <td align="right" width="259"  ><input type="reset" name="button3" id="button3" value=" " style="background:url(images/reset.jpg) no-repeat; width:62px; height:23px; margin-right:20px; border:none; cursor:pointer;" /></td>
                     <td align="left"  width="91" ><input type="submit" name="button2" id="button2" value=" " style="background:url(images/self_btn.jpg) no-repeat; width:62px; height:23px; border:none; cursor:pointer;" /></td>
                   </tr>
                 </table></td>
               </tr>
             </form>
           </table>
           <div style="clear:both"></div>
         </div>
      </div>
     
       <div style="clear:both"></div>
    </div>
   <div style="clear:both"></div>
   <!--#include file="footer.asp"-->  
</div> 
</body>
</html>
