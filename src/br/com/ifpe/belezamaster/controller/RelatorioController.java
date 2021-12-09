package br.com.ifpe.belezamaster.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.belezamaster.model.relatorio.Relatorio;
import br.com.ifpe.belezamaster.model.relatorio.RelatorioDao;
import br.com.ifpe.belezamaster.util.Datas;

@Controller
public class RelatorioController {

	// EXIBIR PÁGINA DO RELATÓRIO
	@RequestMapping("/ExibirRelatorio")
	public String ExibirRelatorio(Model model) {
		RelatorioDao dao = new RelatorioDao();
		List<Relatorio> listarRelatorio = dao.listar();
		model.addAttribute("listarRelatorio", listarRelatorio);
		return "relatorio/ListarRelatorio";
	}

	// PESQUISAR NA PÁGINA RELATÓRIO
	@RequestMapping("/ListarRelatorio")
	public String PesquisarExibirRelatorio(Model model, @RequestParam("dataInicio") String dataInicio,@RequestParam("dataTermino") String dataTermino ) {
        RelatorioDao dao = new RelatorioDao();
		List<Relatorio> listarRelatorio = dao.pesquisar(Datas.criarData1(dataInicio) , Datas.criarData1(dataTermino));
		model.addAttribute("listarRelatorio", listarRelatorio);
		return "relatorio/ListarRelatorio";
	}

}