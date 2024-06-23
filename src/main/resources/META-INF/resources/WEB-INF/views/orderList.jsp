<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문페이지</title>
    <style type="text/css">
        .App {
            margin-bottom: 70px;
            text-align: center;
            font-size: 16px;
        }

        label, input, button {
            margin: 10px;
            padding: 5px;
        }

        r {
            bottom: 0;
            position: absolute;
            width: 90%;
            height: 40px;
        }
        tr, td {
            font-size: 12px;
            color: #353535;
            vertical-align: middle;
        }
        .totalPrice {
            text-align: right;
        }
        .span {
            font-size: 12px;
            color: #353535;
            vertical-align: middle;
        }
        .titleArea {
            margin: 3% 0 30px;
            text-align: center;
        }
        .titleArea h2 {
            font-size: 18px;
            color: black;
        }
        .userInfoTop {
            font-size: 13px;
            color: #353535;
            margin: 30px;
        }
        .title h3 {
            font-size: 13px;
            color: #353535;
            text-align: left;
            margin-left: 45px;
        }
        .title .required {
            margin: -15px 0 0;
            color: #353535;
            text-align: right;
        }
        #infoChange {
            font-size: 13px;
            color: #757575;
            margin: 5px 45px;
            text-align: left;
        }
        .userInfo {
            margin: auto;
            margin-top: 30px;
        }
        .totalPrice {
            text-align: center;
        }
        table {
            margin: 50px 0;
        }
        .orderInfo {
            width: 50%;
            align-content: center;
            margin: 0 auto;
        }
        .howtopay {
            text-align: left;
            margin-left: 30px;
        }
        .howtopay label {
            margin: 0;
        }
    </style>
    <link rel="stylesheet" href="webjars/bootstrap/5.3.3/css/bootstrap.min.css"/>
    <script src="webjars/jquery/3.7.1/dist/jquery.min.js"></script>
</head>
<body>
<div class="App">
    <jsp:include page="common/header.jsp" flush="true" />
    <jsp:include page="order/orderList.jsp" flush="true" />
</div>
</body>
</html>