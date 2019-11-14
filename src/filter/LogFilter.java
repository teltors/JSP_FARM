package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LogFilter implements Filter {
	
	PrintWriter writer;
	

	public void init(FilterConfig config) throws ServletException {
		String filename = config.getInitParameter("filename"); //xml 매개변수 값
		
		if(filename==null) 
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		
		try {
			writer = new PrintWriter(new FileWriter(filename, true), true); //true일 경우 파일이 끝에 쓰여짐
		}catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session_id = ((HttpServletRequest) request).getSession(true); //세션 정보
		writer.println("세션 정보 : " + session_id);	
		writer.println(" 접속한 클라이언트 IP : " + request.getRemoteAddr());
		long start = System.currentTimeMillis();
		writer.println(" 접근한 URL 경로 : " + getURLPath(request));
		writer.println(" 요청 처리 시작 시간 : " + getCurrentTime());
		chain.doFilter(request, response);
		
		long end = System.currentTimeMillis();		
		writer.println(" 요청 처리 종료 시각 : " + getCurrentTime());
		writer.println(" 요청 처리 소요 시간 : " + (end-start)+ "ms ");
		writer.println("=======================================================");
	}

	public void destroy() {
		writer.close();
	}
	
	public String getURLPath(ServletRequest request) {
		HttpServletRequest req;
		String currentPath="";
		String queryString=""; 
		if(request instanceof HttpServletRequest){ //request가 HttpServletRequest로 형변환이 가능한지 확인 하는 것 = instanceof
			req = (HttpServletRequest)request;
			currentPath = req.getRequestURI();
			queryString = req.getQueryString();
			queryString = queryString == null ? "" : "?" + queryString; //null이면 "" 아니면 ?+쿼리
		}
		return currentPath+queryString;
	}
	
	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());
	}
}

















