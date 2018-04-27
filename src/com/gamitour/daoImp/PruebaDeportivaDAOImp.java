package com.gamitour.daoImp;

import org.hibernate.SessionFactory;

import com.gamitour.dao.PruebaDeportivaDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.Comentario;
import com.gamitour.modelo.Multimedia;
import com.gamitour.modelo.Pruebadeportiva;
import com.gamitour.modelo.Voto;

public class PruebaDeportivaDAOImp extends GenericDAOImp<Pruebadeportiva, String> implements PruebaDeportivaDAO{

	SessionFactory sf;
	
	public PruebaDeportivaDAOImp(SessionFactory sf) {
		super(sf);
		this.sf = sf;
	}
	
	public void borrar(Pruebadeportiva prueba){
		for(Multimedia m: prueba.getMultimedias()){
			for(Voto v: m.getVotos()){
				secuenciaBorrado(v);
			}
			
			for(Comentario c: m.getComentarios()){
				secuenciaBorrado(c);
			}
			
			secuenciaBorrado(m);
		}
		
		secuenciaBorrado(prueba);
		
		System.out.println("Se ha eliminado la prueba deportiva " + prueba.getNombre() + " de la base de datos.");
	}
}
