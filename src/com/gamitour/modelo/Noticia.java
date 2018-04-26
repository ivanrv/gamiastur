package com.gamitour.modelo;
// Generated Apr 26, 2018 12:27:42 PM by Hibernate Tools 5.2.10.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * Noticia generated by hbm2java
 */
@Entity
@Table(name = "noticia", catalog = "gamitour", uniqueConstraints = @UniqueConstraint(columnNames = "nombre"))
public class Noticia implements java.io.Serializable {

	private int idnoticia;
	private String nombre;
	private String texto;
	private Date fechaalta;
	private Date fechacaducidad;
	private String imagen;

	public Noticia() {
	}

	public Noticia(int idnoticia, String nombre, String texto, Date fechaalta, String imagen) {
		this.idnoticia = idnoticia;
		this.nombre = nombre;
		this.texto = texto;
		this.fechaalta = fechaalta;
		this.imagen = imagen;
	}

	public Noticia(int idnoticia, String nombre, String texto, Date fechaalta, Date fechacaducidad, String imagen) {
		this.idnoticia = idnoticia;
		this.nombre = nombre;
		this.texto = texto;
		this.fechaalta = fechaalta;
		this.fechacaducidad = fechacaducidad;
		this.imagen = imagen;
	}

	@Id

	@Column(name = "idnoticia", unique = true, nullable = false)
	public int getIdnoticia() {
		return this.idnoticia;
	}

	public void setIdnoticia(int idnoticia) {
		this.idnoticia = idnoticia;
	}

	@Column(name = "nombre", unique = true, nullable = false, length = 60)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "texto", nullable = false, length = 200)
	public String getTexto() {
		return this.texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fechaalta", nullable = false, length = 10)
	public Date getFechaalta() {
		return this.fechaalta;
	}

	public void setFechaalta(Date fechaalta) {
		this.fechaalta = fechaalta;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fechacaducidad", length = 10)
	public Date getFechacaducidad() {
		return this.fechacaducidad;
	}

	public void setFechacaducidad(Date fechacaducidad) {
		this.fechacaducidad = fechacaducidad;
	}

	@Column(name = "imagen", nullable = false, length = 45)
	public String getImagen() {
		return this.imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

}
