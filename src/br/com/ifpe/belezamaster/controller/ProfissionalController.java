package br.com.ifpe.belezamaster.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.belezamaster.model.profissional.Profissional;
import br.com.ifpe.belezamaster.model.profissional.ProfissionalDao;
import br.com.ifpe.belezamaster.model.usuario.ViolacaoIntegridadeException;

@Controller
public class ProfissionalController {

	// CADASTRANDO O PROFISSIONAL
	@RequestMapping("/exibirIncluirProfissional")
	public String exibirIncluirProfissional(Profissional profissional) {
		return "profissional/incluirProfissional";
	}
	// INCLUINDO O PROFISSIONAL

	@RequestMapping("/incluirProfissional")
	public String incluirProfissional(@Valid Profissional profissional, BindingResult result, Model model) {
		ProfissionalDao dao = new ProfissionalDao();
		if (result.hasErrors()) {
			model.addAttribute("nome", "*O campo não pode ser preenchido são com espaços ou caracteres especias. ");
			return "forward:exibirIncluirProfissional";
		}

		if (dao.buscarPorEmail(profissional.getEmail()) != null) {
			model.addAttribute("email", " E-mail já¡ cadastrado");
			return "forward:exibirIncluirProfissional";
		}
		ProfissionalDao dao1 = new ProfissionalDao();
		if (dao1.buscarPorCpf(profissional.getCpf()) != null) {
			model.addAttribute("cpf", " Cpf já cadastrado");
			return "forward:exibirIncluirProfissional";

		} else {

			ProfissionalDao dao2 = new ProfissionalDao();

			dao2.salvar(profissional);
			model.addAttribute("mensagem", "Profissional cadastrado com Sucesso!");
			return "forward:exibirListarProfissional";

		}

	}

	// listar servico

	@RequestMapping("/exibirListarProfissional")
	public String listarProfissional(Model model) {
		ProfissionalDao dao = new ProfissionalDao();
		List<Profissional> listarProfissional = dao.listar();
		model.addAttribute("listarProfissional", listarProfissional);
		return "profissional/pesquisarProfissional";

	}

	// pesquiar profissional
	@RequestMapping("/pesquisarProfissional")
	public @ResponseBody String PesquisarProfissional(@RequestParam String nome, HttpServletResponse response) {
		ProfissionalDao dao = new ProfissionalDao();
		List<Profissional> listarProfissional = dao.buscar(nome);
		StringBuilder st = new StringBuilder();
		st.append("<tr>");
		st.append("<th>Nome do Profissional</td>");
		st.append("<th>ProfissÃ£o</td>");
		st.append("<th>CPF</td>");
		st.append("<th>E-mail</td>");
		st.append("<th>EndereÃ§o</td>");
		st.append("<th>Telefone</td>");
		st.append("<th>Celular</td>");
		st.append("<th>Alterar</td>");
		st.append("<th>Remover</td>");

		st.append("</tr>");
		for (Profissional profissional : listarProfissional) {
			st.append("<tr>");
			st.append("<td> " + profissional.getNome() + " </td>");
			st.append("<td> " + profissional.getProfissao() + " </td>");
			st.append("<td> " + profissional.getCpf() + " </td>");
			st.append("<td> " + profissional.getEmail() + " </td>");
			st.append("<td> " + profissional.getEndereco() + " </td>");
			st.append("<td> " + profissional.getTelefone() + " </td>");
			st.append("<td> " + profissional.getCelular() + " </td>");
			st.append("<td><a class='btn btn-success' href='exibirAlterarProfissional?id=" + profissional.getId()
					+ "'>Alterar</a> &nbsp;</td>");
			st.append("<td><a  class='btn btn-danger' href='removerProfissional?id=" + profissional.getId()
					+ "'>Remover</a></td>");
			st.append("</td>");
			st.append("</tr>");
		}
		response.setStatus(200);
		return st.toString();
	}

	// Alterar profissional
	@RequestMapping("/exibirAlterarProfissional")
	public String exibirAlterarProfissional(Profissional profissional, Model model) {
		ProfissionalDao dao = new ProfissionalDao();
		Profissional ProfissionalCOD = dao.buscarPorId(profissional.getId());
		model.addAttribute("profissional", ProfissionalCOD);
		return "profissional/alterarProfissional";

	}

	// Redireciona para alterar profissional
	@RequestMapping("/alterarProfissional")
	public String alterarProfissional(@Valid Profissional Profissional, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("nome", "*O campo nã pode ser preenchido com espaços ou caracteres especias. ");
			return "forward:exibirAlterarProfissional";
		}

		ProfissionalDao dao = new ProfissionalDao();

		dao.alterar(Profissional);
		model.addAttribute("mensagem", "Profissional alterado com Sucesso!");
		return "forward:exibirListarProfissional";

	}

	// remover profissional
	@RequestMapping("/removerProfissional")
	public String removeProfissional(Profissional profissional, Model model) {
		ProfissionalDao dao = new ProfissionalDao();
		try {
			dao.remover(profissional);
		} catch (ViolacaoIntegridadeException e) {
			model.addAttribute("mensagem", "Profissional Não pode ser Removido, Pois está com reservas.");
			return "forward:exibirListarProfissional";
		}
		model.addAttribute("mensagem", "Profissional Removido com Sucesso");
		return "forward:exibirListarProfissional";
	}

}