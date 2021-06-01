package web.spring.skintalk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(MemberInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.info("preHandle 호출");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		if (userId != null) {
			logger.info("로그인 상태");
			return true;
		}else {
			logger.info("로그아웃 상태");
			saveDestination(request);
			response.sendRedirect("/skintalk/member/login");
			return false;
		}
	}

	private void saveDestination(HttpServletRequest request) {
		logger.info("saveDestination() 호출");
		String uri = request.getRequestURI();
		String queryString = request.getQueryString();
		
		String url = "";
		if (queryString == null) {
			url = uri;
		}else {
			url = uri + "?" + queryString;
		}
		request.getSession().setAttribute("destination", url);
	}
	
}