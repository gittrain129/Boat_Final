<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- <link rel="stylesheet" href="${path}\resources\css\schedule\calendar.css"> -->
<!-- <script defer src="${path}/resources/js/schedule/calendar.js"></script> -->
<jsp:include page="../Main/header.jsp" />
	

<style>
    .calendar{
    width:80%;
    height: 100%;
    padding: 30px;
}

.header{
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.year-month{
    font-size: 30px;
}

.btn {
    border: none;
    width: 85px;
    height: 30px;
}

.write {
    width: 120px;
    height: 40px;
}


.nav{
    display: flex;
    border-radius: 5px;
}

.nav-btn{
    width: 28px;
    height: 30px;
    border: none;
    font-size: 16px;
    line-height: 34px;
    background-color: transparent;
    cursor: pointer;
}

.nav-btn:hover{
    background-color: rgb(197, 197, 197);
    border-radius: 5px;
}

.category-btn{
    width: 48px;
    height: 26px;
    border: 1px solid #aaa;
    background-color: #FFFFFF;
    cursor: pointer;
}

.category-btn:hover{
    background-color: #17a897;
    color: #FFFFFF;
    border: none;
}

.go-prev , .go-next {
    color: #aaa;
    font-weight: bold;
}

.go-prev:hover , .go-next:hover {
    color: #333333;
}

.go-today{
    width: 75px;
}

.days{
    display: flex;
    margin: 25px 0 10px;
}

.day{
    width: calc(100% / 7);
    text-align: center;
}

.dates{
    display: flex;
    flex-flow: row wrap;
    height: 600px;
    border-top: 1px solid #aaa;
    border-right: 1px solid #aaa;
}

.date{
    width: calc(100% / 7);
    padding: 15px;
    text-align: right;
    border-bottom: 1px solid #aaa;
    border-left: 1px solid #aaa;
    z-index: 1;
}

.day:nth-child(7n + 1),
.date:nth-child(7n + 1){
    color: #d13e3e;
}

.day:nth-child(7n),
.date:nth-child(7n){
    color: #396EE2;
}

.other{
    opacity: 0.3;
}

.today{
    position: relative;
    color: #FFFFFF;
}

.today::before{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: -1;
    width: 30px;
    height: 30px;
    display: block;
    background-color: #FF0000;
    border-radius: 50%;
    content: '';
}

/* modal */

#modal.modal-overlay {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    display: none;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: rgba(255, 255, 255, 0.25);
    box-shadow: 0 8px 8px 0 #2fa597;
    backdrop-filter: blur(1.5px);
    --webkit-backdrop-filter: blur(1.5px);
    border-radius: 10px;
    border: 1px solid #aaa;
    z-index: 5;
}
#modal .modal-window {
    background: #FFFFFF;
    box-shadow: 3px 5px 10px 0 #2fa597;
    --backdrop-filter: blur( 13.5px );
    --webkit-backdrop-filter: blur( 13.5px );
    border: 1px solid #d3d3d3;
    border-radius: 5px;
    width: 850px;
    height: 780px;
    position: relative;
    padding: 10px;
}
#modal .title {
    padding-top: 80px;
    padding-left: 40px;
    padding-bottom: 20px;
    --display: inline; 
    display: flex;
    font-size: 35px;
    font-weight: bolder;
    justify-content: space-between;
}

#modal .title p {
    margin: 15px;
    color: black;
    font-size: 32px;
}

#modal p {
    margin-top: 2px;
    margin-left: 15px;
    color: #aaa;
    font-weight: bold;
    font-size: 20px;
}

#modal .close-area {
    --display: inline;
    --float: right;
    padding-right: 40px;
    cursor: pointer;
}

#modal .status {
    display: flex;
    margin-left: 40px;
    margin-bottom: 30px;
}

#modal .member {
    display: flex;
    margin-left: 40px;
    margin-bottom: 30px;
}

#modal .scheduledate {
    display: flex;
    margin-left: 40px;
    margin-bottom: 30px;
}

#modal .schedule-title {
    display: flex;
}

#modal input{
    margin-left: 30px;
    border: none;
    outline: 1px #aaa;
}

#modal .hidden{
    margin-left: 40px;
    width: 84%;
}

#modal .status-btn {
    display: flex;
}

#modal .contentbox {
    width: 80%;
    height: 40%;
}

#modal .content {
    margin-left: 55px;
    padding: 10px;
    resize: none;
    width: 100%;
    height: 90%;
}

#modal .footer-btn {
    display: flex;
    justify-content: center;
}

.footer-btn .btn,
.footer-btn .c-btn {
    margin-right: 15px;
    width: 125px;
    height: 50px;
}
 
#modal .schedule-title span {
    columns: #12887A;
}

/* modal 색상 옵션 */
.hide {
    display: none;
}
/* .show{
    display: block;
} */

.select{
    position: relative;
    padding: 5px 10px;
    width: 150px;
    height: 40px;
    border-radius: 5px;
    border:1px solid #d3d3d3;
    background-color: #ffffff;
    background-image: url("https://img.icons8.com/material-rounded/24/000000/expand-arrow.png");
    background-repeat: no-repeat;
    background-position: 96% center;
    cursor: pointer;
}

