<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Landing.master" AutoEventWireup="true" CodeFile="Landing.aspx.cs" Inherits="Pages_Landing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHeader" runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <div class="hero-area hero-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 offset-lg-2 text-center">
                    <div class="hero-text">
                        <div class="hero-text-tablecell" style="display: table-cell !important;">
                            <p class="subtitle">Tasty & Healthy</p>
                            <h1>Delicious Food</h1>
                            <div class="hero-btns">
                                <a href="#" class="boxed-btn">Food Collection</a>
                                <a href="#" class="bordered-btn">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- product section -->


    <div class="product-section mt-150 mb-150">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 text-center">
                    <div class="section-title">
                        <h3><span class="orange-text">Our</span> Products</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="single-product-item">
                        <div class="product-image">
                            <a href="#">
                                <img src="/assets/images/fast-food-removebg-preview.png" height="150" width="214" alt="" /></a>
                        </div>
                        <h3>Burger</h3>
                        <p class="product-price">₹ 99 </p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center">
                    <div class="single-product-item ">
                        <div class="product-image">
                            <a href="#">
                                <img src="/assets/images/64ecfa28965abfe67dffe8d1_pewsxzzjjtgmj5th716smsgba0gqj1wr-removebg-preview%20(1).png" alt="" height="150" width="214" />
                            </a>
                        </div>
                        <h3>Veg</h3>
                        <p class="product-price">₹ 299 </p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
                    <div class="single-product-item">
                        <div class="product-image">
                            <a href="#">
                                <img src="/assets/images/istockphoto-494350327-612x612-removebg-preview.png" alt="" height="150" width="214" /></a>
                        </div>
                        <h3>Non Veg</h3>
                        <p class="product-price">₹ 199</p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- end product section -->


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
</asp:Content>

