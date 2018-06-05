package com.gamitour.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamitour.accion.Activa;
import com.gamitour.accion.EliminarUno;
import com.gamitour.accion.Login;
import com.gamitour.accion.Logout;
import com.gamitour.accion.MostrarAccion;
import com.gamitour.accion.MostrarUno;
import com.gamitour.accion.Nuevo;
import com.gamitour.accion.Reserva;
import com.gamitour.accion.Update;

public abstract class Accion {

	public abstract String ejecutar(HttpServletRequest request, HttpServletResponse response);
	
	public static Accion getAccion(String tipo){
		Accion accion = null;
		
		if(tipo.equals("Admin")){
			accion = new MostrarAccion();
		}
		
		if(tipo.equals("Mostrar")){
			accion = new MostrarUno();
		}
		
		if(tipo.equals("Eliminar")){
			accion = new EliminarUno();
		}
		
		if(tipo.equals("Nuevo")){
			accion = new Nuevo();
		}
		
		if(tipo.equals("Login")){
			accion = new Login();
		}
		
		if(tipo.equals("Logout")){
			accion = new Logout();
		}
		
		if(tipo.equals("Update")){
			accion = new Update();
		}
		
		if(tipo.equals("Reserva")) {
			accion = new Reserva();
		}
		
		if(tipo.equals("Activa")) {
			accion = new Activa();
		}
		
		return accion;
	}
}
