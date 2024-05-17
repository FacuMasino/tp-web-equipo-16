<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticlesCartForm.aspx.cs" Inherits="TPWeb_Equipo16.ArticlesCartForm" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <%
        if (0 < ArticlesCart.Count())
        {
    %>

    <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-light table-bordered">
        <Columns>
            <asp:BoundField HeaderText="Cantidad" DataField="Amount"/>
            <asp:BoundField HeaderText="Nombre" DataField="Name"/>
        </Columns>
    </asp:GridView>

    <%
        }
        else
        {
    %>

    <h5>Todavía no agregaste ningún artículo a tu carrito...</h5>
    <a href="Default.aspx">¡Elegí los productos que desees desde nuestra tienda!</a>

    <%
        }
    %>
</asp:Content>
