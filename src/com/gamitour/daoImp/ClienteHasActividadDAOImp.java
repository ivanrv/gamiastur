package com.gamitour.daoImp;

import javax.persistence.Query;

import org.hibernate.SessionFactory;

import com.gamitour.dao.ClienteHasActividadDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.Actividad;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.ClienteHasActividad;

public class ClienteHasActividadDAOImp extends GenericDAOImp<ClienteHasActividad, String> implements ClienteHasActividadDAO{

	SessionFactory sf;
	
	public ClienteHasActividadDAOImp(SessionFactory sf) {
		super(sf);
		this.sf = sf;
	}

	@Override
	public ClienteHasActividad buscarReserva(Actividad actividad, Cliente cliente) {
		ClienteHasActividad reserva;
		
		sf.getCurrentSession().beginTransaction();
		Query q = sf.getCurrentSession().createQuery("select r from ClienteHasActividad r where cliente_idcliente = :idcliente and actividad_idactividad = :idactividad");
		q.setParameter("idcliente", cliente.getIdcliente());
		q.setParameter("idactividad", actividad.getIdactividad());
		reserva = (ClienteHasActividad) q.getSingleResult();
		sf.getCurrentSession().getTransaction().commit();
		sf.getCurrentSession().close();
		
		return reserva;
	}

}
