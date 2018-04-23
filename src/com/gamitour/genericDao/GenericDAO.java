package com.gamitour.genericDao;

import java.io.Serializable;
import java.util.List;

public interface GenericDAO<T, Id extends Serializable> {
	T buscarPorNombre(String nombre);
	List<T> buscarTodos();
	void insertar(T objeto);
	void borrar(T objeto);
	void actualizar(T objeto);
	void secuenciaBorrado(Object o);
}
