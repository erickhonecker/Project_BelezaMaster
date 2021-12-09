package br.com.ifpe.belezamaster.model.reserva;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import br.com.ifpe.belezamaster.model.profissional.Profissional;
import br.com.ifpe.belezamaster.model.servico.Servico;
import br.com.ifpe.belezamaster.model.usuario.Usuario;

/**
 * "O campo  situacao poderá receber quatro valores
 * P(Pendente),A(Atendimento),F(Finalizado),C(Cancelado).
 *
 **/
public class Atendimento {
    @DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date horario;
	private int codigoAtendimento;
	private Profissional profissional;
	private Servico servico;
	private Usuario usuario;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date dataAtendimento;
	private String situacao;

	// GETs E SETS
	
	public Date getHorario() {
		return horario;
	}

	public void setHorario(Date horario) {
		this.horario = horario;
	}


	public int getCodigoAtendimento() {
		return codigoAtendimento;
	}

	public void setCodigoAtendimento(int codigoAtendimento) {
		this.codigoAtendimento = codigoAtendimento;
	}


	public Date getDataAtendimento() {
		return dataAtendimento;
	}

	public void setDataAtendimento(Date dataAtendimento) {
		this.dataAtendimento = dataAtendimento;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Profissional getProfissional() {
		return profissional;
	}

	public void setProfissional(Profissional profissional) {
		this.profissional = profissional;
	}

}


