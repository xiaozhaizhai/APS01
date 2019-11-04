/*// 原始window.open 包装，增加功能： 将打开的页面句柄存储在openedPage数组中
var openedPage = new Array();
window.prototypeOpen = window.open; //原始window.open
window.open=function(url,windowName,windowStyle){
	var openhandler;
	var topmain;
	if(windowName==""||windowName == undefined){
		if(windowStyle==""||windowStyle== undefined){
			// TODO 实体配置暂时在页签里打开 
			if(url.indexOf('/ec/') == -1) {
				windowStyle="resizable=yes";
			}
		}
		openhandler=window.prototypeOpen(url,'',windowStyle);
	}else{ 
		openhandler=window.prototypeOpen(url,windowName,windowStyle);	
	}
	topmain = topPage(window.self);
	topmain.openedPage.push(openhandler);
	return openhandler;
}

topPage=function (handler){	
	if(handler !=null && handler.location != null){
		var url=handler.location.href.toString();
		if(url!=null && url.indexOf("foundation/workbench/mainFrame")>0)
		{
			return handler;
		}
		else{
			var parentpage=handler.opener;
			if(parentpage==null)
				return handler;
			return topPage(parentpage);
		}
	}else{
		return handler;
	}
}
closeAllPage =function(){
	count=openedPage.length;
	for(var i=0;i<count;i++){
		handler=openedPage.pop();
		handler.close();
	}
}*/