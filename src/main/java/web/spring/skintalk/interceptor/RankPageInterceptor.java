package web.spring.skintalk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class RankPageInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(RankPageInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("preHandle() Call");
		String page = request.getParameter("page");
		String regExp = "^[0-9]+$";
		
		if (page == null) {
			return true;
		}else if(page.matches(regExp)) {
			return true;
		}else {
			response.sendRedirect("/skintalk/main/index");
			return false;
		}
				
				
	}
	

}
