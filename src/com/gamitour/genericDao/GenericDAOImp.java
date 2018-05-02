package com.gamitour.genericDao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.SessionFactory;

public class GenericDAOImp<T, Id extends Serializable> implements GenericDAO<T, Id> {

	private Class<T> claseDePersistencia;
	SessionFactory sf;
	
	public GenericDAOImp(SessionFactory sf) {
		this.sf = sf;
		this.claseDePersistencia = (Class<T>)((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}

	@Override
	public List<T> buscarTodos() {
		ArrayList<T> lista = new ArrayList<T>();
		
		sf.getCurrentSession().beginTransaction(); //se inicia la conexión con la bd
		Query q = sf.getCurrentSession().createQuery("select o from " + claseDePersistencia.getSimpleName() + " o"); //se crea la secuencia de búsqueda
		lista = (ArrayList<T>) q.getResultList(); //se crea la lista con los resultados
		sf.getCurrentSession().getTransaction().commit(); //se guardan los cambios
		sf.getCurrentSession().close(); // se cierra la conexión con la bd
		
		return lista;
	}

	@Override
	public void insertar(T objeto) {
		sf.getCurrentSession().beginTransaction(); //se incia la conexion con la bd
		sf.getCurrentSession().save(objeto); //se elimina el objeto
		sf.getCurrentSession().getTransaction().commit(); //se guardan los cambios
		sf.getCurrentSession().close(); //se cierra la transaccion
		System.out.println("Se ha insertado el objeto de tipo " + claseDePersistencia.getSimpleName());
	}

	@Override
	public void borrar(T objeto) {
		sf.getCurrentSession().beginTransaction(); //se incia la conexion con la bd
		sf.getCurrentSession().delete(objeto); //se inserta el objeto
		sf.getCurrentSession().getTransaction().commit(); //se guardan los cambios
		sf.getCurrentSession().close(); //se cierra la transaccion
		System.out.println("Se ha eliminado el objeto de tipo " + claseDePersistencia.getSimpleName());
	}

	@Override
	public void actualizar(T objeto) {
		sf.getCurrentSession().beginTransaction(); //se incia la conexion con la bd
		sf.getCurrentSession().update(objeto); //se actualiza el objeto
		sf.getCurrentSession().getTransaction().commit(); //se guardan los cambios
		sf.getCurrentSession().close(); //se cierra la transaccion
		System.out.println("Se ha actualizado el objeto de tipo " + claseDePersistencia.getSimpleName());
	}

	@Override
	public T buscarPorNombre(String nombre) {
		T objeto;
		
		sf.getCurrentSession().beginTransaction(); //se inicia la conexion con la bd
		Query q = sf.getCurrentSession().createQuery("select o from " + claseDePersistencia.getSimpleName() + " o where nombre = :nombre"); //creacion de secuencia de busqueda
		q.setParameter("nombre", nombre); //asignacion de variable
		objeto = (T) q.getSingleResult();
		sf.getCurrentSession().getTransaction().commit(); //guardado de cambios
		sf.getCurrentSession().close(); //cierre de la conexion
		
		return objeto;
	}

	@Override
	public void secuenciaBorrado(Object o){
		sf.getCurrentSession().beginTransaction();
		sf.getCurrentSession().delete(o);
		sf.getCurrentSession().getTransaction().commit();
		sf.getCurrentSession().close();
	}

	@Override
	public List<String> buscarNombres() {
		List<String> nombres;
		
		sf.getCurrentSession().beginTransaction();
		Query q = sf.getCurrentSession().createQuery("select o.nombre from " + claseDePersistencia.getSimpleName() + " o");
		nombres = q.getResultList();
		sf.getCurrentSession().getTransaction().commit();
		sf.getCurrentSession().close();
		
		return nombres;
	}
	
	
}
