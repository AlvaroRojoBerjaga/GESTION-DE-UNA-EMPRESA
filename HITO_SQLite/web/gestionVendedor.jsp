<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="misrc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    body{
        text-align: center;
    }
    #listado{
        margin-left: 20%;
        margin-right:  20%;
    }
    .formulario{
        margin-left: 40%;
        margin-right: 40%;
    }
</style>
<div id="seccion">
    <h2>Gestión de los vendedores</h2><br>

    <%
        //String rutaAbsoluta = "C:\\sqlite\\hito";
        File f = new File("data/hito");
        String rutaAbsoluta = f.getAbsolutePath();
        ConexionSqlite cs = new ConexionSqlite(true, rutaAbsoluta);
        Connection conexion = cs.getConexion();
        OperacionesCrud crud = new OperacionesCrud(conexion);

        if (conexion != null) {
    %>
    <div id="listado">
        <table class="table">

            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">IdVendedor</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Edad</th>
                    <th scope="col">IdOficina</th>
                    <th scope="col">Titulo</th>
                    <th scope="col">Contrato</th>
                    <th scope="col">Couta</th>
                    <th scope="col">Ventas</th>
                    <th scope="col">IdVendedorJefe</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Vendedor> vendedores_al = crud.obtenerTodosLosVendedores();

                    for (int i = 0; i < vendedores_al.size(); i++) {
                        Vendedor v = vendedores_al.get(i);
                %>
                <tr>
                    <td><%=i + 1%></td>
                    <td><%=v.getIdVendedor()%></td>
                    <td><%=v.getNombre()%></td>
                    <td><%=v.getEdad()%></td>
                    <td><%=v.getIdOficina()%></td>
                    <td><%=v.getTitulo()%></td>
                    <td><%=v.getContrato()%></td>    
                    <td><%=v.getCouta()%></td>
                    <td><%=v.getVentas()%></td>
                    <td><%=v.getIdVendedorJefe()%></td>
                </tr>
                <%
                    }

                %>             
            </tbody>
        </table>
    </div>
    <p>
    <form>
        <input type="submit" name="accion1" value="Añadir">
        <input type="submit" name="accion2" value="Editar">
        <input type="submit" name="accion3" value="Eliminar">
    </form>
</p>
<%} else {
        out.println("NO HAY CONEXION CON LA BASE DE DATOS");
    }

%>
</div>








<%    if (request.getParameter("accion1") != null) {
%>
<div class="formulario">
    <h3>Añadir vendedor</h3>
    <form>

        <pre><p>id        <input type="number" name="txtIdVendedor" required=""></p></pre>
        <pre><p>Nombre    <input type="text" name="txtNombre" required=""></p></pre>
        <pre><p>Edad      <input type="number" name="txtEdad" required=""></p></pre>
        <p>idOficina: 
            <select name="txtOficina">
                <%
                    List<Oficina> oficinas_al = crud.obtenerTodosLasOficinas();
                    for (int x = 0; x < oficinas_al.size(); x++) {
                        Oficina o = oficinas_al.get(x);

                %>
                <option value="<%=o.getIdOficina()%>"><%=o.getIdOficina()%></option>
                <%
                    }
                %>
            </select>
        </p>
        <pre><p>Titulo    <input type="text" name="txtTitulo" required=""></p></pre>
        <pre><p>Contrato      <input type="date" name="txtContrato" required=""></p></pre>
        <p>idVendedorJefe:  <select name="txtIdVendedorJefe">
                <%
                    List<Director> director_al = crud.obtenerTodosLosDirectores();
                    for (int y = 0; y < director_al.size(); y++) {
                        Director d = director_al.get(y);

                %>
                <option value="<%=d.getIdDirector()%>"><%=d.getIdDirector()%></option>
                <%
                    }
                %>
            </select>
        </p>
        <pre><p>Couta     <input type="number" step="0.01" name="txtCuota" required=""></p></pre>
        <pre><p>Ventas    <input type="number" step="0.01" name="txtVenta" required=""></p></pre>
        <input type="submit" name="accion4" value="Crear">
    </form>
</div>
<%
    }
%>



<%
    if (request.getParameter("accion2") != null) {
%>
<div class="formulario">
    <h3>Editar vendedor</h3>
    <form>

        <p>idVendedor:  <select name="txtIdVendedor">
                <%
                    List<Vendedor> vendedores_al = crud.obtenerTodosLosVendedores();
                    for (int y = 0; y < vendedores_al.size(); y++) {
                        Vendedor v = vendedores_al.get(y);

                %>
                <option value="<%=v.getIdVendedor()%>"><%=v.getIdVendedor()%></option>
                <%
                    }
                %>
            </select>
        </p>
        <input type="submit" name="accion5" value="Buscar">
    </form>
</div>
<%
    }
%>
<%
    if (request.getParameter("accion3") != null) {
%>
<div class="formulario">
    <h3>Eliminar vendedor</h3>
    <form>

        <p>idVendedor:  <select name="txtIdVendedor">
                <%
                    List<Vendedor> vendedores_al = crud.obtenerTodosLosVendedores();
                    for (int y = 0; y < vendedores_al.size(); y++) {
                        Vendedor v = vendedores_al.get(y);

                %>
                <option value="<%=v.getIdVendedor()%>"><%=v.getIdVendedor()%></option>
                <%
                    }
                %>
            </select>
        </p>
        <input type="submit" name="accion6" value="Borrar">
    </form>
</div>
<%
    }
