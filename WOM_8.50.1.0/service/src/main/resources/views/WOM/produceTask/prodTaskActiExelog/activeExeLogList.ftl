<!-- WOM_7.5.0.0/produceTask/activeExeLogList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1510101768348')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_produceTask_activeExeLogList,head,WOM_7.5.0.0_produceTask_ProdTaskActiExelog,WOM_7.5.0.0) -->
<!-- 自定义代码 -->
<link rel="stylesheet" href="/bap/static/WOM/stepUtils/css/step.css">
<style type="text/css">
	.cui-btn-gyfx {
    	background: url('/bap/static/WOM/img/icon_347.png') no-repeat;
	}
    .cui-btn-ckst {
    	background: url('/bap/static/WOM/img/icon_wlszyck.png') no-repeat;
	}
 		.cui-btn-sdtj {
            background: url('/bap/static/WOM/img/icon_87.png') no-repeat;
        }
</style>
<!-- CUSTOM CODE END -->
</head>
<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>
<style type="text/css">
	.ewc-dialog-el{height:100%;}
	
	#fast_select_elements .accordion_pane li {
		font-size: 12px;
		color: #000000;
		cursor: pointer;
		line-height: 18px;
		z-index: 100;
		margin-left: 4px;
	}
	#fast_select_elements_bak .accordion_pane li {
		font-size: 12px;
		color: #000000;
		cursor: pointer;
		line-height: 18px;
		z-index: 100;
		margin-left: 4px;
	}
	#fast_select_elements .accordion_pane li.dragout {
		color: #BBBBBB;
		cursor: default;
	}
	#fast_select_elements_bak .accordion_pane li.dragout {
		color: #BBBBBB;
		cursor: default;
	} 
	
</style>  
<script type="text/javascript">
	CUI.ns('WOM.produceTask.prodTaskActiExelog','WOM.produceTask.prodTaskActiExelog.activeExeLogList');
</script>
<@frameset id="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_container" border=0>
	<@frame id="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "activeExeLogList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_produceTask_activeExeLogList,html,WOM_7.5.0.0_produceTask_ProdTaskActiExelog,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript">
	WOM.produceTask.prodTaskActiExelog.activeExeLogList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.produceTask.prodTaskActiExelog.activeExeLogList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.produceTask.prodTaskActiExelog.activeExeLogList._prefix += '.';
			}
			WOM.produceTask.prodTaskActiExelog.activeExeLogList._prefix += arr[i];
		}
		WOM.produceTask.prodTaskActiExelog.activeExeLogList._suffix = arr[arr.length -1];
		if(WOM.produceTask.prodTaskActiExelog.activeExeLogList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.produceTask.prodTaskActiExelog.activeExeLogList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.produceTask.prodTaskActiExelog.activeExeLogList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.produceTask.prodTaskActiExelog.activeExeLogList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.produceTask.prodTaskActiExelog.activeExeLogList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm *[name="'+WOM.produceTask.prodTaskActiExelog.activeExeLogList._prefix + '.' + WOM.produceTask.prodTaskActiExelog.activeExeLogList._suffix +'"]').val(obj[0][WOM.produceTask.prodTaskActiExelog.activeExeLogList._suffix]);
		CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm *[name="'+WOM.produceTask.prodTaskActiExelog.activeExeLogList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm *[name^="'+WOM.produceTask.prodTaskActiExelog.activeExeLogList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm *[name="'+WOM.produceTask.prodTaskActiExelog.activeExeLogList._prefix + '.' + WOM.produceTask.prodTaskActiExelog.activeExeLogList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.produceTask.prodTaskActiExelog.activeExeLogList._dialog) {
			WOM.produceTask.prodTaskActiExelog.activeExeLogList._dialog.close();
		}
	};
	
	WOM.produceTask.prodTaskActiExelog.activeExeLogList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.produceTask.prodTaskActiExelog.activeExeLogList.query_"+obj+")!='undefined'") ? eval('WOM.produceTask.prodTaskActiExelog.activeExeLogList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
