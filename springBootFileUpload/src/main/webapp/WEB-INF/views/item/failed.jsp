<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>BOARD | 새 글 쓰기 ✏️</title>
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
	max-width: 600px;
	background: #ffffff;
	border: 4px solid #5d5d5d;
	border-radius: 25px;
	padding: 40px;
	box-shadow: 12px 12px 0px #5d5d5d; /* 팝아트 느낌의 그림자 */
	position: relative;
}

h1 {
	font-family: 'Gaegu', cursive;
	font-size: 42px;
	text-align: center;
	margin-bottom: 30px;
	color: var(--text-color);
	background: linear-gradient(transparent 60%, var(--main-yellow) 40%);
	/* 형광펜 밑줄 효과 */
	display: inline-block;
	width: 100%;
}

.btn-group {
	display: flex;
	gap: 15px;
	margin-top: 10px;
}

.btn {
	flex: 1;
	padding: 15px;
	border: 3px solid #5d5d5d;
	border-radius: 50px;
	font-family: 'Gaegu', cursive;
	font-size: 24px;
	font-weight: bold;
	cursor: pointer;
	transition: all 0.1s;
}

.btn-cancel {
	background-color: #eeeeee;
}

.btn-save {
	background-color: var(--main-pink);
	box-shadow: 0 5px 0px #d49a96;
}

.btn-save:hover {
	transform: translateY(2px);
	box-shadow: 0 3px 0px #d49a96;
}

.btn-save:active {
	transform: translateY(5px);
	box-shadow: none;
}

/* 아기자기한 데코레이션 */
.deco-icon {
	position: absolute;
	font-size: 30px;
}
</style>
</head>
<body>

	<div class="board-container">
		<span class="deco-icon" style="top: 20px; left: 20px;">📌</span> <span
			class="deco-icon" style="top: 20px; right: 20px;">✨</span>

		<h1>${message}</h1>

		<div class="btn-group">
			<a href="/item/createForm"><button class="btn btn-save">상품등록 🚀</button></a>
			<a href="/item/list"><button class="btn btn-save">상품리스트 🚀</button></a>
		</div>
	</div>

</body>
</html>