package misrc;

import java.sql.*;

public class ConexionSqlite {

    private Connection conexion;
    private String database;
    private String url;

    /**
     * Datos necesarios para realizar la conexion a la bd
     */
    private static final String PROTOCOLO = "jdbc:sqlite";
    private static final String USERNAME = "";
    private static final String PASSWORD = "";

    public ConexionSqlite() {
        setConexion(false);
    }

    public ConexionSqlite(boolean flag, String database) {
        this.database = database;
        this.url = PROTOCOLO + ":" + this.database;
        setConexion(flag);
    }

    public void setConexion(boolean flag) {
        try {
            if (flag) {
                Class.forName("org.sqlite.JDBC");
                conexion = DriverManager.getConnection(this.url, USERNAME, PASSWORD);
            } else {
                conexion.close();
                conexion = null;
            }
        } catch (SQLException ex) {
            conexion = null;
        } catch (ClassNotFoundException ex) {
            conexion = null;
        }
    }

    public Connection getConexion() {
        return conexion;
    }

}