WOM_produceTask_prodTaskActiExelog_activeExeLogList_refresh = function(node){
WOM.produceTask.prodTaskActiExelog.activeExeLogList.node = node;
	//保存树状节点的参数，导出时用
	if(node!=null && node.layRec){
		$("#treeNodeSelected").attr("value", node.layRec);
	}else if(node!=null && node.id == -1){
		$("#treeNodeSelected").removeAttr("value");
	}
	
	if(node!=null && node.layRec){
		$(".nodeInfo").attr("id", node.modelName+".layRec");
		$(".nodeInfo").attr("name", node.modelName+".layRec");
		$(".nodeInfo").attr("value", node.layRec);
	}else if(node!=null && node.id == -1){	
		$(".nodeInfo").removeAttr("id");
		$(".nodeInfo").removeAttr("value");
		$(".nodeInfo").removeAttr("name");
	}
	WOM.produceTask.prodTaskActiExelog.activeExeLogList.query("query");
}

WOM_produceTask_prodTaskActiExelog_activeExeLogList_getList = function() {
	return "WOM.produceTask.prodTaskActiExelog.activeExeLogList";
}
WOM.produceTask.prodTaskActiExelog.activeExeLogList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_produceTask_prodTaskActiExelog_activeExeLogListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.produceTask.prodTaskActiExelog.activeExeLogList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.produceTask.prodTaskActiExelog.activeExeLogList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_produceTask_prodTaskActiExelog_activeExeLogList_fileupload_button",
		handler:function(){
				list_operate_produceTask_activeExeLogList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.produceTask.prodTaskActiExelog.activeExeLogList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_produceTask_activeExeLogList.WOM.produceTask.prodTaskActiExelog." + params.viewName + ".referenceCopy");
			funcName('prodTaskActiExelog', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.produceTask.prodTaskActiExelog.activeExeLogList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_produceTask_activeExeLogList.WOM.produceTask.prodTaskActiExelog." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.produceTask.prodTaskActiExelog.activeExeLogList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_produceTask_activeExeLogList.WOM.produceTask.prodTaskActiExelog." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function makeRejectDeal(){ 
							
	if(ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget.getSelectedRow().length!=0){
		var activeBatchStateID=ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget.getSelectedRow()[0].activeBatchStateID.id;
		var rejectsDealID=ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget.getSelectedRow()[0].rejectsDealID;
		var manuCheckId=ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget.getSelectedRow()[0].checkResultID;
		if(activeBatchStateID==1002 ){
			if(rejectsDealID==null){
				if(manuCheckId!=null){
						var deploymentId="";  //流程部署id
						CUI.ajax({
							url: "/ec/workflow/getCurrentDeployment.action?processKey=manudealWorkFlow", //工作流
							type: 'post',
							async: false,
							success: function(msg) {
								deploymentId = msg.deploymentId;
							}
						});
					if(deploymentId==undefined || deploymentId===""){
						CUI.Dialog.alert("工作流配置有问题，请联系管理员！");
						return false;
					}
					var powerCode = "";   //权限code（_pc_）
					CUI.ajax({
						url: "/ec/workflow/getStartActivePowerCode.action?deploymentId="+deploymentId,
						type: 'post',
						async: false,
						success: function(msg) {
							powerCode = msg.powerCode;
						}
					});
					//将上述参数传入url
					var url="/qualityMan/manuDeal/manuDeal/dealEdit.action?deploymentId="+deploymentId+"&entityCode=qualityMan_7.5.0.0_manuDeal&__pc__="+powerCode;				
					url += "&manuCheckId=" + encodeURI(manuCheckId);
					openFullScreen(url);
				}else{
					//检验报告单为空为空，不能进行不良品处理
					workbenchErrorBarWidget.showMessage("${getText('WOM.makeExcutView.randon1234561reportnull1111')}","f");
					return false;
				}
			}else{
				//不良品处理单不为空，不能进行不良品处理
				workbenchErrorBarWidget.showMessage("${getText('WOM.makeExcutView.randon1234561dealnotnull1111')}","f");
				return false;
			}
		}else{
			//选择的活动与批状态不为待不良品处理，不能进行不良品处理
			workbenchErrorBarWidget.showMessage("${getText('WOM.makeExcutView.randon1234561sdacadhyascaca')}","f");
			return false;
		}
	
	}else{
		//请先选中一行再进行不良品处理
		workbenchErrorBarWidget.showMessage("${getText('WOM.makeExcutView.randon1234561sdsdvaa')}","f");
		return false;
	}

				};
				function proAnl(){ 
							
	var selectedRow = ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget.getSelectedRow()[0];
	var selectedRows = ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget.getSelectedRow();
	if(selectedRows.length > 1){
		CUI.Dialog.alert(  
		    '请选择一条记录进行操作',
		    function(){},   
		    '提示',  
		    70,  
		    400   
		);
		return false;
	}
	if(selectedRow!=null){
		var activeId =  '';
		var batchNo =  selectedRow.batchNum;
		var startTime =  selectedRow.startTime;
		var endTime =  selectedRow.endTime;
		var activeName = selectedRow.activeName;
		var mappingType = 'batchKinds/active';

		var isAnaly =  selectedRow.isAnaly;
		var id = selectedRow.id;	
		if(isAnaly == true){
				var url="/processAnl/processDetail/procRecord/editDetailWOM.action?entityCode=processAnl_1.0.0_processModelSet&id="+encodeURI(id)+"&mappingKey="+encodeURI(id)+"&mappingType="+encodeURI(mappingType)+"&activeId="+encodeURI(activeId)+"&batchNo="+encodeURI(batchNo)+"&startTime="+encodeURI(startTime)+"&endTime="+encodeURI(endTime)+"&activeName="+encodeURI(activeName)+"&__pc__=cHJvY2Vzc01vZGVsTGlzdF9uZXdfYWRkX3Byb2Nlc3NBbmxfMS4wLjBfcHJvY2Vzc01vZGVsU2V0X3Byb2Nlc3NNb2RlbExpc3R8";
				openFullScreen(url); 
		}else{
				workbenchErrorBarWidget.showMessage('该活动尚未统计工艺或该活动统计工艺失败');
				//workbenchErrorBarWidget.showMessage(\"${getText('batchManag.errorMessage.radion201608310953')}\");
				return false;
		}

	}else{
		CUI.Dialog.alert(  
		    '请选择一条记录进行操作',
		    function(){},   
		    '提示',  
		    70,  
		    400   
		);
	}    

				};
				function refresh(){ 
							
var selectedRow = ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget.getSelectedRow()[0];
var loading;
	if(selectedRow!=null){
		var id = selectedRow.id;
		if(selectedRow.formularActice.isAnaly != true){
			workbenchErrorBarWidget.showMessage('该活动无法进行工艺统计!', 'f');
			return false;
		}
		if(selectedRow.isAnaly == true){
			workbenchErrorBarWidget.showMessage('该活动已完成工艺统计!', 'f');
			return false;
		}
		if(selectedRow.endTime==""){
		workbenchErrorBarWidget.showMessage('请选择执行状态已完成的数据!', 'f');
		return false;
		}
		var isTime = new Date(Date.parse(selectedRow.endTime.replace(/-/g,"/"))).getTime();
		if(isTime+(1000*60*10) > new Date().getTime()){
			workbenchErrorBarWidget.showMessage('请在活动执行完10分钟后再进行工艺统计!', 'f');
			return false;
		}
		var mappingType = 'batchKinds/active'
		 loading = new CUI.loading({ 
						head:"正在加载..." , 
						opacity:50, 
						bgColor:"#666666", 
						show:true, 
						paddingLeft:250 
					});
		$.ajax({
				async   : true,
				type    : 'POST',
				url :  '/processAnl/processDetail/procRecord/getPIMSValue.action?proBatchRecordID='+ encodeURI(id)+ '&proBatchRecordType='+encodeURI(mappingType),
				//data    : {'proBatchRecordID' : id, 'proBatchRecordType':mappingType},
				success : function(msg){
                  loading.close();
                	workbenchErrorBarWidget.showMessage('手动统计完成!', 's');
                  WOM.produceTask.prodTaskActiExelog.activeExeLogList.commonQuery();
				},
				complete: function(){
					loading.close();
				}
		});
	}else{
		 loading.close();
		CUI.Dialog.alert(  
		    '请选择一条记录进行操作',
		    function(){},   
		    '提示',  
		    70,  
		    400   
		);
	}    

				};
	
	/**
	 * 保存完毕回调
	 * @method WOM.produceTask.prodTaskActiExelog.callBackInfo
	 */
	WOM.produceTask.prodTaskActiExelog.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('WOM_produceTask_prodTaskActiExelog_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{WOM.produceTask.prodTaskActiExelog.activeExeLogList.Dlg.close();closeLoadPanel();}catch(e){}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method WOM.produceTask.prodTaskActiExelog.activeExeLogList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.produceTask.prodTaskActiExelog.activeExeLogList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.produceTask.prodTaskActiExelog.activeExeLogList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.produceTask.prodTaskActiExelog.activeExeLogList.checkSelectedValid = function(type) {
		if(WOM.produceTask.prodTaskActiExelog.activeExeLogList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query.selectedRows[i].valid === false){
						CUI.Dialog.alert("${getText('ec.common.checkvalidfordelete')}");
						return false;
					}
				}
			}
		}else{
			return false;
		}
		return true;
	};
	
	/**
	 * 确认是否选中任何记录
	 * @method WOM.produceTask.prodTaskActiExelog.activeExeLogList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.produceTask.prodTaskActiExelog.activeExeLogList.checkSelectedAny = function() {
		if(datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.produceTask.prodTaskActiExelog.activeExeLogList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.produceTask.prodTaskActiExelog.activeExeLogList.checkSelectedMore = function() {
		if(datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	WOM.produceTask.prodTaskActiExelog.activeExeLogList.dbClickViewactiveExeLogList =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=WOM_7.5.0.0_produceTask&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method WOM.produceTask.prodTaskActiExelog.activeExeLogList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.produceTask.prodTaskActiExelog.activeExeLogList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.produceTask.prodTaskActiExelog.activeExeLogList.otherParams || {};
		if(otherParams && otherParams.referenceCopyBtn) {
			buttons.push(otherParams.referenceCopyBtn);
		}
		if(otherParams && otherParams.uploadBtn) {
			buttons.push(otherParams.uploadBtn);
		}
		if(otherParams && otherParams.printBtn) {
			buttons.push(otherParams.printBtn);
		}
		if(otherParams && otherParams.printSettingBtn) {
			buttons.push(otherParams.printSettingBtn);
		}
		if(otherParams && otherParams.viewShowType != 'VIEW') {
		}
		if(otherParams && otherParams.viewShowType == 'VIEW') {
							<#assign linkview = getViewByCode('WOM_7.5.0.0_produceTask_makeTaskView')>
							<#if linkview.extraView?? && linkview.extraView.configMap?? && linkview.extraView.configMap.layout?? && linkview.extraView.configMap.layout.sections??>
							if(viewCode=='${linkview.code}'||!viewCode){
							<#list linkview.extraView.configMap.layout.sections as buttonSection>
							<#if buttonSection.cells??>
							<#list (buttonSection.cells) as operateBtn>
							<#if operateBtn.id?? && (operateBtn.isHide)?string('true','false')=='false'>
							<#if !operateBtn.ispermission?? || (operateBtn.ispermission)?string('true','false')=='false'
								|| checkUserPermisition('${linkview.entity.code}_${operateBtn.permissionCode!}')>
								buttons.push({
									name:"${getText(operateBtn.namekey!)}",
									align:"${operateBtn.buttonAlign!'left'}",
									handler:function(){
										<#if operateBtn['funcname']?? && operateBtn['funcname']?has_content>
										<#assign funcname = (operateBtn['funcname'])?replace('\'','')>
										<#assign funcname = funcname?split('=')[1]>
										list_operate_produceTask_activeExeLogList.${funcname};
										</#if>
									}
								});
							</#if>
							</#if>
							</#list>
							</#if>
							</#list>
							}
							</#if>
			
			
			
					if(viewCode=='WOM_7.5.0.0_produceTask_makeTaskOperaView'||!viewCode){
					}
		}
		
		if(otherParams && otherParams.dialogType != 'OTHER') {
			width = null;
			height = null;
		}
		if(otherParams && otherParams.viewShowType != 'VIEW') {
			buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){
					list_operate_produceTask_activeExeLogList.CUI('#'+formId).submit();
				}
			});
		}
		if(otherParams && otherParams.viewShowType == 'VIEW') {
			buttons.push({
				name:"${getText('foundation.common.closed')}",
				type:"cancel"
			});
		} else {
			buttons.push({
				name:"${getText('common.button.cancel')}",
				type:"cancel"
			});
		}
		
		if ( url.indexOf( "?" ) != -1 ) {
			url += "&openType=frame";
		} else {
			url += "?openType=frame";
		}	
		if ( WOM.produceTask.prodTaskActiExelog.activeExeLogList.Dlg ) {
			WOM.produceTask.prodTaskActiExelog.activeExeLogList.Dlg._config.url = url;
			WOM.produceTask.prodTaskActiExelog.activeExeLogList.Dlg._config.formId = formId;
			WOM.produceTask.prodTaskActiExelog.activeExeLogList.Dlg.setTitle( title )
			WOM.produceTask.prodTaskActiExelog.activeExeLogList.Dlg.setButtonbar( buttons );
		}else{
			WOM.produceTask.prodTaskActiExelog.activeExeLogList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_produceTask_activeExeLogList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.produceTask.prodTaskActiExelog.activeExeLogList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.produceTask.prodTaskActiExelog.activeExeLogList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_produceTask_prodTaskActiExelog', element : $('#WOM_produceTask_prodTaskActiExelog_activeExeLogList_fileupload_button a:eq(1)')});
		}
		WOM.produceTask.prodTaskActiExelog.activeExeLogList.otherParams = {};
	};

	WOM.produceTask.prodTaskActiExelog.activeExeLogList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.produceTask.prodTaskActiExelog.activeExeLogList.beforeCommonQuery === 'function') {
	   		var ret = WOM.produceTask.prodTaskActiExelog.activeExeLogList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.produceTask.prodTaskActiExelog.activeExeLogList.cancelSelectedNode == 'function') {
	   WOM.produceTask.prodTaskActiExelog.activeExeLogList.cancelSelectedNode();
	   WOM.produceTask.prodTaskActiExelog.activeExeLogList.node = null;
	  }
	  if(typeof WOM_produceTask_prodTaskActiExelog_activeExeLogList_cancelSelectedNode == 'function') {
	   WOM_produceTask_prodTaskActiExelog_activeExeLogList_cancelSelectedNode();
	   WOM.produceTask.prodTaskActiExelog.activeExeLogList.node = null;
	  }
	  WOM.produceTask.prodTaskActiExelog.activeExeLogList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.produceTask.prodTaskActiExelog.activeExeLogList.query
	 */
	WOM.produceTask.prodTaskActiExelog.activeExeLogList.query = function(type,pageNo,sortFlag){
		var node = WOM.produceTask.prodTaskActiExelog.activeExeLogList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.produceTask.prodTaskActiExelog.activeExeLogList.node = null;
		if(!checkListValid("ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query._sortKey && datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query._sortMethod){
			CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query._sortKey);
			CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm #dataTableSortColName').val(datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query._sortColumnName);
			CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query._sortMethod);
		}else{
			datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query._sortKey = '';
			CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.produceTask.prodTaskActiExelog.activeExeLogList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/produceTask/prodTaskActiExelog/activeExeLogList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/produceTask/prodTaskActiExelog/activeExeLogList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_produceTask_activeExeLogList";
		condobj.modelAlias="prodTaskActiExelog";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info[fieldName].dbColumnType;
						if(fastCol.endsWith('_start')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType){
								if(dateType == 'date') {
									fastColValue += " 00:00:00";
								} else if(dateType == 'year') {
									fastColValue += "-01-01 00:00:00";
								} else if(dateType == 'yearMonth') {
									fastColValue += "-01 00:00:00";
								}
							}
							var showFormat = CUI(this).attr('showformat');
							if (showFormat === 'PERCENT'){
								fastColValue = parseFloat(fastColValue)/100 + '';
							}
							fieldObj.operator=">=";
							fieldObj.paramStr="?";
						}else if(fastCol.endsWith('_end')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType){
								if(dateType == 'date') {
									fastColValue += " 23:59:59";
								} else if(dateType == 'year') {
									fastColValue += "-12-31 23:59:59";
								} else if(dateType == 'yearMonth') {
									var str = fastColValue.split("-");
									var lastDay = new Date(str[0],str[1],0).getDate();
									fastColValue += "-" + lastDay + " 23:59:59";
								}
							}
							var showFormat = CUI(this).attr('showformat');
							if (showFormat === 'PERCENT'){
								fastColValue = parseFloat(fastColValue)/100 + '';
							}
							fieldObj.operator="<=";
							fieldObj.paramStr="?";
						}else{
							if(ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm *[name="'+ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info["MainTableName"];
								}
								fieldObj.operator="=includeCustSub#"+tableName;
								fieldObj.paramStr="?";
							}else{
								var exp=CUI(this).attr('exp');
								var caseSensitive=CUI(this).attr('caseSensitive');
								if(exp=="equal"){
									fieldObj.operator="=";
									fieldObj.paramStr="?";
								}else if(exp=="unequal"){
									fieldObj.operator="<>";
									fieldObj.paramStr="?";
								}else if(exp=="llike"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="?%";
								}else if(exp=="rlike"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="%?";
								}else if(exp=="like"){
									fieldObj.operator="like";
									if(caseSensitive=='true'){
										fieldObj.operator+="caseSensitive";
									}
									fieldObj.paramStr="%?%";
								}else{
									fieldObj.operator="=";
									fieldObj.paramStr="?";
								}
							}
						}
						fieldObj.value=fastColValue;
						var layrec=ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_quickquery_info[fieldName].layRec;
						if(layrec.indexOf("-")>1){
							generateChainCond(condobj,layrec.split("-"),fieldObj);						
						}else{
							condobj.subconds.push(fieldObj);
						}
					}else{
						dataPost += "&" + fastCol + "=" + encodeURIComponent($.trim(fastColValue));
					}
				}
			}
		});
		if(type != "adv") {
			dataPost += "&fastQueryCond="+encodeURIComponent(JSON.stringify(condobj));
			//把fastQueryCond的值赋到一个隐藏的对话框，导出的时候使用
			$('#excelQueryCond').val(JSON.stringify(condobj));
		}
		var pageSize=CUI('input[name="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
							dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
							dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
			<#if mainBusinessId??>
		 		dataPost += "&mainBusinessId=${mainBusinessId}";	
		 	</#if>
		 	<#if businessCenterCode??>
		 		dataPost += "&businessCenterCode=${businessCenterCode}";	
		 	</#if>
		 	<#if flowBulkFlag??>
		 		dataPost += "&flowBulkFlag=${flowBulkFlag?string('true','false')}";	
		 	</#if>
		 	<#if listCustomCondition?? && listCustomCondition != "">
		 		dataPost += "&${listCustomCondition}";	
		 	</#if>
		
		if(type && type == 'goList') {
			dataPost += "&activityName=${activityName!}";
			dataPost += "&processKey=${processKey!}";
		}
		if(nodeParam!=""){
			if(url.indexOf(".action?")<0){
				url += "?1=1";
			}
			url += nodeParam;
		}
		var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'WOM_7.5.0.0_produceTask_activeExeLogList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.produceTask.prodTaskActiExelog.activeExeLogList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_produceTask";
		openExportFrame(url);
	}
