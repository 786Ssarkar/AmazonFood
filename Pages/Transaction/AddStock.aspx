﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Amazon.master" AutoEventWireup="true" CodeFile="AddStock.aspx.cs" Inherits="Transection_AddStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenthead" runat="Server">
    <%--<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">--%>
    <style>
        .card-header {
            margin: 0px;
            width: 100%;
            background-image: url("/assets/images/Header-image.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
        }

        .card {
            /*margin-top:20%!important;*/
            min-width: 300px;
            padding: 0px;
            border-top-left-radius: 40px;
            border-bottom-right-radius: 40px;
            overflow: hidden
        }

        .btn-success {
            color: #fff !important;
            background-color: #28a745 !important;
            border-color: #28a745 !important;
        }

        .btn-warning:hover {
            background-color: #e0a800 !important;
            border-color: #d39e00 !important;
        }

        h2 {
            color: white;
        }

        label {
            display: inline-block;
            font-weight: bolder;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody"
    runat="Server">
    <div class="container-fluid">
        <div runat="server" id="divAlert" clientidmode="Static">
        </div>
        <%-- <div class="container-fluid justify-content-center ">--%>
        <div class="card ">

            <div class="card-header">
                <div class="col-md-12">
                    <div class=" text-light ps-4">
                        <h2>Add Stock </h2>
                    </div>
                </div>
            </div>

            <div class="card-body">
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label>Item</label>
                        <span style="color: red">*</span>
                        <asp:DropDownList runat="server" ID="ddlItem" CssClass="form-control rounded-3  form-select">
                            <asp:ListItem Value="">--Select--</asp:ListItem>

                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlItem" ErrorMessage="Please select Item" ForeColor="Red" Display="Dynamic" ValidationGroup="a"> </asp:RequiredFieldValidator>

                    </div>
                    <div class="col-md-3 mb-3">
                        <label>Purchase Amount</label>
                        <span style="color: red">*</span>
                        <asp:TextBox runat="server" ID="txtPurchaseAmount" CssClass="form-control" placeholder="Enter  Purchase Amount" AutoComplete="off"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPurchaseAmount" ErrorMessage="Please Enter Purchase Amount" ForeColor="Red" Display="Dynamic" ValidationGroup="a"> </asp:RequiredFieldValidator>
                        <asp:RangeValidator runat="server" ControlToValidate="txtPurchaseAmount" ErrorMessage="Amount Should be in Range of 10 to  1000" ForeColor="Red" Display="Dynamic" ValidationGroup="a" MinimumValue="10" MaximumValue="1000" Type="Currency" />
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>Quantity</label>
                        <span style="color: red">*</span>
                        <asp:TextBox runat="server" ID="txtQuantity" CssClass="form-control" placeholder="Enter Quantity" AutoComplete="off"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtQuantity" ErrorMessage="Please Enter Quantity" ForeColor="Red" Display="Dynamic" ValidationGroup="a"> </asp:RequiredFieldValidator>
                        <asp:RangeValidator runat="server" ControlToValidate="txtQuantity" ErrorMessage="Quantity Should be in Range of 1 to  10000" ForeColor="Red" Display="Dynamic" ValidationGroup="a" MinimumValue="1" MaximumValue="10000" Type="Integer" />
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>Total Amount</label>
                        <asp:TextBox runat="server" ID="txtTotalAmount" ReadOnly="true" CssClass="form-control" disabled="true" placeholder="Total Amount" AutoComplete="off"></asp:TextBox>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-5 text-center">
                        <asp:Button runat="server" CausesValidation="true" ValidationGroup="a" ID="BtnAddStock" Text="ADD" BorderStyle="Solid" type="button" class=" btn btn-success btn-rounded"  OnClick="BtnAddStock_Click"/>
                        <a href="AddStock.aspx" class="btn btn-warning  btn-rounded">Clear</a>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-12">
                        <asp:GridView runat="server" ID="grdItems" AutoGenerateColumns="true" CssClass="table table-responsive">

                        </asp:GridView>
                    </div>
                    <div class="col-12 text-center">
                       <asp:Button Text="Save All" runat="server" ID="btnSaveAll" OnClick="btnSaveAll_Click" CssClass=" btn btn-success btn-rounded" Visible="false" />
                    </div>

                </div>
                <div class="row mt-4">
                    <div class="col">
                        <asp:GridView runat="server" ID="grdTotalStocks" CssClass="table table-responsive">
                            

                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
    <script>
        function getTotal(inputArray) {
            // Loop through inputArray to get values and multiply
            let total = 1;
            for (let i = 0; i < inputArray.length; i++) {
                const number = parseFloat(inputArray[i]);
                if (isNaN(number) || number === 0) {
                    return null;
                }
                total *= number;
            }
            return total;
        }
        document.getElementById('<%= txtQuantity.ClientID %>').addEventListener('input', updateTotal);
        document.getElementById('<%=txtPurchaseAmount.ClientID%>').addEventListener('input', updateTotal);

      
        function updateTotal() {
            if (document.getElementById('<%= txtQuantity.ClientID %>').value > 0 && document.getElementById('<%=txtPurchaseAmount.ClientID%>').value>9 ) {

            document.getElementById('<%= txtTotalAmount.ClientID %>').value = getTotal([document.getElementById('<%= txtQuantity.ClientID %>').value, document.getElementById('<%=txtPurchaseAmount.ClientID%>').value]);
            } else {
                document.getElementById('<%= txtTotalAmount.ClientID %>').value = null;
            }
           
        }
    </script>
  
</asp:Content>

