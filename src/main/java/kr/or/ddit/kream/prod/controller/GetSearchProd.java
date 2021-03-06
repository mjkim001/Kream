package kr.or.ddit.kream.prod.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.kream.prod.service.IProdService;
import kr.or.ddit.kream.prod.service.ProdServiceImpl;
import kr.or.ddit.kream.vo.MainPageProdVo;

@WebServlet("/GetSearchProd.do")
public class GetSearchProd extends HttpServlet {
	private static final long serialVersionUID = 1L;
/*
 * 상품 검색 하기 
 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String input = request.getParameter("input");
		
		IProdService service = ProdServiceImpl.getInstance();

		List<MainPageProdVo> list = service.prodSearch(input);
		
		Gson gson = new Gson();
		
		String data = gson.toJson(list);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.write(data);
		out.flush();
		
	}

}
