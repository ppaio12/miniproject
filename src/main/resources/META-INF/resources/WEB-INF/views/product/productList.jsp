<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
    <div class="row">
        <c:forEach var="dto" items="${productList}" >
            <div class="col border border-dark m-4 w-80">
                <a href="productDetail?category_idx=${dto.product_idx}">
                    <img src="images/product/${dto.product_image}.jpg" width="350">
                </a>
                <div id="product_name">${dto.product_name}</div>
                <div id="product_price" name="price">
                    KRW <fmt:formatNumber value="${dto.product_price}" pattern="#,###"/>
                </div>
            </div>
        </c:forEach>
    </div>
</div>