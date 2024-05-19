<%@ Page Title="Detalles del artículo" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticleRegisterForm.aspx.cs" Inherits="TPWeb_Equipo16.ArticleRegisterForm" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <%
        if (0 < _article.Id)
        {
    %>
    <div class="d-flex mt-auto flex-column align-items-center justify-content-center">
        <h4 class="text-align-center">Detalles del artículo</h4>
        <div class="col-7">
            <div class="card mb-3">
                <div class="row g-0">
                    <div class="col-md-4">
                        <div id="carouselExampleIndicators" class="carousel slide h-100">
                            <div class="carousel-inner h-100">
                                <%
                                    string category = _article.Category.ToString() == "" ? "Sin Categoría" : _article.Category.ToString();
                                    foreach (Domain.Image image in _article.Images)
                                    {
                                %>
                                <div class="carousel-item h-100 active">
                                    <img src="<%: image.Url%>" class="object-fit-cover rounded-start d-block" alt="Imagen de <%:_article.Name%>" width="300px" height="100%" onerror="this.src='<%:placeholder%>'">
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            <% if (_article.Images.Count > 1)
                                {
                            %>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                            <%} %>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card-body d-flex flex-column justify-content-between h-100">
                            <div>
                                <p class="mb-0"><small class="text-body-secondary"><%:category%></small></p>
                                <h5 class="card-title mb-0"><%:_article.Name%></h5>
                                <p class="card-text"><small class="text-body-secondary"><%:_article.Brand.ToString()%></small></p>
                                <p class="card-text"><%:_article.Description.ToString()%></p>
                            </div>

                            <p class="card-text text-end fw-bold fs-5">$<%:_article.Price%></p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%
        }
    %>
</asp:Content>
