package com.gamitour.accion;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamitour.modelo.Actividad;
import com.gamitour.modelo.ClienteHasActividad;
import com.gamitour.service.ServiceActividad;
import com.gamitour.service.ServiceActividadImp;
import com.gamitour.service.ServiceCliente;
import com.gamitour.service.ServiceClienteHasActividad;
import com.gamitour.service.ServiceClienteHasActividadImp;
import com.gamitour.service.ServiceClienteImp;
import com.gamitour.util.Accion;

public class Reserva extends Accion{

	@Override
	public String ejecutar(HttpServletRequest request, HttpServletResponse response) {
		
		ServiceClienteHasActividad sCliHAct = new ServiceClienteHasActividadImp();
		ServiceCliente sCli = new ServiceClienteImp();
		ServiceActividad sAct = new ServiceActividadImp();
		
		Actividad actividad = sAct.buscarPorNombre(request.getParameter("actividad"));
		
		switch(request.getParameter("tipo")) {
		case "reserva":
			
			// TODO seleccion de personas, pago, etc
			
			sCliHAct.insertar(new ClienteHasActividad(actividad, sCli.buscarPorEmail(request.getSession().getAttribute("userEmail").toString()), new Date(), 1));
			actividad.setNumparticipantes(actividad.getNumparticipantes() + 1);
			sAct.actualizar(actividad);
			
			break;
		
		case "cancela":
			sCliHAct.borrar(sCliHAct.buscarReserva(sCli.buscarPorEmail(request.getSession().getAttribute("userEmail").toString()), actividad));
			actividad.setNumparticipantes(actividad.getNumparticipantes()-1);
			sAct.actualizar(actividad);
			
			break;
		}
		
		return "misActs";
	}
}