WOM.produceTask.prodTaskActiExelog.activeExeLogList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.produceTask.prodTaskActiExelog.activeExeLogList.otherParams = {};
	WOM.produceTask.prodTaskActiExelog.activeExeLogList.otherParams.dialogType = dialogType;
	WOM.produceTask.prodTaskActiExelog.activeExeLogList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.produceTask.prodTaskActiExelog.activeExeLogList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.produceTask.prodTaskActiExelog.editCallBackInfo
 */
WOM.produceTask.prodTaskActiExelog.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_produceTask_prodTaskActiExelog_activeExeLogList_getLayout == "function"){
    		var layout = WOM_produceTask_prodTaskActiExelog_activeExeLogList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.produceTask.prodTaskActiExelog.activeExeLogList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget._sortKey && ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_produceTask_ProdTaskActiExelog'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget._sortKey && ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget._sortKey && ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_produceTask_prodTaskActiExelog_activeExeLogList_getLayout == "function"){
			var layout = WOM_produceTask_prodTaskActiExelog_activeExeLogList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.produceTask.prodTaskActiExelog.activeExeLogList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.produceTask.prodTaskActiExelog.activeExeLogList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.produceTask.prodTaskActiExelog.activeExeLogList.query('pending');
	    	}
			if(modelCode == 'WOM_7.5.0.0_produceTask_ProdTaskActiExelog'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.produceTask.prodTaskActiExelog.activeExeLogList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.produceTask.prodTaskActiExelog.activeExeLogList.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_produceTask_activeExeLogList,js,WOM_7.5.0.0_produceTask_ProdTaskActiExelog,WOM_7.5.0.0) */
