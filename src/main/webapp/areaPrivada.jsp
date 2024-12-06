<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%
    // Verificar si la sesión del usuario está activa
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp"); // Redirige si no hay sesión activa
        return; 
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Área Privada</title>
    <link rel="stylesheet" href="css/AreaPrivada.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <header class="d-flex justify-content-between bg-secondary text-white px-3 rounded-1 pt-3 pb-2">
            <h3>
                Bienvenido, <c:out value="${sessionScope.usuario}" />
            </h3>
            <form action="Deslogueo" method="POST">
                <button type="submit" class="btn btn-danger">Cerrar sesión</button>
            </form>
        </header>

        <h3 class="mt-5 text-center">Área Privada</h3>
        <p class="text-center">Si estás viendo esta página es porque estás logueado correctamente.</p>

        <!-- Configuración de la fuente de datos (data source) para PostgreSQL -->
        <sql:setDataSource var="myDS" driver="org.postgresql.Driver"
            url="jdbc:postgresql://localhost:5432/universidad"
            user="postgres" password="mtg.2029" />

        <!-- Consulta SQL para obtener datos de la tabla DEPARTAMENTO -->
        <sql:query dataSource="${myDS}" var="result">
            SELECT * FROM DEPARTAMENTO;
        </sql:query>

        <h4 class="text-center mt-4">Datos de Departamentos</h4>
        <table class="table table-bordered mt-3">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Número Departamento</th>
                    <th scope="col">Nombre Departamento</th>
                    <th scope="col">Ubicación Departamento</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.NUMDEPTO}" /></td>
                        <td><c:out value="${row.NOMDEPTO}" /></td>
                        <td><c:out value="${row.UBICACIONDPTO}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
