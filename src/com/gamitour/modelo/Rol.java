package com.gamitour.modelo;
// Generated Apr 26, 2018 12:27:42 PM by Hibernate Tools 5.2.10.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Rol generated by hbm2java
 */
@Entity
@Table(name = "rol", catalog = "gamitour")
public class Rol implements java.io.Serializable {

	private Integer idrol;
	private String nombre;
	private Set<Cliente> clientes = new HashSet<Cliente>(0);

	public Rol() {
	}

	public Rol(String nombre) {
		this.nombre = nombre;
	}

	public Rol(String nombre, Set<Cliente> clientes) {
		this.nombre = nombre;
		this.clientes = clientes;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idrol", unique = true, nullable = false)
	public Integer getIdrol() {
		return this.idrol;
	}

	public void setIdrol(Integer idrol) {
		this.idrol = idrol;
	}

	@Column(name = "nombre", nullable = false, length = 60)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "rol")
	public Set<Cliente> getClientes() {
		return this.clientes;
	}

	public void setClientes(Set<Cliente> clientes) {
		this.clientes = clientes;
	}

}
