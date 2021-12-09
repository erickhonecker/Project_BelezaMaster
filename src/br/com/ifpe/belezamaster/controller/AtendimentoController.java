package br.com.ifpe.belezamaster.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.belezamaster.model.profissional.Profissional;
import br.com.ifpe.belezamaster.model.profissional.ProfissionalDao;
import br.com.ifpe.belezamaster.model.reserva.Atendimento;
import br.com.ifpe.belezamaster.model.reserva.AtendimentoDao;
import br.com.ifpe.belezamaster.model.servico.Servico;
import br.com.ifpe.belezamaster.model.servico.ServicoDao;
import br.com.ifpe.belezamaster.model.usuario.Usuario;
import br.com.ifpe.belezamaster.model.usuario.UsuarioDao;

@Controller
public class AtendimentoController {
	// EXIBIR INCLUIR RESERVA
	@RequestMapping("/exibirIncluirAtendimento")
	public String ExibirIncluirAtendimento(Atendimento atendimento, Model model) {

		ProfissionalDao dao = new ProfissionalDao();
		List<Profissional> listaProfissional = dao.listar();
		model.addAttribute("listaProfissional", listaProfissional);

		ServicoDao dao2 = new ServicoDao();
		List<Servico> listaServico = dao2.listar();
		model.addAttribute("listaServico", listaServico);

		UsuarioDao dao3 = new UsuarioDao();
		List<Usuario> listaUsuario = dao3.listar();
		model.addAttribute("listaUsuario", listaUsuario);

		return "reserva/fazerReserva";
	}
	
	
	
	// INCLUIR RESERVA
		@RequestMapping("/fazerReserva")
		public String IncluirAtendimento(Atendimento atendimento, BindingResult result, Model model) {
			
		AtendimentoDao dao = new AtendimentoDao();
		if (dao.AtendimentoReserva(atendimento.getDataAtendimento(),atendimento.getProfissional().getId()) ) {
			
			model.addAttribute("mensagem", "A Reserva não foi realizada, Por favor tente outro horário!");
			return "forward:exibirIncluirAtendimento";
		
		}
		AtendimentoDao dao1 = new AtendimentoDao();

		dao1.salvar(atendimento);
		model.addAttribute("mensagem", "A Reserva foi cadastrado com Sucesso!!");
		return "forward:exibirIncluirAtendimento";

		}
			

	/* Finalizar e registro */

	// exibir listar registro
	@RequestMapping("/exibirListarAtendimento")
	public String listarAtendimento(Model model) {
		AtendimentoDao dao = new AtendimentoDao();
		List<Atendimento> registrarAtendimento = dao.listarRegistrar();
		model.addAttribute("registrarAtendimento", registrarAtendimento);

		return "reserva/registrarAtendimento";

	}
  //pesquisar registrar reserva
	@RequestMapping("/PesquisarRegistrarAtendimento")
	public @ResponseBody String registrarAtendimento(@RequestParam String codigoAtendimento, HttpServletResponse response) {
		AtendimentoDao dao = new AtendimentoDao();
		List<Atendimento> listarAtendimento = dao.buscar(codigoAtendimento);
		StringBuilder st = new StringBuilder();
		st.append("<tr>");
		st.append("<th>Nome do Usuário</th>");
		st.append("<th>Cpf do Usuário</th>");
		st.append("<th>Código do Servico</th>");
		st.append("<th>Serviço</th>");
		st.append("<th>Nome do Profissional</th>");
		st.append("<th>Código do Atendimento</th>");
		st.append("<th>Horário de Atendimento</th>");
		st.append("<th>Situaçãoo</th>");
		st.append("<th>Data do Atendimento</th>");
		st.append("<th>Alterar</th>");
		st.append("<th>Remover</th>");

		st.append("</tr>");
		for (Atendimento atendimento : listarAtendimento) {
			st.append("<tr >");
			st.append("<td> " + atendimento.getUsuario().getNome() + " </td>");
			st.append("<td> " + atendimento.getUsuario().getCpf() + " </td>");
			st.append("<td> " + atendimento.getServico().getCodigo() + " </td>");
			st.append("<td> " + atendimento.getServico().getNome() + " </td>");
			st.append("<td> " + atendimento.getProfissional().getNome() + " </td>");
			st.append("<td> " + atendimento.getCodigoAtendimento() + " </td>");
			st.append("<td>" + atendimento.getHorario() + " </td>");
			st.append("<td> " + atendimento.getSituacao() + " </td>");
			st.append("<td> " + atendimento.getDataAtendimento() + " </td>");
			st.append("<td><a  class='btn btn-success'  href='alterarRegistro?codigoAtendimento="
					+ atendimento.getCodigoAtendimento() + "'>Registrar</a> &nbsp;</td>");
			st.append("<td><a   class='btn btn-danger' href='removerCancelar?codigoAtendimento="
					+ atendimento.getCodigoAtendimento() + "'>Cancelar</a></td>");
			st.append("</tr>");
		}
		response.setStatus(200);
		return st.toString();
	}

