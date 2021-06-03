package web.spring.skintalk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class BoardInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(BoardInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String boardNo = request.getParameter("boardNo");
		String regExp = "^[0-9]+$";
		logger.info("boardNo = " + boardNo);
		if(boardNo != null && boardNo.matches(regExp)) {
			return true;
		}else {
			response.sendRedirect("/skintalk/board/list");
			return false;
		}
	}
}
