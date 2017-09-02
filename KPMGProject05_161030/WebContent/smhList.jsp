<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.or.asterisk.homep.SmhItems" %>
<%@ page import = "kr.or.asterisk.homep.SmhList" %> 
<!-- ; BBSList 가져다 쓸것이기 때문에 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");	
%> 

<br><br>
	&nbsp;&nbsp; 게시판 입니다.<br><br>
	<div id = smhList> <!-- bbslist 에서 table의 값들을 수정하려고한다. -->
	
	<table border = 0>
	
		<tr>
			<td class = smhOrderHead > 순서 </td>			
			<td class = smhHeadHead > 머리글 </td>			
			<td class = smhTitleHead > 제목 </td>
			<td class = smhWriterHead > 작성자 </td>
			<td class = smhYmdHead > 작성일 </td>
			<td class = smhHmsHead > 작성시간 </td>	
			<td class = smhHitHead > 읽음 </td>			
		</tr>
			
		<c:if test="${BBSLIST.listSize gt 0 }">	<!-- 0보다 클때 아래를 수행 -->
			<!-- 목록을 보여주는 부분 -->
			<c:forEach var="cnt" begin = "0" end="${BBSLIST.listSize -1 }">
				<tr>				
					<td class = smhOrder >
						<c:if test="${BBSLIST.notice[cnt] eq 1}">
							<font color="#FF0000">공지</font>
						</c:if>
						<c:if test="${BBSLIST.notice[cnt] ne 1}">
							${BBSLIST.idx[cnt] } 
						</c:if>					
					</td>
					
					<td class = smhHead >${BBSLIST.head[cnt] } </td>
					
					<td class = smhTitle>  &nbsp;
						<c:forEach var="j" begin="1" end="${BBSLIST.space[cnt] -1 }">
							&nbsp; &nbsp; &nbsp; 						
						</c:forEach>		
						<c:if test="${BBSLIST.space[cnt] >1 }">
							<img src="/data/reply.gif">
						</c:if>
												
							<a href="smhMain.jsp?CMDS=smhView.jsp?bid=${param.bid }&idx=${BBSLIST.idx[cnt] }" > ${BBSLIST.title[cnt] } </a> 
						
						
						
					</td>
									
					
					<!-- Title을 클릭했을때 href로이동 -->
					<td class = smhWriter > ${BBSLIST.writer[cnt] } </td>
					<td class = smhYmd > ${BBSLIST.ymd[cnt] } </td>
					<td class = smhHms > ${BBSLIST.hms[cnt] } </td>
					<td class = smhHit > ${BBSLIST.hit[cnt] } </td>					
				</tr>		
			
			</c:forEach>
		</c:if>
		
		<form method=post action="smhMain.jsp?CMDS=smhMakeList">
		<tr>
			<td colspan = 5 class=udlineCenter > 
				<c:if test="${ sessionScope.sessLevel ge BBSLIST.wlevel  }">
					<input type = "button" value = "글쓰기" onClick="location.href='smhMain.jsp?CMDS=smhInput.jsp?bid=${param.bid}' " >				
				</c:if>
				
				<c:if test="${ sessionScope.sessLevel lt BBSLIST.wlevel  }"> <!-- less than -->
					<input type = "button" value = "글쓰기" onClick="alert('쓰기권한이 없습니다.')" disabled>			
				</c:if>					
				
				<select name="opt"> <!-- opt 값이 1,2  -->
					<option value="1">제목</option>
					<option value="2">작성자</option>
				</select>				
				<input type ="text" name=key required>
				<input type = "submit" value = "검색">
			</td>	
		
		</tr>
		</form>					
		
	</table>	
		<c:if test = "${BBSLIST.lastpage }">
			<a href = "smhMain.jsp?CMDS=smhMakeList?bid=${param.bid }?LAST_IDX=${BBSLIST.idx[BBSLIST.listSize -1] }"> 다음페이지 </a>				
		</c:if>	
	</div>
	
