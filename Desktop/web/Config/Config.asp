<!--#Include File="Conn.asp"-->
<%
Session.CodePage = 65001
Response.Charset = "UTF-8"

Set Rs=Server.CreateObject("Adodb.RecordSet")
Sql="Select * From SiteInfo"
Rs.Open Sql,Conn,1,1
if not (Rs.eof and Rs.bof) then
SiteName=Rs("SiteName")
SiyeKeys=Rs("SiyeKeys")
enSiteName=Rs("enSiteName")
enSiyeKeys=Rs("enSiyeKeys")
SiteDes=Rs("SiteDes")
SiteLogo=Rs("SiteLogo")
SiteICP=Rs("SiteICP")
SiteCopy=Rs("SiteCopy")
Support=rs("Support")
gonggao=rs("gonggao")
SiteAuthor=Rs("SiteAuthor")
SMTPServer=Rs("SMTPServer")
SmtpFormMail=Rs("SmtpFormMail")
SMTPUserName=Rs("SMTPUserName")
SMTPUserPass=Rs("SMTPUserPass")
end if
Rs.Close
Set Rs=Nothing
%>


<%
'**************单页显示
Function Readpage(txt,tst1)

Set Rs=Server.CreateObject("Adodb.RecordSet")
Sql="Select * From [SiteExplain] where ClassID='"&txt&"'"
Rs.Open Sql,Conn,1,1
If Not (Rs.Eof Or Rs.Bof) Then
Readpage=Rs(tst1)
End If
Rs.Close
Set Rs=Nothing

end Function

'**************单页显示
Function ReadpageContent(txt,tst1)

Set Rs=Server.CreateObject("Adodb.RecordSet")
Sql="Select * From [SiteExplain] where id='"&txt&"'"
Rs.Open Sql,Conn,1,1
If Not (Rs.Eof Or Rs.Bof) Then
Readpage=Rs(tst1)
End If
Rs.Close
Set Rs=Nothing

end Function

%>
<%
if request.cookies("CookieUserName")<>"" then
daoqitime=Conn.Execute("Select Birthday From UserReg Where UserName='"&request.cookies("CookieUserName")&"'")(0)
NowDay=DateDiff("d",Now,daoqitime)
end if
%>

