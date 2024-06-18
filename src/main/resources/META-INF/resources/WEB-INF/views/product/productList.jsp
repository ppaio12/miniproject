<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <div class="row">
        <c:forEach var="dto" items="${productList}" >
            <div class="col border border-dark m-4 w-80">
                <a href="productDetail?category_idx=${dto.product_idx}">
                    <img src="images/product/${dto.product_image}.jpg" width="350">
                </a>
                <div class="mt-4 fs-6" style="font-size: 15px;">${dto.product_name}</div>
<%--                <div class="mt-2 fs-6">${dto.product_content}</div>--%>
                <div class="mt-2 fs-6" style="font-size: 13px;">KRW ${dto.product_price}</div>
            </div>
        </c:forEach>
    </div>
</div>