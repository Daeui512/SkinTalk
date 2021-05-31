package web.spring.skintalk.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.spring.skintalk.domain.MemberVO;
import web.spring.skintalk.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping(value = "/register")
	public void registerGet() {
		logger.info("registerGet() 호출");
	}
	
	@PostMapping(value ="/register")
	public String registerPost(MemberVO vo, RedirectAttributes reAttr) {
		logger.info("registerPost() 호출");
		int result = memberService.create(vo);
		logger.info(result + "행 삽입 create()");
		
		if (result == 1) {
			logger.info("회원가입 성공");
			reAttr.addFlashAttribute("register_result", "success");
			return "redirect:/member/login";
		} else {
			logger.info("회원가입 실패");
			reAttr.addFlashAttribute("register_result", "fail");
			return "redirect:/member/login";
		}
	}
	
	@GetMapping(value = "/login")
	public void loginGet(HttpSession session) {
		logger.info("loginGet() 호출");
		String userId = (String)session.getAttribute("userId");
		logger.info("userId : " + userId);
	}
	
	@PostMapping(value = "/login")
	public void loginPost(MemberVO vo, String userId, String password, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("loginPost() 호출");
		vo = memberService.login(userId, password);
		
		if (vo != null) {
			logger.info("로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("userId", vo.getUserId());
			logger.info("userId : " + userId);
			response.sendRedirect("/skintalk/main/index");
		} else {
			logger.info("로그인 실패");
			response.sendRedirect("/skintalk/member/login?loginFail=loginFail");
		}
		
	}
	
	@GetMapping("/logout")
	public String logoutGet(HttpServletRequest request) {
		logger.info("logoutGet() 호출");
		
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		
		return "redirect:/main/index";
	}
	
	@GetMapping("/member-detail")
	public void memberDetailGet(MemberVO vo, String userId, HttpSession session, Model model) {
		
		userId = (String)session.getAttribute("userId");
		logger.info("memberDetail() 호출 userId : " + userId);
		vo = memberService.read(userId);
		
		model.addAttribute("vo", vo);
	}
	
	@GetMapping("/update")
	public void updateGet(MemberVO vo, HttpServletRequest request, HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		logger.info("updateGet() 호출 userId : " + userId);
		vo = memberService.read(userId);
		
		model.addAttribute("vo", vo);
	}
	
	@PostMapping("/update")
	public String updatePost(MemberVO vo, HttpServletResponse response, 
			RedirectAttributes reAttr) throws IOException {
		logger.info("updatePost() 호출");
		int result = memberService.update(vo);
		logger.info(result + "행 변경 update()");
		
		if (result == 1) {
			logger.info("회원정보 변경 성공");
			reAttr.addFlashAttribute("update_result", "success");
			return "redirect:/member/member-detail";
		} else {
			logger.info("회원정보 변경 실패");
			reAttr.addFlashAttribute("update_result", "fail");
			return "redirect:/member/member-detail";
		}
	}
	
	@GetMapping("/delete")
	public String deleteGet(HttpServletResponse response, HttpSession session, 
			RedirectAttributes reAttr) throws IOException {
		logger.info("deleteGet() 호출");
		String userId = (String)session.getAttribute("userId");
		int result = memberService.delete(userId);
		
		if (result == 1) {
			logger.info("회원탈퇴 성공");
			reAttr.addFlashAttribute("delete_result", "success");
			session.removeAttribute("userId");
			return "redirect:/main/index";
		} else {
			logger.info("회원탈퇴 실패");
			reAttr.addFlashAttribute("delete_result", "fail");
			return "redirect:/main/index";
		}
	}
	
	@PostMapping("/userid_check")
	@ResponseBody
	public int userIdChkPost(String userId) {
		logger.info("userIdChkPost() : " + userId);
		int result = memberService.userIdChk(userId);
		return result;
	}
	
	@PostMapping("/email_check")
	@ResponseBody
	public int emailChkPost(String email) {
		logger.info("emailChkPost() : " + email);
		int result = memberService.emailChk(email);
		return result;
	}
	
	@PostMapping("/phone_check")
	@ResponseBody
	public int phoneChkPost(String phone) {
		logger.info("phoneChkPost() : " + phone);
		int result = memberService.phoneChk(phone);
		return result;
	}
	
	@GetMapping("/find_id_form")
	public void findUserIdFormGet(String email, String phone, Model model) throws Exception{
		logger.info("findIdFormGet() 호출");
	}
	
	@PostMapping("/find_id")
	public String findUserIdPost(String email, String phone, 
			Model model) throws Exception{
		logger.info("findUserIdFormPost() 호출");
		model.addAttribute("userId", memberService.findId(email, phone));
		String userId = memberService.findId(email, phone);

		if (userId == null) {
			logger.info("아이디찾기 성공 userId : " + userId);
			model.addAttribute("findUserId_result", "fail");
		} else {
			logger.info("아이디찾기 실패");
			model.addAttribute("findUserId_result", "success");
		}
		
		return "/member/find_id";
	}
	
	@GetMapping("/find_password_form")
	public void findPasswordFormGet(MemberVO vo) {
		logger.info("findPasswordFormGet() 호출");
	}
	
	@PostMapping("/find_password")
	@ResponseBody
	public String findPasswordPost(String userId, String email, MemberVO vo) {
		logger.info("findPasswordPost() 호출 : userId = " + userId + " email = " + email);
		String findUserPassword_result = "fail";

			MemberVO checkVo = memberService.read(userId);
			
			if (memberService.userIdChk(vo.getUserId()) == 0) {
				logger.info("등록되지 않은 아이디입니다.");
				findUserPassword_result = "wrong_userid";
				return findUserPassword_result;
			} else if (!vo.getEmail().equals(checkVo.getEmail())) {
				logger.info("등록되지 않은 이메일입니다.");
				findUserPassword_result = "wrong_email";
				return findUserPassword_result;
			} else { 
				
				String password = "";
				
				for (int i = 0; i < 12; i++) {
					password += (char) ((Math.random() * 26) + 97);
				}
				
				vo.setPassword(password);
				memberService.findPassword(vo);
				memberService.sendEmail(vo, "findPassword");
				
				logger.info("임시비밀번호 이메일 발송완료.");
				findUserPassword_result = "success";
				return findUserPassword_result;
			}
			
	}
	
}












