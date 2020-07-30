const LOGIN_ALERT = (function ()  {

  /**
   * Alert 내용 입력
   * @param {*} content 
   */
  function setContent(content)  {
		$('#alertPopupContent').html(content);
	}
	
	/**
	 * Alert 버튼 이름 입력
	 * @param {*} text 
	 */
	function setAlertButtonText(text)	{
		$('#alertBtnArea').html(text);
	}

	/**
	 * 로그인 Alert 호출
	 * @param {*} content 
	 * @param {*} btnText 
	 */
  function show(content, btnText) {
		setContent(content);

		if(btnText){
			setAlertButtonText(btnText);
		} else {
			let $html = '';
			$html += '<div class="confirm_button_box box_type1">';
			$html += 	'<a href="javascript:void(0)" class="confirm_button ok_btn" onclick="LOGIN_ALERT.hide();">확인</a>';
			$html += '</div>';

			setAlertButtonText($html);
		}

		setShowMask('on');
		showLayerSet('alertPop_wrap', 'on'); 
	}

	/**
	 * 백그라운드, Popup Layer 세팅
	 * @param {*} control 
	 */
	function showLayerSet(id, control) {
		setLayer(id, control);
		setShowMask(control);
	}

	/**
	 * 백그라운드 마스킹
	 * @param {*} control 
	 */
	function setShowMask(control) {
		if (control === 'on') {
			$('.layerMaskBackground').addClass('on');
		} else {
			$('.layerMaskBackground').removeClass('on');
		}
	}

	/**
	 * 팝업 노출 & 감춤
	 * @param {*} id 
	 * @param {*} control 
	 */
	function setLayer(id, control) {
		let $popup = $('#' + id);
	
		if (control === 'on') {
			$popup.show();			
		} else {
			$popup.hide();
		}
	}
	
	function hide(){
		setShowMask('off');
		showLayerSet('alertPop_wrap', 'off');
	}

  return {
		show: show,
		hide: hide
  };
})();