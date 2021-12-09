package br.com.ifpe.belezamaster.model.produto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.belezamaster.util.ConnectionFactory;

public class ProdutoDao {

	private Connection connection;

	public ProdutoDao() {

		
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void salvar(Produto produto) {

		String sql = "INSERT INTO PRODUTO (nome_produto, descricao, quantidade, valor) VALUES (?,?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);

			stmt.setString(1, produto.getNomeProduto());
			stmt.setString(2, produto.getDescricao());
			stmt.setInt(3, produto.getQuantidade());
			stmt.setDouble(4, produto.getValor());

			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
	}

	public void alterar(Produto produto) {
		String sql = "UPDATE PRODUTO SET nome_produto = ?, descricao  = ?,  quantidade = ?, valor = ?  WHERE codigo = ?";

		try {

			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, produto.getNomeProduto());
			stmt.setString(2, produto.getDescricao());
			stmt.setDouble(3, produto.getQuantidade());
			stmt.setDouble(4, produto.getValor());
			stmt.setDouble(5, produto.getCodigo());

			stmt.execute();
			stmt.close();

			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// buscar por nome
			public List<Produto> buscar(String nome) {
				try {
					List<Produto> listarProduto = new ArrayList<Produto>();
					PreparedStatement stmt = null;
					if (!nome.equals("")) {
						stmt = this.connection.prepareStatement("SELECT * FROM PRODUTO WHERE nome_produto LIKE ? ORDER BY nome_produto");
						stmt.setString(1, "%" + nome + "%");
					} else if (nome.equals("")) {
						stmt = this.connection.prepareStatement("SELECT * FROM PRODUTO ORDER BY nome_produto");
					}
					ResultSet rs = stmt.executeQuery();
					while (rs.next()) {
						listarProduto.add(montarObjeto(rs));
					}
					rs.close();
					stmt.close();
					connection.close();
					return listarProduto;

				} catch (SQLException e) {

					throw new RuntimeException(e);
				}

			}

	// Remover

	public void remover(int Codigo) {

		try {
			String sql = "DELETE FROM PRODUTO WHERE codigo = ?";
			java.sql.PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, Codigo);
			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Listar

	public List<Produto> listar() {

		try {
			List<Produto> listarProduto = new ArrayList<Produto>();
			PreparedStatement stmt = (PreparedStatement) this.connection
					.prepareStatement("SELECT * FROM PRODUTO ORDER BY nome_produto");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				listarProduto.add(montarObjeto(rs));
			}

			rs.close();
			stmt.close();
			connection.close();

			return listarProduto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Buscar por codigo
	public Produto buscarPorCodigo(int codigo) {

		try {
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM PRODUTO WHERE codigo = ?");
			stmt.setInt(1, codigo);
			ResultSet rs = stmt.executeQuery();

			Produto produto = null;
			if (rs.next()) {
				produto = montarObjeto(rs);
			}

			rs.close();
			stmt.close();
			connection.close();
			return produto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Montar o Objeto

	private Produto montarObjeto(ResultSet rs) throws SQLException {

		Produto produto = new Produto();

		produto.setNomeProduto(rs.getString("nome_produto"));
		produto.setDescricao(rs.getString("descricao"));
		produto.setCodigo(rs.getInt("codigo")); 
		produto.setQuantidade(rs.getInt("quantidade"));
		produto.setValor(rs.getDouble("valor"));

		return produto;

	}
}
