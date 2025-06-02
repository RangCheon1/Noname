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
<h1>메인화면</h1>

<div class="menu-container">
    <a href="/Login" class="menu-item">
        <div class="menu-icon">L</div>
        <div>로그아웃</div>
    </a>
    <a href="/electric_fee.do" class="menu-item">
        <div class="menu-icon">E</div>
        <div>전기요금표</div>
    </a>
    <a href="/selectCustomer.do" class="menu-item">
        <div class="menu-icon">C</div>
        <div>고객번호<br/>/조회</div>
    </a>
    <a href="/chargecheck" class="menu-item">
        <div class="menu-icon">Q</div>
        <div>요금조회</div>
    </a>
    <a href="/proof.do" class="menu-item">
        <div class="menu-icon">P</div>
        <div>요금납부<br/>증명서 출력</div>
    </a>
</div>
</body>
</html>

