<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Amazon.master" AutoEventWireup="true" CodeFile="Default2 - Copy.aspx.cs" Inherits="Pages_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenthead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <div class="card">

        <div class="card-header pt-5 px-5">
            <h1>Ingredients Quantity
            </h1>
        </div>
        <div class="card-body p-5">
            <div class=" row">
                <div class="col-md-3">
                    <label>Category<span class="text-danger">*</span></label>
                    <asp:DropDownList runat="server" ID="ddlCategory" CssClass="form-select">
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label>Sub Category<span class="text-danger">*</span></label>
                    <asp:DropDownList runat="server" ID="ddlSubCategory" CssClass="form-select" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                </div>

            </div>

            <div class=" row" runat="server" id="DvIngredients" visible="false">
                <div class="col-md-12">
                    <hr />
                    <h4>Ingredients</h4>
                </div>
                <div class="col-md-12 h-100">
                    <asp:GridView runat="server" ID="grdMAinData" CssClass="table" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="Ingredients">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("Ingredients") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity in %">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("Formula") %>' ID="lblPrevFormula" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="New Quantity">
                                <ItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Eval("Formula") %>' ID="txtFormula" CssClass="form-control" />

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Material Cost" Visible="true">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("Material Cost") %>' ID="lblCost" />

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PROTIEN" Visible="true">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("PROTIEN") %>' runat="server" ID="lblPROTIEN" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CALORIES" Visible="true">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("CALORIES") %>' runat="server" ID="lblCALORIES" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>
                </div>
                <div class="col-md-12 p-3">
                    <asp:Button Text="Calculate" runat="server" OnClick="Unnamed_Click" CssClass="btn btn-primary" />
                   
                </div>
                <div class="col-md-12">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Value of </th>
                            <th>Previous Data</th>
                            <th>New Data</th>
                        </tr>

                        </thead>
                        <tbody>
                        <tr>
                            <td>Price Escalation</td>
                            <td><asp:Label runat="server" ID="lblPrevEscalation"></asp:Label></td>
                            <td><asp:Label runat="server" ID="lblTotelEscalation"></asp:Label></td>
                      
                        </tr>
                        <tr>
                            <td>Total Cost</td>
                            <td>
                                <asp:Label runat="server" ID="lblPrevCost"></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTotalCost"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Total Calories </td>
                            <td>
                                <asp:Label runat="server" ID="lblPrevCALORIES"></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTotalCALORIES"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Total Protien</td>
                            <td>
                                <asp:Label runat="server" ID="lblPrevPROTIEN"></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTotalPROTIEN"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Total % </td>
                            <td>
                                <asp:Label runat="server" ID="lblPrevPrs"></asp:Label></td>
                            <td>
                                <asp:Label runat="server" ID="lblTotalPrs"></asp:Label></td>
                        </tr>
                        </tbody>
                    </table>
                    <hr />

                </div>
            </div>


        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
</asp:Content>
