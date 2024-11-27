<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<link rel="shortcut icon" type="imagex/png" href="resources/images/Logo-Fintech.ico">
<nav class="navbar navbar-dark navbar-expand-lg bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">FINTECH</a>
        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div
                class="collapse navbar-collapse"
                id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link"
                       href="despesas?acao=listar">Despesas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"
                       href="receitas?acao=listar">Receitas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"
                       href="investimentos?acao=listar">Investimentos</a>
                </li>
            </ul>
            <c:if test="${empty user }">
               <span class="navbar-text text-danger" style="margin-right:10px">
                       ${erro }
               </span>
                <form class="form-inline my-lg-0" action="login" method="post">
                    <div class="row">
                        <div class="col">
                            <input
                                    class="form-control mr-sm-2"
                                    type="text"
                                    name="email"
                                    placeholder="E-mail">
                        </div>
                        <div class="col">
                            <input
                                    class="form-control mr-sm-2"
                                    type="password"
                                    name="senha"
                                    placeholder="Senha">
                        </div>
                        <div class="col">
                            <button class="btn btn-outline-success my-2 my-sm-0"
                                    type="submit">Entrar
                            </button>
                        </div>
                    </div>
                </form>
            </c:if>
            <c:if test="${not empty user }">
               <span class="navbar-text">
                   ${user }
                   <a href="login" class="btn btn-outline-primary my-2 my-sm-0">Sair</a>
               </span>
            </c:if>
        </div>
    </div>
</nav>