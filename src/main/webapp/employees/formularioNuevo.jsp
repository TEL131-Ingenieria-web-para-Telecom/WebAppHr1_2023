<%@ page import="com.example.webapphr1_2023.Beans.Job" %>
<%@ page import="com.example.webapphr1_2023.Beans.Employee" %>
<%@ page import="com.example.webapphr1_2023.Beans.Department" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean id="listaEmpleados" type="java.util.ArrayList<com.example.webapphr1_2023.Beans.Employee>" scope="request"/>
<jsp:useBean id="listaTrabajos" type="java.util.ArrayList<com.example.webapphr1_2023.Beans.Job>" scope="request"/>
<jsp:useBean id="listaDepartamentos" type="java.util.ArrayList<com.example.webapphr1_2023.Beans.Department>"
             scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../includes/bootstrap_header.jsp"/>
        <title>Nuevo empleado</title>
    </head>
    <body>
        <div class='container'>
            <form method="POST" action="EmployeeServlet?action=guardar" class="col-md-6 col-lg-6">
                <h1 class='mb-3'>Nuevo usuario</h1>
                <hr>
                <div class="mb-3">
                    <label for="first_name">First Name</label>
                    <input type="text" class="form-control form-control-sm" name="first_name" id="first_name">
                </div>
                <div class="mb-3">
                    <label for="last_name">Last Name</label>
                    <input type="text" class="form-control form-control-sm" name="last_name" id="last_name">
                </div>
                <div class="mb-3">
                    <label for="email">Email</label>
                    <input type="text" class="form-control form-control-sm" name="email" id="email">
                </div>
                <div class="mb-3">
                    <label for="phone">Phone number</label>
                    <input type="text" class="form-control form-control-sm" name="phone" id="phone">
                </div>
                <div class="mb-3">
                    <label for="hire_date">Hire date</label>
                    <input type="text" class="form-control form-control-sm" name="hire_date" id="hire_date">
                </div>
                <div class="mb-3">
                    <label for="job_id">Job</label>
                    <select class="form-select" name="job_id">
                        <% for (Job job : listaTrabajos) { %>
                        <option value="<%=job.getJobId()%>">
                            <%=job.getJobTitle()%>
                        </option>
                        <% } %>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="salary">Salary</label>
                    <input type="text" class="form-control form-control-sm" name="salary" id="salary">
                </div>
                <div class="mb-3">
                    <label for="commission">Commision PCT</label>
                    <input type="text" class="form-control form-control-sm" name="commission" id="commission">
                </div>
                <div class="mb-3">
                    <label for="manager_id">Manager</label>
                    <select class="form-select" name="manager_id">
                        <option value="0">--Sin jefe--</option>
                        <% for (Employee employee : listaEmpleados) { %>
                        <option value="<%=employee.getEmployeeId() %>">
                            <%=employee.getNombreCompleto()%>
                        </option>
                        <% } %>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="department_id">Department</label>
                    <select class="form-select" name="department_id">
                        <option value="0">--Sin departamento--</option>
                        <% for (Department department : listaDepartamentos) { %>
                        <option value="<%=department.getDepartmentId()%>">
                            <%=department.getDepartmentName()%>
                        </option>
                        <% } %>
                    </select>
                </div>
                <a href="<%= request.getContextPath()%>/EmployeeServlet" class="btn btn-danger">Cancelar</a>
                <input type="submit" value="Guardar" class="btn btn-primary"/>
            </form>
        </div>
        <jsp:include page="../includes/bootstrap_footer.jsp"/>
    </body>
</html>
