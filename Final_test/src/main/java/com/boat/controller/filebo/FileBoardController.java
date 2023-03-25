  package com.boat.controller.filebo;
  
  import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import
  org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import
  org.springframework.web.bind.annotation.RequestMapping;
import
  org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boat.Service.FileboService.FileBoService;
import com.boat.Service.FileboService.FileCommentService;
import com.boat.domain.Filebo;
import com.boat.domain.MySaveFoler;
  
  @Controller
  @RequestMapping(value="/Filebo")
  public class FileBoardController {
  
  private static final Logger logger =
  LoggerFactory.getLogger(FileBoardController.class);
  
  private MySaveFoler mysavefolder;
  private FileBoService boardService;
  private FileCommentService commentService;
  
  
  @Autowired public FileBoardController(FileBoService boardService, 
		  								FileCommentService commentService, 
		  								MySaveFoler mysavefolder)  {
	  this.boardService = boardService;
	  this.commentService = commentService;
	  this.mysavefolder = mysavefolder; }
  
  
  //게시판 초기화면
  @RequestMapping(value="/list",method=RequestMethod.GET)
  public ModelAndView fileboardlist(
			@RequestParam(value="page",defaultValue="1",required=false)int page,
			ModelAndView mv) {
		int limit = 10;
		int listcount = boardService.getListCount();//총 리스트 수를 받아옴
		int maxpage = (listcount +limit-1)/limit;
		
		int startpage = ((page-1)/10)*10+1;
		
		int endpage = startpage +10 -1;
		
		if(endpage>maxpage)
		endpage=maxpage;
		
		List<Filebo> boardlist = boardService.getBoardList(page,limit);//리스트를 받아옴
		
		mv.setViewName("Filebo/Newfilelist");
		mv.addObject("page",page);
		mv.addObject("maxpage",maxpage);
		mv.addObject("startpage",startpage);
		mv.addObject("endpage",endpage);
		mv.addObject("listcount",listcount);
		mv.addObject("boardlist",boardlist);
		mv.addObject("limit",limit);
		
		
		return mv;
		}
		  
  //글쓴화면
  @RequestMapping(value="/writeee",method=RequestMethod.GET) 
  public String  write() {
  
  return "Filebo/File_bo_Write"; 
  }
  
  
  
  
  
  //작성글 추가
  @PostMapping(value="/add") 
  public String add( Filebo board,
		  			HttpServletRequest request) throws Exception {
	  
		  MultipartFile uploadfile = board.getUploadfile();
		  MultipartFile uploadfile2 = board.getUploadfile2();
		  
		  if(!uploadfile.isEmpty()) {
			  String fileName = uploadfile.getOriginalFilename();//원래 파일명
			 
			  logger.info("있니?uploadfile1="+uploadfile.getOriginalFilename());//원래 파일명
			  
			  //==> 있음
		  board.setFILE_ORIGINAL(fileName);//원래 파일명 저장

		  
		  
		  String saveFolder= mysavefolder.getSavefolder();
		  String fileDBName = fileDBName(fileName, saveFolder);//update에서도 쓸예정입니다.
		  
		  logger.info("fileDBName= "+fileDBName);
		  
		  
		  //transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
		  uploadfile.transferTo(new File(saveFolder + fileDBName));
		  logger.info("transferTo path ="  +saveFolder+fileDBName); //바뀐 파일명으로 저장 
		   
		  board.setFILE_FILE(fileDBName); 
		   logger.info("왜 널이뜨는지 보자고"+uploadfile2.getOriginalFilename());
		   
		  	if(!uploadfile2.isEmpty()) {
		  		
		  		
		  		String fileName2 = uploadfile2.getOriginalFilename();//원래 파일명
		  		logger.info("있니?uploadfile2="+uploadfile2.getOriginalFilename());//원래 파일명
				board.setFILE_ORIGINAL2(fileName2);//원래 파일명 저장
				String fileDBName2 = fileDBName(fileName2, saveFolder);//update에서도 쓸예정입니다.
				logger.info("fileDBName2= "+fileDBName2);
				uploadfile2.transferTo(new File(saveFolder + fileDBName2)); 
				logger.info("uploadfile2 transferTo path ="  +saveFolder+fileDBName2); //바뀐 파일명으로 저장
				board.setFILE_FILE2(fileDBName2);
				  
		  	}
		  	
		  }
		  
		  boardService.insertBoard(board);//저장메서드 호출
		  logger.info(board.toString());//selectKey로 정의한 BOARD_NUM값 확인해 봅니다. 
		  return  "redirect:list"; 
		  }
		  
		  //폴더 생성 및 파일 이름 생성
		  private String fileDBName(String fileName,
				  					String  saveFolder) { //새로운 폴더 이름 : 오늘 년+월+일 
			  Calendar c = Calendar.getInstance() ;
		  int year = c.get(Calendar.YEAR); 
		  int month =  c.get(Calendar.MONTH)+1;
		  int date = c.get(Calendar.DATE); 
		  
		  String homedir = saveFolder +"/"+year+"-"+month+"-"+date;
		  logger.info(homedir); File path1 = new File(homedir);
		  if(!(path1.exists())) {
		  path1.mkdir();
		  }
		  
		  //난수를 구합니다. 
		  Random r = new Random();
		  int random = r.nextInt(1000000000);
		  
		 /*** 확장자 구하기 시작 **/
		
		  int index = fileName.lastIndexOf(".");
		 
		 logger.info("index = "+ index);
		 
		 String fileExtension = fileName.substring(index+1);
		 logger.info("fileExtension = " +fileExtension );
		 
		/****** 확장자 구하기 끝 ******/
									 
		//새로운 파일명 
		 String refileName = "bbs" + year +month +date + random + "." +	 fileExtension; logger.info("refileName ="+refileName);
									 
		String fileDBName = File.separator + year + "-" +month +"-"+date +"/"+refileName;
		logger.info("fileDBName = "+ fileDBName);
		
		return fileDBName; 
	  }	 
  
  @RequestMapping(value="/reply",method=RequestMethod.GET) 
	public ModelAndView FileboReplyView(int num, ModelAndView mv,
			HttpServletRequest request) {
		
		Filebo board = boardService.getDetail(num);
		if(board == null){
			mv.setViewName("error/error");
			mv.addObject("url",request.getRequestURL());
			mv.addObject("message","게시판 답변글 가져오기 실패");
			}else {
			mv.addObject("boarddata",board);
			mv.setViewName("Filebo/File_bo_reply");
			}
		return mv;
		}
  
  @PostMapping("/replyAction")
	public ModelAndView BoardReplyAction(Filebo board, ModelAndView mv,
										HttpServletRequest request,
										RedirectAttributes rattr) {
		int result = boardService.boardReply(board);
		if(result ==0) {
			mv.setViewName("error/error");
			mv.addObject("url",request.getRequestURL());
			mv.addObject("message","게시판 답변 처리 실패");
		}else {
			rattr.addAttribute("num",board.getFILE_NUM());
			mv.setViewName("redirect:detail");
			 
		}   
		return mv;		
	}	
  
  
 // @GetMapping(value="/modifyView")
   @GetMapping(value="/modify")
	public ModelAndView Filebomodify(
			int num, ModelAndView mv,
			HttpServletRequest request
			) {
		Filebo board = boardService.getDetail(num);
		
		if(board==null){
			logger.info("수정보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url",request.getRequestURL());
			mv.addObject("message","수정보기 실패입니다.");
			return mv;
		}else {
			logger.info("(수정)보기 성공");
			//수정 폼 페이지로 이동할 떄 원문 글 내용을 보여주기 때문에 boarddata객체를 
			//ModelAndView객체에 저장합니다.
			
			mv.addObject("boarddata",board);
			mv.setViewName("Filebo/File_bo_update");
			return mv;
		}
		
	}
	
   @PostMapping("/modifyAction")
	public String FileboModifyAction(
			Filebo boarddata,
			String check, Model mv,
			HttpServletRequest request,
			RedirectAttributes rattr)throws Exception {
		boolean usercheck = 
				boardService.isBoardWriter(boarddata.getFILE_NUM(), boarddata.getFILE_PASS());
		String url = "";
		
		//비밀번호가 다른 경우
		if(usercheck == false) {
			rattr.addFlashAttribute("result","passFail");
			rattr.addAttribute("num",boarddata.getFILE_NUM());
			return "redirect:modifyView";
		}
		MultipartFile uploadfile = boarddata.getUploadfile();
//		String saveFolder = request.getSession().getServletContext().getRealPath("resources")+"/upload";
		
		if(check != null&& !check.equals("")) {//기존 파일 그대로 사용하는 경우입니다.
			logger.info("기존파일 그대로 사용합니다.");
			boarddata.setFILE_ORIGINAL(check);
			//<input type="hidden" name="BOARD_FILE" value="${boarddata.BOARD_FILE}">
			//위 문장 때문에 board.setBOARD_FILE()값은 자동 저장됩니다.
			
		}else {
			//답변글의 경우 파일 첨부에 대한 기능이 없습니다.
			//만약 답변글을 수정할 경우 
			//<input type="file" id = "upfile" name="uploadfile">엘리먼트가 존재하지 않아
			//private MultipartFile uploadfile;에서 uploadfile은 null입니다.
		if(uploadfile!=null &&!uploadfile.isEmpty()) {
			logger.info("파일 추가/변경되었습니다.");
			
			String fileName = uploadfile.getOriginalFilename();//원래 파일명
			boarddata.setFILE_ORIGINAL(fileName);
			
			String saveFolder= mysavefolder.getSavefolder();
			String fileDBName = fileDBName(fileName, saveFolder);//update에서도 쓸예정입니다.
			
			logger.info("fileDBNAME = " +fileDBName);
			
			
			//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			logger.info("transferTo path =" +saveFolder+fileDBName);
			//바뀐 파일명으로 저장
			
			boarddata.setFILE_FILE(fileDBName);
		}else {//기존 파일이 없는데 파일 선택하지 않은 경우 또는 기존 파일이 있었는데 삭제한 경우
			
			logger.info("선택 파일 없습니다.");
			//<input type="hidden" name="BOARD_FILE" value="${boarddata.BOARD_FILE}">
			//위 태그에 값이 있다면 ""값을 변경합니다.
			boarddata.setFILE_FILE("");//""로 초기화
			boarddata.setFILE_ORIGINAL("");//""로 초기화
			}
		}
		//DAO에서 수정 메서드 호출하여 수정합니다.
		int result = boardService.boardModify(boarddata);
		//수정에 실패한 경우
		if(result==0) {
			logger.info("게시판 수정 실패");
			mv.addAttribute("url",request.getRequestURL());
			mv.addAttribute("message","게시판 수정 실패");
			url = "error/error";
			
		}else {//수정 성공의 경우
			logger.info("게시판 수정 완료");
			//수정한 글 내용을 보여주기 위해 글 내용 보기 보기 페이지로 이동하기 위해 경로 설정합니다.
			url = "redirect:detail";
			rattr.addAttribute("num",boarddata.getFILE_NUM());
		}
		return url;
	}
	
  @PostMapping("/delete")
	public String Boarddelete(
			String FILE_PASS,
			int num,
			Model mv, 
			RedirectAttributes rattr,
			HttpServletRequest request
			) {
		//글삭제 명령을 요청한 사용자가 글을 작성한 사용자인지 판단하기 위해
		//입력한 비밀번호와 저장된 비밀번호를 비교하여 일치하면 삭제합니다.
		boolean usercheck = boardService.isBoardWriter(num, FILE_PASS);
		
		//비밀번호 일치하지 않는경우
		if(usercheck ==false) {
			rattr.addFlashAttribute("result","passFail");
			rattr.addAttribute("num",num);
			return "redirect:detail";
		}
		
		
		//비밀번호 일치하는 경우 삭제 처리 합니다.
		int result = boardService.boardDelete(num);
		
		//삭제 처리 실패한 경우
		if(result ==0) {
			logger.info("게시판 삭제 실패");
			mv.addAttribute("url",request.getRequestURL());
			mv.addAttribute("message","삭제 실패");
			return "error/error";
		}
		
		//삭제 처리 성공한 경우- 글 목록 보기 요청을 전송하는 부분입니다.
		logger.info("게시판 삭제 성공");
		rattr.addFlashAttribute("result","deleteSuccess");
		return "redirect:list";
	}	
	
  //조회수 증가 및 글쓴페이지 상세보기
 // @GetMapping(value="/detail")
	@GetMapping(value="/hi")
	public ModelAndView Detail(
			int num,ModelAndView mv,
			HttpServletRequest request,
			@RequestHeader(value="referer",required=false)String beforeURL) {
		/*
		  1. String beforeURL = request.getHeader("referer"); 의미로
		 	어느 주소에서 detail로 이동했는지 header의 정보 중에서 "referer"를 통해 알 수 있습니다.
		  2. 수정 후 이곳으로 이동하는 경우 조회수는 증가하지 않도록 합니다.
		  3. myhome4/board/list에서 제목을 클릭한 경우 조회수가 증가하도록 합니다.
		  4. detail을 새로고침 하는 경우 referer는 header에 존재하지 않아 오류 발생하므로 
		  required = false 로 설정합니다. 이 경우 beforeURL 의 값은 null입니다.*/
		
		logger.info("referer:" + beforeURL);
		if(beforeURL!=null&&beforeURL.endsWith("list")) {
			boardService.setReadCountUpdate(num);
		}
		Filebo board = boardService.getDetail(num);
		//board=null; //error 페이지 이동 확인하고자 임의로 지정합니다.
		if(board==null){
			logger.info("상세보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url",request.getRequestURL());
			mv.addObject("message","상세보기 실패입니다.");
		}else {
			logger.info("상세보기 성공");
			int count = commentService.getListCount(num);
			mv.setViewName("Filebo/File_bo_view2");
			mv.addObject("count",count);
			mv.addObject("boarddata",board);
		}
		return mv;}
		
		
		@GetMapping(value="/hiff")
		public ModelAndView dfDetail(ModelAndView mv) {
				mv.setViewName("Filebo/File_bo_view");
				return mv;
		
		
	}
	//파일다운
		@ResponseBody
		@PostMapping("/down")
		public byte[] fileDown(String filename,
								String original,
								HttpServletRequest request,
								HttpServletResponse response) throws Exception {
			
			String saveFolder= mysavefolder.getSavefolder();
			String sFilePath = saveFolder + filename;
			
			File file = new File(sFilePath);
			byte[] bytes = FileCopyUtils.copyToByteArray(file);
			
			String sEndcoding = new String(original.getBytes("utf-8"),"ISO-8859-1");
			
			response.setHeader("Content-Disposition","attachment;filename="+sEndcoding);
			
			response.setContentLength(bytes.length);
			return bytes;
		}
		
							 
							 }//클래스 end
 