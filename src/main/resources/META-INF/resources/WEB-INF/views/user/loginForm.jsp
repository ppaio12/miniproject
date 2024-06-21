<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mesg" value="${mesg}" />

<div class="titleArea">
    <h2>Login</h2>
</div>
<hr>

<div class="container">
    <form action="auth" method="post" class="row g-3 m-4">
        <div class="row mb-3">
            <label for="user_id" class="col-sm-2 col-form-label">아이디</label>
                <div class="col-auto">
                <input type="text" class="form-control" id="user_id" name="user_id">
            </div>
        </div>
        <div class="row mb-3">
            <label for="user_pw" class="col-sm-2 col-form-label">비밀번호</label>
            <div class="col-auto">
                <input type="password" class="form-control" name="user_pw" id="user_pw">
            </div>
        </div>
        <c:if test="${not empty mesg}">
            <div class="row mb-3">
                <span id="userCheck" class="fs-6">${mesg}</span>
            </div>
        </c:if>
        <div class="col-12">
            <button type="submit" class="btn btn-light btn-outline-dark  btn-outline-secondary">로그인</button>
            <button type="reset" class="btn btn-light btn-outline-dark  btn-outline-secondary">취소</button>
        </div>
    </form>
</div>