package com.gamitour.daoImp;

import java.util.List;

import javax.persistence.Query;
import org.hibernate.SessionFactory;

import com.gamitour.dao.ClienteDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.ClienteHasActividad;
import com.gamitour.modelo.Comentario;
import com.gamitour.modelo.Multimedia;
import com.gamitour.modelo.Premio;
import com.gamitour.modelo.Voto;

public class ClienteDAOImp extends GenericDAOImp<Cliente, String> implements ClienteDAO{

	SessionFactory sf;
	
	public ClienteDAOImp(SessionFactory sf) {
		super(sf);
		this.sf = sf;
	}

	@Override
	public Cliente buscarPorEmail(String email) {
		Cliente cliente;
		
		sf.getCurrentSession().beginTransaction(); //se inicia la conexion con la bd
		Query q = sf.getCurrentSession().createQuery("select c from Cliente c where email = :email"); //se crea la secuencia de búsqueda
		q.setParameter("email", email); //se asigna el valor al a busqueda
		cliente = (Cliente) q.getSingleResult(); // se obtiene el resultado
		sf.getCurrentSession().getTransaction().commit(); //se guardan los cambios en la bd
		sf.getCurrentSession().close(); //se cierra la conexion con la bd
		
		return cliente;
	}
	
	public void borrar(Cliente cliente){
		
		for(Premio p: cliente.getPremios()){ //borrado de los premios asociados al cliente
			secuenciaBorrado(p);
		}
		
		for(Voto v: cliente.getVotos()){ //borrado de los votos asociados al cliente
			secuenciaBorrado(v);
		}
		
		for(Comentario c: cliente.getComentarios()){ //borrado de los comentarios asociados al cliente
			secuenciaBorrado(c);
		}
		
		for(ClienteHasActividad a: cliente.getClienteHasActividads()){ //modificacion de las actividades en las que participaba el cliente
			a.getActividad().setNumparticipantes(a.getActividad().getNumparticipantes() -1);
			sf.getCurrentSession().beginTransaction();
			sf.getCurrentSession().update(a);
			sf.getCurrentSession().getTransaction().commit();
		}
		
		for(Multimedia m: cliente.getMultimedias()){ //borrado de los multimedias asociados al cliente
			secuenciaBorrado(m);
		}
		
		secuenciaBorrado(cliente);
		
		System.out.println("Se ha eliminado el cliente " + cliente.getEmail() + " de la base de datos.");
	}
	
	public List<String> buscarEmails() {
		List<String> emails;
		
		sf.getCurrentSession().beginTransaction();
		Query q = sf.getCurrentSession().createQuery("select c.email from Cliente c");
		emails = q.getResultList();
		sf.getCurrentSession().getTransaction().commit();
		sf.getCurrentSession().close();
		
		return emails;
	}

	@Override
	public int buscarPuntos(String email) {
		int puntos;
		
		sf.getCurrentSession().beginTransaction();
		Query q = sf.getCurrentSession().createQuery("select c.puntosacumulados from Cliente c where email = :email");
		q.setParameter("email", email);
		puntos = (int) q.getSingleResult();
		sf.getCurrentSession().getTransaction().commit();
		sf.getCurrentSession().close();
		
		return puntos;
	}

}
