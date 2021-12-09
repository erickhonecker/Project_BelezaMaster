package br.com.ifpe.belezamaster.model.usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import br.com.ifpe.belezamaster.model.login.Perfil;
import br.com.ifpe.belezamaster.util.ConnectionFactory;

public class UsuarioDao {

	private Connection connection;

	public UsuarioDao() {

		
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Salvar Usuario
	public void salvar(Usuario usuario) {

		String sql = "INSERT INTO USUARIO (cpf, nome, email, senha, telefone, celular, codigo_perfil) VALUES (?,?,?,?,?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);

			stmt.setString(1, usuario.getCpf());
			stmt.setString(2, usuario.getNome());
			stmt.setString(3, usuario.getEmail());
			stmt.setString(4, DigestUtils.md5Hex(usuario.getSenha()));
			stmt.setString(5, usuario.getTelefone());
			stmt.setString(6, usuario.getCelular());
			stmt.setInt(7, usuario.getPerfil().getCodigo());


			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Buscar usuario Por CPF
	public Usuario buscarPorCpf(String cpf) {

		try {
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM USUARIO WHERE cpf = ?");
			stmt.setString(1, cpf);
			ResultSet rs = stmt.executeQuery();

			Usuario usuario = null;
			if (rs.next()) {
				usuario = montarObjeto(rs);
			}

			rs.close();
			stmt.close();
			connection.close();
			return usuario;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// buscar por nome
				public List<Usuario> buscar(String nome) {
					try {
						List<Usuario> listarUsuario = new ArrayList<Usuario>();
						PreparedStatement stmt = null;
						if (!nome.equals("")) {
							stmt = this.connection.prepareStatement("SELECT * FROM USUARIO WHERE nome LIKE ?");
							stmt.setString(1, "%" + nome + "%");
						} else if (nome.equals("")) {
							stmt = this.connection.prepareStatement("SELECT * FROM USUARIO ORDER BY nome");
						}
						ResultSet rs = stmt.executeQuery();
						while (rs.next()) {
							listarUsuario.add(montarObjeto(rs));
						}
						rs.close();
						stmt.close();
						connection.close();
						return listarUsuario;

					} catch (SQLException e) {

						throw new RuntimeException(e);
					}

				}

	// Alterar Usuario
	public void alterar(Usuario usuario) {

		String sql = "UPDATE USUARIO SET nome = ? , email = ? , telefone = ? , celular = ? WHERE cpf = ?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getNome());
			stmt.setString(2, usuario.getEmail());
			stmt.setString(3, usuario.getTelefone());
			stmt.setString(4, usuario.getCelular());
			stmt.setString(5, usuario.getCpf());

			stmt.execute();
			stmt.close();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	// Alterar Senha
		public void alterarSenha(Usuario usuario) {

			String sql = "UPDATE USUARIO SET senha = ?  WHERE cpf = ?";

			try {
				PreparedStatement stmt = connection.prepareStatement(sql);
				
				stmt.setString(1, DigestUtils.md5Hex(usuario.getSenha()));
				stmt.setString(2, usuario.getCpf());

				stmt.execute();
				stmt.close();
				connection.close();

			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
	

	// remover Usuario
	public void remover(Usuario usuario) throws ViolacaoIntegridadeException {

		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM USUARIO WHERE cpf = ?");
			stmt.setString(1, usuario.getCpf());
			stmt.execute();
			stmt.close();
			connection.close();
		}catch(MySQLIntegrityConstraintViolationException e){
			throw new ViolacaoIntegridadeException();
			
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//Buscar por E-mail
			public Usuario buscarPorEmail(String email) {

				try {
					PreparedStatement stmt = connection.prepareStatement("SELECT * FROM USUARIO WHERE email = ?");
					stmt.setString(1, email);
					ResultSet rs = stmt.executeQuery();

					Usuario usuario = null;
					if (rs.next()) {
						usuario = montarObjeto(rs);
					}

					rs.close();
					stmt.close();
					connection.close();
					return usuario;

				} catch (SQLException e) {
					throw new RuntimeException(e);
				}
			}
			
			// listar Usuario
			public List<Usuario> listar() {

				try {
					List<Usuario> listarUsuario = new ArrayList<Usuario>();
					PreparedStatement stmt = (PreparedStatement) this.connection
							.prepareStatement("SELECT * FROM USUARIO ORDER BY nome");

					ResultSet rs = stmt.executeQuery();

					while (rs.next()) {
						listarUsuario.add(montarObjeto(rs));
					}

					rs.close();
					stmt.close();
					connection.close();

					return listarUsuario;
				} catch (SQLException e) {
					throw new RuntimeException(e);
				}
			}
			
			
	// Buscar Usuario Login

	public Usuario buscarUsuario(Usuario usuario) {
		try {
			Usuario usuarioConsultado = null;
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from USUARIO where email = ? and senha = ?");
			stmt.setString(1, usuario.getEmail());
			stmt.setString(2, DigestUtils.md5Hex(usuario.getSenha()));
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				usuarioConsultado = montarObjeto(rs);
			}
			rs.close();
			stmt.close();
			return usuarioConsultado;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
	private Usuario montarObjeto(ResultSet rs) throws SQLException {

		Usuario usuario = new Usuario();
		usuario.setNome(rs.getString("nome"));
		usuario.setEmail(rs.getString("email"));
		usuario.setTelefone(rs.getString("Telefone"));
		usuario.setCelular(rs.getString("celular"));
		usuario.setCpf(rs.getString("cpf"));
		
		Perfil perfil = new Perfil();
		perfil.setCodigo(rs.getInt("codigo_perfil"));
        usuario.setPerfil(perfil);
		return usuario;
	}
}
