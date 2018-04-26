package com.gamitour.modelo;
// Generated Apr 26, 2018 12:27:42 PM by Hibernate Tools 5.2.10.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * Cliente generated by hbm2java
 */
@Entity
@Table(name = "cliente", catalog = "gamitour", uniqueConstraints = @UniqueConstraint(columnNames = "email"))
public class Cliente implements java.io.Serializable {

	private Integer idcliente;
	private Rol rol;
	private String nombre;
	private String apellidos;
	private Date fechanacimiento;
	private String email;
	private String password;
	private String telefono;
	private String direccion;
	private String codigopostal;
	private String avatar;
	private int puntosacumulados;
	private Date fecharegistro;
	private Set<Premio> premios = new HashSet<Premio>(0);
	private Set<Voto> votos = new HashSet<Voto>(0);
	private Set<Comentario> comentarios = new HashSet<Comentario>(0);
	private Set<ClienteHasActividad> clienteHasActividads = new HashSet<ClienteHasActividad>(0);
	private Set<Multimedia> multimedias = new HashSet<Multimedia>(0);

	public Cliente() {
	}

	public Cliente(Rol rol, String nombre, String apellidos, Date fechanacimiento, String email, String password,
			int puntosacumulados, Date fecharegistro) {
		this.rol = rol;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fechanacimiento = fechanacimiento;
		this.email = email;
		this.password = password;
		this.puntosacumulados = puntosacumulados;
		this.fecharegistro = fecharegistro;
	}

	public Cliente(Rol rol, String nombre, String apellidos, Date fechanacimiento, String email, String password,
			String telefono, String direccion, String codigopostal, String avatar, int puntosacumulados,
			Date fecharegistro, Set<Premio> premios, Set<Voto> votos, Set<Comentario> comentarios,
			Set<ClienteHasActividad> clienteHasActividads, Set<Multimedia> multimedias) {
		this.rol = rol;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fechanacimiento = fechanacimiento;
		this.email = email;
		this.password = password;
		this.telefono = telefono;
		this.direccion = direccion;
		this.codigopostal = codigopostal;
		this.avatar = avatar;
		this.puntosacumulados = puntosacumulados;
		this.fecharegistro = fecharegistro;
		this.premios = premios;
		this.votos = votos;
		this.comentarios = comentarios;
		this.clienteHasActividads = clienteHasActividads;
		this.multimedias = multimedias;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idcliente", unique = true, nullable = false)
	public Integer getIdcliente() {
		return this.idcliente;
	}

	public void setIdcliente(Integer idcliente) {
		this.idcliente = idcliente;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "rol_idrol", nullable = false)
	public Rol getRol() {
		return this.rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

	@Column(name = "nombre", nullable = false, length = 60)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Column(name = "apellidos", nullable = false, length = 60)
	public String getApellidos() {
		return this.apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fechanacimiento", nullable = false, length = 10)
	public Date getFechanacimiento() {
		return this.fechanacimiento;
	}

	public void setFechanacimiento(Date fechanacimiento) {
		this.fechanacimiento = fechanacimiento;
	}

	@Column(name = "email", unique = true, nullable = false, length = 45)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "password", nullable = false, length = 45)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "telefono", length = 45)
	public String getTelefono() {
		return this.telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	@Column(name = "direccion", length = 60)
	public String getDireccion() {
		return this.direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	@Column(name = "codigopostal", length = 10)
	public String getCodigopostal() {
		return this.codigopostal;
	}

	public void setCodigopostal(String codigopostal) {
		this.codigopostal = codigopostal;
	}

	@Column(name = "avatar", length = 45)
	public String getAvatar() {
		return this.avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@Column(name = "puntosacumulados", nullable = false)
	public int getPuntosacumulados() {
		return this.puntosacumulados;
	}

	public void setPuntosacumulados(int puntosacumulados) {
		this.puntosacumulados = puntosacumulados;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fecharegistro", nullable = false, length = 10)
	public Date getFecharegistro() {
		return this.fecharegistro;
	}

	public void setFecharegistro(Date fecharegistro) {
		this.fecharegistro = fecharegistro;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "cliente")
	public Set<Premio> getPremios() {
		return this.premios;
	}

	public void setPremios(Set<Premio> premios) {
		this.premios = premios;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "cliente")
	public Set<Voto> getVotos() {
		return this.votos;
	}

	public void setVotos(Set<Voto> votos) {
		this.votos = votos;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "cliente")
	public Set<Comentario> getComentarios() {
		return this.comentarios;
	}

	public void setComentarios(Set<Comentario> comentarios) {
		this.comentarios = comentarios;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "cliente")
	public Set<ClienteHasActividad> getClienteHasActividads() {
		return this.clienteHasActividads;
	}

	public void setClienteHasActividads(Set<ClienteHasActividad> clienteHasActividads) {
		this.clienteHasActividads = clienteHasActividads;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "cliente")
	public Set<Multimedia> getMultimedias() {
		return this.multimedias;
	}

	public void setMultimedias(Set<Multimedia> multimedias) {
		this.multimedias = multimedias;
	}

}
