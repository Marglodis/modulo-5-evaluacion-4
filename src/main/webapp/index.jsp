<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
	<div class="container login-container">
	
		<h2 class="mt-5 text-center text-danger"><i class="fas fa-user-circle"></i>Inicio Sesión</h2>
		<form action="ProcesaLogin" method="POST" class="mt-3">
			<div class="mb-3">
				<label for="usuario" class="form-label">Usuario</label> <input
					type="text" class="form-control" id="usuario" name="usuario"
					required>
			</div>
			<div class="mb-3">
				<label for="contrasena" class="form-label">Contraseña</label> <input
					type="password" class="form-control" id="contrasena"
					name="contrasena" required>
			</div>
			<button type="submit" class="btn btn-danger">Iniciar sesión</button>
			<!-- Mensaje de error en caso de fallo -->
            <c:if test="${param.error != null}">
                <div class="alert alert-danger mt-3" role="alert">
                    <strong>Error:</strong> Usuario o contraseña incorrectos.
                </div>
            </c:if>
		</form>
	</div>
</body>
</html>