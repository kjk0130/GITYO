package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

@RequestMapping(value="board")
@Component
public class BoardController {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private BoardPaging boardPaging;
	
	@RequestMapping(value="boardWriteForm", method=RequestMethod.GET)
	public String boardWriteForm(Model model) {
		model.addAttribute("display", "/board/boardWriteForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="boardWrite", method=RequestMethod.POST)
	public ModelAndView boardWrite(@RequestParam Map<String,String> map,
								   HttpSession session) {
		String id = (String)session.getAttribute("memId");
		String name = (String)session.getAttribute("memName");
		String email = (String)session.getAttribute("memEmail");
		
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		//DB
		boardDAO.boardWrite(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", "1");
		mav.addObject("display", "/board/boardList.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public String boardList(@RequestParam(required=false, defaultValue="1") String pg
							,Model model) {
		
		model.addAttribute("pg", Integer.parseInt(pg));
		model.addAttribute("display", "/board/boardList.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="getBoardList", method=RequestMethod.POST)
	public ModelAndView getBoardList(@RequestParam(required=false ,defaultValue="1") String pg) {
		//DB - 1페이지당 5개씩
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<BoardDTO> list = boardDAO.getBoardList(map);
		
		//페이징처리
		int totalA = boardDAO.getTotalA();
		
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="boardSearch", method=RequestMethod.POST)
	public ModelAndView boardSearch(@RequestParam(required=false) Map<String,String> map) {
		System.out.println(map.get("pg")+","+map.get("searchOption"));
		int endNum = Integer.parseInt(map.get("pg"))*5;
		int startNum = endNum-4;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		//DB
		List<BoardDTO> list = boardDAO.boardSearch(map);
		
		//페이징처리
		int totalA = boardDAO.getSearchTotalA(map);
		
		boardPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makeSearchPagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="boardView", method=RequestMethod.GET)
	public String boardView(@RequestParam int seq,@RequestParam int pg, Model model) {
		//DB
		BoardDTO boardDTO = boardDAO.boardView(seq);
		
		model.addAttribute("pg", pg);
		model.addAttribute("boardDTO", boardDTO);
		model.addAttribute("display", "/board/boardView.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="boardReplyForm", method=RequestMethod.GET)
	public String boardReplyForm(@RequestParam int pseq,@RequestParam int pg, Model model) {
		model.addAttribute("pseq", pseq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardReplyForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="boardReply", method=RequestMethod.POST)
	public String boardReply(@ModelAttribute BoardDTO boardDTO,
							 @RequestParam int pg,
							 HttpSession session,
							 Model model) {
		
		BoardDTO pDTO = boardDAO.boardView(boardDTO.getPseq());//원글
		
		boardDTO.setId((String)session.getAttribute("memId"));
		boardDTO.setName((String)session.getAttribute("memName"));
		boardDTO.setEmail((String)session.getAttribute("memEmail"));
		boardDTO.setRef(pDTO.getRef());//답글ref = 원글ref
		boardDTO.setLev(pDTO.getLev()+1);//답글lev = 원글lev+1
		boardDTO.setStep(pDTO.getStep()+1);//답글step = 원글step+1
		
		//DB
		boardDAO.boardReply(boardDTO);
		
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardList.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="boardDelete", method=RequestMethod.POST)
	public String boardDelete(@RequestParam String seq, Model model) {
		//DB
		boardDAO.boardDelete(Integer.parseInt(seq));
		
		model.addAttribute("pg", "1");
		model.addAttribute("display", "/board/boardList.jsp");
		return "/main/index";
	}

}



































