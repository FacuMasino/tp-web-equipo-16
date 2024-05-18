<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWeb_Equipo16.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div class='row row-cols-1 row-cols-md-4 my-4 g-4'>
        <%
            foreach (Article article in Articles)
            {
                string imageUrl = "https://www.kurin.com/wp-content/uploads/placeholder-square.jpg";

                if (0 < article.Images.Count && Helper.IsAccesibleImage(article.Images[0].Url))
                {
                    System.Diagnostics.Debug.Print(article.Images[0].Url);
                    imageUrl = article.Images[0].Url;
                }
        %>
        <div class='col'>
            <div class="card">
                <img src="<%:imageUrl%>" class="card-img-top" alt="...">
                <div class="card-body">
                    <span class="mb-2 text-muted"><%:article.Category.ToString()%></span>
                    <h5 class="card-title fs-6"><%:article.Name%></h5>
                    <p class="card-subtitle mb-2 text-muted fw-bold">$<%:article.Price%></p>
                    <div class='text-end'>
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
