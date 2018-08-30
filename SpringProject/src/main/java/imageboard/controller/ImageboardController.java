package imageboard.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import imageboard.bean.ImageboardDTO;
import imageboard.bean.ImageboardPaging;
import imageboard.dao.ImageboardDAO;

@RequestMapping(value="imageboard")
@Component
public class ImageboardController {
	@Autowired
	private ImageboardDAO imageboardDAO;
	@Autowired
	private ImageboardPaging imageboardPaging;
	
	@RequestMapping(value="imageboardWriteForm", method=RequestMethod.GET)
	public String imageboardWriteForm(Model model) {
		model.addAttribute("display", "/imageboard/imageboardWriteForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="imageboardWrite", method=RequestMethod.POST)
	public String imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
								  @RequestParam MultipartFile img,
								  Model model) {
		
		String filePath = "D:\\Spring\\workspace\\SpringProject\\src\\main\\webapp\\storage";   
		String fileName = img.getOriginalFilename();
		File file = new File(filePath,fileName);
		
		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		imageboardDTO.setImage1(fileName);
		
		//DB
		imageboardDAO.imageboardWrite(imageboardDTO);
		
		model.addAttribute("display","/imageboard/imageboardList.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="imageboardList", method=RequestMethod.GET)
	public String imageboardList(@RequestParam(required=false, defaultValue="1") String pg,
								 Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/imageboard/imageboardList.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="getImageboardList", method=RequestMethod.POST)
	public ModelAndView getImageboardList(@RequestParam(required=false, defaultValue="1") String pg) {
		//DB - 1페이지당 3개씩
		int endNum = Integer.parseInt(pg)*3;
		int startNum = endNum-2;
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<ImageboardDTO> list = imageboardDAO.getImageboardList(map);
		
		//페이징처리
		int totalA = imageboardDAO.getTotalA();
		imageboardPaging.setCurrentPage(Integer.parseInt(pg));
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(3);
		imageboardPaging.setTotalA(totalA);
		imageboardPaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("imageboardPaging", imageboardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value="imageboardDelete", method=RequestMethod.POST)
	public String imageboardDelete(@RequestParam String[] box, Model model) {
		List<Integer> list = new ArrayList<Integer>();
		
		for(String seq : box) {
			list.add(Integer.parseInt(seq));
		}
		
		//DB
		imageboardDAO.imageboardDelete(list);
		model.addAttribute("display", "/imageboard/imageboardList.jsp");
		
		return "/main/index";
	}
	
	@RequestMapping(value="imageboardView", method=RequestMethod.GET)
	public String imageboardView(@RequestParam String seq, @RequestParam(required=false, defaultValue="1") String pg, Model model) {
		
		
		ImageboardDTO imageboardDTO = imageboardDAO.getImageboard(Integer.parseInt(seq));
		
		model.addAttribute("pg", pg);
		model.addAttribute("imageboardDTO", imageboardDTO);
		model.addAttribute("display", "/imageboard/imageboardView.jsp");
		return "/main/index";
	}
}