.select > span {
    display: flex;
    justify-content: center;
    padding-top: 5px;
    padding-right: 7px;
}

.select ul{
    position: absolute;
    top: 39px;
    left: 1px;
    width: 100%;
    border:1px solid #d3d3d3;
    border-radius: 5px;
    background-color: #ffffff;
    cursor: pointer;
    z-index: 1;
}
.select ul li{
    padding: 10px;
    text-align: center;
}

.select ul li:hover{
    background-color: floralwhite;
}

</style>
</head>
<body>
    <!-- 메뉴바 고정 -->

    <main class="main-box">
        <div class="calendar box">
            <div class="header">
                <div class="nav-1">
                    <button  type="button" class="btn write" id="btn-modal"><p>작성하기</p></button>
                </div>
                <div class="year-month"></div>
                <div>
                <div class="nav">
                    <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
                    <button class="nav-btn go-today" onclick="goToday()">오늘</button>
                    <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
                </div>
                <div class="category">
                    <br>
                    <button class="category-btn">월간</button>
                    <button class="category-btn" onclick="location.href='${path}/schedule/weeks'">주간</button>
                    <button class="category-btn">일간</button>
                </div>
                </div>
            </div>
            <div class="main">
                <div class="days">
                    <div class="day">일</div>
                    <div class="day">월</div>
                    <div class="day">화</div>
                    <div class="day">수</div>
                    <div class="day">목</div>
                    <div class="day">금</div>
                    <div class="day">토</div>
                </div>
                <div class="dates"></div>
            </div>
        </div>
    </main>
    <!-- Modal -->
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <p>일정 제목란</p>
                <div class="close-area">
                    <span class="material-symbols-outlined">close</span>
                </div>
            </div>
            <div class="scheduledate">
                <div class="schedule-title">
                    <p>일정</p>
                </div>
                <input type="date" name="startdate">
                <p>~</p>
                <input type="date" name="enddate">
            </div>
            <div class="schedule-color">
                <p>색상</p>
                <div class="select" data-role="selectBox">
                    <span date-value="optValue" class="selected-option" id="membervalue"><!-- 선택된 옵션 값이 출력되는 부분 --></span>
                    <ul class="hide">
                        <li class="option-wrap">red</li>
                        <li class="option-wrap">green</li>
                        <li class="option-wrap">blue</li>
                    </ul>
                </div>
            </div>
            <div class="hidden"></div>
            <div class="contentbox">
                <p>내용</p>
                <textarea name="content" class="content"></textarea>
            </div>
            <div class="footer-btn">
                <button class="btn" type="button">작성하기</button>
                <button class="c-btn" type="button" onclick="location.href='history.back()'">취소하기</button>
            </div>
        </div>
    </div>
    <script>
let date = new Date();
console.log(date);

const renderCalender = () =>{
    const viewYear  = date.getFullYear();
    const viewMonth = date.getMonth();

    document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;

    const prevLast = new Date(viewYear, viewMonth , 0);
    const thisLast = new Date(viewYear, viewMonth + 1 , 0);

    const PLDate = prevLast.getDate();
    const PLDay = prevLast.getDay();

    const TLDate = thisLast.getDate();
    const TLDay = thisLast.getDay();

    const prevDates = [];
    const thisDates = [...Array(TLDate + 1).keys()].slice(1);
    const nextDates = [];

    if(PLDay !== 6) {
        for(let i = 0; i < PLDay + 1; i++) {
            prevDates.unshift(PLDate - i);
        }
    }

    for(let i = 1; i < 7 - TLDay; i++) {
        nextDates.push(i);
    }

    const dates = prevDates.concat(thisDates, nextDates);
    const firstDateIndex = dates.indexOf(1);
    const lastDateIndex = dates.lastIndexOf(TLDate);

    dates.forEach((date, i) => {
        const condition = i >= firstDateIndex && i < lastDateIndex + 1
                          ? 'this'
                          : 'other';
        dates[i] = `<div class="date"><span class=${condition}>${date}</span></div>`;
    });

    document.querySelector('.dates').innerHTML = dates.join('');

    const today = new Date();
    if(viewMonth === today.getMonth() && viewYear === today.getFullYear()){
        for(let date of document.querySelectorAll('.this')) {
            if(+date.innerText === today.getDate()) {
                date.classList.add('today');
                break;
            }
        }
    }
};

renderCalender();

const prevMonth = () =>{
    date.setMonth(date.getMonth() - 1);
    renderCalender();
};

const nextMonth = () =>{
    date.setMonth(date.getMonth() + 1);
    renderCalender();
};

const goToday = () => {
    date = new Date();
    renderCalender();
};

// modal

const modal = document.getElementById("modal");

function modalOn() {
    modal.style.display = "flex"
}

function isModalOn() {
    return modal.style.display === "flex"
}
function modalOff() {
    modal.style.display = "none"
}
const btnModal = document.getElementById("btn-modal")
btnModal.addEventListener("click", e => {
    modalOn()
})
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modalOff()
})
modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modalOff()
    }
})
window.addEventListener("keyup", e => {
    if(isModalOn() && e.key === "Escape") {
        modalOff()
    }
})

    </script>
</body>
</html>