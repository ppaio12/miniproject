<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">


</script>

<div class="titleArea">
    <h2>주문이 완료되었습니다.</h2>
</div>
<hr>
<div class="TodoApp">
    <div class="container">
        <div class="row">
            <div class="card" style="margin-bottom: 50px;">
                <div class="card-header">
                    <h4 class="card-title" style="text-align: left;">주문자 정보</h4>
                    <!-- /.card-tools -->
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <p class="p" style="text-align: left;">주문자 명&nbsp;&nbsp;&nbsp;&nbsp;: ${receiverUserInfo.user_name}</p>
                    <p class="p" style="text-align: left;">휴대폰 번호 : ${receiverUserInfo.user_phone}</p>
                    <p class="p" style="text-align: left;">주문일시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ${receiverUserInfo.order_date}</p>
                    <p class="p" style="text-align: left;">주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
                        (${receiverUserInfo.user_post}) ${receiverUserInfo.user_addr1} ${receiverUserInfo.user_addr2}</p>
                    <p class="p" style="text-align: left;">배송메모&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ${receiverUserInfo.order_comment}</p>
                </div>
                <div class="card-footer">
                    <p class="p" style="text-align: left;">적립금 : <fmt:formatNumber value="${point}" pattern="#,###"/> 원</p>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <table class="table">
                <thead>
                <tr>
                    <th class="scope">상품번호</th>
                    <th class="scope">상품이미지</th>
                    <th class="scope">상품정보</th>
                    <th class="scope">판매가</th>
                    <th class="scope">수량</th>
                    <th class="scope">합계</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="dto" items="${orderProduectInfo}" varStatus="status">
                    <c:set var="sum" value="${sum + (dto.product_price * dto.cart_quantity)}" />
                    <tr>
                        <td>
                                ${dto.product_idx}
                        </td>
                        <td><img src="images/product/${dto.product_image}.jpg" width="80" height="100"/>
                        </td>
                        <td>
                            <span>${dto.product_name}</span><br>
                            [옵션: ${dto.cart_size}&nbsp;/&nbsp;${dto.cart_color}]
                        </td>
                        <td>
                            KRW <fmt:formatNumber value="${dto.product_price}" pattern="#,###"/>
                        </td>
                        <td>${dto.cart_quantity}</td>
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


