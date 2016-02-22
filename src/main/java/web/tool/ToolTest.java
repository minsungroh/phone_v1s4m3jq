package web.tool;

import java.io.File;

public class ToolTest {
  public static void main(String[] args) {
    //File src = new File("C:/hybrid2/Gallery/case/imgResize/iphone5.jpg");
    //File dest = new File("C:/hybrid2/Gallery/case/imgResize/iphone5_mini.jpg");
    
    //Tool.imgResize(src, dest, 120, 80);
    
    String upDir = "C:/hybrid2/Gallery/case";
    String src = "file1.jpg";
    Tool.preview(upDir, src, 120, 80);
    
  }

}
