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
    <h2>Gestión de los pedidos</h2><br>
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
                    <th scope="col">IdPedido</th>
                    <th scope="col">IdVendedor</th>
                    <th scope="col">IdCliente</th>
                    <th scope="col">IdFabrica</th>
                    <th scope="col">IdProducto</th>
                    <th scope="col">FechaPedido</th>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Importe</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Pedido> pedidos_al = crud.obtenerTodosLosPedidos();

                    for (int i = 0; i < pedidos_al.size(); i++) {
                        Pedido p = pedidos_al.get(i);
                %>
                <tr>
                    <td><%=i + 1%></td>
                    <td><%=p.getIdPedido()%></td>
                    <td><%=p.getIdVendedor()%></td>
                    <td><%=p.getIdCliente()%></td>
                    <td><%=p.getIdFabrica()%></td>
                    <td><%=p.getIdProducto()%></td>
                    <td><%=p.getFechaPedido()%></td>
                    <td><%=p.getCantidad()%></td>
                    <td><%=p.getImporte()%></td>
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

<%
    if (request.getParameter("accion1") != null) {
%>  
<div class="formulario">
    <h3>Añadir pedido</h3>
    <form>

        <pre><p>idPedido       <input type="text" name="txtIdPedido" required></p></pre>
        <pre><p>idFabrica:     <select name="txtIdFabrica" >
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
        </p></pre>

            <input type="submit" name="accion4" value="Continuar">
    </form>
</div>
<%
    }
%>

<%
    if (request.getParameter("accion4") != null) {
        int idPedido = Integer.parseInt(request.getParameter("txtIdPedido"));
        String idFabrica = request.getParameter("txtIdFabrica");
%>
<div class="formulario">
    <h3>Añadir pedido</h3>
    <form>

        <pre><p>idPedido       <input type="text" name="txtIdPedido" value="<%=idPedido%>" readonly></p></pre>
        <pre><p>idFabrica       <input type="text" name="txtIdFabrica" value="<%=idFabrica%>" readonly></p></pre>
        <pre><p>Cantidad       <input type="number" name="txtCantidad" required=""></p></pre>
        <pre><p>Importe        <input type="number" step="0.01" name="txtImporte" required=""></p></pre>
        <pre><p>FechaPedido       <input type="date" name="txtFechaPedido" required=""></p></pre>
        
        <pre><p>idCliente:  <select name="txtIdCliente">
                    <%
                        List<Cliente> clientes_al = crud.obtenerTodosLosClientes();
                        for (int x = 0; x < clientes_al.size(); x++) {
                            Cliente c = clientes_al.get(x);

                    %>
                <option value="<%=c.getIdCliente()%>"><%=c.getIdCliente()%></option>
                    <%
                        }
                    %>
            </select>
        </p></pre>
        <pre><p>idVendedor:  <select name="txtIdVendedor">
                    <%
                        List<Vendedor> vendedores_al = crud.obtenerTodosLosVendedores();
                        for (int x = 0; x < vendedores_al.size(); x++) {
                            Vendedor v = vendedores_al.get(x);

                    %>
                <option value="<%=v.getIdVendedor()%>"><%=v.getIdVendedor()%></option>
                    <%
                        }
                    %>
            </select>
        </p></pre>
        <pre><p>idProducto: <select name="txtIdProducto">
                    <%
                        List<String> productos_al = crud.obtenerProductos(idFabrica);
                        for (int x = 0; x < productos_al.size(); x++) {
                            

                    %>
                <option value="<%=productos_al.get(x)%>"><%=productos_al.get(x)%></option>
                    <%
                        }
                    %>
            </select>
        </p></pre>
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
    <h3>Editar pedido</h3>
    <form>

        <p>idPedido:  <select name="txtIdPedido">
                <%
                    List<Pedido> pedidos_al = crud.obtenerTodosLosPedidos();
                    for (int y = 0; y < pedidos_al.size(); y++) {
                        Pedido p = pedidos_al.get(y);

                %>
                <option value="<%=p.getIdPedido()%>"><%=p.getIdPedido()%></option>
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
    <h3>Eliminar pedido</h3>
    <form>

        <p>idPedido:  <select name="txtIdPedido">
                <%
                    List<Pedido> pedidos_al = crud.obtenerTodosLosPedidos();
                    for (int y = 0; y < pedidos_al.size(); y++) {
                        Pedido p = pedidos_al.get(y);

                %>
                <option value="<%=p.getIdPedido()%>"><%=p.getIdPedido()%></option>
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

        int idPedido = Integer.parseInt(request.getParameter("txtIdPedido"));
        int idVendedor = Integer.parseInt(request.getParameter("txtIdVendedor"));
        int idCliente = Integer.parseInt(request.getParameter("txtIdCliente"));
        String idFabrica = request.getParameter("txtIdFabrica");
        String idProducto = request.getParameter("txtIdProducto");
        String fecha = request.getParameter("txtFechaPedido");
        int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
        Double importe = Double.parseDouble(request.getParameter("txtImporte"));

        if ((idPedido > 0) && (cantidad >= 0) && (importe >= 0)) {

            Pedido p = new Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha, cantidad, importe);

            if (crud.insertarPedido(p)) {
                out.println("<h3>Creado con éxito</h3>");
            } else {
                out.println("<h3>Error al crear: Dato inválido o ID ocupado</h3>");
            }

        } else {
            System.out.println("<h3>Has introducido algún dato inválido</h3>");
        }

    }
%>

<%
    if (request.getParameter("accion6") != null) {

        int idPedido = Integer.parseInt(request.getParameter("txtIdPedido"));

        if (crud.eliminarPedido(idPedido)) {
            out.println("<h3>BORRADO CON ÉXITO</h3>");
        } else {
            out.println("<h3>ERROR AL ELIMINAR</h3>");
        }

    }
%>

<%
    if (request.getParameter("accion5") != null) {
        Pedido p = null;
        int idPedido = Integer.parseInt(request.getParameter("txtIdPedido"));
        List<Pedido> pedidos_al = crud.obtenerTodosLosPedidos();
        for (int i = 0; i < pedidos_al.size(); i++) {
            if (pedidos_al.get(i).getIdPedido() == idPedido) {
                p = pedidos_al.get(i);
                break;
            }
        }
%>
<div class="formulario">
    <h3>Editar pedido</h3>
    <form>
        <pre><p>idPedido      <input type="number" name="txtIdPedido" value="<%=p.getIdPedido()%>" required="" readonly></p></pre>
        <pre><p>idCliente     <input type="number" name="txtIdCliente" value="<%=p.getIdCliente()%>" required="" readonly></p></pre>
        <pre><p>idVendedor    <input type="number" name="txtIdVendedor" value="<%=p.getIdVendedor()%>" required="" readonly></p></pre>
        <pre><p>idFabrica     <input type="text" name="txtIdFabrica" value="<%=p.getIdFabrica()%>" required="" readonly></p></pre>
        <pre><p>idProducto    <input type="text" name="txtIdProducto" value="<%=p.getIdProducto()%>" required="" readonly></p></pre>
        <pre><p>Cantidad      <input type="number" name="txtCantidad" required="" value="<%=p.getCantidad()%>"></p></pre>
        <pre><p>Importe       <input type="number" step="0.01" name="txtImporte" required="" value="<%=p.getImporte()%>"></p></pre>
        <pre><p>FechaPedido      <input type="date" name="txtFechaPedido" required="" value="<%=p.getFechaPedido()%>"></p></pre>
        <input type="submit" name="accion8" value="Actualizar">
    </form>
</div>
<%
    }
%>

<%
    if (request.getParameter("accion8") != null) {

        int idPedido = Integer.parseInt(request.getParameter("txtIdPedido"));
        int idVendedor = Integer.parseInt(request.getParameter("txtIdVendedor"));
        int idCliente = Integer.parseInt(request.getParameter("txtIdCliente"));
        String idFabrica = request.getParameter("txtIdFabrica");
        String idProducto = request.getParameter("txtIdProducto");
        String fecha = request.getParameter("txtFechaPedido");
        int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
        Double importe = Double.parseDouble(request.getParameter("txtImporte"));

        if ((idPedido > 0) && (cantidad >= 0) && (importe >= 0)) {

            Pedido p = new Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha, cantidad, importe);

            if (crud.editarPedido(p)) {
                out.println("<h3>Actualizado con éxito</h3>");
            } else {
                out.println("<h3>Error al actualizar</h3>");
            }

        } else {
            out.println("<h3>Has introducido algún dato inválido</h3>");
        }
    }
%>