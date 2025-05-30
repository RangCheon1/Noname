<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="user" value="${list[0]}" />
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
window.onload = function () {
    <c:if test="${loginRequired}">
        alert("로그인 해주세요.");
        history.back(); // 또는 location.href = '/login';
    </c:if>
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/chargecheck.css' />">

</head>
<body>
<h1>
테스트: userno=${user.userno}
테스트2: name=${user.name}
  
</h1>
<div>
<table>
	<tr>
		<th class="l_table">
		<span>고객정보</span>
		</th>
		<th class="r_table">
		---
		</th>
	</tr>
	<tr>
		<td colspan=2>
			<div class="customer_value">
				<div id="name" class="innerdiv">
					<div class="l_table">
						성명
					</div>
					<div class="value">
						${user.name}
					</div>
				</div>
				<div id="address" class="innerdiv">
					<div class="l_table">
						주소
					</div>
					<div class="value">
						${user.address }
					</div>
				</div>
			</div>
		</td>
	</tr>
</table>
<br>
<table>
	<tr>
		<th class="l_table">
		<span>이번 달 검침/전기 사용량</span> <label>(단위:kWh)</label>
		</th>
		<th class="r_table">
		---
		</th>
	</tr>
	<tr>
		<td class="l_table">
		전기 사용 기간
		</td>
		<td class="r_table">
		ㅁㅁㅁ
		</td>
	</tr>
	<tr>
		<td class="l_table">
		검침일
		</td>
		<td class="r_table">
		매월 17일
		</td>
	</tr>
	<tr>
		<td class="l_table">
		이달 사용량
		</td>
		<td class="r_table">
		${user.month25_6}
		</td>
	</tr>
	<tr>
		<td class="l_table">
		전월 사용량
		</td>
		<td class="r_table">
		${user.month25_5}
		</td>
	</tr>
</table>
<br>
<table>
	<tr>
		<th class="l_table">
		<span>이번 달 예상 청구금액</span> <label>(단위:원)</label>
		</th>
		<th class="r_table">
		---
		</th>
	</tr>
	<tr>
		<td class="l_table">
		전기요금계
		</td>
		<td class="r_table">
		sumCharge = basic+useCharge
		</td>
	</tr>
	<tr>
		<td class="l_table">
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp기본요금
		</td>
		<td class="r_table">
		basic
		</td>
	</tr>
	<tr>
		<td class="l_table">
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp전력량 요금
		</td>
		<td class="r_table">
		useCharge
		</td>
	</tr>
	<tr>
		<td class="l_table">
		부가 가치세
		</td>
		<td class="r_table">
		addedtax = sumCharge/10
		</td>
	</tr>
	<tr>
		<td class="l_table">
		전력기금
		</td>
		<td class="r_table">
		360
		</td>
	</tr>
	<tr class="sum">
		<td class="last_l_table">
		청구금액
		</td>
		<td class="last_r_table">
		totalCharge = sumCharge+addedtax+360
		</td>
	</tr>
	<tr>
		<td colspan=2  class="l_table annotation">
		※예상 청구금액은 예상치로 실제 부과되는 청구요금과 차이가 있습니다.
		</td>
	</tr>
</table>
</div>
<script type="text/javascript" src="/resources/js/chargecheck.js"></script>
</body>
</html>