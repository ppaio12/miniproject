<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상세페이지</title>
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
        #up:hover, #down:hover{
            cursor: pointer;
        }
        .card-title {
            font-size: 16px;
            font-weight: bold;
            text-align: left;
        }
        .card-text {
            text-align: left;
            margin-top: 15px;
        }
        .product_content {
            margin-top: 10px;
            font-size: 13px;
            color: #999;
            border-bottom: 1px solid #e8e8e8;
            padding: 0 0 10px;
        }
        .fw-light {
            font-size: 13px;
            color: #555555;
            margin-right: 70px;
        }
        #option {
            margin-top: 20px;
        }
        .option_menu {
            width: 115px;
            padding: 7px 0;
            text-align: left;
        }
        #gAmount {
            border: #e9ecef;
            width: 14rem;
            height: 1.8rem;
        }
		.quantityintput{
			height:29.6px;
			border: 0.5px solid;
			border-color:#E0E0E0;
			border-radius: 4.5%;
		}

    </style>
    <link rel="stylesheet" href="webjars/bootstrap/5.3.3/css/bootstrap.min.css"/>
    <script src="webjars/jquery/3.7.1/dist/jquery.min.js"></script>
</head>
<body>
<div class="App">
    <jsp:include page="common/header.jsp" flush="true" />
    <jsp:include page="product/productDetail.jsp" flush="true" />
</div>
</body>
</html>