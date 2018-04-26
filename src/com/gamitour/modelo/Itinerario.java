package com.gamitour.modelo;
// Generated Apr 26, 2018 12:27:42 PM by Hibernate Tools 5.2.10.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Itinerario generated by hbm2java
 */
@Entity
@Table(name = "itinerario", catalog = "gamitour", uniqueConstraints = @UniqueConstraint(columnNames = "nombre"))
public class Itinerario implements java.io.Serializable {

	private int iditinerario;
	private String nombre;
	private String categoria;
	private String duracion;
	private String latitud;
	private String longitud;
	private Set<Parada> paradas = new HashSet<Parada>(0);

	public Itinerario() {
	}

	public Itinerario(int iditinerario, String nombre, String categoria, String duracion, String latitud,
			String longitud) {
		this.iditinerario = iditinerario;
		this.nombre = nombre;
		this.categoria = categoria;
		this.duracion = duracion;
		this.latitud = latitud;
		this.longitud = longitud;
	}

	public Itinerario(int iditinerario, String nombre, String categoria, String duracion, String latitud,
			String longitud, Set<Parada> paradas) {
		this.iditinerario = iditinerario;
		this.nombre = nombre;
		this.categoria = categoria;
		this.duracion = duracion;
		this.latitud = latitud;
		this.longitud = longitud;
		this.paradas = paradas;
	}

	@Id

	@Column(name = "iditinerario", unique = true, nullable = false)
	public int getIditinerario() {
		return this.iditinerario;
	}

	public void setIditinerario(int iditinerario) {
		this.iditinerario = iditinerario;
	}

	@Column(name = "nombre", unique = true, nullable = false, length = 60)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "categoria", nullable = false, length = 45)
	public String getCategoria() {
		return this.categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	@Column(name = "duracion", nullable = false, length = 15)
	public String getDuracion() {
		return this.duracion;
	}

	public void setDuracion(String duracion) {
		this.duracion = duracion;
	}

	@Column(name = "latitud", nullable = false, length = 45)
	public String getLatitud() {
		return this.latitud;
	}

	public void setLatitud(String latitud) {
		this.latitud = latitud;
	}

	@Column(name = "longitud", nullable = false, length = 45)
	public String getLongitud() {
		return this.longitud;
	}

	public void setLongitud(String longitud) {
		this.longitud = longitud;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "itinerario")
	public Set<Parada> getParadas() {
		return this.paradas;
	}

	public void setParadas(Set<Parada> paradas) {
		this.paradas = paradas;
	}

}
