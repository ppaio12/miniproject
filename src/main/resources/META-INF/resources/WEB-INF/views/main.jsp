<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인홈페이지</title>
    <style type="text/css">
        .App {
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
        .mb-5 {
            margin-bottom: 0;
        !important;
        }
        .border {
            --bs-border-width: 0px; !important;
        }
        #product_name {
            font-size: 14px;
            margin-top: 13px;
            color: gray;
        }
        #product_price {
            font-size: 12px;
            margin-top: 7px;
        }
         .form-control:focus {
             box-shadow: none;
             border-color: black;
             outline: none;
         }
         .btn-light btn-outline-dark  {
            --bs-btn-bg: none;
         }
        .titleArea {
            margin: 3% 0 30px;
            text-align: center;
        }
        .titleArea h2 {
            font-size: 18px;
            color: black;
        }

    </style>
    <link rel="stylesheet" href="webjars/bootstrap/5.3.3/css/bootstrap.min.css"/>
    <script src="webjars/jquery/3.7.1/dist/jquery.min.js"></script>
</head>
<body>
    <div class="App">
        <jsp:include page="common/header.jsp" flush="true" />
        <jsp:include page="product/productList.jsp" flush="true" />
    </div>
</body>
</html>