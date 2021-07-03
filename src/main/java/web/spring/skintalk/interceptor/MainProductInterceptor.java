package web.spring.skintalk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MainProductInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(MainProductInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.info("preHandle 호출");
		String type = request.getParameter("type");
		String page = request.getParameter("page");
		logger.info(type + ", " + page);
		String regExp = "^[0-9]+$";
		
		if (type == null) {
			if(page == null) {
				return true;
			}else if(page.matches(regExp)){
				return true;
			}else {
				response.sendRedirect("/skintalk/main/index");
				return false;
			}
		}else if(type.matches(regExp)) {
			return true;
		}else {
			response.sendRedirect("/skintalk/main/index");
			return false;
		}
	}	
}
