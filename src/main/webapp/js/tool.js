/**
 * 태그 id에 해당하는 태그를 찾아 값을 리턴합니다.
 * @param id
 * @returns
 */
function val(id){
  return document.getElementById(id).value;
}

/**
 * 파일 크기의 단위를 계산합니다.
 * @param length 파일 크기
 */
function unit(length){
  var str = "";
  
  if (length < 1024){  // Byte: 0 ~ 1023
    str = parseInt(length) + " Byte";   
  }else if (length < (1024 * 1024)){ // Byte: 1024 ~ 1048575
    str = parseInt(length / 1024) + " KB";
  }else if(length < (1024 * 1024 * 1024)){ // Byte: 1048576 ~ 1073741823
    str = parseInt(length / 1024 / 1024) + " MB";
  }else if(length < (1024 * 1024 * 1024 * 1024)){ // Byte: 1073741824 ~
    str = parseInt(length / 1024 / 1024 / 1024) + " GB";
  }
  
  return str;
}

/**
 * 아이디를 전달받아 이벤트를 등록합니다.
 * @param id_name 태그의 id
 * @param event_name 이벤트 종류
 * @param handler 처리 함수
 * @returns
 */
function evt(id_name, event_name, handler){
  var tag = document.getElementById(id_name);
  tag.addEventListener(event_name, handler);
}

/*
 * id 값을 받아서 태그를 검색합니다. 
 */
function id(id_name){
  var tag = document.getElementById(id_name);
  
  return tag;
}

/*
문자열에서 숫자만 추출합니다. 예) 100,000 --> 100000
정규 표현식
/ ... /  : 정규 표현식 선언 영역
[^0-9]: 0 ~ 9를 제외한 모든 문자 추출
g       : 추출된 모든 문자열 리턴
*/
function getNumber(val){
  var regexp = /[^0-9]/g;  
  var returnval = new String(val); // 타입 명시
  returnval = returnval.replace(regexp, '');
  
  return returnval;
}

/*
 * 천단위 ','를 출력합니다.
  */
function comma(price){
  var _price = Number(price).toLocaleString('en');
  
  return _price;
}

