package br.com.ifpe.belezamaster.model.servico;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Servico {
     
	
	@NotEmpty(message="O campo deve ser preenchido")
	@Size(max= 30, message=" O nome do serviçoo deve ter no maximo 30 caracteres")
	@Pattern(regexp = "^[A-Za-z ]*$")
	private String nome;
	
	@NotEmpty(message=" O campo de ser preenchido")
	@Size(max= 50, message="A descricao deve ter no maximo 50 caracteres ")
	@Pattern(regexp = "^[A-Za-z ]*$")
	private String descricao;  
	
	private double valor;

	private int codigo;
	
	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome.trim();
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao.trim();
	}


	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}
}
