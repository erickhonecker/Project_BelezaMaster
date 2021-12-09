package br.com.ifpe.belezamaster.model.servico;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import br.com.ifpe.belezamaster.model.usuario.ViolacaoIntegridadeException;
import br.com.ifpe.belezamaster.util.ConnectionFactory;

public class ServicoDao {

	// abri conexão
	private Connection connection;

	public ServicoDao() {

		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// aqui Ã© o salvar
	public void salvar(Servico servico) {

		String sql = "INSERT INTO SERVICO (nome, descricao, valor) VALUES (?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, servico.getNome());
			stmt.setString(2, servico.getDescricao());
			stmt.setDouble(3, servico.getValor());

			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// remover
	public void remover(Servico servico) throws ViolacaoIntegridadeException {

		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM SERVICO WHERE codigo = ?");
			stmt.setInt(1, servico.getCodigo());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (MySQLIntegrityConstraintViolationException e) {
			throw new ViolacaoIntegridadeException();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// alterar servico
	public void alterar(Servico servico) {
		String sql = "UPDATE SERVICO SET nome = ? , descricao = ? , valor = ?  WHERE codigo=?";

		try {

			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, servico.getNome());
			stmt.setString(2, servico.getDescricao());
			stmt.setDouble(3, servico.getValor());
			stmt.setInt(4, servico.getCodigo());

			stmt.execute();
			stmt.close();

			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Buscar por codigo
	public Servico buscarPorCodigo(int codigo) {

		try {
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM SERVICO WHERE codigo = ?");
			stmt.setInt(1, codigo);
			ResultSet rs = stmt.executeQuery();

			Servico servico = null;
			if (rs.next()) {
				servico = montarObjeto(rs);
			}

			rs.close();
			stmt.close();
			connection.close();
			return servico;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// buscar por nome
	public List<Servico> buscar(String nome) {
		try {
			List<Servico> listaServico = new ArrayList<Servico>();
			PreparedStatement stmt = null;
			if (!nome.equals("")) {
				stmt = this.connection.prepareStatement("SELECT * FROM SERVICO WHERE nome LIKE ? ORDER BY nome");
				stmt.setString(1, "%" + nome + "%");
			} else if (nome.equals("")) {
				stmt = this.connection.prepareStatement("SELECT * FROM SERVICO ORDER BY nome");
			}
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				listaServico.add(montarObjeto(rs));
			}
			rs.close();
			stmt.close();
			connection.close();
			return listaServico;

		} catch (SQLException e) {

			throw new RuntimeException(e);
		}

	}

	// Listar usuario
	public List<Servico> listar() {

		try {
			List<Servico> listarServico = new ArrayList<Servico>();
			PreparedStatement stmt = (PreparedStatement) this.connection
					.prepareStatement("SELECT * FROM SERVICO ORDER BY nome");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				listarServico.add(montarObjeto(rs));
			}

			rs.close();
			stmt.close();
			connection.close();

			return listarServico;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private Servico montarObjeto(ResultSet rs) throws SQLException {

		Servico servico = new Servico();

		servico.setNome(rs.getString("nome"));
		servico.setDescricao(rs.getString("descricao"));
		servico.setValor(rs.getDouble("valor"));
		servico.setCodigo(rs.getInt("codigo"));

		return servico;
	}
}
