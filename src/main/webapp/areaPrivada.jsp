<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
    // Verificar si la sesión del usuario está activa
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp"); // Redirige si no hay sesión activa
        return; 
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Área Privada</title>
<link rel="stylesheet" href="css/AreaPrivada.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
</head>
<body>
	<div class="container">
		<header class="d-flex justify-content-between bg-secondary text-white px-3 rounded-1 pt-3 pb-2">
			<h3>
				Bienvenido,
				<c:out value="${sessionScope.usuario}" />
			</h3>
			<form action="Deslogueo" method="POST">
				<button type="submit" class="btn btn-danger">Cerrar sesión</button>
			</form>
		</header>

		<h3 class="mt-5 text-center">Área Privada</h3>
		<p class="text-center">Si estás viendo esta página es porque estás logueado
			correctamente.</p>
	</div>
</body>
</html>