// 自定义代码

   //取消双击事件
   WOM.produceTask.prodTaskActiExelog.activeExeLogList.dbClickViewactiveExeLogList = function(event, oRow) {
		return false;
	}
   
   
   
   function checkManuReportRef(nRow){
     //alert(111);
     var reportId=ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget.getCellValue(nRow,"checkResultID");
     if(reportId!=null){
       var url='/qualityMan/manuCheck/manuCheck/checkView.action?id='+reportId+'&entityCode=qualityMan_7.5.0.0_manuCheck'+'&${getPowerCode('${buttonPerfix!}qualityMan_7.5.0.0_manuCheck_checkList_self')}';
                                                                                                                                              openFullScreen(url);
                                                                                                                                             }
     }


     function checkDealReportRef(nRow){
       //alert(111);
       var dealId=ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_queryWidget.getCellValue(nRow,"rejectsDealID");
       if(dealId!=null){
         var url='/qualityMan/manuDeal/manuDeal/dealView.action?id='+dealId+'&entityCode=qualityMan_7.5.0.0_manuDeal'+'&${getPowerCode('${buttonPerfix!}qualityMan_7.5.0.0_manuDeal_dealList_self')}';
                                                                                                                                          openFullScreen(url);
                                                                                                                                         }		
       }
/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_produceTask_activeExeLogList' idprefix='ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList' queryUrl='/WOM/produceTask/prodTaskActiExelog/activeExeLogList-query.action' queryFunc="WOM.produceTask.prodTaskActiExelog.activeExeLogList.query" ns="WOM.produceTask.prodTaskActiExelog.activeExeLogList" />
<@exportexcel action="/WOM/produceTask/prodTaskActiExelog/activeExeLogList-query.action"   getRequireDataAction="/WOM/produceTask/prodTaskActiExelog/activeExeLogList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_produceTask_ProdTaskActiExelog&&viewCode=WOM_7.5.0.0_produceTask_activeExeLogList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_produceTask_activeExeLogList')}" prefix="ec_WOM_produceTask_prodTaskActiExelog_activeExeLogList_query" modelCode="WOM_7.5.0.0_produceTask_ProdTaskActiExelog"  importFlag="false" viewCode="WOM_7.5.0.0_produceTask_activeExeLogList" />
