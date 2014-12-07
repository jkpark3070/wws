<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<%@ include file="../common/header.jsp" %>


<div id='wrap_admin'>
	<%@ include file='../common/title.jsp' %>
	<div id='admin_container'>
	
	<%@ include file='../common/gnb.jsp' %>
	<table id='admin_table' class='table_style'>
		<tr>
			<td colspan='9' style='text-align=right; border=#fff'>
			<form id="frm" name="frm" method="post" 
			action="${pageContext.request.contextPath }/guest/search.do" onsubmit="return chkSubmit(this);">
				<span>고객관리</span>
				<div id='srchbox'>
					<input type='text'  id='srch' name='srch'/>
					<input type="button" class='btn' value='고개검색' onclick="javascript:chkValid();"/>
				</div>
				</form>
			</td>
		</tr>
		<tr >
			<th class='tab_no' >번호</th>
			<th class='tab_col'>이름</th>
			<th class='tab_col'>전화번호</th>
			<th class='tab_col'>생년월일</th>
			<th class='tab_col' >성별</th>
			<th class='tab_col'>정보</th>
			<th class='tab_col' >사은품</th>
			<th class='tab_col'>등록일자</th>
			<th class='tab_col'>수정/삭제</th>
		</tr>	
		
		<tr>
		
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.gstIdx }</td>
				<td>${list.name}</td>
				<td>${list.phone }</td>
				<td>${list.birth}</td>
				<td>${list.gender }</td>
				<td>${list.info }</td>
				<td>${list.provide}</td>
				<td><fmt:formatDate value="${list.rgstDate }" pattern="yyyy-MM-dd"/></td>
				<td> 
					<a href='${pageContext.request.contextPath }/guest/detail.do?idx=${list.gstIdx}' 
					class='editBtn'>수정</a> 
					/ 
					<a href='${pageContext.request.contextPath }/guest/delete.do?idx=${list.gstIdx}' 
					class='delBtn'>삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<c:if test="${currentPage != 1 }">
		<a href="${pageContext.request.contextPath }/gst/list.do?pageNo=${currentPage - 1}">[PREV]</a>
	</c:if>

		<c:forEach begin="1" end="${noOfPages }" var="i">
		
			<c:choose>
				<c:when test="${currentPage eq i }">
					${i}
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath }/guest/list.do?pageNo=${i}">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	<c:if test="${currentPage lt noOfPages }">
		<a href="${pageContext.request.contextPath }/guest/list.do?pageNo=${currentPage+1}">[NEXT]</a>
	</c:if>
</div></div>

<%@ include file='../common/footer.jsp' %>
<script>

	$(document).ready(function(){
		
		$('#rgstBtn').click(function(){
			
			window.open('${pageContext.request.contextPath}/guest/registform.do','','width=600, height=500,toolbar=no, menubar=no');
		});
		/* $('.editBtn').click(function(){
			window.open('','','width=600, height=500,toolbar=no,menubar=no');
		});  */
		$('.delBtn').click(function(){
			alert('삭제하시겠습니까?');
		});
		
	});
	function chkValid(){
		
		if(document.frm.srch.value==""){
			alert("검색어를 입력해 주세요.");
			$('#srch').focus();
			return false;
			
		}else{
			alert("검색 진행중입니다");
			return false;
		}
		
		return true;
	}
	

</script>
