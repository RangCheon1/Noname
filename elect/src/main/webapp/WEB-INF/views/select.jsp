<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<c:url value='/resources/css/select.css' />">
    <script type="text/javascript" src="/resources/js/select.js"></script>
    <meta charset="UTF-8">
    <title>고객번호 선택</title>
</head>
<body>

<div class="container">
    <%-- 페이지 제목 --%>
    <h2>아래 등록 고객번호를 선택해주세요</h2>

    <div class="top-bar">
        <%-- 고객 데이터가 있을 경우 고객 수 표시 --%>
        <c:if test="${not empty customers}">
            <span class="customer-count">
                등록 고객번호 <strong><c:out value="${fn:length(customers)}" /></strong>
            </span>
        </c:if>

        <%-- 고객 검색 폼 --%>
        <form class="search-form" method="get" action="searchCustomer.do" onsubmit="return validateSearch()">
            <input type="text" id="keyword" name="keyword" placeholder="고객번호, 성명, 주소, 별명 검색" />
            <button type="submit">🔍</button>
        </form>

        <%-- 정산, 추가, 삭제 버튼 모음 --%>
        <div class="action-buttons">
            <button onclick="location.href='recalculateCustomer.do'">고객번호 정산하기</button>
            <button onclick="location.href='addCustomer.do'">고객번호 추가</button>
            <button onclick="location.href='main.do'">메인화면 이동</button>
            <button onclick="location.href='proof.do'">증빙서류 확인</button>
        </div>
    </div>

    <%-- 메시지가 있을 경우 출력 --%>
    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>

    <div class="customer-list">
        <%-- 고객 목록이 없으면 안내 문구 출력 --%>
        <c:choose>
            <c:when test="${empty customers}">
                <div class="no-customers">
                    <p>현재 등록된 고객이 없습니다. 고객번호를 추가해주세요.</p>
                </div>
            </c:when>
            <%-- 고객 목록이 있을 경우 고객 카드 형태로 반복 출력 --%>
            <c:otherwise>
                <c:forEach var="customer" items="${customers}">
                    <div class="customer-card">
                        <%-- 고객 상세 정보 --%>
                        <div class="customer-info">
                            <div><strong>고객번호</strong><br><strong>${customer.userno}</strong></div>
                            <div><strong>성명</strong><br>${customer.name}</div>
                            <div><strong>아이디</strong><br>${customer.id}</div>
                            <div><strong>전화번호</strong><br>${customer.phone}</div>
                            <div><strong>주소</strong><br>${customer.address}</div>
                        </div>

                        <%-- 조회 취소 버튼 (폼 제출) --%>
                        <form method="get" action="selectCustomer.do" class="delete-form">
                            <button type="submit">조회 취소</button>
                        </form>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>

</body>
</html>
