<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Landing.master" AutoEventWireup="true" CodeFile="ShopItems.aspx.cs" Inherits="Pages_ShopItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHeader" Runat="Server">
    <style>
        .one{
            margin-top:120px
        }
.top-header-area {
    background-color:#4e6069;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" Runat="Server">

        <div class="product-section mt-140 mb-160">
        <div class="container">
            <%--             <div class="row">
             <div class="col-lg-8 offset-lg-2 text-center">
                    <div class="section-title">
                        <h3><span class="orange-text">Our</span> Products</h3>
                    </div>
                </div>
            </div>--%>
            <div class="row one">


                <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/Shahi-Paneer.jpg" alt="Shahi-Paneer" height="150" width="214" />
                        </div>
                        <h3>Shahi-Paneer</h3>
                        <p class="product-price">₹ 299</p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>


                <div class="col-lg-4 col-md-6 text-center offset-md-3 offset-lg-0">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="/assets/images/64ecfa28965abfe67dffe8d1_pewsxzzjjtgmj5th716smsgba0gqj1wr-removebg-preview%20(1).png" alt="" height="150" width="214" />
                        </div>
                        <h3>Veg</h3>
                        <p class="product-price">₹ 299 </p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="/assets/images/istockphoto-494350327-612x612-removebg-preview.png" alt="" height="150" width="214" />
                        </div>
                        <h3>Non Veg</h3>
                        <p class="product-price">₹ 199</p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/Ice_Cream.jpg" alt="Ice_Cream" height="150" width="214" />
                        </div>
                        <h3>Ice-Cream</h3>
                        <p class="product-price">₹ 99</p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center offset-md-3 offset-lg-0">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/bhajipav.jpg" alt="bhajipav.jpg" height="150" width="214" />
                        </div>
                        <h3>Pav bhaji</h3>
                        <p class="product-price">₹ 99 </p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/butter-chicken-dish.jpg" alt="butter-chicken-dish" height="155" width="200" />
                        </div>
                        <h3>Butter Chicken</h3>
                        <p class="product-price">₹ 199</p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 text-center offset-md-3 offset-lg-0">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/dal.jpg" height="150" width="214" alt="Dal" />
                        </div>
                        <h3>Dal</h3>
                        <p class="product-price">₹ 99 </p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center offset-md-3 offset-lg-0">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/Fish_Fry.jpg" alt="Fish Fry" height="150" width="214" />
                        </div>
                        <h3>Fish Fry</h3>
                        <p class="product-price">₹ 299 </p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/food-pizza.jpg" alt="Pizza" height="150" width="214" />
                        </div>
                        <h3>Pizza</h3>
                        <p class="product-price">₹ 199</p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 text-center offset-md-3 offset-lg-0">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/gulab-jamuns.jpg" height="150" width="214" alt="Gulab-Jamuns" />
                        </div>
                        <h3>Gulab-Jamuns</h3>
                        <p class="product-price">₹ 79 </p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center offset-md-3 offset-lg-0">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/kheer.jpg" alt="Kheer" height="150" width="214" />
                        </div>

                        <h3>Kheer</h3>
                        <p class="product-price">₹ 49 </p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/Momos.jpg" alt="Momos" height="150" width="214" />
                        </div>
                        <h3>Momos</h3>
                        <p class="product-price">₹ 169</p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 text-center offset-md-3 offset-lg-0">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/ras-malai.jpg" height="150" width="214" alt="Ras-Malai" />
                        </div>
                        <h3>Ras-Malai</h3>
                        <p class="product-price">₹ 149 </p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center offset-md-3 offset-lg-0">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/rosogulla.jpg" alt="Rosogulla" height="150" width="214" />
                        </div>
                        <h3>Rosogulla</h3>
                        <p class="product-price">₹ 99 </p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/Sandwich.jpg" alt="Sandwich" height="150" width="214" />
                        </div>
                        <h3>Sandwich</h3>
                        <p class="product-price">₹ 99</p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center offset-md-3 offset-lg-0">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="/assets/images/fast-food-removebg-preview.png" height="150" width="214" alt="" />
                        </div>
                        <h3>Burger</h3>
                        <p class="product-price">₹ 99 </p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 text-center offset-md-3 offset-lg-0">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/aloo_paratha.jpg" height="150" width="214" alt="aloo_paratha.jpg" />
                        </div>
                        <h3>Aloo Paratha</h3>
                        <p class="product-price">₹ 49 </p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
                    <div class="single-product-item">
                        <div class="product-image">
                            <img src="../assets/images/Garlic-bread.jpg" alt="Garlic-bread" height="150" width="214" />
                        </div>
                        <h3>Garlic-bread</h3>
                        <p class="product-price">₹ 49</p>
                        <a href="#" class="cart-btn"><i class="fas fa-shopping-cart"></i>Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>             
    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" Runat="Server">
</asp:Content>

