package servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ProcesaLogin
 */
@WebServlet("/ProcesaLogin")
public class ProcesaLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProcesaLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        // Validación básica (por ejemplo, usuario y contraseña fijos)
        if ("admin".equals(usuario) && "admin".equals(contrasena)) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);  
            response.sendRedirect("areaPrivada.jsp");  
        } else {
            response.sendRedirect("index.jsp?error=true"); 
        }
	}

}
