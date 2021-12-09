package br.com.ifpe.belezamaster.model.produto;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class Produto {
	
	
	@NotEmpty(message = "Não é permitido caracteres e especias.")
	@Pattern(regexp = "^[A-Za-z0-9 ]*$")
	private String nomeProduto;
	@NotEmpty()
	@Pattern(regexp = "^[A-Za-z0-9 ]*$" , message = "Não é permitido caracteres e especias.") 
	private String descricao;
	private int codigo;
	private int quantidade;
	
	private double valor;
	
	
	public String getNomeProduto() {
		return nomeProduto;
	}
	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto.trim();
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao.trim();
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	
}