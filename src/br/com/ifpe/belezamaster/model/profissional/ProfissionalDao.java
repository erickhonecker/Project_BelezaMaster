package br.com.ifpe.belezamaster.model.profissional;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import br.com.ifpe.belezamaster.model.usuario.ViolacaoIntegridadeException;
import br.com.ifpe.belezamaster.util.ConnectionFactory;

public class ProfissionalDao {

	private Connection connection;

	
	public ProfissionalDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	//Me Salvar

	public void salvar(Profissional profissional) {
		try {
			String sql = "INSERT INTO PROFISSIONAL ( nome, profissao, cpf ,email , endereco ,telefone ,celular) VALUES (?,?,?,?,?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, profissional.getNome());
			stmt.setString(2, profissional.getProfissao());
			stmt.setString(3, profissional.getCpf());
			stmt.setString(4, profissional.getEmail());
			stmt.setString(5, profissional.getEndereco());
			stmt.setString(6, profissional.getTelefone());
			stmt.setString(7, profissional.getCelular());

			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
//Buscar por ID
	public Profissional buscarPorId(int id) {

		try {
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM PROFISSIONAL WHERE id = ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			Profissional profissional = null;
			if (rs.next()) {
				profissional = montarObjeto(rs);
			}

			rs.close();
			stmt.close();
			connection.close();
			return profissional;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//Buscar por E-mail
		public Profissional buscarPorEmail(String email) {

			try {
				PreparedStatement stmt = connection.prepareStatement("SELECT * FROM PROFISSIONAL WHERE email = ?");
				stmt.setString(1, email);
				ResultSet rs = stmt.executeQuery();

				Profissional profissional = null;
				if (rs.next()) {
					profissional = montarObjeto(rs);
				}

				rs.close();
				stmt.close();
				connection.close();
				return profissional;

			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
	// Alterar

	public void alterar(Profissional profissional) {
		String sql = "UPDATE PROFISSIONAL SET nome = ?, profissao = ?, email = ?, endereco = ?,telefone = ?,celular = ? WHERE id=?";


		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, profissional.getNome());
			stmt.setString(2, profissional.getProfissao());
			stmt.setString(3, profissional.getEmail());
			stmt.setString(4, profissional.getEndereco());
			stmt.setString(5, profissional.getTelefone());
			stmt.setString(6, profissional.getCelular());
			stmt.setInt(7, profissional.getId());


			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Remover

	public void remover(Profissional profissional) throws ViolacaoIntegridadeException {

		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM PROFISSIONAL WHERE id = ?");
			stmt.setInt(1, profissional.getId());
			stmt.execute();
			stmt.close();
			connection.close();
		}catch(MySQLIntegrityConstraintViolationException e){
			throw new ViolacaoIntegridadeException();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// BuscarPorNome

	
	//Buscar profissional por nome
		public List<Profissional> buscar(String nome) {
			try {
				List<Profissional> listarProfissional = new ArrayList<Profissional>();
				PreparedStatement stmt = null;
				stmt = connection.prepareStatement("SELECT * FROM PROFISSIONAL WHERE nome like ?");
				stmt.setString(1, "%" + nome + "%");
				ResultSet rs = stmt.executeQuery();

				while (rs.next()) {
					listarProfissional.add(montarObjeto(rs));
				}

				rs.close();
				stmt.close();

				return listarProfissional;
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
	
	
	// Listar profissional
			public List<Profissional> listar() {

				try {
					List<Profissional> listarProfissional = new ArrayList<Profissional>();
					PreparedStatement stmt = (PreparedStatement) this.connection
							.prepareStatement("SELECT * FROM PROFISSIONAL ORDER BY nome");

					ResultSet rs = stmt.executeQuery();

					while (rs.next()) {
						listarProfissional.add(montarObjeto(rs));
					}

					rs.close();
					stmt.close();
					connection.close();

					return listarProfissional;
				} catch (SQLException e) {
					throw new RuntimeException(e);
				}
			}

			// Buscar usuario Por CPF
			public Profissional buscarPorCpf(String cpf) {

				try {
					PreparedStatement stmt = connection.prepareStatement("SELECT * FROM PROFISSIONAL WHERE cpf = ?");
					stmt.setString(1, cpf);
					ResultSet rs = stmt.executeQuery();

					Profissional profissional = null;
					if (rs.next()) {
						profissional = montarObjeto(rs);
					}

					rs.close();
					stmt.close();
					connection.close();
					return profissional;

				} catch (SQLException e) {
					throw new RuntimeException(e);
				}
			}
	
	// Montar o Objeto

	private Profissional montarObjeto(ResultSet rs) throws SQLException {

		Profissional profissional = new Profissional();

		profissional.setId(rs.getInt("id"));
		profissional.setNome(rs.getString("nome"));
		profissional.setProfissao(rs.getString("profissao"));
		profissional.setCpf(rs.getString("cpf"));
		profissional.setEmail(rs.getString("email"));
		profissional.setEndereco(rs.getString("endereco"));
		profissional.setTelefone(rs.getString("telefone"));
		profissional.setCelular(rs.getString("celular"));
		return profissional;

	}
}
