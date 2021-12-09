package br.com.ifpe.belezamaster.model.usuario;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import br.com.ifpe.belezamaster.model.login.Perfil;

public class Usuario {

	
	@Override
	public String toString() {
		return "Usuario [nome=" + nome + ", email=" + email + ", senha=" + senha + ", confSenha=" + confSenha + ", cpf="
				+ cpf + ", telefone=" + telefone + ", celular=" + celular + "]";
	}

	
	@NotEmpty
	@Size(max = 50, message = " O nome deve deve ter no máximo 50 caracteres")
	@Pattern(regexp = "^[A-Za-z ]*$")
	private String nome;

	@NotEmpty
	@Size(max = 50, message = " O E-mail deve deve ter no máximo 50 caracteres")
	private String email;

	@Size(min = 6, max = 32, message = "A senha deve ter no minímo 6 e no maximo 70 caracteres")
	private String senha;

	@Size(min = 6, max = 32, message = "A senha deve ter no minímo 6 e no maximo 70 caracteres")
	private String confSenha;

	@Size(min = 14, max = 14, message = "O CPF deve ter obrigatoriamente 14 caracteres, seguindo o seguinte padrão (XXX.XXX.XXX-XX)")
	private String cpf;

	@NotEmpty
	@Size(max = 14, message = " O Telefone deve deve ter no máximo 13 caracteres, seguindo o padrão '(XX)XXXXX-XXXX' ")
	private String telefone;

	@NotEmpty
	@Size(max = 15, message = " O Telefone deve deve ter no máximo 13 caracteres, seguindo o padrã	o '(XX)XXXXX-XXXX' ")
	private String celular;

	private Perfil perfil;

	public Perfil getPerfil() {
		return perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getConfSenha() {
		return confSenha;
	}

	public void setConfSenha(String confSenha) {
		this.confSenha = confSenha;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
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
