<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>

<%
String email = request.getParameter("email");
String passwd = request.getParameter("passwd");
String auth = Tool.key(); // ABC012345678901234
%>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>

</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='content'>
<FORM name='frm' method='POST' action='./.jsp'>
  <fieldset>
    <legend class='legend'>관리자 등록 결과</legend>
    <ul>
      <li>
      <%
      Admin1VO vo = new Admin1VO();
      vo.setEmail(email);
      vo.setPasswd(passwd);
      vo.setAuth(auth);
      
      if (admin1DAO.count("act", "M") == 0){
        out.println("최초 등록 계정임으로 마스터 계정으로 등록합니다.<be>");
        vo.setAct("M");  // 마스터
      }else{
        vo.setAct("H");  // 인증 대기, 일반 관리자
      }
      
      vo.setConfirm("N");
      
      int count = admin1DAO.insert(vo);
      if (count == 1){
      %>
        등록에 성공 했습니다.<br>
        전송된 이메일 링크를 클릭해야 관리자 등록이 종료됩니다.<br><br>
        
      <%  
      }else{
      %>
        관리자 등록에 실패했습니다. 계속 오류시 담당자에게 문의하세요.<br>
      <%  
      }
      %>
      </li>
      <li class='center'>
        <%
        if (count == 1){
        %>
<!--          <button type='button' onclick="./create_form.jsp">계속 등록</button>
         <button type='button' onclick="./create_form.jsp">목록</button> -->
         
        <%  
        }else{
        %>
        <%  
        }
        %> 
       
      </li>
      <li>
<%
// javamail lib 이 필요합니다.
class MyAuthentication extends Authenticator {
  PasswordAuthentication pa;
  public MyAuthentication(){
    pa = new PasswordAuthentication("test@nulunggi.pe.kr", "test2015");
  }
 
  public PasswordAuthentication getPasswordAuthentication() {
    return pa;
  }
}

String subject = "Blog 관리자 메일 인증입니다.";  // 제목
String content = "메일 인증<br><br>";  // 내용
content += "아래의 링크를 클릭하면 가입이 완료됩니다.<br><br>";
// http://172.16.12.1:9090/admin_v1jq/admin1/confirm.jsp?email=testcell2013@gmail.com&auth=ABC1234567890

content += "http://172.16.12.1:9090/admin_v1jq/admin1/confirm.jsp?email=" + email + "&auth=" + auth;

// mw-002.cafe24.com, Cafe24
String host = "mw-002.cafe24.com";    // smtp mail server(서버관리자)     
String from = "manager@blog.com";   // 보내는 주소, 블로그 관리자 주소
String to = email;    // 받는 사람

Properties props = new Properties();  // SMTP 프로토콜 사용, port 25
props.put("mail.smtp.host", host);
props.put("mail.smtp.auth","true");

Authenticator authenticator = new MyAuthentication();
Session sess = Session.getInstance(props, authenticator);   // 계정 인증 검사

try {
  Message msg = new MimeMessage(sess);   // 메일 내용 객체 생성
  msg.setFrom(new InternetAddress(from));   // 보내는 사람 설정
        
  // 한명에게만 보냄
  InternetAddress[] address = {new InternetAddress(to)}; // 받는 사람 설정
  
  msg.setRecipients(Message.RecipientType.TO, address); // 수령인 주소 설정
        
  msg.setSubject(subject);                  // 제목 설정 
  msg.setSentDate(new Date());          // 보낸 날짜 설정
        
  // msg.setText(msgText); // 메일 내용으로 문자만 보낼 경우

  // 보내는 내용으로 HTML 형식으로 보낼 경우
  msg.setContent(content, "text/html;charset=utf-8");
        
  Transport.send(msg);  // 메일 전송

  out.println("<u>인증 메일이 발송되어습니다.</u><br><br>");
  out.println("<u>메일을 열고 링크를 클릭해주세요.</u><br>");
  
} catch (MessagingException mex) {
  System.out.println(mex.getMessage());
  // out.println(mex.getMessage()+"<br><br>");
  // out.println(to + "님에게 메일 발송을 실패 했습니다.");
}

%>
      </li>
    </ul>
  </fieldset>
</FORM>
</DIV>

<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
