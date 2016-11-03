// JavaScript Document

<!--
var deplay=2000,
 
page=$(".items>li").length, 
current=1,
dir=true;

function goPlay(){
	setInterval(function(){
	if(dir){
			goNext();
			}
		 else{goPrev();}
	},deplay);
	}


function seekTo(i){
	var left=$(".items >li").eq(i).position().left;
	$(".items").animate({left:-left},300,'linear');
	}

function goPrev(){
	if(current==0){dir=true; return;}
	current--;
	seekTo(current);
	
	}

function goNext(){
	if(current==page){dir=false;return;}				  
	seekTo(current); 
	current++;
	}

$(".run_button_left").click(function(){
	goPrev();
});

$(".run_button_right").click(function(){
	goNext();	
});
goPlay();
-->