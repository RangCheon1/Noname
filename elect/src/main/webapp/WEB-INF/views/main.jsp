<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인화면</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css' />">
</head>
<body>
<h1>메인메뉴</h1>
<div class="menu-container">
    <a href="/Login" class="menu-item">
        <div class="menu-icon">L</div>
        <div><strong>로그인</strong></div>
    </a>
    <a href="/electric_fee.do" class="menu-item">
        <div class="menu-icon">E</div>
        <div><strong>전기요금표</strong></div>
    </a>
    <a href="/selectCustomer.do" class="menu-item">
        <div class="menu-icon">C</div>
        <div><strong>고객번호/조회</strong><br/></div>
    </a>
    <a href="/chargecheck" class="menu-item">
        <div class="menu-icon">Q</div>
        <div><strong>요금조회</strong></div>
    </a>
    <a href="/proof.do" class="menu-item">
        <div class="menu-icon">P</div>
        <div><strong>요금납부</strong><br/>증명서 출력</div>
    </a>
</div>

<!-- 로그인 여부에 따라 다른 메시지 출력 -->
<div style="margin-bottom: 20px">
    <c:choose>
        <c:when test="${empty sessionScope.loginUser}">
            <p style="color: gray; font-size: 14px;">※ 로그인 시 간단한 데이터 출력해드립니다.</p>
        </c:when>
        <c:otherwise>
            <p style="font-weight: bold; font-size: 16px;">
                ${loginUser.name}님 환영합니다!<br/>
                고객번호: ${loginUser.userno}
            </p>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>

