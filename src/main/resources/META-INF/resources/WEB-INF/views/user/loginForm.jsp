<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="webjars/jquery/3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">

    // 로그인 Submit
    $(document).ready(function() {
        $("form").on("submit", function() {
            this.action="login";   // LoginServlet의 Mapping값
            this.method="post";
        })
    });

</script>

<div class="container">
    <form class="row g-3 m-4">
        <div class="row mb-3">
            <label for="userid" class="col-sm-2 col-form-label">아이디</label>
            <div class="col-auto">
                <input type="text" class="form-control" id="user_id" name="user_id">
            </div>
        </div>
        <div class="row mb-3">
            <label for="password" class="col-sm-2 col-form-label">비밀번호</label>
            <div class="col-auto">
                <input type="password" class="form-control" name="user_pw" id="user_pw">
            </div>
        </div>
        <div class="row mb-3">
            <div>${errorMessage}</div>
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-primary">로그인</button>
            <button type="reset" class="btn btn-primary">취소</button>
        </div>
    </form>
</div>