<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="misrc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    #seccion{
        text-align: center;
    }
    #listado{
        margin-left: 20%;
        margin-right: 20%;
    }
</style>
<div id="seccion">
    <h2>Listado de oficinas</h2><br>
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
        <!--
        listado de directores
        -->
        <table class="table">

            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">idOficina</th>
                    <th scope="col">idDirector</th>
                    <th scope="col">Ciudad</th>
                    <th scope="col">Region</th>
                    <th scope="col">Objetivo</th>
                    <th scope="col">Ventas</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Oficina> oficinas_al = crud.obtenerTodosLasOficinas();

                    for (int i = 0; i < oficinas_al.size(); i++) {
                        Oficina o = oficinas_al.get(i);
                %>
                <tr>
                    <td><%=i + 1%></td>
                    <td><%=o.getIdOficina()%></td>
                    <td><%=o.getIdDirector()%></td>
                    <td><%=o.getCiudad()%></td>
                    <td><%=o.getRegion()%></td>
                    <td><%=o.getObjetivo()%></td>
                    <td><%=o.getVentas()%></td>
                </tr>
                <%
                    }

                
                %>             
            </tbody>
        </table>
    </div>
    <%
        }else {
            out.println("NO HAY CONEXION CON LA BASE DE DATOS");
        }

    %>
</div>