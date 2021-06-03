package web.spring.skintalk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ProductDetailInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(ProductDetailInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String productNo = request.getParameter("productNo");
		String regExp = "^[0-9]+$";
		
		if (productNo != null && productNo.matches(regExp)) {
			logger.info("정상적인 접근");
			return true;
		}else {
			logger.info("상품번호 정보 없음");
			response.sendRedirect("/skintalk/main/product");
			return false;
		}
		
	}
	
}