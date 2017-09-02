<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>

<%
 String savePath="/JSP9805052"; // ������ ���丮 (������)

 int sizeLimit = 5 * 1024 * 1024 ; // 5�ް����� ���� �Ѿ�� ���ܹ߻�

 try{

	MultipartRequest multi=new MultipartRequest(request, savePath, sizeLimit, new DefaultFileRenamePolicy());
 	Enumeration formNames=multi.getFileNames();  // ���� �̸� ��ȯ
	String formName=(String)formNames.nextElement(); // �ڷᰡ ���� ��쿣 while ���� ���
	String fileName=multi.getFilesystemName(formName); // ������ �̸� ���

	if(fileName == null) {   // ������ ���ε� ���� �ʾ�����
		out.print("���� ���ε� ���� �ʾ���");
	} else {  // ������ ���ε� �Ǿ�����
		fileName=new String(fileName.getBytes("8859_1"),"euc-kr"); // �ѱ����ڵ� - �������� ���
		out.print("Form Name : " + formName + "<BR>");
		out.print("File Name  : " + fileName);
	} // end if

 } catch(Exception e) {
	out.print("���� ��Ȳ �߻�..! ");
 } 
%>
