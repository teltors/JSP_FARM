/*
 * package filter;
 * 
 * import java.io.FileWriter; import java.io.IOException; import
 * java.io.PrintWriter; import java.text.DateFormat; import
 * java.text.SimpleDateFormat; import java.util.Calendar;
 * 
 * import javax.servlet.Filter; import javax.servlet.FilterChain; import
 * javax.servlet.FilterConfig; import javax.servlet.ServletException; import
 * javax.servlet.ServletRequest; import javax.servlet.ServletResponse; import
 * javax.servlet.http.HttpServletRequest; import javax.servlet.http.HttpSession;
 * 
 * public class LogFilter implements Filter {
 * 
 * PrintWriter writer;
 * 
 * 
 * public void init(FilterConfig config) throws ServletException { String
 * filename = config.getInitParameter("filename"); //xml �Ű����� ��
 * 
 * if(filename==null) throw new ServletException("d.");
 * 
 * try { writer = new PrintWriter(new FileWriter(filename, true), true);
 * //true�� ��� ������ ���� ������ }catch (IOException e) { throw new
 * ServletException("dd."); } }
 * 
 * public void doFilter(ServletRequest request, ServletResponse response,
 * FilterChain chain) throws IOException, ServletException { HttpSession
 * session_id = ((HttpServletRequest) request).getSession(true); //���� ����
 * writer.println("d: " + session_id); writer.println(" dƮ IP : " +
 * request.getRemoteAddr()); long start = System.currentTimeMillis();
 * writer.println("dURL d : " + getURLPath(request)); writer.println(" d : " +
 * getCurrentTime()); chain.doFilter(request, response);
 * 
 * long end = System.currentTimeMillis(); writer.println("d : " +
 * getCurrentTime()); writer.println("d : " + (end-start)+ "ms ");
 * writer.println("======================================================="); }
 * 
 * public void destroy() { writer.close(); }
 * 
 * public String getURLPath(ServletRequest request) { HttpServletRequest req;
 * String currentPath=""; String queryString=""; if(request instanceof
 * HttpServletRequest){ //request�� HttpServletRequest�� ����ȯ�� �������� Ȯ��
 * �ϴ� �� = instanceof req = (HttpServletRequest)request; currentPath =
 * req.getRequestURI(); queryString = req.getQueryString(); queryString =
 * queryString == null ? "" : "?" + queryString; //null�̸� "" �ƴϸ� ?+���� }
 * return currentPath+queryString; }
 * 
 * private String getCurrentTime() { DateFormat formatter = new
 * SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); Calendar calendar =
 * Calendar.getInstance(); calendar.setTimeInMillis(System.currentTimeMillis());
 * return formatter.format(calendar.getTime()); } }
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 */