// 로그인처리 intercepoter 작성하려고 했으나 연결할 때 문제가 있을것 같아서 보류함




//package web.spring.skintalk.interceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//
//public class LoginInterceptor extends HandlerInterceptorAdapter {
//	private static final Logger logger =
//			LoggerFactory.getLogger(LoginInterceptor.class);
//	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		logger.info("===== preHandle 호출");
//		// 로그인 상태 : targetUrl 컨트롤러 메소드 실행
//		// 로그인 안된 상태 : 로그인 양식(login)으로 redirect,
//		//				컨트롤러 메소드는 실행하지 않음
//		
//		HttpSession session = request.getSession();
//		String loginId = (String)session.getAttribute("loginId");
//		if (loginId != null) { // 로그인 상태
//			logger.info("로그인 상태 -> target method 실행");
//			return true; // 컨트롤러 메소드 실행
//		} else { // 로그아웃 상태
//			logger.info("로그아웃 상태 -> loginGet() 실행");
//			// 로그인 성공 후에 redirect될 페이지를 세션에 저장
//			saveDestination(request);
//			response.sendRedirect("/skintalk/board/list");
//			return false; // 컨트롤러 메소드 실행하지 않음
//		}
//		
//	} // end of preHandle
//	
//	private void saveDestination(HttpServletRequest request) {
//		logger.info("saveDestination() 호출");
//		
//		// 전체 요청 주소에서 쿼리 스트링을 제외한 부분
//		String uri = request.getRequestURI();
//		logger.info("요청 URI : " + uri);
//		
//		// 전체 요청 주소에서 쿼리 스트링만 추출
//		String queryString = request.getQueryString();
//		logger.info("쿼리 스트링 : " + queryString);
//		
//		String url = "";
//		if (queryString == null) { // 쿼리 스트링이 없으면
//			url = uri;
//		} else { // 쿼리 스트링이 존재하면
//			url = uri + "?" + queryString;
//		}
//		
//		request.getSession().setAttribute("destination", url);
//		
//	}
//	
//} // end of class
//
//
//
//
//
//
//
//
//
//
//
//
//
//
