  package com.boat.controller.filebo;
  
  import java.io.File;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import
  org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import
  org.springframework.web.bind.annotation.RequestMapping;
import
  org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.boat.FileboService.FileBoService;
import com.boat.FileboService.FileCommentService;
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
  
  
  @RequestMapping(value="/list",method=RequestMethod.GET)
  public String list()
  {
  return "Filebo/Newfilelist"; 
  
  }
  
  @RequestMapping(value="/write",method=RequestMethod.GET) 
  public String  write() {
  
  return "Filebo/File_bo_Write"; 
  }
  @RequestMapping(value="/reply",method=RequestMethod.GET) 
  public String  reply() {
	  
	  return "Filebo/File_bo_reply"; 
  }
  
  @PostMapping(value="/add")//board/add 
  public String add( Filebo board,
		  			HttpServletRequest request) throws Exception {
  
  MultipartFile uploadfile = board.getUploadfile();
  
  if(!uploadfile.isEmpty()) { String fileName =
  uploadfile.getOriginalFilename();//원래 파일명
  board.setFILE_ORIGINAL(fileName);//원래 파일명 저장
  
  // String saveFolder =  request.getSession().getServletContext().getRealPath("resources") +"/upload";
  
  //위에서 saveFolder 주입받아 생성함. 
  String saveFolder= mysavefolder.getSavefolder();
  String fileDBName = fileDBName(fileName, saveFolder);//update에서도 쓸예정입니다.
  logger.info("fileDBName= "+fileDBName);
  
  //transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
  uploadfile.transferTo(new File(saveFolder + fileDBName)); logger.info("transferTo path ="  +saveFolder+fileDBName); //바뀐 파일명으로 저장 
  board.setFILE_FILE(fileDBName); }
  
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
  
  @GetMapping(value="/detail")
  public String detail()
  {
	  return "Filebo/File_bo_view2"; 
	  
  }
  @GetMapping(value="/modifyView")
  public String update()
  {
	  return "Filebo/File_bo_update"; 
	  
  }
  

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
		return mv;
	
	}
							 
							 }//클래스 end
 