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

/**
 * Voto generated by hbm2java
 */
@Entity
@Table(name = "voto", catalog = "gamitour")
public class Voto implements java.io.Serializable {

	private Integer idvoto;
	private Cliente cliente;
	private Multimedia multimedia;
	private int puntos;

	public Voto() {
	}

	public Voto(Cliente cliente, Multimedia multimedia, int puntos) {
		this.cliente = cliente;
		this.multimedia = multimedia;
		this.puntos = puntos;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idvoto", unique = true, nullable = false)
	public Integer getIdvoto() {
		return this.idvoto;
	}

	public void setIdvoto(Integer idvoto) {
		this.idvoto = idvoto;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cliente_idcliente", nullable = false)
	public Cliente getCliente() {
		return this.cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "multimedia_idmultimedia", nullable = false)
	public Multimedia getMultimedia() {
		return this.multimedia;
	}

	public void setMultimedia(Multimedia multimedia) {
		this.multimedia = multimedia;
	}

	@Column(name = "puntos", nullable = false)
	public int getPuntos() {
		return this.puntos;
	}

	public void setPuntos(int puntos) {
		this.puntos = puntos;
	}

}
