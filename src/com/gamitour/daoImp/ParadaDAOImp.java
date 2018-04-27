package com.gamitour.daoImp;

import org.hibernate.SessionFactory;

import com.gamitour.dao.ParadaDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.Comentario;
import com.gamitour.modelo.Multimedia;
import com.gamitour.modelo.Parada;
import com.gamitour.modelo.Pruebacultural;
import com.gamitour.modelo.Pruebadeportiva;
import com.gamitour.modelo.Voto;

public class ParadaDAOImp extends GenericDAOImp<Parada, String> implements ParadaDAO{

	SessionFactory sf;
	
	public ParadaDAOImp(SessionFactory sf) {
		super(sf);
		this.sf = sf;
	}
	
	public void borrar(Parada parada){
		for(Pruebacultural pc: parada.getPruebaculturals()){	//eliminacion de pruebas culturales asociadas a la parada
			secuenciaBorrado(pc);
		}
		
		for(Pruebadeportiva pd: parada.getPruebadeportivas()){	//eliminacion de pruebas deportivas asociadas a la parada
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
		
		secuenciaBorrado(parada);
		
		System.out.println("Se ha eliminado la parada " + parada.getNombre() + " de la base de datos.");
	}
}
