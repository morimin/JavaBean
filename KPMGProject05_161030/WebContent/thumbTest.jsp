<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import = "java.awt.image.BufferedImage" %>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.IOException" %>
<%@ page import = "javax.imageio.ImageIO" %>


<%
 request.setCharacterEncoding("utf-8");  // 한글깨짐 방지 
 
 String root = request.getSession().getServletContext().getRealPath("/");
 // ; 절대경로(C:\ ~) 를 나타냄.
 
 String saveDir = "upload";
 String pathDelimeter = "\\";  // \ 하나를 써주기 위해 \\
 
 String orgFileName = "insta3.png";
 // test.jpg serverFileName 으로 대체하면 이름을 자동저장 시킬 수 도 있다.
 
 File srcImgFile = new File(root + "upload/" + orgFileName); 
 // 원본과 섬네일 이미지가 따로따로 있어야 하기 떄문
  
 int width = 150;
 int height = 93;
 BufferedImage bi ;

 
 // 파일처리
 try
 {
  BufferedImage srcImg = ImageIO.read(srcImgFile);
  // ; 원본파일
  BufferedImage dstImg ; // 실제 thumbNail Image
  
  
  bi = ImageIO.read(srcImgFile);  // 원본 이미지를 읽어옴
  
  //height = (int) (bi.getHeight() * width / bi.getWidth()); 
  //  ; 원본의 세로길이 * 새로운 가로길이 / 원본의 가로길이
    
  
  dstImg = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
  // ; 마지막 파라미터(TYPE_3BYTE_BGR)는 색상에 대한 정밀도
  
  java.awt.Graphics2D g = dstImg.createGraphics();
  // ; 단발성으로 사용할때 import 대신 이렇게 루트를 지정해줘서 사용한다.
  
  g.drawImage(srcImg, 0, 0, width, height, null);
  
  // thumb_test.jpg 형식으로 저장해주고싶음
  //    
  File outFile = new File(root + saveDir + "/thumb_" + orgFileName );
  // ; root 밑에 saveDir 주소 밑에 thumb_원본이름 으로 저장
  
  ImageIO.write(dstImg, "PNG", outFile);
  
 }catch(Exception e)
 {
  
 }
  
 
 
 
%>


<!DOCTYPE html >
<html>
<head>
 <meta charset="UTF-8">
 <title> ThumbNail 만들기 </title>  
</head>
<body>
 
 원본 파일 <img src = "upload/<%= orgFileName %>"><br> <br> 
 
 썸네일 <img src = "upload/thumb_<%= orgFileName %>"><br>
 
 
</body>
</html>