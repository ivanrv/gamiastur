package com.gamitour.accion;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Premio;
import com.gamitour.service.ServiceCliente;
import com.gamitour.service.ServiceClienteImp;
import com.gamitour.service.ServicePremio;
import com.gamitour.service.ServicePremioImp;
import com.gamitour.util.Accion;

public class Activa extends Accion{

	@Override
	public String ejecutar(HttpServletRequest request, HttpServletResponse response) {
		
		ServicePremio sPremio = new ServicePremioImp();
		ServiceCliente sCli = new ServiceClienteImp();
		
		Premio premio = sPremio.buscarPorNombre(request.getParameter("premio"));
		Cliente cliente = sCli.buscarPorEmail(request.getSession().getAttribute("userEmail").toString());
		
		switch(request.getParameter("tipo")) {
		case "activa":
			
			premio.setCliente(cliente);
			premio.setFechaactivacion(new Date());
			cliente.setPuntosacumulados(cliente.getPuntosacumulados() - premio.getPuntos());
			sPremio.actualizar(premio);
			sCli.actualizar(cliente);

			break;
			
		case "canjea":
			
			sPremio.borrar(premio);
			
			// TODO entregar cosas al cliente en plan email o algo
			
			break;
		}
		
		return "misPrem";
	}

}
