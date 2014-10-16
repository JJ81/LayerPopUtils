Utils = {
	getDocHeight : -> 
		$(document).height()
		
	getWinHeight : -> 
		$(window).height()
		
	getTargetHeight : (target) -> 
		target.height()
		
	getScrollTop : -> 
		$(document).scrollTop()
		
	getTargetCenter : (target) -> 
		this.getWinHeight()/2 - this.getTargetHeight(target)/2 + this.getScrollTop()
		
	onTouchPreventDefault : (event) ->
		event.preventDefault()
			
	fingerActionControl : (eventType, action, onOff) ->
		if onOff == true
			if typeof document.addEventListener != 'undefined'
				document.addEventListener(eventType, action, false)
			else
				document.attachEvent(eventType, action)
		else
			if typeof document.removeEventListener != 'undefined'
				document.removeEventListener(eventType, action, false)
			else
				document.detachEvent(eventType, action)
		
	numberWithCommas : (num) ->
		num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
		
	addBgLayer : (bgLayerClassName) -> 
		docHeight = this.getDocHeight()
		$("body").append('<div class="'+bgLayerClassName+'"></div>')
		bgLayer = $("."+bgLayerClassName)
		bgLayer.css("height", docHeight)
		
	removeBgLayer : (bgLayerClassName) ->
		bgLayer = $("."+bgLayerClassName)
		bgLayer.remove()
		
	addLayerPop : (btnConfig) ->
		docFrag = document.createDocumentFragment()
		_msg = this.createElem("div", btnConfig.msg.className, btnConfig.msg.text, null).outerHTML

		_btn = "";
		for con, index in btnConfig.btnContent
			if btnConfig.btnContent[index].className != null
				_btn += this.createElem("div", btnConfig.btnContent[index].className, btnConfig.btnContent[index].text, null).outerHTML #엘리먼트를 outerHTML로 변환하면서 이벤트를 잃음!


		_btnWrp = this.createElem("div", btnConfig.btnWrpClassName, _btn, null).outerHTML	
		_wrp = this.createElem("div", btnConfig.popWrpClassName, _msg + _btnWrp ,null)
		#_wrp = this.createElem("div", btnConfig.popWrpClassName, _btn ,null)
		
		docFrag.appendChild(_wrp)
		$("body").append(docFrag)
		return
		
	removeLayerPop : (wrpClassName) ->
		$("." + wrpClassName).remove()
		
	
	createElem : (elementType, className, innerContent, action) ->
		tmpEl = document.createElement(elementType)
		tmpEl.className = className
		if(action != null)
			tmpEl.addEventListener("mousedown", action, false)
		tmpEl.innerHTML = innerContent
		return tmpEl

	# PC 스크롤도 막는 기능을 삽입할 것
	
	
	
	# 쿠키관련 코드 작성
	
	
	
	
}









































