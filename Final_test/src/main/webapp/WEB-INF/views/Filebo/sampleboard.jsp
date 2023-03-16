<!-- https://bootsnipp.com/snippets/AlZ7g
	퍼온사이트 -->

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<jsp:include page="../boat/header.jsp" />
<style type="text/css">
.project-tab {
    padding: 10%;
    margin-top: -8%;
}
.project-tab #tabs{
    background: #007b5e;
    color: #eee;
}
.project-tab #tabs h6.section-title{
    color: #eee;
}
.project-tab #tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #0062cc;
    background-color: transparent;
    border-color: transparent transparent #f3f3f3;
    border-bottom: 3px solid !important;
    font-size: 16px;
    font-weight: bold;
}
.project-tab .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .25rem;
    border-top-right-radius: .25rem;
    color: #0062cc;
    font-size: 16px;
    font-weight: 600;
}
.project-tab .nav-link:hover {
    border: none;
}
.project-tab thead{
    background: #f3f3f3;
    color: #333;
}
.project-tab a{
    text-decoration: none;
    color: #333;
    font-weight: 600;
}</style>
</head>
<body>

<section id="tabs" class="project-tab">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <nav>
                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">할 일 목록</a>
                                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">진행정도</a>
                                <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">팀별 할 일 목록</a>
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                <table class="table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>내 할일</th>
                                            <th>시작날짜</th>
                                            <th>예상 마감일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a href="#">첫 번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">두 번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">세번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                <table class="table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>첫 번째 할 일</th>
                                            <th>그래프</th>
                                            <th></th>
                                        </tr> 
                                         <tr>
                                            <th>두 번째 할 일</th>
                                            <th>그래프</th>
                                            <th></th>
                                        </tr>
                                          <tr>
                                            <th>세 번째 할 일</th>
                                           <th>그래프</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                 <!--    <tbody>
                                        <tr>
                                            <td><a href="#">Work 1</a></td>
                                            <td>Doe</td>
                                            <td>john@example.com</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">Work 2</a></td>
                                            <td>Moe</td>
                                            <td>mary@example.com</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">Work 3</a></td>
                                            <td>Dooley</td>
                                            <td>july@example.com</td>
                                        </tr>
                                    </tbody> -->
                                </table>
                            </div>
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                <table class="table" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>A사원</th>
                                            <th>시작날짜</th>
                                            <th>예상 마감일</th>
                                        </tr>
                                    </thead>
                                
                                    <tbody>
                                     <tr>
                                            <th></th>
                                            <th>그래프</th>
                                            <th></th>
                                        </tr> 
                                        <tr>
                                            <td><a href="#">첫 번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">두 번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">세번째 할 일</a></td>
                                            <td>2023-03-10</td>
                                            <td>2023-03-12</td>
                                        </tr>
                                        
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td><b>더보기</b></td>
                                        </tr>
                                    </tbody>
                                     <thead>
                                        <tr>
                                            <td><a href="#">b사원</a></td>
                                            <td>그래프</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td><a href="#">c사원</a></td>
                                            <td>그래프</td>
                                            <td></td>
                                        </tr>
          </thead>
                                          </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
</body>
</html>