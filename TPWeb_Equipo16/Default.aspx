<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWeb_Equipo16.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div class='row row-cols-1 row-cols-md-4 my-4 g-4'>
        <%
            foreach (Article article in Articles)
            {
                string imageUrl = "Content/img/placeholder.jpg";
                string category = article.Category.ToString();
                category = category.Length == 0 ? "Sin Categoría" : category;
                
                if (0 < article.Images.Count)
                {
                    imageUrl = article.Images[0].Url;
                }
        %>
        <div class='col'>
            <div class="card h-100">
                <img src="<%:imageUrl%>" class="card-img-top" alt="Imagen de <%:article.Name%>" onerror="this.src='Content/img/placeholder.jpg'">
                <div class="card-body d-flex flex-column">
                    <span class="mb-2 text-muted"><%:category%></span>
                    <h5 class="card-title fs-6"><%:article.Name%></h5>
                    <p class="card-subtitle mb-2 text-muted fw-bold">$<%:article.Price%></p>
                    <div class='text-end mt-auto'>
                        <a href='<%= "ArticlesCartForm.aspx?id=" + article.Id %>' class="btn fs-5"><i class="bi bi-cart-plus"></i></a>
                        <a href="ArticleRegisterForm.aspx?id=<%:article.Id%>" class="btn fs-5"><i class="bi bi-eye"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</asp:Content>
