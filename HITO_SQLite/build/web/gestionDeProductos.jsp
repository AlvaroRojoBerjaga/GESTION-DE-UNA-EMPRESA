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
    <h2>Gestión de los productos</h2><br>
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
                    <th scope="col">IdFabrica</th>
                    <th scope="col">IdProducto</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Precio</th>
                    <th scope="col">Existencia</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Producto> productos_al = crud.obtenerTodosLosProductos();

                    for (int i = 0; i < productos_al.size(); i++) {
                        Producto p = productos_al.get(i);
                %>
                <tr>
                    <td><%=i + 1%></td>
                    <td><%=p.getIdFabrica()%></td>
                    <td><%=p.getIdProducto()%></td>
                    <td><%=p.getDescripcion()%></td>
                    <td><%=p.getPrecio()%></td>
                    <td><%=p.getExistencia()%></td>
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
    <h3>Añadir producto</h3>
    <form>

        <p>idFabrica:     <select name="txtIdFabrica" >
                    <%
                        List<Producto> productos_al = crud.obtenerTodosLosProductos();
                        for (int x = 0; x < productos_al.size(); x++) {
                            Producto p = productos_al.get(x);

                    %>
                <option value="<%=p.getIdFabrica()%>"><%=p.getIdFabrica()%></option>
                    <%
                        }
                    %>
            </select>
        </p>
        <input type="submit" name="accion4" value="Continuar">
    </form>
</div>
<%
    }
%>

<%
    if (request.getParameter("accion4") != null) {
        String idFabrica = request.getParameter("txtIdFabrica");
%>
<div class="formulario">
    <h3>Añadir producto</h3>
    <form>

        <pre><p>idFabrica    <input type="text" name="txtIdFabrica" readonly value="<%=idFabrica%>"></p></pre>
        <pre><p>idProducto   <input type="text" name="txtIdProducto"></p></pre>
        <pre><p>Descripcion  <input type="text" name="txtDescripcion"></p></pre>
        <pre><p>Precio       <input type="number" step="0.01" name="txtPrecio"></p></pre>
        <pre><p>Existencia   <input type="number" name="txtExistencia"></p></pre>
        <input type="submit" name="accion7" value="Crear">
    </form>
</div>
<%
    }
%>


<%
    if (request.getParameter("accion2") != null) {
%>
<div class="formulario">
    <h3>Editar producto</h3>
    <form>

        <p>idProducto
            <select name="txtIdProducto">
                <%
                    List<Producto> productos_al = crud.obtenerTodosLosProductos();
                    for (int x = 0; x < productos_al.size(); x++) {
                        Producto p = productos_al.get(x);
                %>
                <option value="<%= p.getIdProducto()%>"><%=p.getIdProducto()%></option>
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
    <h3>Eliminar producto</h3>
    <form>

        <p>idProducto
            <select name="txtIdProducto">
                <%
                    List<Producto> productos_al = crud.obtenerTodosLosProductos();
                    for (int x = 0; x < productos_al.size(); x++) {
                        Producto p = productos_al.get(x);
                %>
                <option value="<%= p.getIdProducto()%>"><%=p.getIdProducto()%></option>
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
    if (request.getParameter("accion7") != null) {

        String idFabrica = request.getParameter("txtIdFabrica");
        String idProducto = request.getParameter("txtIdProducto");
        String descrpcion = request.getParameter("txtDescripcion");
        double precio = Double.parseDouble(request.getParameter("txtPrecio"));
        int existencia = Integer.parseInt(request.getParameter("txtExistencia"));

        if ((precio > 0) && (existencia >= 0)) {

            Producto p = new Producto(idFabrica, idProducto, descrpcion, precio, existencia);

            if (crud.insertarProducto(p)) {
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
    if (request.getParameter("accion6") != null) {

        String idProducto = request.getParameter("txtIdProducto");

        if (crud.eliminarProducto(idProducto)) {
            out.println("<h3>BORRADO CON ÉXITO</h3>");
        } else {
            out.println("<h3>ERROR AL ELIMINAR</h3>");
        }

    }
%>


<%
    if (request.getParameter("accion5") != null) {
        Producto p = null;
        String idProducto = request.getParameter("txtIdProducto");

        List<Producto> productos_al = crud.obtenerTodosLosProductos();
        for (int i = 0; i < productos_al.size(); i++) {
            if (productos_al.get(i).getIdProducto().equalsIgnoreCase(idProducto)) {
                p = productos_al.get(i);
                break;
            }
        }
%>
<div class="formulario">
    <h3>Editar pedido</h3>
    <form>
        <pre><p>idFabrica    <input type="text" name="txtIdFabrica" readonly value="<%=p.getIdFabrica()%>"></p></pre>
        <pre><p>idProducto   <input type="text" name="txtIdProducto" readonly value="<%=p.getIdProducto()%>"></p></pre>
        <pre><p>Descripcion  <input type="text" name="txtDescripcion" value="<%=p.getDescripcion()%>"></p></pre>
        <pre><p>Precio       <input type="number" step="0.01" name="txtPrecio" value="<%=p.getPrecio()%>"></p></pre>
        <pre><p>Existencia   <input type="number" name="txtExistencia" value="<%=p.getExistencia()%>"></p></pre>
        <input type="submit" name="accion8" value="Actualizar">
    </form>
</div>
<%
    }
%>

<%
    if (request.getParameter("accion8") != null) {

        String idFabrica = request.getParameter("txtIdFabrica");
        String idProducto = request.getParameter("txtIdProducto");
        String descripcion = request.getParameter("txtDescripcion");
        double precio = Double.parseDouble(request.getParameter("txtPrecio"));
        int existencia = Integer.parseInt(request.getParameter("txtExistencia"));

        if ((precio > 0) && (existencia >= 0)) {

            Producto p = new Producto(idFabrica, idProducto, descripcion, precio, existencia);

            if (crud.editarProducto(p)) {
                out.println("<h3>Actualizado con éxito</h3>");
            } else {
                out.println("<h3>Error al actualizar</h3>");
            }

        } else {
            out.println("<h3>Has introducido algún dato inválido</h3>");
        }
    }
%>
