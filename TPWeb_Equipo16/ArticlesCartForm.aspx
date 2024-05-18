<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticlesCartForm.aspx.cs" Inherits="TPWeb_Equipo16.ArticlesCartForm" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <%
        if (0 < ArticlesCart.Count())
        {
    %>

    <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-light table-bordered">
        <Columns>
            <asp:BoundField HeaderText="Cantidad" DataField="Amount" />
            <asp:BoundField HeaderText="Nombre" DataField="Name" />
            <asp:BoundField HeaderText="Marca" DataField="Brand" />
            <asp:BoundField HeaderText="Precio" DataField="Price" />
        </Columns>
    </asp:GridView>
    
    <asp:Repeater runat="server" ID="CartRepeater">
        <ItemTemplate>
            <div class="d-flex">
                <asp:Button Text="-" CssClass="btn btn-primary" CommandArgument='<%#Eval("Id")%>' Id="removeButton" OnClick="removeButton_Click" runat="server" />
                <asp:Button Text="+" CssClass="btn btn-primary" CommandArgument='<%#Eval("Id")%>' Id="addButton" OnClick="addButton_Click" runat="server" />
                <asp:Button Text="x" CssClass="btn btn-primary" CommandArgument='<%#Eval("Id")%>' Id="deteleButton" OnClick="deteleButton_Click" runat="server" />
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <%
        }
        else
        {
    %>

    <div class="half-vh column-div">
        <h5 class="text-align-center">Todavía no agregaste ningún artículo a tu carrito...</h5>
        <a href="Default.aspx">¡Elegí los productos que desees desde nuestra tienda!</a>
    </div>


    <%
        }
    %>
</asp:Content>
