<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticleRegisterForm.aspx.cs" Inherits="TPWeb_Equipo16.ArticleRegisterForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <h3>Detalles del artículo</h3>



        <div class="card-body">
  
            <span class="mb-2 text-muted">Codigo: <%:_article.Code.ToString()%></span>
            <br />
            <span class="mb-2 text-muted">Nombre: <%:_article.Name%></span>
            <br />
            <span class="mb-2 text-muted">Categoría: <%:_article.Category.ToString()%></span>
            <br />
            <span class="mb-2 text-muted">Marca: <%:_article.Brand.ToString()%></span>
            <br />

            <span class="mb-2 text-muted">Descripción: <%:_article.Description.ToString()%></span><br />
            <span class="mb-2 text-muted">Precio$<%:_article.Price%></span>



        </div>



</asp:Content>
