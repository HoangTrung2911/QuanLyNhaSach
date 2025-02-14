/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import DTO.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author 19522
 */
public class NhaCungCap_DAL {
   DBConnection connection;
    
    //All
    public ArrayList<NhaCungCap> getAllNhaCungCap()
    {
        connection = new DBConnection();
        ArrayList<NhaCungCap> result = new ArrayList<NhaCungCap>();
        String query = "select * from NhaCungCap";
        System.out.println(query);
        try{
            ResultSet rs = connection.ExcuteQueryGetTable(query);
            while (rs.next()) {                
                NhaCungCap nhacungcap = new NhaCungCap();
                nhacungcap.setMaNhaCC(rs.getString("MaNhaCC"));
                nhacungcap.setTenNhaCC(rs.getString("TenNhaCC"));
                result.add(nhacungcap);
            }
        }catch(SQLException e)
        {
            System.out.println("Null Table!");
        }
        return result;
    }
    
    //Search
    public ArrayList<NhaCungCap> searchNhaCungCap(String search)
    {
        connection = new DBConnection();
        ArrayList<NhaCungCap> result = new ArrayList<NhaCungCap>();
        String query = "select * from NhaCungCap where MaNhaCC like '%" + search + "%' or TenKH like '%" + search+ "%'";
        System.out.println(query);
        try{
            ResultSet rs = connection.ExcuteQueryGetTable(query);
            while (rs.next()) {                
                NhaCungCap nhacungcap = new NhaCungCap();
                nhacungcap.setMaNhaCC(rs.getString("MaNhaCC"));
                nhacungcap.setTenNhaCC(rs.getString("TenNhaCC"));
                result.add(nhacungcap);
            }
        }catch(SQLException e)
        {
            System.out.println("Null Table!");
        }
        return result;
    }
    
    public boolean addNhaCungCap(NhaCungCap nhacungcap)
    {
        connection = new DBConnection();
        String query = "insert into NhaCungCap values ('" + nhacungcap.getMaNhaCC()+ "','" +nhacungcap.getTenNhaCC() + "'";
        System.err.println(query);
        try {
            ResultSet rs = connection.ExcuteQueryUpdateDB(query);
            return true;
        } catch (Exception e) {
            System.err.println("Failed!");
            return false;
        }
    }
    
    public boolean updateNhaCungCap(NhaCungCap nhacungcap)
    {
        connection = new DBConnection();
        String query = "update NhaCungCap set TenNhaCC = '"  + nhacungcap.getTenNhaCC() + "' where TenKH = '" + nhacungcap.getMaNhaCC() + "'" ;
        System.err.println(query);
        try {
            ResultSet rs = connection.ExcuteQueryUpdateDB(query);
            return true;
        } catch (Exception e) {
            System.err.println("Failed!");
            return false;
        }
    }
    
    public boolean deleteNhaCungCap(String maNhaCC)
    {
        connection = new DBConnection();
        String query = "delete from NhaCungCap where MaNhaCC = '" + maNhaCC + "'";
        System.err.println(query);
        try {
            ResultSet rs = connection.ExcuteQueryUpdateDB(query);
            return true;
        } catch (Exception e) {
            System.err.println("Failed!");
            return false;
        }
    }
    
    
}
