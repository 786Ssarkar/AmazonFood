<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Landing.master" AutoEventWireup="true" CodeFile="BuyerRegistration.aspx.cs" Inherits="Pages_Buyer_BuyerRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHeader" runat="Server">
    <link href="/assets/css/tabler-icons.css" rel="stylesheet" />
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

        #divProfile {
            cursor: pointer;
            min-height: 50px;
            height: 120px;
            /*background-color: aqua;*/
            min-width: 50px;
            width: 120px;
            border: 1px solid red;
            border-radius: 50%;
            /*margin-top: -15px;*/
            overflow: hidden;
        }

        #main {
            min-height: 100vh;
            min-width: 100vw;
            background-color: #66767e;
        }

        .buyer {
            margin-top: 120px;
            margin-bottom: 20px;
        }

        .btn-warning {
            color: #212529 !important;
            background-color: #ffc107 !important;
            border-color: #ffc107 !important;
        }

            .btn-warning:hover {
                background-color: #e0a800 !important;
                border-color: #d39e00 !important;
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

        #divAlert {
            position: fixed;
            top: 120px;
            right: 10px;
        }

        .form-control:hover {
            color: #5A6A85;
            background-color: transparent;
            border-color: #aec3ff;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 2px rgba(var(--bs-body-color-rgb), 0.075), 0 0 0 0.25rem rgba(93, 135, 255, 0.25);
            box-shadow: inset 0 1px 2px rgba(var(--bs-body-color-rgb), 0.075), 0 0 0 0.25rem rgba(93, 135, 255, 0.25);
        }

        #txtPassword:focus-visible, #txtCnfPass:focus-visible {
            outline: -webkit-focus-ring-color auto 0px;
        }

        #txtPassword, #txtCnfPass {
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

        #divPassword:focus-within, #divPassword2:focus-within {
            color: #495057;
            background-color: #fff;
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .25);
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">

    <main id="main">
        <div class="row justify-content-center">
            <div class="col-lg-9">
                <div class="card buyer">
                    <div class="card-header">

                        <div class="col-md-12">
                            <div class=" text-light ps-4">
                                <h2>Buyer's Registration</h2>
                                
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row justify-content-center">

                            <div class="ms-auto me-auto w-auto text-center ">

                                <div id="divProfile" onclick="uploadClick()">
                                    <img src="~/assets/images/User_Avatar.png" id="imgPreview" runat="server" class="h-100 w-100" />
                                    <asp:FileUpload runat="server" ID="ProfileUpload" AllowMultiple="false" onchange="loadFile(event)" accept="image/*" hidden="hidden" />
                                    <%-- <asp:RegularExpressionValidator ErrorMessage="errormessage" ControlToValidate="ProfileUpload" runat="server" ValidationExpression="^\w+[.][img]$" />--%>
                                </div>
                                <label class="" for="ProfileUpload">
                                    Upload Profile
                                </label>
                                <asp:Button Text="Upload" runat="server" ID="btnUpload" OnClick="btnUpload_Click" hidden="true" />
                            </div>



                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label for="txtName">Full Name</label><span class="span">*</span>
                                <asp:TextBox runat="server" AutoComplete="off" placeholder="Enter Full Name" ID="txtName" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator ErrorMessage="Only English letters" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="a" ControlToValidate="txtName" runat="server" />
                                <asp:RequiredFieldValidator ErrorMessage="Name is Required" ForeColor="Red" Display="Dynamic" ValidationGroup="a" ControlToValidate="txtName" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <label for="ddlGender">Gender</label><span class="span">*</span>

                                <asp:DropDownList runat="server" ID="ddlGender" CssClass="form-control form-select">
                                    <asp:ListItem Value="">--Select--</asp:ListItem>
                                    <asp:ListItem Value="1">Male</asp:ListItem>
                                    <asp:ListItem Value="2">Female</asp:ListItem>
                                    <asp:ListItem Value="3">Other</asp:ListItem>

                                </asp:DropDownList>
                                <asp:RequiredFieldValidator  ErrorMessage="State is Required" ControlToValidate="ddlGender" ForeColor="Red" Display="Dynamic" ValidationGroup="a" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <label for="txtEmail">Email</label><span class="span">*</span>
                                <asp:TextBox runat="server" AutoComplete="off" ID="txtEmail" placeholder="Enter Email" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Email is Required" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" ValidationGroup="a" runat="server" />
                                <asp:RegularExpressionValidator ErrorMessage="Email Should be Valid" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" ValidationGroup="a" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(?:\.[a-zA-Z]{2,})?$" runat="server" />
                            </div>

                            <div class="col-md-4">

                                <label for="txtMobile">Mobile Number</label><span class="span">*</span>
                                <asp:TextBox runat="server" MaxLength="10" AutoComplete="off" ID="txtMobile" placeholder="Enter Mobile Number" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Phone Number is Required" ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic" ValidationGroup="a" runat="server" />
                                <asp:RegularExpressionValidator ErrorMessage="Enter valid Phone Number" ValidationExpression="^[6-9][0-9]{9}" ForeColor="Red" Display="Dynamic" ValidationGroup="a" ControlToValidate="txtMobile" runat="server" />
                            </div>

                            <div class="col-md-4">
                                <label for="ddlDivision">Division</label><span class="span">*</span>
                                <asp:DropDownList ID="ddlDivision" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDivision_SelectedIndexChanged" CssClass="form-control form-select">
                                    <asp:ListItem Value="">--Select--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator  ErrorMessage="Division is Required" ControlToValidate="ddlDivision" ForeColor="Red" Display="Dynamic" ValidationGroup="a" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <label for="ddlDistrict">District</label><span class="span">*</span>
                                <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control form-select">
                                    <asp:ListItem Value="">--Select--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator  ErrorMessage="District is Required" ForeColor="Red" Display="Dynamic" ValidationGroup="a" ControlToValidate="ddlDistrict" runat="server" />
                            </div>

                            <div class="col-md-4">
                                <label for="txtAddress">Address</label><span class="span">*</span>
                                <asp:TextBox runat="server" AutoComplete="off" ID="txtAddress" TextMode="MultiLine" placeholder="Enter Address" Rows="1" CssClass="form-control autosized"></asp:TextBox>
                                <asp:RequiredFieldValidator ErrorMessage="Address is Required" ForeColor="Red" Display="Dynamic" ValidationGroup="a" ControlToValidate="txtAddress" runat="server" />
                            </div>


                            <div class=" col-md-4 mb-3">
                                <label for="txtPassword" class="form-label">Password<span>*</span></label>
                                <div id="divPassword" class="form-control align-items-center justify-content-between d-flex p-1">
                                    <asp:TextBox runat="server" ID="txtPassword" ClientIDMode="Static" placeholder="Enter password" AutoComplete="off" CssClass="border-0" TextMode="Password" MaxLength="20"></asp:TextBox>

                                    <label onclick='showPassword(lblShow,<%= txtPassword.ClientID %>)' id="lblShow" class=" mt-auto fa fa-eye-slash"></label>

                                </div>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Please Fill Password" ForeColor="Red" Display="Dynamic" ValidationGroup="a"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Invalid Password Format" ForeColor="Red" ValidationExpression="^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{5,20})$" Display="Dynamic" ValidationGroup="a"></asp:RegularExpressionValidator>
                            </div>

                            <div class=" col-md-4 mb-3">
                                <label for="txtCnfPass" class="form-label">Confirm Password<span>*</span></label>
                                <div id="divPassword2" class="form-control align-items-center justify-content-between d-flex p-1">
                                    <asp:TextBox runat="server" ID="txtCnfPass" ClientIDMode="Static" placeholder="Enter password again" AutoComplete="off" CssClass="border-0" TextMode="Password" MaxLength="20"></asp:TextBox>

                                    <label onclick='showPassword(lblShow2,<%= txtCnfPass.ClientID %>)' id="lblShow2" class=" mt-auto fa fa-eye-slash"></label>

                                </div>
                                <asp:CompareValidator ErrorMessage="Password Dosn't Matched" ControlToValidate="txtCnfPass" ForeColor="Red" Display="Dynamic" ValidationGroup="a" runat="server" ControlToCompare="txtPassword"></asp:CompareValidator>
                            </div>
                        </div>


                        <div class="row m-2 text-center">
                            <div class="col-md-12 mt-3">
                                <asp:Button runat="server" class="btn btn-success" ValidationGroup="a" Text="Register" ID="btnReg" OnClick="btnReg_Click" />

                                <asp:Button runat="server" class="btn btn-warning" type="button" Text="Clear" ID="btnClear" OnClick="btnClear_Click" />
                            </div>
                        </div>

                    </div>



                </div>
            </div>
        </div>
    </main>
    <div runat="server" id="divAlert" class="w-25" clientidmode="Static">
    </div>




    <!-- end product section -->


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
        function expandTextarea(id) {
            document.getElementById(id).addEventListener('keyup', function () {
                this.style.overflow = 'hidden';
                this.style.height = 0;
                this.style.height = this.scrollHeight + 'px';
            }, false);
        }

        expandTextarea('<%= txtAddress.ClientID%>');

        function uploadClick() {
            document.getElementById('<%= ProfileUpload.ClientID%>').click();
        }
        function loadFile(event) {
            var Preview = document.getElementById('<%= imgPreview.ClientID %>');
            Preview.src = URL.createObjectURL(event.target.files[0])
            document.getElementById('<%= btnUpload.ClientID %>').click();
        };
    </script>
</asp:Content>
