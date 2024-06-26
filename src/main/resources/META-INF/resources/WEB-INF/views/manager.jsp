<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <style type="text/css">
        .App {
            text-align: center;
            font-size: 16px;
        }

        label, input, button {
            margin: 10px;
            padding: 5px;
        }

        footer {
            bottom: 0;
            position: absolute;
            width: 90%;
            height: 40px;
        }
    </style>
    <link rel="stylesheet" href="webjars/bootstrap/5.3.3/css/bootstrap.min.css"/>
    <script src="webjars/jquery/3.7.1/dist/jquery.min.js"></script>
</head>
<body>
<div class="App">
    <jsp:include page="common/header.jsp" flush="true" />
    <jsp:include page="user/loginForm.jsp" flush="true" />
</div>
</body>
</html>