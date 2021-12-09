package br.com.ifpe.belezamaster.model.profissional;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class Profissional {
private	int id;
@NotEmpty
@Pattern(regexp = "^[A-Za-z ]*$")
private String nome;
@NotEmpty
@Pattern(regexp = "^[A-Za-z ]*$")
private String profissao;
private String cpf;
private String email;
@NotEmpty
@Pattern(regexp = "^[A-Za-z0-9 ]*$")
private String endereco;
private String telefone;
private String celular;



//Get e Sets!
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getNome() {
	return nome;
}
public void setNome(String nome) {
	this.nome = nome.trim();
}
public String getProfissao() {
	return profissao;
}
public void setProfissao(String profissao) {
	this.profissao = profissao;
}
public String getCpf() {
	return cpf;
}
public void setCpf(String cpf) {
	this.cpf = cpf;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getEndereco() {
	return endereco;
}
public void setEndereco(String endereco) {
	this.endereco = endereco.trim();
}
public String getTelefone() {
	return telefone;
}
public void setTelefone(String telefone) {
	this.telefone = telefone;
}
public String getCelular() {
	return celular;
}
public void setCelular(String celular) {
	this.celular = celular;
}

}