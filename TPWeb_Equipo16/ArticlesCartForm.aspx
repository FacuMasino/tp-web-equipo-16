<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticlesCartForm.aspx.cs" Inherits="TPWeb_Equipo16.ArticlesCartForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <%
        if (0 < ArticlesCart.Count())
        {
    %>
    <h5>aca va la logica para cargar en el carrito</h5>
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
