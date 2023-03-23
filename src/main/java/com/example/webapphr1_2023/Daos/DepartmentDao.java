package com.example.webapphr1_2023.Daos;


import com.example.webapphr1_2023.Beans.Department;

import java.sql.*;
import java.util.ArrayList;

public class DepartmentDao  {

    public ArrayList<Department> lista() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        ArrayList<Department> list = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hr", "root", "root");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from departments")) {

            while (rs.next()) {
                Department department = new Department();
                department.setDepartmentId(rs.getInt(1));
                department.setDepartmentName(rs.getString(2));
                list.add(department);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);

        }
        return list;
    }
}