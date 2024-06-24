<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
</script>

${orderProduct}

<div class="titleArea">
    <h2>Order List</h2>
</div>
<hr>
<div class="TodoApp">
    <div class="container">
        <div class="row">
            <table class="table">
                <thead>
                <tr>
                    <th class="scope">주문번호</th>
                    <th class="scope">주문일자</th>
                    <th class="scope">상품이미지</th>
                    <th class="scope">상품정보</th>
                    <th class="scope">수량</th>
                    <th class="scope">상품금액</th>
                    <th class="scope">합계</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="dto" items="${orderProductInfoMany}" varStatus="status">
                    <c:set var="sum" value="${sum + (dto.product_price * dto.cart_quantity)}" />
                    <tr>
                        <td>
                            ${dto.order_idx}
                        </td>
                        <td>
                                ${receiverUserInfoMany.order_date}
                        </td>
                        <td><img src="images/product/${dto.product_image}.jpg" width="80" height="100"/>
                        </td>
                        <td>
                            <span>${dto.product_name}</span><br>
                            [옵션: ${dto.cart_size}&nbsp;/&nbsp;${dto.cart_color}]
                        </td>
                        <td>${dto.cart_quantity}</td>
                        <td>
                            KRW <fmt:formatNumber value="${dto.product_price}" pattern="#,###"/>
                        </td>
                        <td>
                            KRW <fmt:formatNumber value="${dto.product_price * dto.cart_quantity}"
                                                  pattern="#,###"/>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>[기본배송]</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td colspan="3" class="totalPrice">
                        합계 : &nbsp;KRW <fmt:formatNumber value="${sum}" pattern="#,###"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>


