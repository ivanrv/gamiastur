package com.gamitour.daoImp;

import javax.persistence.Query;

import org.hibernate.SessionFactory;

import com.gamitour.dao.ComentarioDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Comentario;
import com.gamitour.modelo.Multimedia;

public class ComentarioDAOImp extends GenericDAOImp<Comentario, String> implements ComentarioDAO{

	SessionFactory sf;
	
	public ComentarioDAOImp(SessionFactory sf) {
		super(sf);
		this.sf = sf;
	}

	@Override
	public Comentario buscarComentario(Cliente cliente, Multimedia multimedia) {
		Comentario comentario;
		
		sf.getCurrentSession().beginTransaction(); //se inica la conexion con la bd
		Query q = sf.getCurrentSession().createQuery("select c from Comentario c where cliente_idcliente = :idcliente and multimedia_idmultimedia = :idmultimedia"); // creacion de la secuencia de busqueda
		q.setParameter("idcliente", cliente.getIdcliente()); //asignacion del valor del idcliente
		q.setParameter("idmultimedia", multimedia.getIdmultimedia()); //asignacion del valor del idmultimedia
		comentario = (Comentario) q.getSingleResult(); //obtencion de resultado
		sf.getCurrentSession().getTransaction().commit(); //guardado de los cambios
		sf.getCurrentSession().close(); //cierre de la consexion
		
		return comentario;
	}

}
