<%@page import="java.io.File"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="misrc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    #seccion{
        text-align: center;
    }
    .listado{
        margin-left: 20%;
        margin-right: 20%;
    }
</style>
<div id="seccion">
    <h2>Listado de los directores</h2><br>

    <%
        //String rutaAbsoluta = "C:\\sqlite\\hito";
        File f = new File("data/hito");
        String rutaAbsoluta = f.getAbsolutePath();
        ConexionSqlite cs = new ConexionSqlite(true, rutaAbsoluta);
        Connection conexion = cs.getConexion();
        OperacionesCrud crud = new OperacionesCrud(conexion);

        if (conexion != null) {
    %>
    <div class="listado">
        <!--
        listado de directores
        -->
        <div class="listado">
            <table class="table">

                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">idDirector</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Director> directores_al = crud.obtenerTodosLosDirectores();

                        for (int i = 0; i < directores_al.size(); i++) {
                            Director d = directores_al.get(i);
                    %>
                    <tr>
                        <td><%=i + 1%></td>
                        <td><%=d.getIdDirector()%></td>
                    </tr>
                    <%
                        }

                    %>             
                </tbody>
            </table>
        </div>
    </div>
    <%} else {
            out.println("NO HAY CONEXION CON LA BASE DE DATOS");
        }

    %>
</div>