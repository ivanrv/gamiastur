package com.gamitour.daoImp;

import org.hibernate.SessionFactory;

import com.gamitour.dao.ItinerarioDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.Comentario;
import com.gamitour.modelo.Itinerario;
import com.gamitour.modelo.Multimedia;
import com.gamitour.modelo.Parada;
import com.gamitour.modelo.PruebaCultural;
import com.gamitour.modelo.PruebaDeportiva;
import com.gamitour.modelo.Voto;

public class ItinerarioDAOImp extends GenericDAOImp<Itinerario, String> implements ItinerarioDAO{

	SessionFactory sf;
	
	public ItinerarioDAOImp(SessionFactory sf) {
		super(sf);
		this.sf = sf;
	}
	
	public void borrar(Itinerario itinerario){
		for(Parada p: itinerario.getParadas()){	//eliminacion de paradas asociadas a un itinerario
			
			for(PruebaCultural pc: p.getPruebasCulturales()){	//eliminacion de pruebas culturales asociadas a la parada
				secuenciaBorrado(pc);
			}
			
			for(PruebaDeportiva pd: p.getPruebasDeportivas()){	//eliminacion de pruebas deportivas asociadas a la parada
				for(Multimedia m: pd.getMultimedias()){	//eliminacion de multimedias asociados a la prueba
					for(Voto v: m.getVotos()){
						secuenciaBorrado(v);
					}
					
					for(Comentario c: m.getComentarios()){
						secuenciaBorrado(c);
					}
					
					secuenciaBorrado(m);
				}
				
				secuenciaBorrado(pd);
			}
			
			secuenciaBorrado(p);
		}
		
		secuenciaBorrado(itinerario);
		
		System.out.println("Se ha eliminado el itinerario " + itinerario.getNombre() + " de la base de datos.");
	}
}
