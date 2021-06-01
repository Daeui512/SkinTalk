package web.spring.skintalk.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import web.spring.skintalk.domain.MemberVO;
import web.spring.skintalk.domain.ProductVO;
import web.spring.skintalk.service.MemberService;
import web.spring.skintalk.service.ProductService;
import web.spring.skintalk.util.PageCriteria;
import web.spring.skintalk.util.PageMaker;

@Controller
@RequestMapping(value="/main")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
    @Autowired
	private ProductService productService;
    
    @Autowired
    private MemberService memberService;
    
	@Transactional
	@GetMapping("/index")			 // 쇼핑몰 홈페이지 호출
	public void index(Model model, HttpSession session) {
		logger.info("index()호출 ");
		String userId = (String) session.getAttribute("userId");
		logger.info("userId " + userId);
		
		if (userId != null) {
			MemberVO member = memberService.read(userId);
			logger.info("member_info = " + member.toString());
			
			PageCriteria criteria = new PageCriteria(1, 12);

			String skin_type = member.getSkinType();
			String[] skin_troubles = member.getSkinTrouble().split(",");
			List<ProductVO> list = productService.read(criteria);
			
			if (skin_type.equals("지성")) {
				logger.info("지성_피부타입");
			}else if(skin_type.equals("중성")) {
				logger.info("중성_피부타입");
			}else if(skin_type.equals("건성")) {
				logger.info("건성_피부타입");
			}else if(skin_type.equals("복합성")){
				logger.info("복합성_피부타입");
			}else {
				logger.info("잘못된 피부타입");
			}
			
			for (int i = 0; i < skin_troubles.length; i++) {
				logger.info("skin_troubles = " + skin_troubles[i]);
			}

			for (ProductVO vo : list) {
				logger.info("vo = " + vo.getPoint());
				String[] points = vo.getPoint().split(",");
				for (String point : points) {
					logger.info("point = " + point);
				}
			}
			model.addAttribute("productList", list);

		}else {
			PageCriteria criteria = new PageCriteria(1, 12);
			List<ProductVO> list = productService.read(criteria);
			model.addAttribute("productList", list);
			
		}
	}// end of index
	
	@GetMapping("/product")			// 상품목록 페이지 호출
	public void product(Model model, String keyword, Integer page, Integer perPage, Integer type) {
		logger.info("product()호출");
		PageCriteria criteria = new PageCriteria();
		PageMaker maker = new PageMaker();
		List<ProductVO> list = null;
		
		if (page != null) {
			criteria.setPage(page);
		}
		if (perPage != null) {
			criteria.setNumsPerPage(perPage);
		}
		
		logger.info("type = " + type);
		
		if (keyword == null) {
			if(type == null) {
				list = productService.read(criteria);
				maker.setTotalCount(productService.getTotalNumsOfRecords());
			}else {
				list = productService.readByTypical(criteria, type);
				maker.setTotalCount(productService.getTotalNumsByTypical(type));
			}
		}else {
			keyword = keyword.replaceAll(" ", "");						// keyword에 포함된 모든 공백 제거
			keyword = keyword.replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");	// keyword의 앞/뒤에 포함된 비정상적인 공백 제거

			list = productService.readAllKeyword(keyword,criteria);
			for (ProductVO vo : list) {
				logger.info("vo = " + vo.toString());
			}
			maker.setTotalCount(productService.getTotalNumsByKeyword(keyword));
			logger.info("키워드에 의한 총 상품 개수 : " + productService.getTotalNumsByKeyword(keyword));
			logger.info("총 상품 개수 : " + maker.getTotalCount());
		}
		
		maker.setCriteria(criteria);
		maker.setPageData();

		model.addAttribute("productList", list);
		model.addAttribute("pageMaker", maker);
	}// end of product
	
	@GetMapping("/search-autocomplete")
	@ResponseBody
	public List<String> autoComplete(String keyword) {
		logger.info("자동완성 기능 호출");
		List<String> list = productService.readKeyword(keyword);
		
		return list;
	}
	
	@GetMapping("/rank")
	public void rank(Model model, Integer page, Integer perPage) {
		logger.info("상품 랭킹 기능 호출");
		PageCriteria criteria = new PageCriteria();
		PageMaker maker = new PageMaker();
		
		if (page != null) {
			criteria.setPage(page);
		}
		if (perPage != null) {
			criteria.setNumsPerPage(perPage);
		}
		
		List<ProductVO> list = productService.readByRank(criteria);
		
		maker.setTotalCount(productService.getTotalNumsOfRecords());
		maker.setCriteria(criteria);
		maker.setPageData();
		
		model.addAttribute("productList", list);
		model.addAttribute("pageMaker", maker);
	}
	
        
}