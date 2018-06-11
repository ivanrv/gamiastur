package com.gamitour.accion;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamitour.modelo.Cliente;
import com.gamitour.service.ServiceCliente;
import com.gamitour.service.ServiceClienteImp;
import com.gamitour.util.Accion;

public class Login extends Accion {

	@Override
	public String ejecutar(HttpServletRequest request, HttpServletResponse response) {

		ServiceCliente sCliente = new ServiceClienteImp();
		Cliente cliente;
		
		try{
			cliente = sCliente.buscarPorEmail(request.getParameter("email"));
		}catch(NoResultException e){
			cliente = null;
		}
		
		
		if (cliente == null) {
			request.setAttribute("mensajeError", "email");
			request.setAttribute("prevEmail", request.getParameter("email"));
			return "/content/login.jsp";
		} else {
			if (cliente.getPassword().equals(request.getParameter("password"))) {

				response.setHeader("Cache-Control", "no-store");
				response.setHeader("Pragma", "no-cache");
				response.setDateHeader("Expires", 0);

				request.getSession().setAttribute("userRol", cliente.getRol().getNombre());
				request.getSession().setAttribute("username",
						cliente.getNombre() + " " + cliente.getApellidos().substring(0, cliente.getApellidos().indexOf(" ")));
				request.getSession().setAttribute("userEmail", cliente.getEmail());

				if (request.getSession().getAttribute("filter") != null) {
					return request.getSession().getAttribute("filter").toString().substring(request.getSession().getAttribute("filter").toString().lastIndexOf("content") + 8);
				} else {					
					return "/index.jsp";
				}
			} else {
				request.setAttribute("mensajeError", "pass");
				return "/content/login.jsp";
			}
		}
	}
}
