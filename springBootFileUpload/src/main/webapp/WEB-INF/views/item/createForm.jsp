<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
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

h2 {
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

.form-label {
	display: block;
	font-family: 'Gaegu', cursive;
	font-size: 24px;
	font-weight: 700;
	margin-bottom: 8px;
	color: #ff6f61;
}

.input-box {
	width: 100%;
	padding: 15px;
	border: 3px solid #5d5d5d;
	border-radius: 15px;
	font-size: 16px;
	box-sizing: border-box;
	background-color: #fff;
	outline: none;
	margin-bottom: 25px;
	transition: transform 0.2s;
}

.input-box:focus {
	transform: scale(1.02);
	background-color: var(--main-blue);
}

textarea.input-box {
	height: 200px;
	resize: none;
}
/* 버튼들을 감싸는 컨테이너 */
.btn-group {
    display: flex;       /* 가로 정렬의 핵심 */
    gap: 10px;           /* 버튼 사이 간격 */
    margin-top: 30px;
    width: 100%;         /* 부모 너비에 꽉 차게 */
}

/* 내부의 모든 요소(a, button)를 동일한 크기로 고정 */
.btn-group > * {
    flex: 1;             /* 1:1:1 비율로 정확히 나눔 */
    text-decoration: none;
    border: none;
    padding: 0;
    margin: 0;
}

/* 실제 버튼 디자인 */
.custom-btn {
    width: 100%;
    height: 50px;
    border: 3px solid #5d5d5d;
    border-radius: 15px;
    font-family: 'Gaegu', cursive;
    font-size: 19px;
    font-weight: bold;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    box-sizing: border-box;
    transition: all 0.1s;
}

/* 색상 지정 */
.bg-list  { background-color: #b2e2f2; box-shadow: 0 4px 0 #88b7c5; color: #4a4a4a; }
.bg-send  { background-color: #ffb7b2; box-shadow: 0 4px 0 #d49a96; color: #fff; text-shadow: 1px 1px 1px rgba(0,0,0,0.1); }
.bg-reset { background-color: #fff9ae; box-shadow: 0 4px 0 #d8d38b; color: #4a4a4a; }

/* 누르는 효과 */
.custom-btn:active {
    transform: translateY(3px);
    box-shadow: none !important;
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

		<h2>자료실업로드</h2>

		<form action="/item/create" method="post" enctype="multipart/form-data">
			<label class="form-label">상품이름</label> <input type="text" id="name"
				name="name" class="input-box" placeholder="상품이름을 입력하세요" required>

			<label class="form-label">상품가격(KRW)</label> <input type="text" id="price"
				name="price" class="input-box" placeholder="상품가격을 입력하세요" required>

			<label class="form-label">상품파일</label> <input type="file" id="picture"
				name="picture" class="input-box" required>

			<label class="form-label">상품이미지설명</label> <textarea id="description"
				name="description" class="input-box" rows="5" cols="20">
				</textarea>

			<div class="btn-group">
				<a href="/item/list" class="custom-btn bg-list">📋 상품리스트</a>
    
    <button type="submit" class="custom-btn bg-send">🚀 상품등록</button>
    
    <button type="reset" class="custom-btn bg-reset">🧹 취소하기</button>
			</div>
		</form>
	</div>

</body>
</html>