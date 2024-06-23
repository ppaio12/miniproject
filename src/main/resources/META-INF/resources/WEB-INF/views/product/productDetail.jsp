<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="product" value="${product}" />
<script type="text/javascript">
    $(document).ready(function(){

        $("#up").on("click", function(){
            var gAmount = Number.parseInt( $("#cart_quantity").val() );
            console.log(gAmount);
            $("#cart_quantity").val(gAmount+1);
        });

        $("#down").on("click", function(){
            var gAmount = Number.parseInt(  $("#cart_quantity").val() );
            if(gAmount==1){
                $("#cart_quantity").val(1);
            }else{
                $("#cart_quantity").val(gAmount-1);
            }
        });

        $("#addCart").click(function() {
            if (!$("#Color").val() || !$("#Size").val()) {
                alert("옵션을 선택해주세요.");

                return false;
            }else {
                $("#prdtFm").submit();
            }
        });
    });
</script>

<div class="titleArea">
    <h2>Detail</h2>
</div>
<hr>

<div class="container">
    <form class="row g-3 m-4" id="prdtFm" action="cartAdd" method="post">
        <input type="hidden" name="product_idx" value="${product.product_idx}">
        <div class="row">
            <div class="card border border-0" style="width:33rem;">
                <img src="images/product/${product.product_image}.jpg" class="card-img-top" alt="...">
            </div>
            <div class="card border border-0" style="width:30rem;">
                <div class="card-body">
                    <div class="card-title">
                        <h2 class="fw-bold">
                            ${product.product_name}
                        </h2>
                    </div>
                    <div class="card-text product_content">
                        <span class="fw-light content_border">
                            ${product.product_content}
                        </span>
                    </div>
                    <table class="table-light" id="option">
                        <tbody style="height: 165px">
                            <tr class="table-light">
                                <th scope="row" class="fw-light option_menu">Color</th>
                                <td>
                                    <select class="select_change form-select-sm border-light-subtle fw-light" name="cart_color" id="Color">
                                        <option value="" selected="">- [필수] 옵션을 선택해 주세요 -</option>
                                        <option value="" disabled="">-------------------</option>
                                        <option value="white">white</option>
                                        <option value="gray">gray</option>
                                        <option value="navy">navy</option>
                                        <option value="black">black</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="table-light">
                                <th scope="row" class="fw-light option_menu">Size</th>
                                <td>
                                    <select class="select_change form-select-sm border-light-subtle fw-light" name="cart_size" id="Size">
                                        <option value="" selected="">- [필수] 옵션을 선택해 주세요 -</option>
                                        <option value="" disabled="">-------------------</option>
                                        <option value="L">L</option>
                                        <option value="M">M</option>
                                        <option value="S">S</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="table-light">
                                <th scope="row" class="fw-light option_menu">주문수량</th>
                                <td>
                                    <input type="text" name="cart_quantity" value="1" id="cart_quantity" class="quantityintput">
                                    <img src="images/up.PNG" id="up">
                                    <img src="images/down.PNG" id="down">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <a href="#" class="btn btn-light btn-outline-dark  btn-outline-secondary mt-3">구매</a>
                    <button type="button" id="addCart" class="btn btn-light btn-outline-dark  btn-outline-secondary mt-3">장바구니</button>
                </div>
            </div>
        </div>
    </form>
</div>