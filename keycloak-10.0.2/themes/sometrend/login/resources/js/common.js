
//-----------------------------------------------------------
// 레이어 노출 - 단순 노출 유무
//-----------------------------------------------------------
function setLayer(id,control) {
	if(control == "on"){
		$("#"+id).show();
	}else{
		$("#"+id).hide();
	}
}

//-----------------------------------------------------------
// Toggle
//-----------------------------------------------------------
function setToggle(id, className) {
	$("#"+id).toggleClass(className);
}
function set_thisToggle(obj, className) {
	$(obj).toggleClass(className);
}

//-----------------------------------------------------------
// 마스크 공통함수
//-----------------------------------------------------------
function setShowMask(control){
	if (control == "on")	{
		$(".layerMaskBackground").addClass("on");
	}else{
		$(".layerMaskBackground").removeClass("on");
	}
}

//-----------------------------------------------------------
// 레이어팝업 함수
//-----------------------------------------------------------
function showLayerSet(id, control){
	setLayer(id,control);
	setShowMask(control);
}

//-----------------------------------------------------------
// tabmenu
//-----------------------------------------------------------
function setTabMenu(tabName, num){
    var num = num || 0;
    var menu = $(tabName).children();
    var con = $(tabName+'_con').children();
    var select = $(menu).eq(num);
    var i = num;

	menu.click(function(){
		menu.removeClass('on');
		con.removeClass('tabViewOn');

        if(select!==null){
            select.removeClass("on");
            //con.eq(i).hide();
        }

        select = $(this);	
        i = $(this).index();

        select.addClass('on');
        con.eq(i).addClass('tabViewOn');
    });
    
}


//-----------------------------------------------------------
//tabmenu
//-----------------------------------------------------------
function showTabMenu(tabName, num){
 var num = num || 0;
 var menu = $(tabName).children();
 var con = $(tabName+'_con').children();
 var select = $(menu).eq(num);
 var i = num;

	menu.click(function(){
		menu.removeClass('on');
		con.removeClass('tabViewOn');

     if(select!==null){
         select.removeClass("on");
         //con.eq(i).hide();
     }

     select = $(this);	
     i = $(this).index();

     select.addClass('on');
     con.eq(i).addClass('tabViewOn');
 });
 
}



//-----------------------------------------------------------
// confirm 함수
//-----------------------------------------------------------
function getConfirm(text) {
   if(confirm(text)){
	   console.log("삭제처리");
   };
}

//-----------------------------------------------------------
//링크연결
//-----------------------------------------------------------
function commGoLink(url,target){
	if(target == "out"){
		window.open(url, '_blank');//새창 오픈
	}else {
		window.location.href = url;//현재창 오픈
	}
}

//-----------------------------------------------------------
//파일업로드
//-----------------------------------------------------------
function fileUpload(id){
	$("#"+id).click();
}



//-----------------------------------------------------------
// responsive side Bar
//-----------------------------------------------------------
function setSidebar(){
	$('html, body').toggleClass('overHidden');
	setToggle('side_close_btn', 'open');
	setToggle('leftsidebar', 'open');
}