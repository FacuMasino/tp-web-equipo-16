<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWeb_Equipo16.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div class="row py-5">
        <div class="col-3">
            <ul class="nav flex-column">
                <!-- Filtro de categorías -->
                <li class="nav-item">
                    <a class="nav-link fs-lg text-reset border-bottom mb-6 px-2 fw-500 bg-body-tertiary" data-bs-toggle="collapse" href="#categoriesCollapse" aria-expanded="true">Categorias
                    </a>
                    <div class="collapse show" id="categoriesCollapse">
                        <ul class="list-group py-1 list-group-flush">
                            <!-- Articulos sin filtro -->
                            <li class="list-group-item pb-0 ps-2 border-0">
                                <a href="Default.aspx" class="text-decoration-none text-black">Todas
                                </a>
                            </li>
                            <%
                                foreach (Category category in Categories)
                                {
                            %>
                            <!-- Item Categoría -->
                            <li class="list-group-item pb-0 ps-2 border-0">
                                <a href="Default.aspx?catId=<%:category.Id%>" class="text-decoration-none text-black"><%:category.Description%>
                                </a>
                            </li>
                            <%
                                }
                            %>
                            <!-- Artículos sin categoría -->
                            <li class="list-group-item pb-0 ps-2 border-0">
                                <a href="Default.aspx?catId=-1" class="text-decoration-none text-black">Sin Categoría
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <!-- Filtro de Marcas -->
                <li class="nav-item">
                    <a class="nav-link fs-lg text-reset border-bottom mb-6 px-2 fw-500 bg-body-tertiary" data-bs-toggle="collapse" href="#brandsCollapse" aria-expanded="true">Marcas
                    </a>
                    <div class="collapse" id="brandsCollapse">
                        <ul class="list-group py-1 list-group-flush">
                            <!-- Articulos sin filtro -->
                            <li class="list-group-item pb-0 ps-2 border-0">
                                <a href="Default.aspx" class="text-decoration-none text-black">Todas
                                </a>
                            </li>
                            <%
                                foreach (Brand brand in Brands)
                                {
                            %>
                            <!-- Item Marca -->
                            <li class="list-group-item pb-0 ps-2 border-0">
                                <a href="Default.aspx?brandId=<%:brand.Id%>" class="text-decoration-none text-black"><%:brand.Description%>
                                </a>
                            </li>
                            <%
                                }
                            %>
                            <!-- Artículos sin Marca -->
                            <li class="list-group-item pb-0 ps-2 border-0">
                                <a href="Default.aspx?brandId=-1" class="text-decoration-none text-black">Sin Marca
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <div class="col-9">
            <div class='row row-cols-1 row-cols-md-4 g-4'>
                <%
                    foreach (Article article in Articles)
                    {
                        string imageUrl = "Content/img/placeholder.jpg";
                        string category = article.Category.Description;
                        System.Diagnostics.Debug.Print(article.Name);
                        System.Diagnostics.Debug.Print(article.Category.Description);
                        if (0 < article.Images.Count)
                        {
                            imageUrl = article.Images[0].Url;
                        }
                %>
                <div class='col'>
                    <div class="card h-100">
                        <img src="<%:imageUrl%>" class="card-img-top" alt="Imagen de <%:article.Name%>" onerror="this.src='Content/img/placeholder.jpg'">
                        <div class="card-body d-flex flex-column">
                            <span class="mb-2 text-muted"><%:category.Length==0?"Sin Categoría":category%></span>
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
        </div>
    </div>
</asp:Content>
