<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function(){
	var e,t,n,r;
	e=function(e){
		return $("<style>")
		.attr({"class":"keyframe-style",
			id:e.id,
			type:"text/css"}).appendTo("head")};
			
	$.keyframe={getVendorPrefix:function(){
		var e;e=navigator.userAgent;
		
		if(e.indexOf("Opera")!==-1){
			return"-o-"
		}else if(e.indexOf("MSIE")!==-1){
			return"-ms-"
		}else if(e.indexOf("WebKit")!==-1){
			return"-webkit-"
		}else{return""}
		
	 },isSupported:function(){
		 var e,t,n;t=$("body").get(0);e=false;
		 
		 if(t.style.animationName){
			 e=true
		}else{
			n=this.getVendorPrefix().slice(1,-1);
			var r=n+"AnimationName";
			if(r in t.style){
				e=true}}return e
			},getProperty:function(e){
				var t=e;
				switch(e){
				case "transform":
					t=this.getVendorPrefix()+t;break
				}return t
			},generate:function(t){
				var n,r,i,s,o,u;
				
				s=t.name||"";
				i="@"+this.getVendorPrefix()+"keyframes "+s+" {";
				
				for(u in t){
					if(u!=="name"){
						i+=u+" {";
						for(o in t[u]){
							var a=this.getProperty(o);
							i+=a+":"+t[u][o]+";"
						}i+="}"
					}
				}
				i+="}";
				r=$("style#"+t.name);
				if(r.length>0){
					r.html(i);
					n=$("*").filter(function(){
						this.style[""+$.keyframe
							.getVendorPrefix()
							.slice(1,-1)+"AnimationName"]===s
							});
					n.each(function(){
						var e,t;
						e=$(this);
						t=e.data("keyframeOptions");
						e.resetKeyframe(function(){
							e.playKeyframe(t)
							})
					})
				}else{
					e({id:s}).append(i)
				}
			},define:function(e){
				if(e.length){
					for(var t=0;t<e.length;t++){
						var n=e[t];
						this.generate(n)
					}
				}else{
					return this.generate(e)
				}
			}
		};
	r=$.keyframe.getVendorPrefix();
	t="animation-play-state";
	n="running";
	
	$.fn.resetKeyframe=function(e){
		var i=$(this).css(r+t,n)
		.css(r+"animation","none");
		if(e){setTimeout(e,1)}
	};
	$.fn.pauseKeyframe=function(){
		var e=$(this).css(r+t,"paused")};
		$.fn.resumeKeyframe=function(){
			return $(this).css(r+t,n)};
			$.fn.playKeyframe=function(e,i){
				var s,o,u,a,f,l;
				if(typeof e==="string"){
					var c=e.trim().split(" ");
					e={name:c[0],duration:parseInt(c[1]),
							timingFunction:c[2],
							delay:parseInt(c[3]),
							repeat:c[4],complete:i
					}
				}
				e=$.extend({duration:0,
					timingFunction:"ease",
					delay:0,
					repeat:1,
					direction:"normal",
					fillMode:"forwards",
					complete:i},e);
				a=e.duration;
				u=e.delay;
				l=e.repeat;
				s=""+e.name+" "+a+"ms "
				  +e.timingFunction+" "+u+"ms "+l+" "
				  +e.direction+" "
				  +e.fillMode;i=e.complete;
				o=r+"animation";
				f=["webkit","moz","MS","o",""];
				var h=function(e,t,n){
					var r,i,s;i=0;s=[];
					
					while(i<f.length){
						if(!f[i]){
							t=t.toLowerCase()
						}
						r=f[i]+t;
						e.off(r).on(r,n);
						s.push(i++)
					}s
				};
				
				this.each(function(){
					var u=$(this).addClass("boostKeyframe")
					  .css(r+t,n).css(o,s)
					  .data("keyframeOptions",e);
					if(i){
						h(u,"AnimationIteration",i);
						h(u,"AnimationEnd",i)
					}
				})};
				e({id:"boost-keyframe"})
				 .append(" .boostKeyframe{"+r
						 +"transform:scale3d(1,1,1);}")
    var rotationsTime = 5;
    var wheelSpinTime = 6;
    var ballSpinTime = 5;
    var numorder = [0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28, 12, 35, 3, 26];
    var rednum = [32, 19, 21, 25, 34, 27, 36, 30, 23, 5, 16, 1, 14, 9, 18, 7, 12, 3];
    var blacknum = [15, 4, 2, 17, 6, 13, 11, 8, 10, 24, 33, 20, 31, 22, 29, 28, 35, 26];
    var numwhite = [0];
    var numbg = $('.pieContainer');
    var ballbg = $('.ball');
    var btnSpin = $('#btnSpin');
    var toppart = $("#toppart");
    var pfx = $.keyframe.getVendorPrefix();
    var transform = pfx + 'transform';
    var rinner = $("#rcircle");
    var numberLoc = [];
    createWheel();
function createWheel() {
        var temparc = 360 / numorder.length;
        for (var i = 0; i < numorder.length; i++) {


            numberLoc[numorder[i]] = [];
            numberLoc[numorder[i]][0] = i * temparc;
            numberLoc[numorder[i]][1] = (i * temparc) + temparc;

            newSlice = document.createElement("div");
            $(newSlice).addClass("hold");
            newHold = document.createElement("div");
            $(newHold).addClass("pie");
            newNumber = document.createElement("div");
            $(newNumber).addClass("num");
            newNumber.innerHTML = numorder[i];
            $(newSlice).attr('id', 'rSlice' + i);
            $(newSlice).css('transform', 'rotate(' + numberLoc[numorder[i]][0] + 'deg)');
          
            $(newHold).css('transform', 'rotate(9.73deg)');
            $(newHold).css('-webkit-transform', 'rotate(9.73deg)');

            if ($.inArray(numorder[i], numwhite) > -1) {
                $(newHold).addClass("whitebg");
            } else if ($.inArray(numorder[i], rednum) > -1) {
                $(newHold).addClass("redbg");
            } else if ($.inArray(numorder[i], blacknum) > -1) {
                $(newHold).addClass("greybg");
            }

            $(newNumber).appendTo(newSlice);
            $(newHold).appendTo(newSlice);
            $(newSlice).appendTo(rinner);
        }
        

    }

    btnSpin.on("click", function () {
          var rndNum = Math.floor((Math.random() * 34) + 0);
          var result = 0;
        spinTo(rndNum);
        setTimeout(function(){
        	var numwin = $("#numwin").val().trim();
        	if(numwin=="red"){
        		for(var i = 0; i < rednum.length; i++){
        			if(rednum[i] == rndNum){
        				result = 1;
        			}
        		}
        		if(result == 1){
        			alert("축하합니다 \n색깔을 맞추셨습니다");
        		}else{
        			alert("룰렛에 실패하셨습니다");
        		}
        	}else if(numwin=="black"){
        		
        		for(var i = 0; i < blacknum.length; i++){
        			if(blacknum[i] == rndNum){
        				result = 1;
        			}
        		}
        		if(result == 1){
        			alert("축하합니다 \n색깔을 맞추셨습니다");
        		}else{
        			alert("룰렛에 실패하셨습니다");
        		}
        	}else if(numwin >= 0 && numwin <= 36 ){
        		if(rndNum == numwin){
        			alert("축하합니다 \n숫자를 맞추셨습니다");
        		}else{
        			alert("룰렛에 실패하셨습니다");
        		}
        	}else{
        		alert("정확한 값을 입력해 주세요");
        	}
        	
        },6000);
    
    });
function resetAni() {

        animationPlayState = "animation-play-state";
        playStateRunning = "running";
        $(ballbg).css(pfx + animationPlayState, playStateRunning)
           .css(pfx + "animation", "none");
        $(numbg).css(pfx + animationPlayState, playStateRunning)
           .css(pfx + "animation", "none");
        $(toppart).css(pfx + animationPlayState, playStateRunning)
           .css(pfx + "animation", "none");
        $("#rotate2").html("");
        $("#rotate").html("");

    }

    function spinTo(num) {
      
        var temp = numberLoc[num][0] + 4;

        
        var rndSpace = Math.floor((Math.random() * 360) + 1);

        resetAni();
        setTimeout(function () {
            bgrotateTo(rndSpace);
            ballrotateTo(rndSpace + temp);
        }, 500);
    }

    function ballrotateTo(deg) {
        var temptime = (rotationsTime * 1000);
        var dest = (-360 * ballSpinTime) - (360 - deg);

        /* 대상의 위치, 크기, 방향 등을 상대적으로 변경*/
        $.keyframe.define({
            name: 'rotate2',
            from: {
                transform: 'rotate(0deg)'
            },
            to: { //대상의 각도를 설정하고 각도를 설정
            	  //360deg = 1바퀴 회전
                transform: 'rotate(' + dest + 'deg)'
            }
        });

        $(ballbg).playKeyframe({
            name: 'rotate2',
            duration: temptime,
            timingFunction: 'ease-in-out',
            complete: function () {
            }
        });

    }

    function bgrotateTo(deg) {
        var dest = 360 * wheelSpinTime + deg;
        var temptime = (rotationsTime * 1000) - 1000;



        $.keyframe.define({
            name: 'rotate',
            from: {
                transform: 'rotate(0deg)'
            },
            to: {
                transform: 'rotate(' + dest + 'deg)'
            }
        });

        $(numbg).playKeyframe({
            name: 'rotate',
            duration: temptime, 
            timingFunction: 'ease-in-out', 
            complete: function () {

            } 
        });

        $(toppart).playKeyframe({
            name: 'rotate',
            duration: temptime,
            timingFunction: 'ease-in-out',
            complete: function () {

            } 
        });
    }
    
    $(".spinner").css("font-size","+=1.5em");

});
</script>

