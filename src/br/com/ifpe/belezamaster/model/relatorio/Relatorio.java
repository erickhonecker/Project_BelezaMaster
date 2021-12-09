package br.com.ifpe.belezamaster.model.relatorio;

import java.util.Date;

public class Relatorio {
	
	private String usuarioNome;
	private String profissionalNome;
	private Date servicoHorario;
	private double servicoValor;
	private String servicoDescricao;
	 
	public String getServicoDescricao() {
		return servicoDescricao;
	}
	public void setServicoDescricao(String servicoDescricao) {
		this.servicoDescricao = servicoDescricao;
	}
	public String getUsuarioNome() {
		return usuarioNome;
	}
	public void setUsuarioNome(String usuarioNome) {
		this.usuarioNome = usuarioNome;
	}
	public String getProfissionalNome() {
		return profissionalNome;
	}
	public void setProfissionalNome(String profissionalNome) {
		this.profissionalNome = profissionalNome;
	}
	public Date getServicoHorario() {
		return servicoHorario;
	}
	public void setServicoHorario(Date servicoHorario) {
		this.servicoHorario = servicoHorario;
	}
	public double getServicoValor() {
		return servicoValor;
	}
	public void setServicoValor(double servicoValor) {
		this.servicoValor = servicoValor;
	}

	

}
