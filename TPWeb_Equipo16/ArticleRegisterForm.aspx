<%@ Page Title="Detalles del artículo" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticleRegisterForm.aspx.cs" Inherits="TPWeb_Equipo16.ArticleRegisterForm" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <h4 class="text-align-center">Detalles del artículo</h4>

    <div class="d-flex justify-content-center">
        <div class="card mb-3" style="max-width: 540px;">
            <div class="row g-0">
                <div class="col-md-4">
                    <div id="carouselExampleIndicators" class="carousel slide">
                        <div class="carousel-inner">
                            <%
                                foreach (Domain.Image image in _article.Images)
                                {
                            %>
                            <div class="carousel-item active">
                                <img src="<%: image.Url%>" class="d-block w-100" alt="...">
                            </div>
                            <%
                                }
                            %>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title"><%:_article.Name%></h5>
                        <p class="card-text"><%:_article.Description.ToString()%></p>
                        <p class="card-text"><small class="text-body-secondary">Categoría: <%:_article.Category.ToString()%></small></p>
                        <p class="card-text"><small class="text-body-secondary">Marca: <%:_article.Brand.ToString()%></small></p>
                        <p class="card-text"><small class="text-body-secondary">Precio$<%:_article.Price%></small></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
