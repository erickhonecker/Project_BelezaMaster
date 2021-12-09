package br.com.ifpe.belezamaster.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import br.com.ifpe.belezamaster.model.login.LoginDao;
import br.com.ifpe.belezamaster.model.usuario.Usuario;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
			throws Exception {

		
		String uri = request.getRequestURI();
		if (uri.contains("fonts") || uri.contains("css") || uri.contains("img") || uri.contains("js")
				|| uri.contains("less") || uri.contains("view/vendor") || uri.contains("gulpfile.js")
				|| uri.contains("view/scrollreveal.js") || uri.endsWith("exibirLogin") || uri.endsWith("exibirIndex")
				|| uri.endsWith("efetuarLogin") || uri.endsWith("view/index") || uri.endsWith("exibirIncluirUsuario")
				|| uri.endsWith("incluirUsuario") || uri.endsWith("esqueciMinhaSenha")
				|| uri.endsWith("recuperarPorEmail") || uri.endsWith("alterarSenha")) {
			return true;
		}
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		String tela = uri.substring(uri.lastIndexOf("/")+1);
		if (request.getSession().getAttribute("usuarioLogado") != null) { 
            LoginDao dao = new LoginDao(); 
            if (dao.verificarPermissao(usuario.getCpf(), tela)) { 

               return true; 
            }
 
        }

		response.sendRedirect("exibirIndex");

		return false;
	}
}
