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
import com.google.gson.JsonElement;

import kr.or.ddit.kream.prod.service.IProdService;
import kr.or.ddit.kream.prod.service.ProdServiceImpl;
import kr.or.ddit.kream.vo.GraphVo;

/**
 * 그래프 표시에 필요한 서블릿 
 */

@WebServlet("/GraphInfo.do")
public class GraphInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String prodid = request.getParameter("prodid");
		String sizenm = request.getParameter("sizename");
		
		//체킹용
		System.out.println(sizenm);
		
		GraphVo vo = new GraphVo();
		vo.setProd_id(prodid);
		vo.setSize_name(sizenm);

		IProdService service = ProdServiceImpl.getInstance();
		
		List<GraphVo> list = service.getGraphInfo(vo);
		
		response.setContentType("application/json; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		Gson gson = new Gson();
		
		String data = gson.toJson(list);
		
		System.out.println(data);
		
		out.write(data);
		out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
