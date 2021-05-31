package web.spring.skintalk.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.spring.skintalk.domain.BoardVO;
import web.spring.skintalk.service.BoardService;
import web.spring.skintalk.util.PageCriteria;
import web.spring.skintalk.util.PageMaker;

@Controller
@RequestMapping(value = "/board") // url : /ex02/board/
public class BoardController {
	private static final Logger LOGGER = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;

	@GetMapping("/list")
	public void list(Model model, Integer page, Integer perPage) {
		LOGGER.info("list() 호출");
		LOGGER.info("page = " + page + ", perPage = " + perPage);

		PageCriteria criteria = new PageCriteria();
		if (page != null) {
			criteria.setPage(page);
		}

		if (perPage != null) {
			criteria.setNumsPerPage(perPage);
		}

		List<BoardVO> list = boardService.read(criteria);
		model.addAttribute("list", list);

		PageMaker maker = new PageMaker();
		maker.setCriteria(criteria);
		maker.setTotalCount(boardService.getTotalNumsOfRecords());
		maker.setPageData();
		model.addAttribute("pageMaker", maker);
	}

	@GetMapping("/register")
	public void registerGET() {
		LOGGER.info("registerGET() 호출");
	}

	@PostMapping("/register")
	public String registerPOST(BoardVO vo, RedirectAttributes reAttr) {
		LOGGER.info("registerPOST() 호출");
		LOGGER.info(vo.toString());
		int result = boardService.create(vo);
		LOGGER.info(result + "행 삽입");
		if (result == 1) {
			reAttr.addFlashAttribute("insert_result", "success");
			return "redirect://board/list";
		} else {
			reAttr.addFlashAttribute("insert_result", "fail");
			return "redirect://board/list";
		}
	}
	
	@GetMapping("/detail")
	public void detali(Model model, Integer boardNo, Integer page) {
		LOGGER.info("detail() 호출 : bno = " + boardNo);
		BoardVO vo = boardService.read(boardNo);
		model.addAttribute("vo", vo);
		model.addAttribute("page", page);
	}
	
	@GetMapping("/update")
	public void updateGET(Model model, Integer boardNo, Integer page) {
		LOGGER.info("updateGET()호출");
		BoardVO vo = boardService.read(boardNo);
		model.addAttribute("vo", vo);
		model.addAttribute("page", page);
	}
	
	@PostMapping("/update")
	public String updatePOST(BoardVO vo, int page, RedirectAttributes reAttr) {
		LOGGER.info("updatePOST()호출");
		LOGGER.info(vo.toString());
		int result = boardService.update(vo);
		LOGGER.info(result + "행 수정");
		if (result==1) {
			reAttr.addFlashAttribute("update_result", "success");
			return "redirect://board/list?page=" + page;
		}else {
			reAttr.addFlashAttribute("update_result", "fail");
			return "redirect://board/list?bno=" + vo.getBoardNo();
		}
	}
	
	@GetMapping("/delete")
	public String delete(Integer boardNo) {
		LOGGER.info("delete()호출 : boardNo = " + boardNo);
		int result = boardService.delete(boardNo);
		if (result==1) {
			return "redirect://board/list";
		}else {
			return "redirect://board/error";
		}
	}
}
