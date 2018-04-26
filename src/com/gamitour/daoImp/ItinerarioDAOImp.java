package com.gamitour.daoImp;

import org.hibernate.SessionFactory;

import com.gamitour.dao.ItinerarioDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.Itinerario;
import com.gamitour.modelo.Parada;

public class ItinerarioDAOImp extends GenericDAOImp<Itinerario, String> implements ItinerarioDAO{

	SessionFactory sf;
	
	public ItinerarioDAOImp(SessionFactory sf) {
		super(sf);
		this.sf = sf;
	}
	
	public void borrar(Itinerario itinerario){
		for(Parada p: itinerario.getParadas()){	//eliminacion de paradas asociadas a un itinerario
			secuenciaBorrado(p);
		}
		
		secuenciaBorrado(itinerario);
		
		System.out.println("Se ha eliminado el itinerario " + itinerario.getNombre() + " de la base de datos.");
	}
}
