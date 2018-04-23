package com.gamitour.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.gamitour.dao.*;
import com.gamitour.daoImp.*;

public class MySQLDaoFactory {
	
	SessionFactory sf;
	
	public MySQLDaoFactory(){
		sf = new Configuration().configure().buildSessionFactory();
	}
	
	public ClienteDAO getClienteDAO(){
		return new ClienteDAOImp(sf);
	}
	
	public RolDAO getRolDAO(){
		return new RolDAOImp(sf);
	}
	
	public ActividadDAO getActividadDAO(){
		return new ActividadDAOImp(sf);
	}
	
	public ComentarioDAO getComentarioDAO(){
		return new ComentarioDAOImp(sf);
	}
	
	public ItinerarioDAO getItinerarioDAO(){
		return new ItinerarioDAOImp(sf);
	}
	
	public MultimediaDAO getMultimediaDAO(){
		return new MultimediaDAOImp(sf);
	}
	
	public NoticiaDAO getNoticiaDAO(){
		return new NoticiaDAOImp(sf);
	}
	
	public ParadaDAO getParadaDAO(){
		return new ParadaDAOImp(sf);
	}
	
	public PremioDAO getPremioDAO(){
		return new PremioDAOImp(sf);
	}
	
	public PruebaCulturalDAO getPruebaCulturalDAO(){
		return new PruebaCulturalDAOImp(sf);
	}
	
	public PruebaDeportivaDAO getPruebaDeportivaDAO(){
		return new PruebaDeportivaDAOImp(sf);
	}
	
	public VotoDAO getVotoDAO(){
		return new VotoDAOImp(sf);
	}
}

