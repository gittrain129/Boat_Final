/*
 * package com.boat.controller.filebo;
 * 
 * import java.io.File; import java.util.Calendar; import java.util.Random;
 * 
 * import javax.servlet.http.HttpServletRequest;
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.multipart.MultipartFile;
 * 
 * @Controller
 * 
 * @RequestMapping(value="/Filebo")
 * 
 * public class FileBoardController {
 * 
 * private static final Logger logger =
 * LoggerFactory.getLogger(BoardController.class);
 * 
 * private MySaveFoler mysavefolder; private FileBoService boardService;
 * 
 * private CommentService commentService;
 * 
 * 
 * @Autowired public BoardController(BoardService boardService, CommentService
 * commentService, MySaveFoler mysavefolder) { this.boardService = boardService;
 * this.commentService = commentService; this.mysavefolder = mysavefolder; }
 * 
 * 
 * @RequestMapping(value="/list",method=RequestMethod.GET) public String list()
 * {
 * 
 * 
 * return "Filebo/Newfilelist"; }
 * 
 * @RequestMapping(value="/list2",method=RequestMethod.GET) public String
 * mainpage() {
 * 
 * 
 * return "Filebo/File_bo_List"; }
 * 
 * @RequestMapping(value="/write",method=RequestMethod.GET) public String
 * write() {
 * 
 * 
 * return "Filebo/File_bo_Write"; }
 * 
 * @PostMapping(value="/add")//board/add public String add( Filebo board,
 * HttpServletRequest request) throws Exception {
 * 
 * MultipartFile uploadfile = board.getUploadfile();
 * 
 * if(!uploadfile.isEmpty()) { String fileName =
 * uploadfile.getOriginalFilename();//원래 파일명
 * board.setBOARD_ORIGINAL(fileName);//원래 파일명 저장
 * 
 * // String saveFolder =
 * request.getSession().getServletContext().getRealPath("resources") +"/upload";
 * 
 * //위에서 saveFolder 주입받아 생성함. String saveFolder= mysavefolder.getSavefolder();
 * String fileDBName = fileDBName(fileName, saveFolder);//update에서도 쓸예정입니다.
 * logger.info("fileDBName= "+fileDBName);
 * 
 * //transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다. uploadfile.transferTo(new
 * File(saveFolder + fileDBName)); logger.info("transferTo path ="
 * +saveFolder+fileDBName); //바뀐 파일명으로 저장 board.setBOARD_FILE(fileDBName); }
 * 
 * boardService.insertBoard(board);//저장메서드 호출
 * logger.info(board.toString());//selectKey로 정의한 BOARD_NUM값 확인해 봅니다. return
 * "redirect:list"; }
 * 
 * //폴더 생성 및 파일 이름 생성 private String fileDBName(String fileName, String
 * saveFolder) { //새로운 폴더 이름 : 오늘 년+월+일 Calendar c = Calendar.getInstance() ;
 * int year = c.get(Calendar.YEAR); //오늘 년도 구합니다. int month =
 * c.get(Calendar.MONTH)+1; //오늘 월 구합니다. int date = c.get(Calendar.DATE); //오늘 일
 * 구합니다.
 * 
 * String homedir = saveFolder +"/"+year+"-"+month+"-"+date;
 * logger.info(homedir); File path1 = new File(homedir); if(!(path1.exists())) {
 * path1.mkdir();//새로운 폴더를 생성 }
 * 
 * //난수를 구합니다. Random r = new Random(); int random = r.nextInt(1000000000);
 * 
 *//*** 확장자 구하기 시작 **/
/*
 * ; int index = fileName.lastIndexOf(".");
 * 
 * logger.info("index = "+ index);
 * 
 * String fileExtension = fileName.substring(index+1);
 * logger.info("fileExtension = " +fileExtension );
 * 
 *//****** 확장자 구하기 끝 ******//*
							 * 
							 * //새로운 파일명 String refileName = "bbs" + year +month +date + random + "." +
							 * fileExtension; logger.info("refileName ="+refileName);
							 * 
							 * //오라클 디비에 저장될 파일 명 //String fileDBName = "/" + year + "-" +month +"-"+date
							 * +"/"+refileName; String fileDBName = File.separator + year + "-" +month
							 * +"-"+date +"/"+refileName; logger.info("fileDBName = "+ fileDBName);
							 * 
							 * 
							 * return fileDBName; }
							 * 
							 * }//클래스 end
							 */