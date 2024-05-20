<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWeb_Equipo16.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">
    <div class="row py-5">
        <div class="col-3">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <div class="input-group mb-3">
<%--                        <input type="text" class="form-control"  placeholder="Buscar producto" aria-label="Buscar producto" aria-describedby="searchBtn">--%>
                        <%--<button class="btn btn-outline-secondary" type="button" id="searchBtn"><i class="bi bi-search"></i></button>--%>
                        <asp:TextBox CssClass="form-control" ID="searchTextBox" runat="server" Text="" placeholder="Buscar producto"/>
                        <asp:LinkButton Text='<i class="bi bi-search"></i>' ID="searchBtn" CssClass="btn btn-outline-secondary" runat="server" OnClick="searchBtn_Click"/>
                    </div>
                </li>
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
            <%
                if (Articles.Count > 0)
                {
            %>
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
                            <span class="mb-2 text-muted"><%:category.Length == 0 ? "Sin Categoría" : category%></span>
                            <h5 class="card-title fs-6"><%:article.Name%></h5>
                            <p class="card-subtitle mb-2 text-muted fw-bold">$<%:article.Price.ToString("0.00")%></p>
                            <div class='text-end mt-auto'>
                                <a href='<%= "ArticlesCartForm.aspx?id=" + article.Id %>' class="btn fs-5"><i class="bi bi-cart-plus"></i></a>
                                <a href="ArticleRegisterForm.aspx?id=<%:article.Id%>" class="btn fs-5"><i class="bi bi-eye"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        } // Fin foreach
                    }
                    else // Mensaje si no hay artículos que mostrar
                    {
                %>
                <div class="col">
                    <div class="d-flex flex-column align-items-center">
                        <div class="col-6 w-50">
                            <h5 class="text-align-center">Ups! Parece que el artículo que buscas no existe...</h5>
                            <img src="Content/img/Empty-Pana.svg" class="img-fluid object-fit-cover h-50">
                        </div>
                        <div class="col-6 text-center">
                            <p>¡Puedes ver todos los artículos que tenemos para vos!</p>
                            <a href="Default.aspx" class="btn btn-dark text-center" type="button">Ver Artículos</a>
                        </div>
                    </div>
                </div>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
