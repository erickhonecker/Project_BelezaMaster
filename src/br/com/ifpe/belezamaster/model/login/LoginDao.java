package br.com.ifpe.belezamaster.model.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.ifpe.belezamaster.util.ConnectionFactory;

public class LoginDao {

	private Connection connection;

	public LoginDao() {

		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	
	public boolean verificarPermissao(String cpf, String tela) {
		
		try {
			PreparedStatement stmt = (PreparedStatement) connection
					.prepareStatement("SELECT * FROM USUARIO u join TELA_PERFIL tp on u.codigo_perfil = tp.codigo_perfil join TELA t on tp.codigo_tela = t.codigo WHERE u.cpf = ? AND t.url_mapping = ?;");
			stmt.setString(1, cpf);
			stmt.setString(2, tela);

			ResultSet rs = stmt.executeQuery();

			
			if (rs.next()) {
				
				return true;
			}

			rs.close();
			stmt.close();
			connection.close();
			return false;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}


	

	

}