%>

<%
    if (request.getParameter("accion4") != null) {

        int idVendedor = Integer.parseInt(request.getParameter("txtIdVendedor"));
        String nombre = request.getParameter("txtNombre");
        int edad = Integer.parseInt(request.getParameter("txtEdad"));
        int idOficina = Integer.parseInt(request.getParameter("txtOficina"));
        String titulo = request.getParameter("txtTitulo");
        String contrato = request.getParameter("txtContrato");
        int idVendedorJefe = Integer.parseInt(request.getParameter("txtIdVendedorJefe"));
        Double cuota = Double.parseDouble(request.getParameter("txtCuota"));
        Double ventas = Double.parseDouble(request.getParameter("txtVenta"));

        if ((idVendedor > 0) && (edad > 0 && edad < 100) && (cuota > 0) && (ventas > 0)) {

            Vendedor v = new Vendedor(idVendedor, nombre, edad, idOficina, titulo, contrato, cuota, ventas, idVendedorJefe);

            if (crud.insertarVendedor(v)) {
                out.println("<h3>Creado con éxito</h3>");
            } else {
                out.println("<h3>Error al crear: Dato inválido o ID de vendedor ocupado</h3>");
            }

        } else {
            out.println("<h3>Has introducido algún dato inválido</h3>");
        }
    }
%>

<%
    if (request.getParameter("accion5") != null) {
        Vendedor v = null;
        int idVendedor = Integer.parseInt(request.getParameter("txtIdVendedor"));
        List<Vendedor> vendedores_al = crud.obtenerTodosLosVendedores();
        for (int i = 0; i < vendedores_al.size(); i++) {
            if (vendedores_al.get(i).getIdVendedor() == idVendedor) {
                v = vendedores_al.get(i);
                break;
            }
        }
%>
<div class="formulario">
    <h3>Editar vendedor</h3>
    <form>

        <pre><p>id        <input type="number" name="txtIdVendedor" value="<%=v.getIdVendedor()%>" required="" readonly></p></pre>
        <pre><p>Nombre    <input type="text" name="txtNombre" value="<%=v.getNombre()%>" required=""></p></pre>
        <pre><p>Edad      <input type="number" name="txtEdad" required="" value="<%=v.getEdad()%>"></p></pre>
        <p>idOficina: 
            <select name="txtOficina">
                <%
                    List<Oficina> oficinas_al = crud.obtenerTodosLasOficinas();
                    for (int x = 0; x < oficinas_al.size(); x++) {
                        Oficina o = oficinas_al.get(x);

                %>
                <option value="<%=o.getIdOficina()%>"><%=o.getIdOficina()%></option>
                <%
                    }
                %>
            </select>
        </p>
        <pre><p>Titulo    <input type="text" name="txtTitulo" value="<%=v.getTitulo()%>" required=""></p></pre>
        <pre><p>Contrato      <input type="date" name="txtContrato" value="<%=v.getContrato()%>" required=""></p></pre>
        <p>idVendedorJefe:  <select name="txtIdVendedorJefe">
                <%
                    List<Director> director_al = crud.obtenerTodosLosDirectores();
                    for (int y = 0; y < director_al.size(); y++) {
                        Director d = director_al.get(y);

                %>
                <option value="<%=d.getIdDirector()%>"><%=d.getIdDirector()%></option>
                <%
                    }
                %>
            </select>
        </p>
        <pre><p>Couta     <input type="number" step="0.01" name="txtCuota" required="" value="<%=v.getCouta()%>"></p></pre>
        <pre><p>Ventas    <input type="number" step="0.01" name="txtVenta" required="" value="<%=v.getVentas()%>"></p></pre>
        <input type="submit" name="accion7" value="Actualizar">
    </form>
</div>
<%
    }
%>

<%
    if (request.getParameter("accion7") != null) {

        int idVendedor = Integer.parseInt(request.getParameter("txtIdVendedor").trim());
        String nombre = request.getParameter("txtNombre");
        int edad = Integer.parseInt(request.getParameter("txtEdad"));
        int idOficina = Integer.parseInt(request.getParameter("txtOficina").trim());
        String titulo = request.getParameter("txtTitulo");
        String contrato = request.getParameter("txtContrato");
        int idVendedorJefe = Integer.parseInt(request.getParameter("txtIdVendedorJefe").trim());
        Double cuota = Double.parseDouble(request.getParameter("txtCuota"));
        Double ventas = Double.parseDouble(request.getParameter("txtVenta"));

        if ((idVendedor > 0) && (edad > 0 && edad < 100) && (cuota > 0) && (ventas > 0)) {

            Vendedor v = new Vendedor(idVendedor, nombre, edad, idOficina, titulo, contrato, cuota, ventas, idVendedorJefe);

            if (crud.editarVendedor(v)) {
                out.println("<h3>Actualizado con éxito</h3>");
            } else {
                out.println("<h3>Error al actualizar</h3>");
            }

        } else {
            out.println("<h3>Has introducido algún dato inválido</h3>");
        }
    }
%>
    
<%
    if (request.getParameter("accion6") != null) {

        int idVendedor = Integer.parseInt(request.getParameter("txtIdVendedor"));

        if (crud.eliminarVendedor(idVendedor)) {
            out.println("<h3>BORRADO CON ÉXITO</h3>");
        } else {
            out.println("<h3>ERROR AL ELIMINAR</h3>");
        }

    }
%>
  