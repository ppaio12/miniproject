<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

    $(function() {
        $("#mypageForm").on("click", function() {

            window.location.href = "myPage";
        });

        $("#orderList").on("click", function() {
            window.location.href = "orderList";
        });
    });

</script>

<div class="titleArea">
    <h2>Mypage Main</h2>
</div>
<hr>

<div class="container">
    <button id="mypageForm">회원 정보 수정</button>
    <button id="orderList">주문 내역</button>
</div>
