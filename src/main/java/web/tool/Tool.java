package web.tool;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Tool {
  /**
   * 폴더를 입력받아 절대 경로를 산출합니다. 
   * 예) getRealPath(request, "/media/storage")
   * 
   * @param request
   * @param dir 절대 경로를 구할 폴더명
   * @return 절대 경로 리턴
   * @throws IOException
   */
  public static synchronized String getRealPath(HttpServletRequest request, String dir) {
    String path = "";
    
    try{
      path = request.getRealPath(dir) + "/";  
      // System.out.println("Upload path: " + path);
    }catch(Exception e){
      System.out.println(e.toString());
    }

    return path;
  }

  /**
   * 파일 삭제
   * @param fname
   * @return
   */
  public static synchronized boolean deleteFile(String fname) {
    File file = new File(fname);
    boolean ret = false;
    
      if (file.exists()){
        ret = file.delete();
      }
    
    return ret;
  }

  
  /**
   * 문자열의 길이가 length 보다 크면 "..." 을 표시하는 메소드
   * @param length 선별할 문자열 길이
   * @param str 문자열
   * @return
   */
  public static synchronized String textLength(int length, String str) {
    str = checkNull(str);

    if (str.length() > length) {
      str = str.substring(0, length) + "...";
    }
    
    return str;
  }

  /**
   * 회원으로 로그인 했는지 검사합니다.
   * 
   * @param request
   * @return true: 로그인 성공, false: 로그인 실패
   */
  public static synchronized boolean isMember(HttpServletRequest request) {
    boolean sw = false;

    HttpSession session = request.getSession(); 
    String id = (String) session.getAttribute("id");

    if (id != null) {
      sw = true;
    } else {
      sw = false;
    }

    return sw;
  }

  /**
   * 이미지 사이즈를 변경하여 새로운 이미지를 생성합니다.
   * 
   * <pre>
   사용예)
      File src = new File("F:/hybrid2/Gallery/imgResize/festval02.jpg");
      File dest = new File("F:/hybrid2/Gallery/imgResize/festval02_mini.jpg");
    
      Tool.imgResize(src, dest, 120, 80);
   * </pre>
   * 
   * @param src
   *          원본 이미지
   * @param dest
   *          생성되는 이미지
   * @param width
   *          생성될 이미지 너비
   * @param height
   *          생성될 이미지 높이, ImageUtil.RATIO는 자동 비례 비율
   * @throws IOException
   */
  public static synchronized String imgResize(File src, File dest, int width,
      int height) {
    int RATIO = 0;
    int SAME = -1;

    Image srcImg = null;
    // 파일의 확장자 추출
    String name = src.getName().toLowerCase(); // 파일명 추출
    // 이미지 파일인지 검사
    if (name.endsWith("jpg") || name.endsWith("bmp") || name.endsWith("png")
        || name.endsWith("gif")) {
      try {
        srcImg = ImageIO.read(src); // 메모리에 원본 이미지 생성
        int srcWidth = srcImg.getWidth(null); // 원본 이미지 너비 추출
        int srcHeight = srcImg.getHeight(null); // 원본 이미지 높이 추출
        int destWidth = -1, destHeight = -1; // 대상 이미지 크기 초기화

        if (width == SAME) { // width가 같은 경우
          destWidth = srcWidth;
        } else if (width > 0) {
          destWidth = width; // 새로운 width를 할당
        }

        if (height == SAME) { // 높이가 같은 경우
          destHeight = srcHeight;
        } else if (height > 0) {
          destHeight = height; // 새로운 높이로 할당
        }

        // 비율에 따른 크기 계산
        if (width == RATIO && height == RATIO) {
          destWidth = srcWidth;
          destHeight = srcHeight;
        } else if (width == RATIO) {
          double ratio = ((double) destHeight) / ((double) srcHeight);
          destWidth = (int) ((double) srcWidth * ratio);
        } else if (height == RATIO) {
          double ratio = ((double) destWidth) / ((double) srcWidth);
          destHeight = (int) ((double) srcHeight * ratio);
        }

        // 메모리에 대상 이미지 생성
        Image imgTarget = srcImg.getScaledInstance(destWidth, destHeight,
            Image.SCALE_SMOOTH);
        int pixels[] = new int[destWidth * destHeight];
        PixelGrabber pg = new PixelGrabber(imgTarget, 0, 0, destWidth,
            destHeight, pixels, 0, destWidth);

        pg.grabPixels();

        BufferedImage destImg = new BufferedImage(destWidth, destHeight,
            BufferedImage.TYPE_INT_RGB);
        destImg.setRGB(0, 0, destWidth, destHeight, pixels, 0, destWidth);

        // 파일에 기록
        ImageIO.write(destImg, "jpg", dest);

        System.out.println(dest.getName() + " 이미지를 생성했습니다.");
      } catch (Exception e) {
        e.printStackTrace();
      }

      name = dest.getName(); // 새로 생성된 파일명
    }

    return name;
  }

  /**
   * 이미지 사이즈를 변경하여 새로운 Preview 이미지를 생성합니다.
   * 
   * @param upDir
   *          원본 이미지 폴더
   * @param src
   *          원본 파일명
   * @param width
   *          생성될 이미지 너비
   * @param height
   *          생성될 이미지 높이, ImageUtil.RATIO는 자동 비례 비율
   * @throws IOException
   */
  public static synchronized File preview(String upDir, String src, int width,
      int height) {
    int RATIO = 0;
    int SAME = -1;

    File _src = new File(upDir + "/" + src); // 원본 파일 객체 생성
    String srcname = _src.getName(); // 원본 파일명 추출

    // 순수 파일명 추출, mt.jpg -> mt 만 추출
    String _dest = srcname.substring(0, srcname.indexOf("."));

    // 축소 이미지 조합 /upDir/mt_t.jpg
    File dest = new File(upDir + "/" + _dest + "_mini.jpg");

    Image srcImg = null;
    // 파일의 확장자 추출
    String name = _src.getName().toLowerCase(); // 파일명 추출
    // 이미지 파일인지 검사
    if (name.endsWith("jpg") || name.endsWith("bmp") || name.endsWith("png")
        || name.endsWith("gif")) {
      try {
        srcImg = ImageIO.read(_src); // 메모리에 원본 이미지 생성
        int srcWidth = srcImg.getWidth(null); // 원본 이미지 너비 추출
        int srcHeight = srcImg.getHeight(null); // 원본 이미지 높이 추출
        int destWidth = -1, destHeight = -1; // 대상 이미지 크기 초기화

        if (width == SAME) { // width가 같은 경우
          destWidth = srcWidth;
        } else if (width > 0) {
          destWidth = width; // 새로운 width를 할당
        }

        if (height == SAME) { // 높이가 같은 경우
          destHeight = srcHeight;
        } else if (height > 0) {
          destHeight = height; // 새로운 높이로 할당
        }

        // 비율에 따른 크기 계산
        if (width == RATIO && height == RATIO) {
          destWidth = srcWidth;
          destHeight = srcHeight;
        } else if (width == RATIO) {
          double ratio = ((double) destHeight) / ((double) srcHeight);
          destWidth = (int) ((double) srcWidth * ratio);
        } else if (height == RATIO) {
          double ratio = ((double) destWidth) / ((double) srcWidth);
          destHeight = (int) ((double) srcHeight * ratio);
        }

        // 메모리에 대상 이미지 생성
        Image imgTarget = srcImg.getScaledInstance(destWidth, destHeight,
            Image.SCALE_SMOOTH);
        int pixels[] = new int[destWidth * destHeight];
        PixelGrabber pg = new PixelGrabber(imgTarget, 0, 0, destWidth,
            destHeight, pixels, 0, destWidth);

        pg.grabPixels();

        BufferedImage destImg = new BufferedImage(destWidth, destHeight,
            BufferedImage.TYPE_INT_RGB);
        destImg.setRGB(0, 0, destWidth, destHeight, pixels, 0, destWidth);

        // 파일에 기록
        ImageIO.write(destImg, "jpg", dest);

        System.out.println(dest.getName() + " 이미지를 생성했습니다.");
      } catch (Exception e) {
        e.printStackTrace();
      }
    }

    return dest;
  }

  /**
   * 문자열을 null인지 체크하여 null값을 ""으로 변환합니다.
   * 
   * @param obj
   * @return
   */
  public static synchronized String checkNull(Object obj) {
    if (obj == null) {
      return "";
    } else {
      String str = (String) obj; // null이란 문자열이 값으로 있는 경우
      if (str.equals("null")) {
        return "";
      }
      return (String) obj;
    }
  }

  /**
   * 마스터 계정인지 검사합니다.
   * 
   * @param request
   * @return true: 마스터 계정
   */
  public static synchronized boolean isMaster(HttpServletRequest request) {
    boolean sw = false;

    HttpSession session = request.getSession();
    String act = (String) session.getAttribute("act");
    // System.out.println("--> Tool.java act: " + act);

    if (act != null) {
      if (act.equals("M")) {
        sw = true;
      }
    }
    return sw;
  }

  /**
   * 일반 관리자 계정인지 검사합니다.
   * 
   * @param request
   * @return true: 일반 관리자
   */
  public static synchronized boolean isAdmin(HttpServletRequest request) {
    boolean sw = false;

    HttpSession session = request.getSession();
    String act = (String) session.getAttribute("act");

    if (act != null) {
      if (act.equals("Y")) {
        sw = true;
      }
    }
    return sw;
  }

  /**
   * 키를 조합합니다. 예) ABC + 현재시간: ABC1234567890123
   * 
   * @return
   */
  public static synchronized String key() {
    String code = "";

    // ASCII: 65 ~ 90, (A ~ Z: 26자)
    Random rnd = new Random();
    int su = rnd.nextInt(26) + 65; // 0 ~ 25 --> 65 ~ 90
    // System.out.println((char)su);
    code = code + (char) su;

    su = rnd.nextInt(26) + 65; // 0 ~ 25 --> 65 ~ 90
    // System.out.println((char)su);
    code = code + (char) su;

    su = rnd.nextInt(26) + 65; // 0 ~ 25 --> 65 ~ 90
    // System.out.println((char)su);
    code = code + (char) su;

    code = code + new Date().getTime();
    // System.out.println("CODE: " + code); // CODE: XGL1449819012230

    return code;
  }

  /**
   * 라인 변경을 <br>
   * 태그로 전환합니다.
   * 
   * @param str
   * @return
   */
  public static synchronized String convertChar(String str) {
    str = str.replaceAll("\r\n", "<BR>");

    return str;
  }

  /**
   * 파일의 확장자를 추출합니다.
   * 
   * @param name
   *          파일명
   * @return 파일 확장자 예) jpg
   */
  public static synchronized String fileExtend(String file) {
    if (file != null) {
      file = file.toLowerCase(); // 소문자로 변경

      int point = file.lastIndexOf("."); // 마지막으로 나타난 '.'의 위치
      file = file.substring(point + 1); // .jpg --> jpg
    } else {
      file = ""; // null 에러 방지용 초기값
    }
    return file;
  }

  public static synchronized String unit(long length) {
    String str = "";

    if (length < 1024) { // Byte: 0 ~ 1023
      str = length + " Byte";
    } else if (length < (1024 * 1024)) { // Byte: 1024 ~ 1048575
      str = length / 1024 + " KB";
    } else if (length < (1024 * 1024 * 1024)) { // Byte: 1048576 ~ 1073741823
      str = length / 1024 / 1024 + " MB";
    } else if (length < (1024L * 1024 * 1024 * 1024)) { // Byte: 1073741824 ~
      str = length / 1024 / 1024 / 1024 + " GB";
    }

    return str;
  }
  public static synchronized boolean isImage(String filename){
	    boolean bol = false;  // 이미지 여부 저장
	    
	    filename = filename.toLowerCase(); // 소문자로 변경
	    
	    if (filename.endsWith(".jpg") ||
	        filename.endsWith(".jpeg") ||
	        filename.endsWith(".png") ||
	        filename.endsWith(".gif") ||
	        filename.endsWith(".bmp")){
	      bol = true;
	    }
	    
	    return bol;
	  }
  public static synchronized boolean isNew(String date, int period) {
	    boolean sw = false;

	    Date _date = new Date();
	    // 숫자 형태인 날짜를 '년월일 시분초'의 형태로 변환
	    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
	    try {
	      _date = sd.parse(date);
	    } catch (Exception e) {
	    }
	    // System.out.println(date);
	    // 1970년1월1일부터 시간을 1000을 1초로하여 계산하여 리턴
	    long time = _date.getTime(); // 글을 작성한 시간

	    // 현재 시간을 1970년 1월 1일부터 수치형식으로 리턴
	    long currentTime = System.currentTimeMillis();

	    // 현재 시간과 글 등록시간의 차이를 계산
	    long diff = currentTime - time;

	    // 1일 86,400,000: 1초를 1000으로 하루를 계산

	    // ceil: 아주 작은 소수점이 있어도 정수로 반올림 처리됨.
	    // 0.0001 --> 1: 오늘 날짜
	    // 1.00002 --> 2: 어제 날짜
	    int day = (int) Math.ceil(((double) diff / 86400000)); // 지난 날짜 계산

	    if (day <= period) {
	      sw = true; // 최신글 처리
	    }
	    return sw;
	  }
}
