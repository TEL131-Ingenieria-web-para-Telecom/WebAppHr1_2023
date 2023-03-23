package com.example.webapphr1_2023.Daos;



import com.example.webapphr1_2023.Beans.Job;

import java.sql.*;
import java.util.ArrayList;

public class JobDao {

    public ArrayList<Job> obtenerListaTrabajos() {
        ArrayList<Job> listaTrabajos = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hr", "root", "root");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM jobs");) {

            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getString(1));
                job.setJobTitle(rs.getString(2));
                job.setMinSalary(rs.getInt(3));
                job.setMaxSalary(rs.getInt(4));

                listaTrabajos.add(job);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaTrabajos;

    }

    public void crearTrabajo(String jobId, String jobTitle, int minSalary, int maxSalary) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "INSERT INTO jobs (job_id,job_title,min_salary,max_salary) VALUES (?,?,?,?)";
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hr", "root", "root");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, jobId);
            pstmt.setString(2, jobTitle);
            pstmt.setInt(3, minSalary);
            pstmt.setInt(4, maxSalary);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Job obtenerTrabajo(String jobId) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        Job job = null;

        String sql = "SELECT * FROM jobs WHERE job_id = ?";
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hr", "root", "root");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, jobId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    job = new Job();
                    job.setJobId(rs.getString(1));
                    job.setJobTitle(rs.getString(2));
                    job.setMinSalary(rs.getInt(3));
                    job.setMaxSalary(rs.getInt(4));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return job;
    }

    public void actualizarTrabajo(String jobId, String jobTitle, int minSalary, int maxSalary) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE jobs SET job_title = ?, min_salary = ?, max_salary = ? "
                + "WHERE job_id = ?";
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hr", "root", "root");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, jobTitle);
            pstmt.setInt(2, minSalary);
            pstmt.setInt(3, maxSalary);
            pstmt.setString(4, jobId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void borrarTrabajo(String jobId) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "DELETE FROM jobs WHERE job_id = ?";
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hr", "root", "root");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, jobId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
