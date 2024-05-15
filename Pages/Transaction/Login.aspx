<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Landing.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHeader" runat="Server">
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
            overflow: hidden;
            box-shadow: inset -1px 1rem 4rem 9px rgb(18 38 63 / 68%) !important;
        }

        .span {
            color: red;
        }

        h2 {
            color: white;
        }

        /*#divProfile {
            cursor: pointer;
            min-height: 50px;
            height: 120px;*/
        /*background-color: aqua;*/
        /*min-width: 50px;
            width: 120px;
            border: 1px solid red;
            border-radius: 50%;*/
        /*margin-top: -15px;*/
        /*overflow: hidden;
        }*/

        #main {
            min-height: 100vh;
            min-width: 100vw;
            background-color: #66767e;
        }

        .Login {
            margin-top: 120px;
            margin-bottom: 20px;
        }

        /* .btn-warning {
            color: #212529 !important;
            background-color: #ffc107 !important;
            border-color: #ffc107 !important;
        }

            .btn-warning:hover {
                background-color: #e0a800 !important;
                border-color: #d39e00 !important;
            }*/

        .btn-success {
            color: #fff !important;
            background-color: #28a745 !important;
            border-color: #28a745 !important;
        }

        #txtPassword:focus-visible {
            outline: -webkit-focus-ring-color auto 0px;
        }

        #txtPassword {
            display: block;
            width: 100%;
            padding: 0px 16px;
            line-height: 1.5;
            color: #5A6A85;
            background-color: transparent;
            background-clip: padding-box;
            border: var(--bs-border-width) solid #00000000;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border-radius: 0px;
            -webkit-box-shadow: inset 0 1px 2px rgba(var(--bs-body-color-rgb), 0.075);
            box-shadow: inset 0 1px 2px rgba(var(--bs-body-color-rgb), 0.075);
            -webkit-transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
            transition: border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
        }

        #divPassword:focus-within {
            color: #495057;
            background-color: #fff;
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .25);
        }
        /*
        .btn-warning:hover {
            background-color: #e0a800 !important;
            border-color: #d39e00 !important;
        }*/

        #divAlert {
            position: fixed;
            top: 120px;
            right: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">

    <div runat="server" id="divAlert" class="w-25" clientidmode="Static">
    </div>
    <main id="main" class="row  align-items-center justify-content-center">

        <div class="col-lg-4 ">
            <div class="card container-fluid Login">
                <div class="card-header">

                    <div class="col-md-12">
                        <div class=" text-light ps-4">
                            <h2>Login</h2>
                        </div>
                    </div>
                </div>
                <div class="card-body px-5">
                    <div class="row">
                        <div class="col-md-12">
                            <label for="txtUsername">User Name<span class="span">*</span></label>
                            <asp:TextBox runat="server" MaxLength="10" AutoComplete="off" ID="txtUsername" placeholder="Enter User Name" CssClass="form-control"></asp:TextBox>

                            <asp:RequiredFieldValidator ErrorMessage="User Name is Required" ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic" ValidationGroup="a" runat="server" />
                            <asp:RegularExpressionValidator ErrorMessage="Enter valid User Name" ValidationExpression="^[6-9][0-9]{9}" ForeColor="Red" Display="Dynamic" ValidationGroup="a" ControlToValidate="txtUsername" runat="server" />

                        </div>
                        <div class="col-md-12">
                            <label for="txtPassword" class="form-label">Password<span class="span">*</span></label>
                            <div id="divPassword" class="form-control align-items-center justify-content-between d-flex p-1">
                                <asp:TextBox runat="server" ID="txtPassword" ClientIDMode="Static" placeholder="Enter password" AutoComplete="off" CssClass="border-0" TextMode="Password" MaxLength="20"></asp:TextBox>

                                <label onclick='showPassword(lblShow,<%= txtPassword.ClientID %>)' id="lblShow" class=" mt-auto fa fa-eye-slash"></label>

                            </div>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is Required" ForeColor="Red" Display="Dynamic" ValidationGroup="a"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Invalid Password Format " ForeColor="Red" ValidationExpression="^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{5,20})$" Display="Dynamic" ValidationGroup="a"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="row m-2 text-center">
                        <div class="col-md-12 mt-3">
                            <asp:Button runat="server" class="btn btn-success" ValidationGroup="a" Text="Login" ID="btnLogin" OnClick="btnLogin_Click" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </main>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
    <script>
        function showPassword(lableId, inputid) {

            if (inputid.type === "password") {
                inputid.type = "text";
                lableId.className = "mt-auto  fa fa-eye";

            } else {
                inputid.type = "password";
                lableId.className = "mt-auto  fa fa-eye-slash";


            }

        }
    </script>

</asp:Content>

