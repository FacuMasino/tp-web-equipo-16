<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticleRegisterForm.aspx.cs" Inherits="TPWeb_Equipo16.ArticleRegisterForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <h3>Detalles del artículo</h3>

    <div class="card mb-3" style="max-width: 540px;">
        <div class="row g-0">
            <div class="col-md-4">
                <img src="..." class="img-fluid rounded-start" alt="...">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                  
                    <h5 class="card-title"> <%:_article.Name%></h5>
                    <p class="card-text"> <%:_article.Description.ToString()%></p>
                    <p class="card-text"><small class="text-body-secondary">Categoría: <%:_article.Category.ToString()%></small></p>
                    <p class="card-text"><small class="text-body-secondary">Marca: <%:_article.Brand.ToString()%></small></p>
                    <p class="card-text"><small class="text-body-secondary">Precio$<%:_article.Price%></small></p>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
