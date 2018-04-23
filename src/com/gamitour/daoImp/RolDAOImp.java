package com.gamitour.daoImp;
import org.hibernate.SessionFactory;

import com.gamitour.dao.RolDAO;
import com.gamitour.genericDao.GenericDAOImp;
import com.gamitour.modelo.Cliente;
import com.gamitour.modelo.Rol;

public class RolDAOImp extends GenericDAOImp<Rol, String> implements RolDAO{
	
	SessionFactory sf;

	public RolDAOImp(SessionFactory sf) {
		super(sf);
		this.sf = sf;
	}

	public void borrar(Rol rol){
		
		for(Cliente c: rol.getClientes()){ //cambio de rol de todos los usuarios al rol por defecto (user)
			c.setRol(buscarPorNombre("user"));
			sf.getCurrentSession().beginTransaction();
			sf.getCurrentSession().update(c);
			sf.getCurrentSession().getTransaction().commit();;
		}
		
		secuenciaBorrado(rol);
		
		System.out.println("Se ha eliminado el rol " + rol.getNombre() + " de la base de datos.");
	}
	
}
