<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="TodoApp">
    <div class="container">
        <div>
            <table class="table">
                <thead>
                <tr>
                    <th>전체삭제
                        &nbsp;
                        <input type="checkbox" name="allCheck" id="allCheck"></th>
                    <th>번호</th>
                    <th>상품이미지</th>
                    <th>상품정보</th>
                    <th>상품가격</th>
                    <th>상품수량</th>
                    <th>합계</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="sum" value="0"/>
                <c:forEach var="dto" items="${cartList}" varStatus="status">
                    <c:set var="amount" value="${dto.cart_quantity}"/>
                    <c:set var="sum" value="${dto.cartList[0].product_price * amount + sum}"/>
                    <tr>
                        <td><input type="checkbox" name="check"  class="check"></td>
                        <td>${dto.cart_idx}</td>
                        <td><img src="images/product/${dto.cartList[0].product_image}.jpg" width="50" height="50" ></td>
                        <td>${dto.product_idx}&nbsp;/&nbsp;${dto.cart_size}&nbsp;/&nbsp;${dto.cart_color}</td>
                        <td>
                            <fmt:formatNumber value="${dto.cartList[0].product_price}" pattern="#,###"/>
                        </td>
                        <td>${amount}</td>
                        <td>
                            <fmt:formatNumber value="${dto.cartList[0].product_price * amount}" pattern="#,###"/>
                        </td>
                        <td> <a href="#" class="btn btn-warning" >Delete</a> </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td colspan="3">
                        총합: &nbsp; <fmt:formatNumber value="${sum}" pattern="#,###"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="btn btn-success m-5">전체삭제</div>
    </div>
</div>
