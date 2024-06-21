<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    // 비밀번호 일치 확인
    $(document).ready(function() {
        $("#user_pw2").on("keyup", function() {
            var user_pw = $("#user_pw").val();
            var user_pw2 = $("#user_pw2").val();
            var mesg = "비밀번호가 일치합니다";

            if(user_pw != user_pw2) {
                mesg = "비밀번호가 일치하지 않습니다";
            }
            $("#pwdcheck").text(mesg);
        });
    });
</script>

<div class="titleArea">
    <h2>Mypage</h2>
</div>
<hr>

<div class="container">
    <form:form class="row g-3 m-4" modelAttribute="login" method="post">
        <div class="row mb-3">
            <label for="user_id" class="col-sm-2 col-form-label">아이디*</label>
            <div class="col-auto">
                <input type="text" class="form-control" name="user_id" id="user_id" value="${login.user_id}" readonly/>
            </div>
        </div>
        <div class="row mb-3">
            <label for="user_pw" class="col-sm-2 col-form-label">비밀번호*</label>
            <div class="col-auto">
                <form:password path="user_pw" id="user_pw" class="form-control"/>
                <form:errors path="user_pw"></form:errors>
            </div>
        </div>
        <div class="row mb-3">
            <label for="user_pw2" class="col-sm-2 col-form-label">비밀번호 확인*</label>
            <div class="col-auto">
                <input type="password" class="form-control" name="user_pw2" id="user_pw2"/>
            </div>
            <div class="col-sm-3">
                <span id="pwdcheck" class="fs-5"></span>
            </div>
        </div>
        <div class="row mb-3">
            <label for="user_name" class="col-sm-2 col-form-label">이름*</label>
            <div class="col-auto">
                <input type="text" class="form-control" name="user_name" id="user_name" value="${login.user_name}" readonly/>
            </div>
        </div>
        <div class="row mb-3">
            <label for="user_phone" class="col-sm-2 col-form-label">전화번호*</label>
            <div class="col-auto">
                <label for="user_phone" class="visually-hidden">전화번호</label>
                <input type="text" name="user_phone" class="form-control" id="user_phone" path="user_phone" value="${login.user_phone}">
                <form:errors path="user_phone" cssStyle="color: #dc3545"></form:errors>
            </div>
        </div>
        <div class="row mb-3">
            <label for="user_email" class="col-sm-2 col-form-label">이메일*</label>
            <div class="col-auto">
                <label for="user_email" class="visually-hidden">이메일</label>
                <input type="email" name="user_email" class="form-control" id="user_email" value="${login.user_email}" placeholder="직접입력">
                <form:errors path="user_email" cssStyle="color: #dc3545"></form:errors>
            </div>
        </div>
        <hr>
        <div class="row mb-3">
            <div class="col-auto">
                <label for="sample4_postcode" class="visually-hidden">post</label>
                <input type="text" name="user_post" class="form-control" id="sample4_postcode" value="${login.user_post}" placeholder="우편번호">
            </div>
            <div class="col-auto">
                <button type="button" class="btn btn-light btn-outline-dark mary mb-3" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-sm-5">
                <label for="sample4_roadAddress" class="visually-hidden">도로명주소</label>
                <input type="text" name="user_addr1" class="form-control" id="sample4_roadAddress" value="${login.user_addr1}" placeholder="도로명주소">
            </div>
            <div class="col-sm-5">
                <label for="sample4_jibunAddress" class="visually-hidden">지번주소</label>
                <input type="text" name="user_addr2" class="form-control" id="sample4_jibunAddress" value="${login.user_addr2}" placeholder="지번주소">
                <span id="guide" style="color:#999"></span>
            </div>
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-light btn-outline-dark mary">수정하기</button>
            <button type="reset" class="btn btn-light btn-outline-dark mary" onclick="history.back()">취소</button>
        </div>
    </form:form>
</div>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 주소 처리 로직
            }
        }).open();
    }
</script>
