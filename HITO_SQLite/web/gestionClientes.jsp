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
    <h2>Gestión de los clientes</h2><br>
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
                    <th scope="col">IdCliente</th>
                    <th scope="col">Empresa</th>
                    <th scope="col">IdVendedor</th>
                    <th scope="col">LimiteCredito</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Cliente> clientes_al = crud.obtenerTodosLosClientes();

                    for (int i = 0; i < clientes_al.size(); i++) {
                        Cliente c = clientes_al.get(i);
                %>
                <tr>
                    <td><%=i + 1%></td>
                    <td><%=c.getIdCliente()%></td>
                    <td><%=c.getEmpresa()%></td>
                    <td><%=c.getIdVendedor()%></td>
                    <td><%=c.getLimiteCredito()%></td>
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
    <h3>Añadir cliente</h3>
    <form>

        <pre><p>idCliente      <input type="text" name="txtIdCliente"></p></pre>
        <pre><p>Empresa        <input type="text" name="txtEmpresa"></p></pre>
        <pre><p>LimiteCredito  <input type="number" step="0.01" name="txtLimiteCredito"></p></pre>
        <p>idVendedor:  <select name="txtIdVendedor">
                <%
                    List<Vendedor> vendedor_al = crud.obtenerTodosLosVendedores();
                    for (int y = 0; y < vendedor_al.size(); y++) {
                        Vendedor v = vendedor_al.get(y);

                %>
                <option value="<%=v.getIdVendedor()%>"><%=v.getIdVendedor()%></option>
                <%
                    }
                %>
            </select>
        </p>
        
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
    <h3>Editar cliente</h3>
    <form>
        <p>idCliente:  <select name="txtIdCliente">
                <%
                    List<Cliente> clientes_al = crud.obtenerTodosLosClientes();
                    for (int y = 0; y < clientes_al.size(); y++) {
                        Cliente c = clientes_al.get(y);

                %>
                <option value="<%=c.getIdCliente()%>"><%=c.getIdCliente()%></option>
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
    if (request.getParameter("accion5") != null) {
         Cliente c = null;
        int idCliente = Integer.parseInt(request.getParameter("txtIdCliente"));
        List<Cliente> clientes_al = crud.obtenerTodosLosClientes();
        for (int i = 0; i < clientes_al.size(); i++) {
            if (clientes_al.get(i).getIdCliente() == idCliente) {
                c = clientes_al.get(i);
                break;
            }
        }
%>
<div class="formulario">
    <h3>Editar cliente</h3>
    <form>

        <pre><p>idCliente      <input type="text" name="txtIdCliente" value="<%=c.getIdCliente()%>" readonly></p></pre>
        <pre><p>Empresa        <input type="text" name="txtEmpresa" value="<%=c.getEmpresa()%>"></p></pre>
        <pre><p>LimiteCredito  <input type="number" name="txtLimiteCredito" value="<%=c.getLimiteCredito()%>"></p></pre>
        <p>idVendedor:  <select name="txtIdVendedor">
                <%
                    List<Vendedor> vendedor_al = crud.obtenerTodosLosVendedores();
                    for (int y = 0; y < vendedor_al.size(); y++) {
                        Vendedor v = vendedor_al.get(y);

                %>
                <option value="<%=v.getIdVendedor()%>"><%=v.getIdVendedor()%></option>
                <%
                    }
                %>
            </select>
        </p>
        
        <input type="submit" name="accion7" value="Actualizar">
    </form>
</div>
<%
    }
%>

<%
    if (request.getParameter("accion7") != null) {

        int idCliente = Integer.parseInt(request.getParameter("txtIdCliente"));
        String empresa = request.getParameter("txtEmpresa");
        Double limiteCredito = Double.parseDouble(request.getParameter("txtLimiteCredito"));
        int idVendedor = Integer.parseInt(request.getParameter("txtIdVendedor"));

        if ((idCliente > 0) && (limiteCredito > 0)) {

            Cliente c = new Cliente(idCliente, empresa, idVendedor, limiteCredito);

            if (crud.editarCliente(c)) {
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
    if (request.getParameter("accion3") != null) {
%>
<div class="formulario">
    <h3>Eliminar cliente</h3>
    <form>
        <p>idCliente:  <select name="txtIdCliente">
                <%
                    List<Cliente> clientes_al = crud.obtenerTodosLosClientes();
                    for (int y = 0; y < clientes_al.size(); y++) {
                        Cliente c = clientes_al.get(y);

                %>
                <option value="<%=c.getIdCliente()%>"><%=c.getIdCliente()%></option>
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

        int idCliente = Integer.parseInt(request.getParameter("txtIdCliente"));
        String empresa = request.getParameter("txtEmpresa");
        Double limiteCredito = Double.parseDouble(request.getParameter("txtLimiteCredito"));
        int idVendedor = Integer.parseInt(request.getParameter("txtIdVendedor"));

        if ((idCliente > 0) && (limiteCredito > 0)) {

            Cliente c = new Cliente(idCliente, empresa, idVendedor, limiteCredito);

            if (crud.insertarCliente(c)) {
                out.println("<h3>Creado con éxito</h3>");
            } else {
                out.println("<h3>Error al crear: Dato inválido o ID ocupado</h3>");
            }

        } else {
            out.println("<h3>Has introducido algún dato inválido</h3>");
        }
    }
%>

<%
    if (request.getParameter("accion6") != null) {

        int idCliente = Integer.parseInt(request.getParameter("txtIdCliente"));

        if (crud.eliminarCliente(idCliente)) {
            out.println("<h3>BORRADO CON ÉXITO</h3>");
        } else {
            out.println("<h3>ERROR AL ELIMINAR</h3>");
        }

    }
%>