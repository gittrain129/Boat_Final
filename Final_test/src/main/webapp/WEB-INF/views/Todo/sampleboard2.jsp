<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">
<link rel="stylesheet" href="css/style.css">
<script nonce="6e5cf715-ec76-422a-9364-4aec90599c7e">(function(w,d){!function(bv,bw,bx,by){bv[bx]=bv[bx]||{};bv[bx].executed=[];bv.zaraz={deferred:[],listeners:[]};bv.zaraz.q=[];bv.zaraz._f=function(bz){return function(){var bA=Array.prototype.slice.call(arguments);bv.zaraz.q.push({m:bz,a:bA})}};for(const bB of["track","set","debug"])bv.zaraz[bB]=bv.zaraz._f(bB);bv.zaraz.init=()=>{var bC=bw.getElementsByTagName(by)[0],bD=bw.createElement(by),bE=bw.getElementsByTagName("title")[0];bE&&(bv[bx].t=bw.getElementsByTagName("title")[0].text);bv[bx].x=Math.random();bv[bx].w=bv.screen.width;bv[bx].h=bv.screen.height;bv[bx].j=bv.innerHeight;bv[bx].e=bv.innerWidth;bv[bx].l=bv.location.href;bv[bx].r=bw.referrer;bv[bx].k=bv.screen.colorDepth;bv[bx].n=bw.characterSet;bv[bx].o=(new Date).getTimezoneOffset();if(bv.dataLayer)for(const bI of Object.entries(Object.entries(dataLayer).reduce(((bJ,bK)=>({...bJ[1],...bK[1]})))))zaraz.set(bI[0],bI[1],{scope:"page"});bv[bx].q=[];for(;bv.zaraz.q.length;){const bL=bv.zaraz.q.shift();bv[bx].q.push(bL)}bD.defer=!0;for(const bM of[localStorage,sessionStorage])Object.keys(bM||{}).filter((bO=>bO.startsWith("_zaraz_"))).forEach((bN=>{try{bv[bx]["z_"+bN.slice(7)]=JSON.parse(bM.getItem(bN))}catch{bv[bx]["z_"+bN.slice(7)]=bM.getItem(bN)}}));bD.referrerPolicy="origin";bD.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(bv[bx])));bC.parentNode.insertBefore(bD,bC)};["complete","interactive"].includes(bw.readyState)?zaraz.init():bv.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document);</script></head>
<jsp:include page="../Main/header.jsp" />
</head>
<body>
<section class="ftco-section">
<div class="container">
<div class="row">
<div class="col-md-12 text-center">
<h2 class="heading-section mb-5 pb-md-4">Accordion #01</h2>
</div>
</div>
<div class="row justify-content-center">
<div class="col-md-8 col-lg-6">
<div id="accordion" class="myaccordion w-100">
<div class="p-4 text-center">
<h3>Prices</h3>
<p>Far far away, behind the word mountains, far from the countries Vokalia</p>
</div>
<div class="card">
<div class="card-header py-3 px-4" id="headingOne">
<h2 class="mb-0">
<button class="d-flex align-items-center justify-content-between btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
Spa Therapies
<i class="fa" aria-hidden="true"></i>
</button>
</h2>
</div>
<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
<div class="card-body py-md-5 px-4">
<ul>
<li class="d-sm-flex">
<span>Face Treatments</span>
<span>40 min.</span>
<span>$10</span>
</li>
<li class="d-sm-flex">
<span>Nail Treatments</span>
<span>30 min.</span>
<span>$20</span>
</li>
<li class="d-sm-flex">
<span>Medical Treatments</span>
<span>60 min.</span>
<span>$10</span>
</li>
<li class="d-sm-flex">
<span>Hair Treatments</span>
<span>30 min.</span>
<span>$30</span>
</li>
</ul>
</div>
</div>
</div>
<div class="card">
<div class="card-header py-3 px-4" id="headingTwo">
<h2 class="mb-0">
<button class="d-flex align-items-center justify-content-between btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
Massage Therapies
<i class="fa" aria-hidden="true"></i>
</button>
</h2>
</div>
<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
<div class="card-body py-md-5 px-4">
<ul>
<li class="d-sm-flex">
<span>Face Treatments</span>
<span>40 min.</span>
<span>$10</span>
</li>
<li class="d-sm-flex">
<span>Nail Treatments</span>
<span>30 min.</span>
<span>$20</span>
</li>
<li class="d-sm-flex">
<span>Medical Treatments</span>
<span>60 min.</span>
<span>$10</span>
</li>
<li class="d-sm-flex">
<span>Hair Treatments</span>
<span>30 min.</span>
<span>$30</span>
</li>
 </ul>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</section>
</body>
</html>