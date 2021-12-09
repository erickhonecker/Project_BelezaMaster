package br.com.ifpe.belezamaster.model.relatorio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.com.ifpe.belezamaster.util.ConnectionFactory;
import br.com.ifpe.belezamaster.util.Datas;

public class RelatorioDao {

	private Connection connection;

	public RelatorioDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void salvar(Relatorio relatorio) {
		try {
			String sql = "INSERT INTO RELATORIO ( usuarioNome, profissionalNome, servicoHorario, servicoValor, servicoDescricao) VALUES(?,?,?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, relatorio.getUsuarioNome());
			stmt.setString(2, relatorio.getProfissionalNome());
			stmt.setDate(3, Datas.criarDataSQL(relatorio.getServicoHorario()));
			stmt.setDouble(4, relatorio.getServicoValor());
			stmt.setString(5, relatorio.getServicoDescricao());

			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Relatorio> listar() {

		try {
			List<Relatorio> listarRelatorio = new ArrayList<Relatorio>();

			PreparedStatement stmt = (PreparedStatement) this.connection.prepareStatement("SELECT U.nome,P.nome,A.data_atendimento,S.valor,S.descricao FROM ATENDIMENTO A JOIN USUARIO U on A.cpf_usuario = U.cpf JOIN SERVICO S ON A.codigo_servico = S.codigo JOIN PROFISSIONAL P ON A.id_profissional = P.id WHERE A.situacao = 'F'");
			ResultSet rs = stmt.executeQuery();


			while (rs.next()) {
				listarRelatorio.add(montarObjeto(rs));
			}

			rs.close();
			stmt.close();
			connection.close();

			return listarRelatorio;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// LISTAR RELATORIO
	public List<Relatorio> pesquisar(Date dataInicio,Date dataTermino) {

		try {
			List<Relatorio> listarRelatorio = new ArrayList<Relatorio>();

			PreparedStatement stmt = (PreparedStatement) this.connection.prepareStatement("SELECT U.nome,P.nome,A.data_atendimento,S.valor,S.descricao FROM ATENDIMENTO A JOIN USUARIO U on A.cpf_usuario = U.cpf JOIN SERVICO S ON A.codigo_servico = S.codigo JOIN PROFISSIONAL P ON A.id_profissional = P.id WHERE A.situacao = 'F'  AND  data_atendimento > ?   AND    data_atendimento < ?");
			stmt.setDate(1, Datas.criarDataSQL(dataInicio));
			stmt.setDate(2, Datas.criarDataSQL(dataTermino));

			ResultSet rs = stmt.executeQuery();


			while (rs.next()) {
				listarRelatorio.add(montarObjeto(rs));
			}

			rs.close();
			stmt.close();
			connection.close();

			return listarRelatorio;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Montar o Objeto

	private Relatorio montarObjeto(ResultSet rs) throws SQLException {

		Relatorio relatorio = new Relatorio();

		relatorio.setUsuarioNome(rs.getString("nome"));
		relatorio.setProfissionalNome(rs.getString("nome"));
		relatorio.setServicoHorario(rs.getDate("data_atendimento"));
		relatorio.setServicoValor(rs.getDouble("valor"));
		relatorio.setServicoDescricao(rs.getString("descricao"));
		return relatorio;

	}

}
