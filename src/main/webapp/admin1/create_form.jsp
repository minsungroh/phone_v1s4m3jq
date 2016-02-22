<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">
  window.onload = function(){
    evt('email_dns', 'change', email_dns_p);
    evt('passwd', 'blur', passwd_p);

  }
  
  function passwd_p(){
    var reg_passwd = /^[^\s]{4,20}$/; // 공백을 제외한 모든 문자, 4 ~ 20자
    // console.log('--> :' + '1234'.search(reg_passwd));
    if (val('passwd').search(reg_passwd) == -1){
      id('passwd_panel').style.color='#FF0000';
      id('passwd_panel').innerHTML = '사용 할 수 없는 패스워드입니다.'
      return false;
    }else{
      id('passwd_panel').style.color='#0000FF';
      id('passwd_panel').innerHTML = '사용 할 수 있는 패스워드입니다.'
      return true;
    }
    // id('passwd_panel').innerHTML = val('passwd');
  }
  
  function email_duplicate(){
    var reg_email=/^[A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
    /*
    - //: 정규 표현식 시작과 종료
    - ^[A-Za-z0-9_]: 알파벳이나 숫자로 시작
    - +: 1번이상 반복되어야함.
    - [-A-Za-z0-9_.]: 하이픈, 알파벳, 숫자, 언더바, 점 입력 가능
    - *: 0번이상 반복되어야함.
    - [@]{1}: 1번 입력되어야함.
    - [-A-Za-z0-9_]+: 하이픈 또는 알파벳 또는 숫자가 1회이상 입력되어야함.
    - [-A-Za-z0-9_.]*:하이픈 또는 알파벳 또는 숫자가 1회이상 입력되어야함.
    - [.]{1}: 점이 1회 입력되어야함.
    - [A-Za-z]{2,5}$: 마지막으로 알파벳이 2에서 5자 입력되어야함.
    
    [참고]
    ?: 존재하지 않거나 1번만 입력 가능
    */
    
    if (val('email').search(reg_email) == -1){
      alert('이메일 형식이 일치하지 않습니다.');
      id('email').focus();
      return false; // 실행 중지
    }

    var url = './email_proc.jsp?email=' + frm.email.value;
    var win = window.open(url, '중복 이메일 검사', 'width=500px, height=440px, scrollbars=no');
    
    var x = (screen.width - 500) / 2;
    var y = (screen.height - 440) / 2;
    
    win.moveTo(x, y); // 화면 이동
  }
  
  function email_dns_p(){
    var email_dns = val('email_dns');
    // alert(email_dns);
    
    var position = val('email').indexOf('@'); // '@' 기호의 위치 파악
    var str=''; // 도메인을 제거한 이메일 계정명 저장
    
    if (position >= 0){
      str = val('email').substring(0, position); // '@' 기호 이전의 문자열 추출
    }else{
      str = val('email');
    }
    
    console.log('position: ' + position);
    console.log('str: ' + str);
    
    if (val('email_dns') == 'none'){
      id('email').value = str + '@'; // 주소 결합
      id('email').focus(); // 마우스 포인터 이동
    }else{
      id('email').value = str + '@' + email_dns; // 주소 결합
    }

  }
  
  function send(){
    if (passwd_p() == false){
      id('passwd').focus();
      return false;
    }
    return true;
  }
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='content'>
<FORM name='frm' method='POST' action='./create_proc.jsp'
           onsubmit="return send();">
  <fieldset>
    <legend class='legend'>관리자 > 등록</legend>
    <ul>
      <li>
        <label class='label' for='email'>이메일</label>
        <input type='email' name='email' id='email' required="required" value='test@mail.com'>
        <select id='email_dns'>
          <option value='none'>직접 입력</option>
          <option value='gmail.com'>gmail.com</option>
          <option value='daum.net'>daum.net</option>
          <option value='naver.com'>naver.com</option>
          <option value='nate.com'>nate.com</option>
          <option value='hotmail.com'>hotmail.com</option>
        </select>
        <span class='link'><A href='javascript: email_duplicate();'>이메일 중복 검사</A></span> 
      </li>
      <li>
        <label class='label' for='passwd'>패스워드</label>
        <input type='password' name='passwd' id='passwd' value='1234'>
        <span id='passwd_panel'></span> 
      </li>

      <li class='center'>
        <button type='submit'>등록</button>
        <button type='button' onclick='history.back();'>취소</button>
        
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
