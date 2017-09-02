<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.or.asterisk.homep.SmhItems" %>
<%@ page import = "kr.or.asterisk.homep.SmhList" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%> 
<script>
 	function checkError()
 	{
 		var f = document.updateForm;
 		if( f.title.value == '' )
 		{
 			alert('제목을 입력하세요');
 			f.title.focus();  // title 자리에 커서 깜박이 
 			return false;
 		}
 		if( f.writer.value == '' )
 		{
 			alert('작성자를 입력하세요');
 			f.writer.focus();  // writer 자리에 커서 깜박이 
 			return false;
 		}
 		if( f.html.value == '' )
 		{
 			alert('작성자를 입력하세요');
 			f.html.focus();  // html 자리에 커서 깜박이 
 			return false;
 		}
 		
 	}// checkError method
</script>

<!-- myHead 관련 설정 -->
<c:if test="${bbsSize gt 0 }">
	<c:forEach var="i" begin="0" end="${bbsSize -1 }">
		<c:if test="${listIdx[i] eq param.bid}">
			<c:set var="myHead" value="${listHead[i] }" />
		</c:if>
	</c:forEach>
</c:if>
 

	<div id=bbsinput>
	<form name="updateForm" method=post enctype="multipart/form-data"  onSubmit="return checkError()" action="smhUpdate">
	
	<input type=hidden name=idx value='${param.idx }'>
	<input type=hidden name=bid value='${bid }'>
	<table border=1>
		<tr>
			<td class=left>
			
				<c:set var="headlist" value="${myHead }" />				
				
				<select name=head>
					<option value=''>== 선택 ==</option>
					<c:forTokens var="h" items="${headlist }" delims=",">
						<c:if test="${head eq h }">
							<option value="${h }" selected>${h }</option>							
						</c:if>
						<c:if test="${head ne h }">
							<option value="${h }"> ${h }</option>							
						</c:if>
						
					</c:forTokens>					
				</select>
				</td>
			
			<td class = right width="500"><input type=text id=title name=title style="width:99%;" value="${title }" placeholder="제목을 입력하세요." ></td>			
			
			
		</tr>
		<tr>
			<td class=left>작성자</td>			
			<td class = right width="500"><input type=text name=writer style="width:49%" value="${writer }">
						
				<c:if test="${empty sessionScope.sessID }"> <!-- sessionID 가 비어있으면 -->
					<input type=password name = "pass" placeholder="비밀번호" style="width:49%;">
				</c:if>
				<c:if test="${sessionScope.sessLevel ge 9 }">
					<c:if test="${notice eq 1}">
						<input type=checkbox name=notice checked> 공지사항 
					</c:if>
					<c:if test="${notice ne 1}">
						<input type=checkbox name=notice> 공지사항 
					</c:if>
				</c:if>			
			</td>
		</tr>
		<tr>
			<td class=left>내용</td>
			<td class= right height="300" width="500">
					<textarea name=html style= "width:99%; height:99%;">${html }</textarea>			
			</td>
		</tr>
		
		<tr>
			<td class=left>
				<c:if test="${file1 ne \"\"}">  <!-- file1 이 있는경우 -->
					<a href='smhDownload.jsp?file=${file1 }'>첨부 1</a> (<input type=checkbox name=delfile1>삭제)
				</c:if>
				<c:if test="${file1 eq \"\"}">  <!-- file1 이 없는경우 -->
					첨부파일 1
				</c:if>
			</td>
			<td class = right width="500"><input type=file id=upfile1 name=upfile1 style="width:99%"></td>			
		</tr>
		<tr>
			<td class=left>
				<c:if test="${file2 ne \"\"}">  <!-- file2 이 있는경우 -->
					<a href='smhDownload.jsp?file=${file2 }'>파일 2</a> (<input type=checkbox name=delfile2>삭제)
				</c:if>
				<c:if test="${file2 eq \"\"}">  <!-- file2 이 없는경우 -->
					첨부파일 2
				</c:if>
			</td>
			<td class = right width="500"><input type=file id=upfile2 name=upfile2 style="width:99%"></td>			
		</tr>
		
		<tr>
			<td colspan=2> <input type=submit value="수정 완료"> </td>
		</tr>
	
	
	</table>
	</form>
	</div>