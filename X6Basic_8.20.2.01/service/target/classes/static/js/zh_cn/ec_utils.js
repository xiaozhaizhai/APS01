//注册命名空间
CUI.ns("ec.common");
ec.common.showDialog = function(url, title, height, width, buttons){
	var allBtns = buttons || [];
	allBtns[allBtns.length] = {
								name: '关闭',
								icon: "no",
								handler:function(){
									this.close()
								}
							};
	ec.common._dialog = new CUI.Dialog({
		title: title,
		url: url,
		modal:true,
		height:height || 480,
		width: width || 750,
		buttons:allBtns
	});
	ec.common._dialog.show();
	return ec.common._dialog;
}
ec.common.proxyType="2";//2普通委托，3全权委托
ec.common.proxyPending=function(pendingId){
	var url="/ec/workflow/proxyPending.action?pendingId="+pendingId;
	// url, title, height, width, buttons
	return ec.common.showDialog(url, '委托', 260, 450, [{
		name: '确定',
		icon: "yes",
		handler:function(){
			if($("#proxyUsers_MultiIDs").val()==""){
				proxyPendIngDialogErrorBarWidget.showMessage('请选择被委托人');
				return ;
			}else{
				$("#proxyUsersInput").val($("#proxyUsers_MultiIDs").val());
			}
			ec.common.proxyType=$("input[name=proxyType]:checked").val();

			var objMe = this;
			$.ajax({
				url: "/ec/workflow/proxyPendingResult.action",
				type: 'post',
				async: false,
				data: $('#SubmitForm').serialize(),
				success: function(res) {
					if(res.dealSuccessFlag == true){
						proxyPendIngDialogErrorBarWidget.showMessage('处理成功！', 's');
						setTimeout(function(){
							try{
								if(ec.common.proxyType=='3'){
									window.opener.location.reload();
									window.close();
								}else{
									objMe.close();	
								}
							}catch(e){}
							
						},1500);
					}else{
						proxyPendIngDialogErrorBarWidget.showMessage('处理失败！');
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					var msg = CUI.parseJSON(XMLHttpRequest.responseText);
					proxyPendIngDialogErrorBarWidget.showMessage(msg.exceptionMsg);
				}
			});
		}
	}]);
};
ec.common.remind=function(tableInfoId,id){
	var url = "/ec/workflow/remindFrame.action?tableInfoId=" + tableInfoId+"&id="+id;
	// url, title, height, width, buttons
	ec.common.showDialog(url, "催办页面", 480, 750, [{
					name:'确定',
					icon: "yes",
					handler:function(){
						var userIds='';
						$('input[name^="user_"]:checked').each(function(index, item){
							userIds+=","+$(this).val();
						});
						if(userIds!=""){
							userIds=userIds.substr(1);
						}else{
							remidnSubmitFormDialogErrorBarWidget.showMessage("请至少选择一人！");
							return false;
						}
						$("#remindUserIds").val(userIds);
						var pandion=$("#pandion").prop("checked");
						var email=$("#email").prop("checked");
						var sms=$("#sms").prop("checked");
						if(!pandion&&!email&&!sms){
							remidnSubmitFormDialogErrorBarWidget.showMessage("请至少需要选择一种提醒方式！");
							return false;
						}
						var i=0;
						i += pandion ? 1 : 0;
						i += email ? 2 : 0;
						i += sms ? 4 : 0;
						var remindContent=CUI("#remindContent").val();
						if(remindContent!=""){
							if(sms&&remindContent.length>60){
								remidnSubmitFormDialogErrorBarWidget.showMessage("短信的催办长度不能超过60的字符。");
								return false;
							}
						}
						$("#remindTypeId").val(i);

						var objMe = this;
						$.ajax({
							url: "/ec/workflow/newRemind.action",
							type: 'post',
							async: false,
							data: $('#remidnSubmitForm').serialize(),
							success: function(res) {
								if(res.dealSuccessFlag == true){
									remidnSubmitFormDialogErrorBarWidget.showMessage('处理成功！', 's');
									setTimeout(function(){
										objMe.close();
									},1500);
								}else{
									remidnSubmitFormDialogErrorBarWidget.showMessage('处理失败！');
								}
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								var msg = CUI.parseJSON(XMLHttpRequest.responseText);
								remidnSubmitFormDialogErrorBarWidget.showMessage(msg.exceptionMsg);
							}
						});
					}
				}]);
}