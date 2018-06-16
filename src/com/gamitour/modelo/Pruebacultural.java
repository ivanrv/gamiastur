package com.gamitour.modelo;
// Generated Apr 27, 2018 8:12:19 AM by Hibernate Tools 5.2.10.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Pruebacultural generated by hbm2java
 */
@Entity
@Table(name = "pruebacultural", catalog = "gamitour", uniqueConstraints = @UniqueConstraint(columnNames = "nombre"))
public class Pruebacultural implements java.io.Serializable {

	private Integer idpruebacultural;
	private Parada parada;
	private String nombre;
	private String pregunta;
	private String respuesta;
	private int puntos;
	private String fallo1;
	private String fallo2;
	private String fallo3;

	public Pruebacultural() {
	}

	public Pruebacultural(Parada parada, String nombre, String pregunta, String respuesta, int puntos, String fallo1) {
		this.parada = parada;
		this.nombre = nombre;
		this.pregunta = pregunta;
		this.respuesta = respuesta;
		this.puntos = puntos;
		this.fallo1 = fallo1;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idpruebacultural", unique = true, nullable = false)
	public Integer getIdpruebacultural() {
		return this.idpruebacultural;
	}

	public void setIdpruebacultural(Integer idpruebacultural) {
		this.idpruebacultural = idpruebacultural;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "parada_idparada", nullable = false)
	public Parada getParada() {
		return this.parada;
	}

	public void setParada(Parada parada) {
		this.parada = parada;
	}

	@Column(name = "nombre", unique = true, nullable = false, length = 60)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "pregunta", nullable = false, length = 200)
	public String getPregunta() {
		return this.pregunta;
	}

	public void setPregunta(String pregunta) {
		this.pregunta = pregunta;
	}

	@Column(name = "respuesta", nullable = false, length = 45)
	public String getRespuesta() {
		return this.respuesta;
	}

	public void setRespuesta(String respuesta) {
		this.respuesta = respuesta;
	}

	@Column(name = "puntos", nullable = false)
	public int getPuntos() {
		return this.puntos;
	}

	public void setPuntos(int puntos) {
		this.puntos = puntos;
	}
	
	@Column(name = "fallo1", nullable = false)
	public String getFallo1() {
		return this.fallo1;
	}

	public void setFallo1(String fallo1) {
		this.fallo1 = fallo1;
	}
	
	@Column(name = "fallo2")
	public String getFallo2() {
		return this.fallo2;
	}

	public void setFallo2(String fallo2) {
		this.fallo2 = fallo2;
	}
	
	@Column(name = "fallo3")
	public String getFallo3() {
		return this.fallo3;
	}

	public void setFallo3(String fallo3) {
		this.fallo3 = fallo3;
	}

}
