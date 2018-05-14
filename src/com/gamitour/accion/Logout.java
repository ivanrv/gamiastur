package com.gamitour.accion;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamitour.util.Accion;

public class Logout extends Accion{

	@Override
	public String ejecutar(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "/index.jsp";
	}

}
