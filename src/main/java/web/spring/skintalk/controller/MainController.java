package web.spring.skintalk.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.shineware.nlp.komoran.core.analyzer.Komoran;
import kr.co.shineware.util.common.model.Pair;
import web.spring.skintalk.domain.ProductVO;
import web.spring.skintalk.service.ProductService;
import web.spring.skintalk.util.PageCriteria;
import web.spring.skintalk.util.PageMaker;

@Controller
@RequestMapping(value="/main")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
    @Autowired
	private ProductService productService;
	
	@GetMapping("/index")			 // 쇼핑몰 홈페이지 호출
	public void index(Model model) {
		logger.info("index()호출 ");
		
		List<ProductVO> list = productService.read();
		model.addAttribute("productList", list);
		
		
	}// end of index
	
	@GetMapping("/product")			// 상품목록 페이지 호출
	public void product(Model model) {
		logger.info("product()호출");
		PageCriteria criteria = new PageCriteria(1, 12);
		
		List<ProductVO> list = productService.read(criteria);
		model.addAttribute("productList", list);
		
		PageMaker maker = new PageMaker();
		maker.setCriteria(criteria);
		maker.setTotalCount(productService.getTotalNumsOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
	}// end of product
	
	@GetMapping("/search-autocomplete")
	@ResponseBody
	public List<String> autoComplete(String keyword) {
		logger.info("자동완성 기능 호출");
		List<String> list = productService.readKeyword(keyword);
		
		return list;
		
	}
	
	@GetMapping("/search")
	public String search(String keyword) {
		logger.info("search() 호출 : keyword = " + keyword);
		
		Komoran komoran = new Komoran("/Users/hongdaeui/Downloads/models-light");
		
		List<List<Pair<String,String>>> result = komoran.analyzeWithoutSpace(keyword);
		for (List<Pair<String, String>> eojeolResult : result) {
			for (Pair<String, String> wordMorph : eojeolResult) {
				System.out.println(wordMorph);
			}
			System.out.println();
		}
		
		return "redirect:/main/product";
		
	}
	
}
