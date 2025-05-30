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
            <img src="<c:url value='/resources/images/logout.png' />" alt="로그인">
            <div>로그인</div>
        </a>
        <a href="/bill.do" class="menu-item">
            <img src="<c:url value='/resources/images/bill.png' />" alt="전기요금표">
            <div>전기요금표</div>
        </a>
        <a href="/selectCustomer.do" class="menu-item">
            <img src="<c:url value='/resources/images/customer.png' />" alt="고객번호 조회">
            <div>고객번호<br/>/조회</div>
        </a>
        <a href="/chargecheck" class="menu-item">
            <img src="<c:url value='/resources/images/inquiry.png' />" alt="요금조회">
            <div>요금조회</div>
        </a>
        <a href="/proof.do" class="menu-item">
            <img src="<c:url value='/resources/images/proof.png' />" alt="증명서 출력">
            <div>요금납부<br/>증명서 출력</div>
        </a>
    </div>
    <div class="contents">
    </div>
</body>
</html>