<script src="script.js"></script> 
<style>
 .pieBackground {
    position: absolute;
    width: 20em;
    height: 20em;
    border-radius: 20em;
    box-shadow: -1px 1px 3px #000;
}
.container {
    width: 100%;
    background: white;
    border-radius: 4em;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    box-shadow: inset 0 0 3em #333, 0 0 3em #333;
}

.pieContainer {
    width: 20em;
    height: 20em;
    position: relative;
    transform: rotate(0deg);
    font-size: 1.25em;
}
.pie {
    box-shadow: inset 0 0 1em #000;
    border: solid .1em white;
    position: absolute;
    width: 20em;
    height: 20em;
    border-radius: 20em;
    clip: rect(0px, 10em, 10em, 0px);
    z-index: 30;
}
.hold {
    position: absolute;
    clip: rect(0, 20em, 20em, 10em);
    width: 20em;
    height: 20em;
    border-radius: 20em;
    z-index: 20;
}

.num {
    position: absolute;
    top: 0.4em;
    color: white;
    z-index: 40;
    left: 10.28em;
    text-align: center;
    font-family: "Times New Roman", Times, serif;
    font-weight: 700;
}

.redbg {
    background: red;
    background: -webkit-gradient(linear, left top, right bottom, color-stop(0%,#a90329), color-stop(44%,#8f0222), color-stop(100%,#6d0019));
    background: -webkit-linear-gradient(-45deg,  #a90329 0%,#8f0222 44%,#6d0019 100%);
    background: -ms-linear-gradient(-45deg,  #a90329 0%,#8f0222 44%,#6d0019 100%);
    background: linear-gradient(135deg,  #a90329 0%,#8f0222 44%,#6d0019 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a90329', endColorstr='#6d0019',GradientType=1 );
}
.greybg {
    background: #7d7e7d;
    background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,#7d7e7d), color-stop(70%,#000000), color-stop(100%,#0e0e0e));
    background: -webkit-radial-gradient(center, ellipse cover,  #7d7e7d 0%,#000000 70%,#0e0e0e 100%);
    background: -ms-radial-gradient(center, ellipse cover,  #7d7e7d 0%,#000000 70%,#0e0e0e 100%);
    background: radial-gradient(ellipse at center,  #7d7e7d 0%,#000000 70%,#0e0e0e 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#7d7e7d', endColorstr='#0e0e0e',GradientType=1 );
}
.whitebg {
    background: white;

}
.platebg {
    position: absolute;
    z-index: 50;
    background: rgba(51, 29, 1, 1);
    width: 19em;
    height: 19em;
    border-radius: 19em;
    left: 3em;
    top: 3em;
    
}

.spinner {

    float: left;
    position: relative;
    background-color: #fff;
    height: 29em;
    width: 29em;
    border-radius: 25em;
    border: solid 2em rgba(41, 25, 6, 1);
    box-shadow: 0 0 1em rgba(42, 40, 40, 1);
    font-size: 1em;
}

.ball {
    position: absolute;
    position: absolute;
    z-index: 80;
    width: 2em;
    height: 18.5em;
    left: 11.5em;
    top: 3.2em;
    transform: rotate(360deg);
}

.ball span {
    display: block;
    background-color: rgba(255, 255, 255, 1);
    border-radius: 50%;
    width: 1.5em;
    height: 1.5em;
    margin: auto;
    box-shadow: inset -.5em -.5em 1em rgba(183, 183, 183, 1),0 0 2em #000;
}
.topnodebox {
    position: absolute;
    left: 9.9em;
    top: 9.9em;
    z-index: 150;
}

.topnode {
    position: relative;
    width: 5em;
    height: 5em;
    z-index: 100;
    border-radius: 10em;
    border: 0.1em solid #A8A8A8;
    box-shadow: 0px 0px 2em rgba(0, 0, 0, 0.5);
}

.topnodebox span {
    position: absolute;
    z-index: 90;
    border-radius: .5em;
    border: solid .1em rgba(168, 168, 168, 1);
    box-shadow: 0 0 2em rgba(0, 0, 0, .5);
}

.top {
    height: 5em;
    width: 1em;
    left: 2em;
    top: -4em;
}

.right {
    height: 1em;
    width: 5em;
    top: 2em;
    left: 4em;
}

.down {
    height: 5em;
    width: 1em;
    left: 2em;
    top: 4em;
}

.left {
    height: 1em;
    width: 5em;
    top: 2em;
    left: -4em;
}


.button {
width: 5em;
height: 3em;
background: none repeat scroll 0% 0% rgba(93, 65, 23, 1);
color: #FFF;
text-align: center;
cursor: pointer;
line-height: 3em;
border-radius: 1em;
margin: .2em;
float: left;
box-shadow: 0 0 1em #333;
border-bottom: solid .1em rgba(0, 0, 0, 1);
}

.button:hover{
box-shadow: inset 0 0 .5em #333;
border-bottom: none;
}
.rouletteP{
 font-size: 20px;
}
#numwin{
 font-size: 20px;
}
</style>
<article>
 <div class="spinner">

		<div class="ball"><span></span></div>
		<div class="platebg"></div>
		<div id="rcircle" class="pieContainer">
			<div class="pieBackground"></div>
		</div>
 </div>
 <form>
  <input id="numwin" name="numwin" type="text"><br>
  <p class="rouletteP">"black" or "red" or number 0~36</p><br>
  <input type="button" id="btnSpin" class="button" value="Spin"></div>
 </form>
</article>
