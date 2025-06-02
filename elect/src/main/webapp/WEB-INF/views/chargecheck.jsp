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
        history.back();
    </c:if>
}
</script>
<script type="text/javascript" src="/resources/js/chargecheck.js"></script>
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
		<th class="r_table hide_button">
		---
		</th>
	</tr>
	<tr>
		<td class="l_table">
		전기 사용 기간
		</td>
		<td class="r_table" id="usagePeriod">
		
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
		<td class="r_table this_month">
		
		</td>
	</tr>
	<tr id="prev_usage_row">
		<td class="l_table">
		전월 사용량
		</td>
		<td class="r_table prev_month">
		
		</td>
	</tr>
</table>
<br>

<table>
	<tr>
		<td class="select1">
			청구 월 선택
		</td>
	</tr>
	<tr>
		<td class="select2">
			<select name="month" id="mon">
				<option value="" disabled>-선택-</option>
				<option value="1">1월</option>
				<option value="2">2월</option>
				<option value="3">3월</option>
				<option value="4">4월</option>
				<option value="5">5월</option>
				<option value="6">6월</option>
				<option value="7">7월</option>
				<option value="8">8월</option>
				<option value="9">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>
		</td>
	</tr>
</table>
<br>
<table>
	<tr>
		<th class="l_table">
		<span>이번 달 예상 청구금액</span> <label>(단위:원)</label>
		</th>
		<th class="r_table hide_button">
		---
		</th>
	</tr>
	<tr>
		<td class="l_table">
		전기요금계
		</td>
		<td class="r_table" id="sumCharge">
		
		</td>
	</tr>
	<tr>
		<td class="l_table">
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp기본요금
		</td>
		<td class="r_table" id="basic">
		
		</td>
	</tr>
	<tr>
		<td class="l_table">
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp전력량 요금
		</td>
		<td class="r_table" id="useCharge">
		
		</td>
	</tr>
	<tr>
		<td class="l_table">
		부가 가치세
		</td>
		<td class="r_table" id="addedTax">
		
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
		<td class="last_r_table" id="totalCharge">
		
		</td>
	</tr>
	<tr>
		<td colspan=2  class="l_table annotation">
		※예상 청구금액은 예상치로 실제 부과되는 청구요금과 차이가 있습니다.
		</td>
	</tr>
</table>
</div>
<script>
$(document).ready(function(){
var use;
var basic;
var useCharge;
const usageMap = {
        1: ${user.month25_1},
        2: ${user.month25_2},
        3: ${user.month25_3},
        4: ${user.month25_4},
        5: ${user.month25_5},
        6: ${user.month25_6},
        7: ${user.month25_7},
        8: ${user.month25_8},
        9: ${user.month25_9},
        10: ${user.month25_10},
        11: ${user.month25_11},
        12: ${user.month25_12}
    };
function updateCharges(month) {
    const use = usageMap[month];
    const prevMonth = month === 1 ? 12 : month - 1;
    const prevUse = prevMonth ? usageMap[prevMonth] : null;
    const startDate = prevMonth + "/18";
	const endDate = month + "/17";
	
    
    let basic = 0;
    let useCharge = 0;
	
    
    //요금 계산식
    if (use <= 200) {
        basic = 730;
        useCharge = use * 97;
    } else if (use <= 400) {
        basic = 1260;
        useCharge = use * 166;
    } else {
        basic = 6060;
        useCharge = use * 234;
    }

    const sumCharge = basic + useCharge;
    const addedTax = Math.floor(sumCharge / 10);
    const totalCharge = sumCharge + addedTax + 360;
	
    
    $("#usagePeriod").text(startDate + " ~ " + endDate);
    $("#basic").text(basic);
    $("#useCharge").text(useCharge);
    $("#sumCharge").text(sumCharge);
    $("#addedTax").text(addedTax);
    $("#totalCharge").text(totalCharge);
    
    $(".this_month").text(use);
    $(".prev_month").text(prevUse);
    
    //1월일 때 전월 사용량 숨기기
    if (prevMonth!=12) {
        $("#prev_usage_row").show();
    } else {
        $("#prev_usage_row").hide();
    }
}


//이번 달이 처음에 자동으로 선택되게 하기
	const today = new Date();
	const currentMonth = today.getMonth() + 1; // getMonth()는 0~11 반환



	$("#mon").val(currentMonth);
	updateCharges(currentMonth);

	$("#mon").on("change", function () {
    	const selectedMonth = parseInt($(this).val());
    	updateCharges(selectedMonth);
	});
	

});
</script>
</body>
</html>