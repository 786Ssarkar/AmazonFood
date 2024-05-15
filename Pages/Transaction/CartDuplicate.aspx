<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Amazon.master" AutoEventWireup="true" CodeFile="CartDuplicate.aspx.cs" Inherits="Pages_CartDuplicate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenthead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">

    <div id="form1" runat="server">
        <div>
            <h2>Shopping Cart</h2>
            <div class="product" id="product_1" style="border: 1px solid #ccc; padding: 10px; margin-bottom: 10px;">
                <div class="row align-items-center">
                    <div class="col-md-1">
                        <input type="checkbox" class="product-checkbox" />
                    </div>
                    <div class="col-md-3">
                        <img src="../assets/images/Ice_Cream.jpg" alt="Ice_Cream.jpg" style="width: 100px; height: 100px; float: left; margin-right: 10px;" />
                    </div>
                    <div class="col-md-3">
                        <h3>Ice-Cream</h3>
                        <p>Price: ₹ 99</p>
                    </div>
                    <div class="col-md-3">
                        <label>
                            Quantity: 
                            <button type="button" onclick="decreaseQuantity(1)">-</button>
                            <span id="quantity_1">1</span>
                            <button type="button" onclick="increaseQuantity(1)">+</button></label>

                    </div>
                </div>

                <%--<div style="clear: both;"></div>--%>
            </div>


            <div class="product" id="product_2" style="border: 1px solid #ccc; padding: 10px; margin-bottom: 10px;">

                <div class="row align-items-center">
                    <div class="col-md-1">
                        <input type="checkbox" class="product-checkbox" />
                    </div>
                    <div class="col-md-3">
                        <img src="../assets/images/butter-chicken-dish.jpg" alt="butter-chicken.jpg" style="width: 100px; height: 100px; float: left; margin-right: 10px;" />
                    </div>
                    <div class="col-md-3">
                        <h3>Butter Chicken</h3>
                        <p>Price: ₹ 199</p>
                    </div>
                    <div class="col-md-3">
                        <label>
                            Quantity: 
 <button type="button" onclick="decreaseQuantity(1)">-</button>
                            <span id="quantity_2">1</span>
                            <button type="button" onclick="increaseQuantity(1)">+</button></label>

                    </div>
                </div>

            </div>


            <!-- Repeat the above structure for each product -->
            <div style="margin-bottom: 10px;">
                <button type="button" onclick="removeSelected()">Remove Selected</button>
                <button type="button" onclick="checkout()">Checkout</button>
            </div>
        </div>
    </div>

    <script>
        function increaseQuantity(productId) {
            var quantityElement = document.getElementById('quantity_' + productId);
            var quantity = parseInt(quantityElement.innerText);
            quantityElement.innerText = quantity + 1;
        }

        function decreaseQuantity(productId) {
            var quantityElement = document.getElementById('quantity_' + productId);
            var quantity = parseInt(quantityElement.innerText);
            if (quantity > 1) {
                quantityElement.innerText = quantity - 1;
            }
        }

        function removeItem(productId) {
            var productElement = document.getElementById('product_' + productId);
            productElement.parentNode.removeChild(productElement);
        }

        function removeSelected() {
            var checkboxes = document.getElementsByClassName('product-checkbox');
            for (var i = checkboxes.length - 1; i >= 0; i--) {
                if (checkboxes[i].checked) {
                    checkboxes[i].parentNode.remove();
                }
            }
        }

        function checkout() {
            alert("Redirecting to checkout page...");
            // You can add code here to redirect the user to the checkout page
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
</asp:Content>

