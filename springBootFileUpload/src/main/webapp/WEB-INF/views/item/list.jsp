<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품 목록 페이지</title>
<link
	href="https://fonts.googleapis.com/css2?family=Gaegu:wght@400;700&family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet">
<style>
:root {
	--bg-color: #fffaf0;
	--main-pink: #ffb7b2;
	--main-yellow: #fff9ae;
	--main-blue: #b2e2f2;
	--text-color: #4a4a4a;
	--border-style: 4px solid #5d5d5d;
}

body {
	background-color: var(--bg-color);
	font-family: 'Nanum Gothic', sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
	color: var(--text-color);
}

.board-container {
	width: 90%;
	max-width: 800px;
	background: #ffffff;
	border: var(--border-style);
	border-radius: 25px;
	padding: 40px;
	box-shadow: 12px 12px 0px #5d5d5d;
	position: relative;
}

h2 {
	font-family: 'Gaegu', cursive;
	font-size: 42px;
	text-align: center;
	margin-bottom: 30px;
	color: var(--text-color);
	background: linear-gradient(transparent 60%, var(--main-pink) 40%);
	display: inline-block;
	width: 100%;
}

/* 🎀 검색창 디자인 */
.search-container {
	display: flex;
	justify-content: flex-end; 
	margin-bottom: 20px;
}

.search-form {
	display: flex;
	background: white;
	border: var(--border-style);
	border-radius: 15px;
	padding: 5px;
	overflow: hidden;
}

.search-select {
	font-family: 'Gaegu', cursive;
	font-size: 18px;
	background: var(--main-blue);
	color: var(--text-color);
	border: none;
	outline: none;
	padding: 5px 10px;
	cursor: pointer;
}

.search-input {
	border: none;
	border-left: var(--border-style);
	padding: 8px 15px;
	width: 180px;
	outline: none;
	font-size: 14px;
}

.btn-search {
	background: var(--main-pink);
	border: none;
	border-left: var(--border-style);
	color: white;
	font-family: 'Gaegu', cursive;
	font-size: 18px;
	font-weight: bold;
	padding: 0 15px;
	cursor: pointer;
	transition: 0.2s;
}

.btn-search:hover {
	background: #ff9a94;
}

/* 테이블 스타일 */
.bbo-table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 25px;
}

.bbo-table th {
	font-family: 'Gaegu', cursive;
	font-size: 22px;
	background-color: var(--main-yellow);
	border-bottom: var(--border-style);
	padding: 12px;
}

.bbo-table td {
	padding: 15px;
	text-align: center;
	border-bottom: 2px dashed #ddd;
	font-size: 15px;
}

.bbo-table tr:hover td {
	background-color: #fffdf0;
	color: #ff6f61;
	cursor: pointer;
}

.title-link {
	text-decoration: none;
	color: inherit;
	font-weight: bold;
}

/* 글쓰기 버튼 */
.btn-box {
	display: flex;
	justify-content: flex-end;
	margin-top: 20px;
}

.btn-write {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	height: 45px;
	padding: 0 25px;
	background-color: var(--main-pink);
	border: 3px solid #5d5d5d;
	border-radius: 15px;
	box-shadow: 0 4px 0 #d49a96;
	color: white;
	font-family: 'Gaegu', cursive;
	font-size: 20px;
	font-weight: bold;
	text-decoration: none;
	transition: all 0.1s;
}

.btn-write:active {
	transform: translateY(3px);
	box-shadow: none;
}

.footer-msg {
	margin-top: 30px;
	text-align: center;
	font-family: 'Gaegu', cursive;
	font-size: 18px;
	color: #888;
}

.deco-icon {
	position: absolute;
	font-size: 30px;
}
</style>
</head>
<body>

	<div class="board-container">
		<span class="deco-icon" style="top: 20px; left: 20px;">🍓</span> <span
			class="deco-icon" style="top: 20px; right: 20px;">🧸</span>

		<h2>소중한 상품 목록</h2>
		
		<table class="bbo-table">
			<thead>
				<tr>
					<th width="13%">ID</th>
					<th width="15%">NAME</th>
					<th width="15%">PRICE</th>
					<th width="57%">URL</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty itemList}">
						<c:forEach var="item" items="${itemList}">
							<tr onclick="location.href='/item/detail?id=${item.id}'">
								<td>${item.id}</td>
								<td style="text-align: center; vertical-align: middle;"><a
									href="/item/detail?id=${item.id}" class="title-link"> <c:out
											value="${item.name}" />
								</a></td>
								<td>${item.price}</td>
								<td>${item.url}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" style="padding: 50px; color: #888;">아직 등록된
								상품 목록이 없어요.. ( ˃̣̣̥᷄⌓˂̣̣̥᷅ )</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<div class="btn-box">
			<a href="/item/list" class="btn-write">✏️ 상품목록리스트</a>
			<a href="/item/createForm" class="btn-write">✏️ 상품등록</a>
		</div>

		<div class="footer-msg">💌 [ SYSTEM: CONNECTED TO
			JDBCBOARD_SEQ.NEXTVAL ] 💌</div>
	</div>

</body>
</html>