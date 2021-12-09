package br.com.ifpe.belezamaster.model.reserva;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.ifpe.belezamaster.model.profissional.Profissional;
import br.com.ifpe.belezamaster.model.profissional.ProfissionalDao;
import br.com.ifpe.belezamaster.model.servico.ServicoDao;
import br.com.ifpe.belezamaster.model.usuario.UsuarioDao;
import br.com.ifpe.belezamaster.util.ConnectionFactory;
import br.com.ifpe.belezamaster.util.Datas;

public class AtendimentoDao {

	private Connection connection;

	
	public AtendimentoDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// SALVAR RESERVA

	public void salvar(Atendimento atendimento) {
		try {
			String sql = "INSERT INTO ATENDIMENTO (data_atendimento,codigo, id_profissional, codigo_servico , cpf_usuario, situacao) VALUES(?,?,?,?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setDate(1, Datas.criarDataSQL(atendimento.getDataAtendimento()));
			stmt.setInt(2, atendimento.getCodigoAtendimento());
			stmt.setInt(3, atendimento.getProfissional().getId());
			stmt.setInt(4, atendimento.getServico().getCodigo());
			stmt.setString(5, atendimento.getUsuario().getCpf());
			stmt.setString(6, "P");


			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	//Cancelar reserva
	public void cancelar(Atendimento atendimento) {

		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM ATENDIMENTO WHERE codigo = ?");
			stmt.setInt(1, atendimento.getCodigoAtendimento());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	
	}
	// Alterar registra atendimento

	public void alterarRegistrar(Atendimento atendimento) {
		String sql = "UPDATE ATENDIMENTO SET situacao = 'A', horario = ?  WHERE codigo = ?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setDate(1,  Datas.criarDataSQL(Calendar.getInstance().getTime()));
			stmt.setInt(2, atendimento.getCodigoAtendimento());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void alterarFinalizar(Atendimento atendimento) {
		String sql = "UPDATE ATENDIMENTO SET situacao = 'F'  WHERE codigo = ?";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, atendimento.getCodigoAtendimento());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// buscar por codigo de atendimento
	public List<Atendimento> buscar(String codigoAtendimento) {
		try {
			List<Atendimento> listarAtendimento = new ArrayList<Atendimento>();
			PreparedStatement stmt = null;
			if (!codigoAtendimento.equals("")) {
				stmt = this.connection.prepareStatement("SELECT * FROM ATENDIMENTO WHERE codigo LIKE ? ORDER BY situacao");
				stmt.setString(1, "%" + codigoAtendimento + "%");
			} else if (codigoAtendimento.equals("")) {
				stmt = this.connection.prepareStatement("SELECT * FROM ATENDIMENTO ORDER BY codigo");
			}
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				listarAtendimento.add(montarObjeto(rs));
			}
			rs.close();
			stmt.close();
			connection.close();
			return listarAtendimento;

		} catch (SQLException e) {

			throw new RuntimeException(e);
		}

	}
	
	// Buscar por datas e id profissional
			public boolean  AtendimentoReserva(java.util.Date date,int id_profissional) {
				try {
					PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ATENDIMENTO WHERE data_atendimento = ? AND id_profissional = ?");
					stmt.setDate(1, Datas.criarDataSQL(date));
					stmt.setInt(2, id_profissional);
					
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

	// Listar registrar atendimento
	public List<Atendimento> listarRegistrar() {

		try {
			List<Atendimento> registrarAtendimento = new ArrayList<Atendimento>();
			PreparedStatement stmt = (PreparedStatement) this.connection.prepareStatement("select * from ATENDIMENTO WHERE situacao = 'P'");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				registrarAtendimento.add(montarObjeto(rs));
			}

			rs.close();
			stmt.close();
			connection.close();

			return registrarAtendimento;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Listar finalizar atendimento
		public List<Atendimento> listarF() {

			try {
				List<Atendimento> finalizarAtendimento = new ArrayList<Atendimento>(); 
				
				PreparedStatement stmt = (PreparedStatement) this.connection.prepareStatement("select * from ATENDIMENTO WHERE situacao = 'A' OR situacao =  'F' ");

				ResultSet rs = stmt.executeQuery();

				while (rs.next()) {
					finalizarAtendimento.add(montarObjeto(rs));
				}

				rs.close();
				stmt.close();
				connection.close();

				return finalizarAtendimento;
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}



	// Montar o Objeto

	private Atendimento montarObjeto(ResultSet rs) throws SQLException {

		Atendimento atendimento = new Atendimento();

		atendimento.setHorario(rs.getDate("horario"));
		atendimento.setCodigoAtendimento(rs.getInt("codigo"));
		atendimento.setDataAtendimento(rs.getDate("data_atendimento"));
		atendimento.setSituacao(rs.getString("situacao"));

		UsuarioDao dao = new UsuarioDao();
		atendimento.setUsuario(dao.buscarPorCpf(rs.getString("cpf_usuario")));

		ServicoDao dao1 = new ServicoDao();
		atendimento.setServico(dao1.buscarPorCodigo(rs.getInt("codigo_servico")));

		ProfissionalDao dao2 = new ProfissionalDao();
		atendimento.setProfissional(dao2.buscarPorId(rs.getInt("id_profissional")));

		return atendimento;
	}
}