	// pesquisar Finalizar reserva
	@RequestMapping("/pesquisarFinalizarAtendimento")
	public @ResponseBody String FinalizarAtendimento(@RequestParam String codigoAtendimento, HttpServletResponse response) {
		AtendimentoDao dao = new AtendimentoDao();
		List<Atendimento> listarAtendimento = dao.buscar(codigoAtendimento);
		StringBuilder st = new StringBuilder();
		st.append("<tr>");
		st.append("<th>Nome do Usuário</th>");
		st.append("<th>Cpf do Usuário</th>");
		st.append("<th>Codigo do Servico</th>");
		st.append("<th>Serviço</th>");
		st.append("<th>Nome do Profissional</th>");
		st.append("<th>Código do Atendimento</th>");
		st.append("<th>Data do Atendimento</th>");
		st.append("<th>Situação</th>");
		st.append("<th>Horário de Atendimento</th>");
		st.append("<th>Alterar</th>");
		st.append("<th>Remover</th>");

		st.append("</tr>");
		for (Atendimento atendimento : listarAtendimento) {
			st.append("<tr>");
			st.append("<td> " + atendimento.getUsuario().getNome() + " </td>");
			st.append("<td> " + atendimento.getUsuario().getCpf() + " </td>");
			st.append("<td> " + atendimento.getServico().getCodigo() + " </td>");
			st.append("<td> " + atendimento.getServico().getNome() + " </td>");
			st.append("<td> " + atendimento.getProfissional().getNome() + " </td>");
			st.append("<td> " + atendimento.getCodigoAtendimento() + " </td>");
			st.append("<td>" + atendimento.getHorario() + " </td>");
			st.append("<td> " + atendimento.getSituacao() + " </td>");
			st.append("<td> " + atendimento.getDataAtendimento() + " </td>");
			st.append("<td><a  class='btn btn-success'  href='finalizarAtendimento?codigoAtendimento="
					+ atendimento.getCodigoAtendimento() + "'>Finalizar</a> &nbsp;</td>");
			st.append("<td><a   class='btn btn-danger' href='removerCancelar?codigoAtendimento="
					+ atendimento.getCodigoAtendimento() + "'>Cancelar</a></td>");
			st.append("</tr>");
		}
		response.setStatus(200);
		return st.toString();
	}

	// Redireciona para alterar registro
	@RequestMapping("/alterarRegistro")
	public String alterarAtendimento(Atendimento atendimento, Model model) {
		AtendimentoDao dao = new AtendimentoDao();

		dao.alterarRegistrar(atendimento);
		model.addAttribute("registrar", "Atendimento registrado com Sucesso!");
		return "forward:exibirListarAtendimento";

	}

	// exibir finalizar registro
	@RequestMapping("/exibirFinalizarAtendimento")
	public String listarFinalizarAtendimento(Model model) {
		AtendimentoDao dao = new AtendimentoDao();
		List<Atendimento> registrarAtendimento = dao.listarF();
		model.addAttribute("registrarAtendimento", registrarAtendimento);

		return "reserva/finalizarAtendimento";

	}

	// Redireciona para alterar finalizar Atendimento
	@RequestMapping("/finalizarAtendimento")
	public String alterarFinalizarAtendimento(Atendimento atendimento, Model model) {
		AtendimentoDao dao = new AtendimentoDao();
		dao.alterarFinalizar(atendimento);
		model.addAttribute("finalizar", "Atendimento Finalizado com Sucesso!");
		return "forward:exibirFinalizarAtendimento";

	}

	// REMOVER RESERVA
	@RequestMapping("/removerCancelar")
	public String cancelarReserva(Atendimento atendimento, Model model) {
		AtendimentoDao dao = new AtendimentoDao();
		dao.cancelar(atendimento);
		model.addAttribute("cancelar", "Reserva Cancelada com Sucesso");
		return "forward:exibirListarAtendimento";
	}

}
