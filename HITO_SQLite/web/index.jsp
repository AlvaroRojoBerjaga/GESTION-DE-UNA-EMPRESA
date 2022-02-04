<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">

        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="paginaDeInicio.jsp" target="contenedor">Inicio</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="verDirectores.jsp" target="contenedor">Directores</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="verOficinas.jsp" target="contenedor">Oficinas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="gestionVendedor.jsp" target="contenedor">Vendedores</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="gestionDeProductos.jsp" target="contenedor">Productos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="gestionClientes.jsp" target="contenedor">Clientes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="gestionPedidos.jsp" target="contenedor">Pedidos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:close()">Salir</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<br>
<div>
    <iframe src = "paginaDeInicio.jsp" scrolling = "auto" name ='contenedor' style="height: 100%; width: 100%; border: none"></iframe>
</div>

