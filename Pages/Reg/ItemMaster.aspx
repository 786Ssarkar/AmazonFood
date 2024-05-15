<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Amazon.master" AutoEventWireup="true" CodeFile="ItemMaster.aspx.cs" Inherits="Item_Management_ItemMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenthead" runat="Server">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
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
        label {
            display: inline-block;
            font-weight: bolder;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <div class="container-fluid">
        <div runat="server" id="divAlert" clientidmode="Static">
        </div>
      <%--  <div class="h2">
            Item Management
        </div>--%>
        <div class="card ">
            <div class="card-header">

                <div class="col-md-12">
                    <div class=" text-light ps-4">
                        <h3>Item Master</h3>
                    </div>
                </div>
            </div>

            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <label for="ddlItemType">
                            Item Type
                        </label>
                        <asp:DropDownList runat="server" ID="ddlItemType" CssClass="form-control ">
                            <asp:ListItem Value="">--Select--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ErrorMessage="Type Name is Required" ControlToValidate="ddlItemType" ForeColor="Red" Display="Dynamic" ValidationGroup="a" runat="server" />
                    </div>
                    <div class="col-md-4 ">
                        <label for="txtItemName">
                            Item Name
                        </label>
                        <asp:TextBox runat="server" ID="txtItemName" placeholder="Enter Item Name" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                        <asp:RegularExpressionValidator ErrorMessage="Only English letters" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]{3,30}$" ValidationGroup="a" ControlToValidate="txtItemName" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="Item Name is Required" ForeColor="Red" Display="Dynamic" ValidationGroup="a" ControlToValidate="txtItemName" runat="server" />
                    </div>
                    <%-- <div class="col-md-4 ">
                        <label for="txtItemCode">
                            Item Code
                        </label>
                        <asp:TextBox runat="server" ID="txtItemCode" placeholder="Enter Item Code" CssClass="form-control" AutoComplete="off"></asp:TextBox>
                        <asp:RegularExpressionValidator ErrorMessage="Invalid" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z]{3,30}$" ValidationGroup="a" ControlToValidate="txtItemNme" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="Item Code is Required" ForeColor="Red" Display="Dynamic" ValidationGroup="a" ControlToValidate="txtItemNme" runat="server" />
                    </div>--%>
                    <div class="col-md-4 mt-4">
                        <asp:Button runat="server" CssClass="btn btn-success" Text="Add" ID="btnAdd" OnClick="btnAdd_Click" />
                        <a class=" btn btn-warning" role="button" href="ItemMaster.aspx">Clear</a>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-12 overflow-auto">
                        <asp:GridView runat="server" ID="grdItems" AutoGenerateColumns="false" CssClass="table table-responsive">
                            <Columns>
                                <asp:TemplateField HeaderText="S. No.">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Container.DataItemIndex+1 %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item  Name">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("ItemName") %>' runat="server" ID="lblItemName" />
                                        <asp:Label Text='<%# Eval("ItemId ") %>' runat="server" Visible="false" ID="lblItemId" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item Code">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("ItemCode") %>' runat="server" ID="lblItemCode" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Type Name">                                                                          
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("ItemTypeName") %>' runat="server" ID="lblItemTypeName" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("IsActive") %>' runat="server" ID="lblIsActive" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User Name">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("UserName") %>' runat="server" ID="lblUserName" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Created On">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("CreatedOn") %>' runat="server" ID="lblCreatedOn" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Created By Ip">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("CreatedByIp") %>' runat="server" ID="lblCreatedByIp" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
</asp:Content>

