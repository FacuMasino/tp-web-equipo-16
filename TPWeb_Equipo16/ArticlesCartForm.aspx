<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticlesCartForm.aspx.cs" Inherits="TPWeb_Equipo16.ArticlesCartForm" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div class="d-flex flex-column align-items-center py-4 my-4">
        <%
            if (0 < ArticlesCart.Count())
            {
        %>
        <div class="row gx-4 w-100 px-5 justify-content-center">
            <div class="col-8">
                <%--                <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-light table-bordered">
                    <Columns>
                        <asp:BoundField HeaderText="Cantidad" DataField="Amount" />
                        <asp:BoundField HeaderText="Nombre" DataField="Name" />
                        <asp:BoundField HeaderText="Marca" DataField="Brand" />
                        <asp:BoundField HeaderText="Precio" DataField="Price" />
                    </Columns>
                </asp:GridView>--%>
                <ul class="list-group list-group-lg list-group-flush border-top mb-auto">
                    <asp:Repeater OnItemDataBound="CartRepeater_ItemDataBound" runat="server" ID="CartRepeater">
                        <ItemTemplate>
                            <li class="list-group-item">
                                <div class="row align-items-center">
                                    <div class="col-4">
                                        <a href="ViewArticle.aspx?id=<%#Eval("id")%>">
                                            <img class="img-fluid" id="articleImage" runat="server" onerror="this.src='https://www.kurin.com/wp-content/uploads/placeholder-square.jpg'">
                                        </a>
                                    </div>
                                    <div class="col-8">
                                        <div class="d-flex mb-2 fw-bold">
                                            <a class="text-body text-decoration-none" href="ArticleReg.aspx?id=<%#Eval("id")%>"><%#Eval("brand")%> - <%#Eval("name")%></a>
                                            <span class="text-muted ms-auto">$<%#Eval("price")%></span>

                                        </div>
                                        <p class="text-muted mt-3 mb-2">Subtotal $<%#Eval("subtotal")%></p>
                                        <div class="d-inline-flex align-items-center justify-content-between w-100">
                                            <div class="itemcount bg-body-tertiary">
                                                <asp:LinkButton Text='<i class="bi bi-dash"></i>' CssClass="itemcount-control minus bg-body-tertiary text-decoration-none text-black fs-5 px-2" CommandArgument='<%#Eval("Id")%>' ID="removeLnkButton" OnClick="removeLnkButton_Click" runat="server" />
                                                <input type="number" class="itemcount-control bg-body-tertiary" value="<%#Eval("amount") %>" disabled>
                                                <asp:LinkButton Text='<i class="bi bi-plus"></i>' CssClass="itemcount-control plus bg-body-tertiary text-decoration-none text-black fs-5 px-2" CommandArgument='<%#Eval("Id")%>' ID="addLnkButton" OnClick="addLnkButton_Click" runat="server" />
                                            </div>
                                            <asp:LinkButton Text="X Eliminar" CssClass="text-muted text-decoration-none" CommandArgument='<%#Eval("Id")%>' ID="deleteLnkButton" OnClick="deleteLnkButton_Click" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <%--<div class="d-flex">
                                <asp:Button Text="-" CssClass="itemcount-control minus bg-body-tertiary" CommandArgument='<%#Eval("Id")%>' ID="removeButton" OnClick="removeButton_Click" runat="server" />
                                <asp:Button Text="+" CssClass=itemcount-control minus bg-body-tertiary" CommandArgument='<%#Eval("Id")%>' ID="addButton" OnClick="addButton_Click" runat="server" />
                                <asp:Button Text="x" CssClass="btn btn-primary" CommandArgument='<%#Eval("Id")%>' ID="deteleButton" OnClick="deteleButton_Click" runat="server" />
                            </div>--%>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <div class="col-4">
                <div class="p-4 mb-4 bg-body-tertiary">
                    <ul class="list-group custom-list-group list-group-sm list-group-flush bg-body-tertiary">
                        <li class="list-group-item d-flex px-0 bg-transparent">
                            <span>Subtotal</span> <span class="ms-auto fs-sm">$ <%:ArticlesCart.GetTotal()%></span>
                        </li>
                        <li class="list-group-item d-flex px-0 bg-transparent">
                            <span>Iva 21%</span> <span class="ms-auto fs-sm">$<%:(ArticlesCart.GetTotal() * (decimal)0.21).ToString()%></span>
                        </li>
                        <li class="list-group-item d-flex px-0 fs-lg fw-bold bg-transparent">
                            <span>Total</span> <span class="ms-auto fs-sm">$ <%:(ArticlesCart.GetTotal() * (decimal)1.21).ToString()%></span>
                        </li>
                        <li class="list-group-item fs-sm text-center text-gray-500 bg-transparent">Costos de envío calculados al momento del pago *
                        </li>
                    </ul>
                </div>
                <a class="btn w-100 btn-dark mb-2" href="#">Ir a Pagar</a>
                <a class="mb-2 w-100 d-block text-black" href="Default.aspx">Volver a la tienda</a>
            </div>
        </div>
        <%
            }
            else
            {
        %>


        <div class="col-6">
            <h5 class="text-align-center">Todavía no agregaste ningún artículo a tu carrito...</h5>
            <img src="Content/img/add-to-cart.svg" class="img-fluid object-fit-cover h-75" />
        </div>
        <div class="col-6 text-center">
            <p>¡Elegí los productos que desees desde nuestra tienda!</p>
            <a href="Default.aspx" class="btn btn-primary text-center" type="button">Ir a la tienda</a>
        </div>


        <%

            }
        %>
    </div>
</asp:Content>
