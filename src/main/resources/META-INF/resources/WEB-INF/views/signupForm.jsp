<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
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
        input[readonly] {
            background-color: #f2f2f2;
            color: #b3b3b3;
            pointer-events: none;
        }
        #idcheck, #pwdcheck {
            color: #dc3545;
            margin-top: 6px;
            line-height: 35px;
        }
        #join_title {
            font-size: 27px;
            font-weight: bold;
            margin: 40px 0;
        }
        textarea {
            resize: none;
        }
    </style>
    <link rel="stylesheet" href="webjars/bootstrap/5.3.3/css/bootstrap.min.css"/>
    <script src="webjars/jquery/3.7.1/dist/jquery.min.js"></script>
</head>
<body>
<div class="App">
    <jsp:include page="common/header.jsp" flush="true" />
    <jsp:include page="user/signupForm.jsp" flush="true" />
</div>
</body>
</html>