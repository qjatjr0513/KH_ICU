package com.kh.icu.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.kh.icu.board.model.service.BoardService;
import com.kh.icu.common.Utils;
import com.kh.icu.common.model.vo.Image;
import com.kh.icu.common.socket.AlramHandler;
import com.kh.icu.common.socket.Sessions;
import com.kh.icu.content.controller.ContentController;
import com.kh.icu.content.model.service.ContentService;
import com.kh.icu.content.model.vo.Content;
import com.kh.icu.faq.model.service.FaqService;
import com.kh.icu.faq.model.vo.Faq;
import com.kh.icu.member.model.service.MemberService;
import com.kh.icu.member.model.vo.Member;
import com.kh.icu.party.model.service.PartyService;
import com.kh.icu.party.model.vo.Party;
import com.kh.icu.pay.model.service.PayService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private PartyService partyService;

	@Autowired
	private FaqService faqservice;

	@Autowired
	private BoardService boardService;

	@Autowired
	private ContentService contentService;

	@Autowired
	private PayService payService;

	@Autowired
	private AlramHandler alramHandler;

	private static final Logger logger = LoggerFactory.getLogger(ContentController.class);

	// 관리자 회원 관리
	/**
	 * 관리자 회원리스트
	 */
	@RequestMapping("memListForm.me")
	public String memberList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model,
			@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> map = new HashMap();

		map = memberService.selectMemList(currentPage);

		model.addAttribute("map", map);

		return "member/memberListForm";
	}

	/**
	 * 관리자 블랙리스트
	 */
	@RequestMapping("memBlackListForm.me")
	public String memberBlackList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model,
			@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> map = new HashMap();

		map = memberService.selectBlackList(currentPage);

		model.addAttribute("map", map);

		return "member/memberBlackListForm";
	}

	/**
	 * 관리자 블랙리스트 해제
	 */
	@RequestMapping("blackCancel.me")
	public String blackCancel(int memNo, String memNickname, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		int result = memberService.blackCancel(memNo);

		if (result > 0) {
			int sendId = loginUser.getMemNo();
			String sendNickname = loginUser.getMemNickname();
			String receiveNickname = memNickname;
			int receiveId = memNo;

			String message = "cancle," + sendId + "," + sendNickname + "," + receiveNickname + "," + receiveId + ","
					+ memNo;

			// Map<String, WebSocketSession> userSessions = new HashMap<>();
			WebSocketSession receiveSession = Sessions.userSessions.get(receiveNickname);
			System.out.println(receiveSession);

			TextMessage msg = new TextMessage(message);

			try {
				alramHandler.handleTextMessage(receiveSession, msg);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return "redirect:memBlackListForm.me";

	}

	// 관리자 파티 관리

	// 관리자페이지 - 진행중인 파티
	@RequestMapping("current.py")
	public ModelAndView currentPartyList(ModelAndView mav) {

		List<Party> list = partyService.currentPartyList();

		mav.addObject("list", list);
		mav.setViewName("party/currentPartyListForm");

		return mav;
	}

	// 관리자페이지 - 종료된 파티
	@RequestMapping("end.py")
	public ModelAndView endPartyList(ModelAndView mav) {

		List<Party> list = partyService.endPartyList();

		mav.addObject("list", list);
		mav.setViewName("party/endPartyListForm");

		return mav;
	}

	// 관리자 컨텐츠 관리
	@RequestMapping("/contentListForm")
	public String contentList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model,
			@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> map = new HashMap();
		map = contentService.getWrittenContent(currentPage);
		ArrayList<String> ottName = new ArrayList<String>();
		String full = "";
		ArrayList<Content> list = (ArrayList<Content>) map.get("list");
		map.remove("list");

		for (int i = 0; i < list.size(); i++) {
			ottName = contentService.getWrittenContentOtt(list.get(i).getConNo());
			for (int j = 0; j < ottName.size(); j++) {
				full += ottName.get(j);
				if (j != ottName.size() - 1) {
					full += ", ";
				}
			}
			list.get(i).setOttName(full);
			full = "";
			if (list.get(i).getConCategory().equals("1")) {
				list.get(i).setConCategory("영화");
			} else {
				list.get(i).setConCategory("드라마");
			}
		}
		map.put("list", list);

		model.addAttribute("list", list);
		model.addAttribute("map", map);

		System.out.println(map);
		return "content/contentListForm";
	}

	// 컨텐츠 등록 페이지
	@RequestMapping("/contentEnrollForm")
	public String contentEnrollForm() {
		return "content/contentEnrollForm";
	}

	// 컨텐츠 수정 페이지
	@RequestMapping("/contentUpdateForm")
	public String contentUpdateForm(@RequestParam(value = "conNo") int conNo, HttpSession session, Model model) {

		Content c = contentService.selectContent(conNo);

		ArrayList<String> genre = new ArrayList<String>();
		ArrayList<String> ott = new ArrayList<String>();

		genre = contentService.selectGenre(conNo);
		ott = contentService.selectOtt(conNo);

		model.addAttribute("content", c);
		model.addAttribute("genre", genre);
		model.addAttribute("ott", ott);

		return "content/contentUpdateForm";
	}

	// 컨텐츠 등록
	@RequestMapping("/contentEnroll")
	public String contentEnroll(Content c, @RequestParam("genre") ArrayList<String> genre, Image image,
			@RequestParam("poster") MultipartFile poster, @RequestParam("ott") ArrayList<String> ott,
			HttpSession session, Model model) {
		int resultImage = 0;
		int resultContent = 0;
		int resultGenre = 0;
		int resultOtt = 0;

		resultContent = contentService.insertContent(c);
		ArrayList<Integer> conNoList = new ArrayList<Integer>();
		int conNo = contentService.selectConNo();

		conNoList.add(conNo);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("conNo", conNoList);
		map.put("genre", genre);
		map.put("ott", ott);

		String filePath = "/resources/posterImg";

		if (!poster.getOriginalFilename().equals("")) {
			String savePath = session.getServletContext().getRealPath("/resources/posterImg/");
			System.out.println("savePath : " + savePath);
			String changeName = Utils.saveFile(poster, savePath);
			File file = new File(savePath + changeName);
			try {
				poster.transferTo(file);
				// System.out.println("save poster : "+file.exists());
			} catch (IllegalStateException | IOException e) {
				logger.error(e.getMessage());
			}

			image.setOriginName(poster.getOriginalFilename());
			image.setChangeName("/" + changeName);
			image.setRefTno(conNo);
			image.setFilePath(filePath);

			resultImage = contentService.insertImg(image);
		}

		resultGenre = contentService.insertGenre(map);
		resultOtt = contentService.insertOtt(map);

		if (resultContent > 0 && resultImage > 0 && resultGenre > 0 && resultOtt > 0) {
			Content cInfo = contentService.selectContent(conNo);

			model.addAttribute("info", cInfo);

			return "redirect:contentListForm";
		} else {
			model.addAttribute("errorMsg", "컨텐츠 등록 실패");
			return "common/errorPage";
		}

	}

	// 컨텐츠 수정
	@RequestMapping("/contentUpdate")
	public String contentUpdate(Content c, @RequestParam("genre") ArrayList<String> genre, Image image,
			@RequestParam("poster") MultipartFile poster, @RequestParam("ott") ArrayList<String> ott,
			HttpSession session, Model model) {
		int resultImage = 0;
		int resultContent = 0;
		int resultGenre = 0;
		int resultOtt = 0;
		int resultDeleteGenre = 0;
		int resultDeleteOtt = 0;

		resultContent = contentService.updateContent(c);
		ArrayList<Integer> conNoList = new ArrayList<Integer>();
		int conNo = contentService.selectConNo();

		conNoList.add(conNo);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("conNo", conNoList);
		map.put("genre", genre);
		map.put("ott", ott);

		String filePath = "/resources/posterImg";

		if (!poster.getOriginalFilename().equals("")) {
			String savePath = session.getServletContext().getRealPath("/resources/posterImg/");
			System.out.println("savePath : " + savePath);
			String changeName = Utils.saveFile(poster, savePath);
			File file = new File(savePath + changeName);
			try {
				poster.transferTo(file);
				// System.out.println("save poster : "+file.exists());
			} catch (IllegalStateException | IOException e) {
				logger.error(e.getMessage());
			}

			image.setOriginName(poster.getOriginalFilename());
			image.setChangeName("/" + changeName);
			image.setRefTno(conNo);
			image.setFilePath(filePath);

			resultImage = contentService.updateImg(image);
		}

		resultDeleteGenre = contentService.deleteGenre(map);
		resultDeleteOtt = contentService.deleteOtt(map);

		if (resultDeleteGenre > 0 && resultDeleteOtt > 0) {
			resultGenre = contentService.insertGenre(map);
			resultOtt = contentService.insertOtt(map);
		}

		System.out.println(resultContent);
		System.out.println(resultImage);
		System.out.println(resultGenre);
		System.out.println(resultOtt);

		if (resultContent > 0 && resultGenre > 0 && resultOtt > 0) {
			Content cInfo = contentService.selectContent(conNo);

			model.addAttribute("info", cInfo);

			return "redirect:contentListForm";
		} else {
			model.addAttribute("errorMsg", "컨텐츠 수정 실패");
			return "common/errorPage";
		}

	}

	// 컨텐츠 삭제
	@RequestMapping("/contentDelete")
	public String contentDelete(@RequestParam(value = "conNo") int conNo, HttpSession session, Model model) {

		int resultDelete = contentService.deleteContent(conNo);

		if (resultDelete > 0) {
			return "redirect:contentListForm";
		} else {
			model.addAttribute("errorMsg", "컨텐츠 수정 실패");
			return "common/errorPage";
		}
	}

	// 관리자 faq 관리
	@RequestMapping("faqList.fq")
	public String faqList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model,
			@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> map = new HashMap();

		map = faqservice.selectList(currentPage);

		model.addAttribute("map", map);

		return "faq/faqListForm";
	}

	@RequestMapping("enrollForm.fq")
	public String faqEnrollForm(Model model,
			@RequestParam(value = "mode", required = false, defaultValue = "insert") String mode,
			@RequestParam(value = "fno", required = false, defaultValue = "0") int fno) {

		if (mode.equals("update")) {

			Faq f = faqservice.selectFaq(fno);

			f.setFaqContent(Utils.newLineClear(f.getFaqContent()));

			model.addAttribute("f", f);
		}

		return "faq/faqEnrollForm";
	}

	@RequestMapping("insert.fq")
	public String insertFaq(Faq f, HttpSession session, Model model,
			@RequestParam(value = "mode", required = false, defaultValue = "insert") String mode,
			RedirectAttributes redirectAttributes) {
		int result = 0;
		if (mode.equals("insert")) {
			result = faqservice.insertFaq(f);
		} else {
			result = faqservice.updateFaq(f);
		}

		if (result > 0) {
			redirectAttributes.addFlashAttribute("flag2", "showAlert2");
			return "redirect:faqList.fq";
		} else {
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}

	}

	@RequestMapping("detail.fq/{fno}")
	public ModelAndView selectFaq(@PathVariable("fno") int fno, HttpSession session, ModelAndView mv) {
		Faq f = faqservice.selectFaq(fno);

		if (f != null) {

			mv.addObject("f", f);
			mv.setViewName("faq/faqDetailView");

		} else {
			// 상세조회 실패
			mv.addObject("errorMsg", "게시글 조회 실패");
			mv.setViewName("common/errorPage");
		}

		return mv;
	}

	@RequestMapping("delete.fq")
	public String deleteBoard(@RequestParam(value = "fno", required = false, defaultValue = "0") int fno,
			HttpSession session, Model model, RedirectAttributes redirectAttributes) {

		int result = faqservice.deleteFaq(fno);

		if (result > 0) {
			redirectAttributes.addFlashAttribute("flag", "showAlert");
			return "redirect:faqList.fq";
		} else {
			model.addAttribute("errorMsg", "FAQ 삭제 실패");
			return "common/errorPage";
		}
	}

	// 관리자 공지사항 관리
	@RequestMapping("/noticeList.bo")
	public String selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {

		Map<String, Object> map = new HashMap();

		map = boardService.selectNoticeList(currentPage);

		model.addAttribute("map", map);

		return "board/noticeListForm";
	}

	@RequestMapping("payManageListForm.pe")
	public String payManageListForm(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model,
			@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> map = new HashMap();

		map = payService.selectPayManageList(currentPage);

		model.addAttribute("map", map);

		return "pay/payManageList";
	}

	@RequestMapping("remitConfirm.pe")
	public String remitConfirm(int payNo, HttpSession session, @RequestParam("paName") int paName,
			@RequestParam("paMemNickName") String paMemNickName, @RequestParam("memNickName") String memNickName) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		int result = payService.remitConfirm(payNo);
		System.out.println("payNo :" + payNo);

		int sendId = loginUser.getMemNo();
		String sendNickname = memNickName;
		String receiveNickname = paMemNickName;
		int receiveId = paName;

		String message = "pay," + sendId + "," + sendNickname + "," + receiveNickname + "," + receiveId + "," + payNo;

		// Map<String, WebSocketSession> userSessions = new HashMap<>();
		WebSocketSession receiveSession = Sessions.userSessions.get(receiveNickname);
		System.out.println(receiveSession);

		TextMessage msg = new TextMessage(message);

		try {
			alramHandler.handleTextMessage(receiveSession, msg);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:payManageListForm.pe";

	}
}
