<%@page contentType="text/html" pageEncoding="UTF-8" %>
<jsp:useBean id="empleado" type="com.example.webapphr1_2023.Beans.Employee" scope="request"/>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../includes/bootstrap_header.jsp"/>
        <title>Editar empleado</title>
    </head>
    <body>
        <div class='container mb-4'>
            <h1 class='mb-3'>Editar usuario</h1>
            <hr>
            <form method="POST" action="EmployeeServlet?action=actualizar" class="col-md-6 col-lg-6">
                <input type="hidden" name="employee_id" value="<%= empleado.getEmployeeId()%>"/>
                <div class="mb-3">
                    <label for="first_name">First Name</label>
                    <input type="text" class="form-control form-control-sm" name="first_name" id="first_name"
                           value="<%= empleado.getFirstName() == null ? "" : empleado.getFirstName()%>">
                </div>
                <div class="mb-3">
                    <label for="last_name">Last Name</label>
                    <input type="text" class="form-control form-control-sm" name="last_name" id="last_name"
                           value="<%= empleado.getLastName() == null ? "" : empleado.getLastName()%>">
                </div>
                <div class="mb-3">
                    <label for="email">Email</label>
                    <input type="text" class="form-control form-control-sm" name="email" id="email"
                           value="<%= empleado.getEmail() == null ? "" : empleado.getEmail()%>">
                </div>
                <div class="mb-3">
                    <label for="phone">Phone number</label>
                    <input type="text" class="form-control form-control-sm" name="phone" id="phone"
                           value="<%= empleado.getPhoneNumber() == null ? "" : empleado.getPhoneNumber()%>">
                </div>
                <div class="mb-3">
                    <label for="hire_date">Hire date</label>
                    <input type="text" class="form-control form-control-sm" name="hire_date" id="hire_date"
                           value="<%= empleado.getHireDate() == null ? "" : empleado.getHireDate()%>">
                </div>
                <div class="mb-3">
                    <label for="job_id">Job</label>
                    <input type="text" class="form-control form-control-sm" name="job_id" id="job_id"
                           value="<%= empleado.getJobId() == null ? "" : empleado.getJobId()%>">
                </div>
                <div class="mb-3">
                    <label for="salary">Salary</label>
                    <input type="text" class="form-control form-control-sm" name="salary" id="salary"
                           value="<%= empleado.getSalary().equals("0.0") ? "" : empleado.getSalary()%>">
                </div>
                <div class="mb-3">
                    <label for="commission">Commision PCT</label>
                    <input type="text" class="form-control form-control-sm" name="commission" id="commission"
                           value="<%= empleado.getCommissionPct() == null ? "" : empleado.getCommissionPct()%>">
                </div>
                <div class="mb-3">
                    <label for="manager_id">Manager ID</label>
                    <input type="text" class="form-control form-control-sm" name="manager_id" id="manager_id"
                           value="<%= empleado.getManagerId() == 0 ? "" : empleado.getManagerId()%>">
                </div>
                <div class="mb-3">
                    <label for="department_id">Department ID</label>
                    <input type="text" class="form-control form-control-sm" name="department_id" id="department_id"
                           value="<%= empleado.getDepartmentId() == 0 ? "" : empleado.getDepartmentId()%>">
                </div>
                <a href="<%= request.getContextPath()%>/EmployeeServlet" class="btn btn-danger">Cancelar</a>
                <input type="submit" value="Actualizar" class="btn btn-primary"/>
            </form>
        </div>
        <jsp:include page="../includes/bootstrap_footer.jsp"/>
    </body>
</html>
