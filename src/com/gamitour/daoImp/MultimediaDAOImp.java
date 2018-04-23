package com.gamitour.daoImp;

import javax.persistence.Query;

import org.hibernate.SessionFactory;
import com.gamitour.dao.MultimediaDAO;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Comentario;
import com.gamitour.modelo.Multimedia;
import com.gamitour.modelo.PruebaDeportiva;
import com.gamitour.modelo.Voto;
import com.gamitour.genericDao.GenericDAOImp;

public class MultimediaDAOImp extends GenericDAOImp<Multimedia, String> implements MultimediaDAO{

	SessionFactory sf;
	
	public MultimediaDAOImp(SessionFactory sf) {
		super(sf);
		this.sf = sf;
	}

	@Override
	public Multimedia buscarMultimedia(Cliente cliente, PruebaDeportiva prueba) {
		Multimedia multimedia;
		
		sf.getCurrentSession().beginTransaction(); //conexion con la bd
		Query q = sf.getCurrentSession().createQuery("select m from Multimedia m where cliente_idcliente = :idcliente and pruebaDeportiva_idpruebadeportiva = :idprueba"); //secuencia de busqueda
		q.setParameter("idcliente", cliente.getIdcliente()); //asignacion idcliente
		q.setParameter("idprueba", prueba.getIdpruebadeportiva()); //asignacion idprueba
		multimedia = (Multimedia) q.getSingleResult(); //creacion objeto con el resultado
		sf.getCurrentSession().getTransaction().commit(); //guardado de cambios
		sf.getCurrentSession().close(); //cierre de la conexion con la bd
		
		return multimedia;
	}

	public void borrar(Multimedia multimedia){
		for(Comentario c: multimedia.getComentarios()){	//eliminacion comentarios asociados a multimedia
			secuenciaBorrado(c);
		}
		
		for(Voto v: multimedia.getVotos()){	//eliminacion de votos asociados al multimedia
			secuenciaBorrado(v);
		}
		
		secuenciaBorrado(multimedia);
		
		System.out.println("Se ha eliminado el multimedia con autor " + multimedia.getCliente().getNombre() + " asociado a la prueba " + multimedia.getPruebaDeportiva().getNombre() + " de la base de datos");
	}
}
