/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package misrc;

import java.sql.*;
import java.util.*;

public class OperacionesCrud {

    private Connection conexion;

    public OperacionesCrud(Connection conexion) {
        this.conexion = conexion;
    }

    public List<Director> obtenerTodosLosDirectores() {

        List<Director> directores_al = new ArrayList<Director>();
        String query = "select * from director";

        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                directores_al.add(new Director(rs.getInt(1)));
            }
            return directores_al;

        } catch (SQLException e) {
            return null;
        }

    }

    public List<Oficina> obtenerTodosLasOficinas() {

        List<Oficina> oficinas_al = new ArrayList<Oficina>();
        String query = "select * from oficina ORDER BY idOficina";

        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                oficinas_al.add(new Oficina(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6)));
            }
            return oficinas_al;

        } catch (SQLException e) {
            return null;
        }

    }

    public List<Vendedor> obtenerTodosLosVendedores() {

        List<Vendedor> vendedores_al = new ArrayList<Vendedor>();
        String query = "select * from vendedor ORDER BY idVendedor";

        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vendedores_al.add(new Vendedor(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getDouble(7), rs.getDouble(8), rs.getInt(9)));
            }
            return vendedores_al;

        } catch (SQLException e) {
            return null;
        }

    }

    public List<Producto> obtenerTodosLosProductos() {

        List<Producto> productos_al = new ArrayList<Producto>();
        String query = "select * from producto";

        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                productos_al.add(new Producto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5)));
            }
            return productos_al;

        } catch (SQLException e) {
            return null;
        }

    }

    public List<String> obtenerTodosLosProductosDiferentes() {

        List<String> fabricas_al = new ArrayList<String>();
        String query = "SELECT DISTINCT idFabrica FROM Producto;";

        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                fabricas_al.add(rs.getString(1));
            }
            return fabricas_al;

        } catch (SQLException e) {
            return null;
        }

    }

    public List<Cliente> obtenerTodosLosClientes() {

        List<Cliente> clientes_al = new ArrayList<Cliente>();
        String query = "select * from cliente ORDER BY idCliente";

        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                clientes_al.add(new Cliente(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4)));
            }
            return clientes_al;

        } catch (SQLException e) {
            return null;
        }

    }

    public List<Pedido> obtenerTodosLosPedidos() {

        List<Pedido> pedidos_al = new ArrayList<Pedido>();
        String query = "select * from pedido ORDER BY idPedido";

        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pedidos_al.add(new Pedido(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getDouble(8)));
            }
            return pedidos_al;

        } catch (SQLException e) {
            return null;
        }

    }

    public List<Oficina> obtenerLasOficinas() {

        List<Oficina> oficinas_al = new ArrayList<Oficina>();
        String query = "select idOficina from oficina ORDER BY idOficina";

        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                oficinas_al.add(new Oficina(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6)));
            }
            return oficinas_al;

        } catch (SQLException e) {
            return null;
        }

    }

    public boolean insertarVendedor(Vendedor v) {
        String query = "INSERT INTO Vendedor (idVendedor, nombre, edad, idOficina, titulo, contrato, cuota, ventas, idVendedorJefe) values(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setInt(1, v.getIdVendedor());
            ps.setString(2, v.getNombre());
            ps.setInt(3, v.getEdad());
            ps.setInt(4, v.getIdOficina());
            ps.setString(5, v.getTitulo());
            ps.setString(6, v.getContrato());
            ps.setDouble(7, v.getCouta());
            ps.setDouble(8, v.getVentas());
            ps.setInt(9, v.getIdVendedorJefe());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR");
            return false;
        }
    }

    public boolean editarVendedor(Vendedor v) {
        String query = "UPDATE Vendedor SET nombre=?, edad=?, idOficina=?, titulo=?, contrato=?, cuota=?, ventas=?, idVendedorJefe=? WHERE idVendedor=?;";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, v.getNombre());
            ps.setInt(2, v.getEdad());
            ps.setInt(3, v.getIdOficina());
            ps.setString(4, v.getTitulo());
            ps.setString(5, v.getContrato());
            ps.setDouble(6, v.getCouta());
            ps.setDouble(7, v.getVentas());
            ps.setInt(8, v.getIdVendedorJefe());
            ps.setInt(9, v.getIdVendedor());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR");
            return false;
        }
    }

    public boolean eliminarVendedor(int idVendedor) {
        String query = "DELETE FROM Vendedor WHERE idVendedor = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setInt(1, idVendedor);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR");
            return false;
        }
    }

    public boolean insertarCliente(Cliente c) {
        String query = "INSERT INTO Cliente (idCliente, empresa, idVendedor, limite_credito) values(?,?,?,?)";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setInt(1, c.getIdCliente());
            ps.setString(2, c.getEmpresa());
            ps.setInt(3, c.getIdVendedor());
            ps.setDouble(4, c.getLimiteCredito());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR");
            return false;
        }
    }

    public boolean editarCliente(Cliente c) {
        String query = "UPDATE Cliente SET empresa=?, idVendedor=?, limite_credito=? WHERE idCliente=?;";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, c.getEmpresa());
            ps.setInt(2, c.getIdVendedor());
            ps.setDouble(3, c.getLimiteCredito());
            ps.setInt(4, c.getIdCliente());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR");
            return false;
        }
    }

    public boolean eliminarCliente(int idCliente) {
        String query = "DELETE FROM Cliente WHERE idCliente = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setInt(1, idCliente);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR");
            return false;
        }
    }

    public boolean insertarPedido(Pedido p) {
        String query = "INSERT INTO Pedido (idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe) values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setInt(1, p.getIdPedido());
            ps.setInt(2, p.getIdVendedor());
            ps.setInt(3, p.getIdCliente());
            ps.setString(4, p.getIdFabrica());
            ps.setString(5, p.getIdProducto());
            ps.setString(6, p.getFechaPedido());
            ps.setInt(7, p.getCantidad());
            ps.setDouble(8, p.getImporte());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR");
            return false;
        }
    }

    public boolean eliminarPedido(int idPedido) {
        String query = "DELETE FROM Pedido WHERE idPedido = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setInt(1, idPedido);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR");
            return false;
        }
    }

    public List<String> obtenerProductos(String idFabrica) {
        String query = "SELECT idProducto FROM Pedido WHERE idFabrica = ?;";
        List<String> productos_al = new ArrayList<String>();

        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, idFabrica);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                productos_al.add(rs.getString(1));
            }
            return productos_al;

        } catch (SQLException e) {
            return null;
        }

    }
    
    public boolean editarPedido(Pedido p) {
        String query = "UPDATE Pedido SET idVendedor=?, idCliente=?, idFabrica=?, idProducto=?, fecha_pedido=?, cantidad=?, importe=? WHERE idPedido=?;";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setInt(1, p.getIdVendedor());
            ps.setInt(2, p.getIdCliente());
            ps.setString(3, p.getIdFabrica());
            ps.setString(4, p.getIdProducto());
            ps.setString(5, p.getFechaPedido());
            ps.setDouble(6, p.getCantidad());
            ps.setDouble(7, p.getImporte());
            ps.setInt(8, p.getIdPedido());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR");
            return false;
        }
    }
    
    public boolean insertarProducto(Producto p) {
        String query = "INSERT INTO Producto (idFabrica, idProducto, descripcion, precio, existencia) values(?,?,?,?,?)";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, p.getIdFabrica());
            ps.setString(2, p.getIdProducto());
            ps.setString(3, p.getDescripcion());
            ps.setDouble(4, p.getPrecio());
            ps.setInt(5, p.getExistencia());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR");
            return false;
        }
    }
    
    public boolean eliminarProducto(String idProducto) {
        String query = "DELETE FROM Producto WHERE idProducto = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, idProducto);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR");
            return false;
        }
    }
    
    public boolean editarProducto(Producto p) {
        String query = "UPDATE Producto SET descripcion=?, precio=?, existencia=? WHERE idProducto=?;";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, p.getDescripcion());
            ps.setDouble(2, p.getPrecio());
            ps.setInt(3, p.getExistencia());
            ps.setString(4, p.getIdProducto());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("ERROR");
            return false;
        }
    }

}
