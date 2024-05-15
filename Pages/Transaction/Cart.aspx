<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Amazon.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Pages_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenthead" runat="Server">

    <style>
        /*img {
         width: 200px;
         height: 200px;
     }*/
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">

    <div class="container-lg">



        <div>
            <h1>Shopping Cart</h1>

            <asp:Repeater runat="server" ID="rpt">
                <ItemTemplate>

                    <div class="card rounded-3 mb-4">
                        <div class="card-body p-4">
                            <div class="row d-flex justify-content-between align-items-center">
                                <div class="col-md-2 col-lg-2 col-xl-2">
                                    <img
                                        src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                                        class="img-fluid rounded-3" alt="Cotton T-shirt">
                                </div>
                                <div class="col-md-3 col-lg-3 col-xl-3">
                                    <asp:Label CssClass="lead fw-normal mb-2" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                                    <p><span class="text-muted">Size: </span>M <span class="text-muted">Color: </span>Grey</p>
                                </div>
                                <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                    <button type="button" onclick="decreaseQuantity(1)">-</button>
                                    <span id="quantity_2">1</span>
                                    <button type="button" onclick="increaseQuantity(1)">+</button></label>
                                </div>
                                <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                    <asp:Label Text='<%# Eval("ItemPrice") %>' runat="server" CssClass="mb-0"> </asp:Label>
                                </div>
                                <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                    <a href="#!" class="text-danger"><i class="fas fa-trash fa-lg"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>


                </ItemTemplate>
            </asp:Repeater>



            <div class="card">
                <div class="card-body">
                    <button type="button" data-mdb-button-init="" data-mdb-ripple-init="" class="btn btn-warning btn-block btn-lg">Proceed to Pay</button>
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
            </script>

            <%-- <section class="h-100" style="background-color: #eee;">
                <div class="container h-100 py-5">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-10">

                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h3 class="fw-normal mb-0 text-black">Shopping Cart</h3>

                            </div>

                            <div class="card rounded-3 mb-4">
                                <div class="card-body p-4">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img
                                                src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                                                class="img-fluid rounded-3" alt="Cotton T-shirt">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <p class="lead fw-normal mb-2">Basic T-shirt</p>
                                            <p><span class="text-muted">Size: </span>M <span class="text-muted">Color: </span>Grey</p>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                            <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                <i class="fas fa-minus"></i>
                                            </button>

                                            <input id="form1" min="0" name="quantity" value="2" type="number"
                                                class="form-control form-control-sm" />

                                            <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h5 class="mb-0">$499.00</h5>
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                            <a href="#!" class="text-danger"><i class="fas fa-trash fa-lg"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>



                             <div class="card mb-4">
                                <div class="card-body p-4 d-flex flex-row">
                                    <div data-mdb-input-init class="form-outline flex-fill">
                                        <input type="text" id="form1" class="form-control form-control-lg" />
                                        <label class="form-label" for="form1">Discound code</label>
                                    </div>
                                    <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-warning btn-lg ms-3">Apply</button>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-warning btn-block btn-lg">Proceed to Pay</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>--%>


            <%--  <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="100" Height="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ItemName" HeaderText="Item" />
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Button ID="btnDecrease" runat="server" Text="-" OnClick="btnDecrease_Click" />
                            <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>' />
                            <asp:Button ID="btnIncrease" runat="server" Text="+" OnClick="btnIncrease_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:TemplateField HeaderText="Remove">
                        <ItemTemplate>
                            <asp:Button ID="btnRemove" runat="server" Text="Remove" OnClick="btnRemove_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>--%>
            <p>Total: ₹<asp:Label ID="TotalLabel" runat="server" Text=""></asp:Label></p>
            <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
</asp:Content>

