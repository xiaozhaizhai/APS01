<!-- WOM_7.5.0.0/batchingMaterialNeed/batchNeedList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1490614659540')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_batchingMaterialNeed_batchNeedList,head,WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

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
	CUI.ns('WOM.batchingMaterialNeed.batchingMaterialNeed','WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList');
</script>
<@frameset id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_container" border=0>
	<@frame id="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "batchNeedList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_batchingMaterialNeed_batchNeedList,html,WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed,WOM_7.5.0.0) -->
<!-- 自定义代码 -->
<style type="text/css">
	.cui-btn-putin {
    	background: url('/bap/static/WOM/img/icon_jxtl.png') no-repeat;
	}
    .cui-btn-inspect {
    	background: url('/bap/static/WOM/img/icon_fqqj.png') no-repeat;
	}
	.cui-btn-taskReport {
    	background: url('/bap/static/WOM/img/icon_jxbg.png') no-repeat;
	}
	.cui-btn-cdsz {
    	background: url('/bap/static/WOM/img/icon_cdsz.png') no-repeat;
	}
	.cui-btn-copy {
    	background: url('/bap/static/WOM/img/icon_copy.png') no-repeat;
	}
	.cui-btn-end {
    	background: url('/bap/static/WOM/img/icon_end.png') no-repeat;
	}
	.cui-btn-gdtpl {
    	background: url('/bap/static/WOM/img/icon_gdtpl.png') no-repeat;
	}
	.cui-btn-hdsz {
    	background: url('/bap/static/WOM/img/icon_hdsz.png') no-repeat;
	}
	.cui-btn-jxps {
    	background: url('/bap/static/WOM/img/icon_jxps.png') no-repeat;
	}
	.cui-btn-plwc {
    	background: url('/bap/static/WOM/img/icon_plwc.png') no-repeat;
	}
	.cui-btn-print {
    	background: url('/bap/static/WOM/img/icon_print.png') no-repeat;
	}
	.cui-btn-sgtpl {
    	background: url('/bap/static/WOM/img/icon_sgtpl.png') no-repeat;
	}
	.cui-btn-wlszyck {
    	background: url('/bap/static/WOM/img/icon_wlszyck.png') no-repeat;
	}
	.cui-btn-xtdbd {
    	background: url('/bap/static/WOM/img/icon_xtdbd.png') no-repeat;
	}
	.cui-btn-zdsc {
    	background: url('/bap/static/WOM/img/icon_zdsc.png') no-repeat;
	}
	.cui-btn-disable{
		background: url('/bap/struts/css/buttons.png') no-repeat 0px -49px;
	}

</style>
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._prefix += '.';
			}
			WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._prefix += arr[i];
		}
		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._suffix = arr[arr.length -1];
		if(WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm *[name="'+WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._prefix + '.' + WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._suffix +'"]').val(obj[0][WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._suffix]);
		CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm *[name="'+WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm *[name^="'+WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm *[name="'+WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._prefix + '.' + WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._dialog) {
			WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._dialog.close();
		}
	};
	
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query_"+obj+")!='undefined'") ? eval('WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_refresh = function(node){
WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.node = node;
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
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query("query");
}

WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_getList = function() {
	return "WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList";
}
WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_fileupload_button",
		handler:function(){
				list_operate_batchingMaterialNeed_batchNeedList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterialNeed_batchNeedList.WOM.batchingMaterialNeed.batchingMaterialNeed." + params.viewName + ".referenceCopy");
			funcName('batchingMaterialNeed', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterialNeed_batchNeedList.WOM.batchingMaterialNeed.batchingMaterialNeed." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterialNeed_batchNeedList.WOM.batchingMaterialNeed.batchingMaterialNeed." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function makeBatcingOrder(){ 
								
    var len=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getSelectedRow().length;
	if(len==0){
		workbenchErrorBarWidget.showMessage("${getText('ec.business.view.choose.one')}","f");
		return;
	}
	for(var i = 0 ; i<len ; i++){
		//如果状态已完成，不允许创建配料指令
		if(ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getSelectedRow()[i].state.id=="womNeedState/04"){
			workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000014')}","f");
			return;
		}
		//选择的数据配料系统不一致,不允许创建配料指令
		for(var j = i+1;j<len;j++){
			if(ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getSelectedRow()[i].offerSystem.id!=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getSelectedRow()[j].offerSystem.id){
				workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000015')}","f");
				return;
			}
		}
	}
	 _dialog=new CUI.Dialog({
		  title:"${getText('WOM.buttonPropertyshowName.radion1491795195241')}",
		  formId:"WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form",
		  type:4,
		  modal:true,
		  url:'/WOM/batchingMaterialNeed/makeBatOrderHead/makeBatchingOrder.action',
		  buttons:[
		      {
			   name:"${getText('WOM.showMessage00000031')}",
			   handler:function(){		 			
				 CUI('#WOM_batchingMaterialNeed_makeBatOrderHead_makeBatchingOrder_form').submit();				 
			   }
			  },
			  {
			   name:"${getText('foundation.common.closed')}",
			   handler:function(){this.close();}
			  }]
	  });   
	  
	  _dialog.show();		

				};
				function updateNeedState(){ 
							
	var seletedRow=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getSelectedRow();
	if (seletedRow == undefined) {
		workbenchErrorBarWidget.showMessage("${getText('ec.business.view.choose.one')}","f");
		return;
	}
	var len=seletedRow.length;
	if(len==0){
		workbenchErrorBarWidget.showMessage("${getText('ec.business.view.choose.one')}","f");
		return;
	}

	var useNum = seletedRow[0].useNum || 0;
	if(useNum == 0){
		workbenchErrorBarWidget.showMessage("选中配料需求已配送数量不能为0！","f");
		return;
	}

	var check = false;
	for(var i = 0 ; i < len ; i++){
		if(ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getSelectedRow()[i].hasOrderNum==""){
			check = true;
			break;
		}
	}
	//选择的行数
	var rows=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getSelectedRow();
	//已下达数量为空
	if(check){
		CUI.Dialog.confirm("${getText('WOM.showMessage00000030')}",
		function(){
			CUI.Dialog.confirm("${getText('WOM.showMessage00000021')}",
				function(){
				    var ids='';
				    for(var i=0;i<rows.length;i++){		   
					  ids+=','+rows[i].id;			
				    }
				    if(ids!=''){
					    ids=ids.substr(1);
				    }
				    CUI.ajax({
					    type:'POST',
					    url:'/WOM/batchingMaterialNeed/batchingMaterialNeed/updateNeedState.action?needDetails='+ids,
					    success:function(msg){
						    try{
						        if(msg.result==true) {
							        workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
									WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query('query');
						        }
					        } catch(e){}
					    }
				    });
			});		
		});	
	}else{
		CUI.Dialog.confirm("${getText('WOM.showMessage00000021')}",
			function(){
			    var ids='';
			    for(var i=0;i<rows.length;i++){		   
				  ids+=','+rows[i].id;			
			    }
			    if(ids!=''){
				    ids=ids.substr(1);
			    }
			    CUI.ajax({
				    type:'POST',
				    url:'/WOM/batchingMaterialNeed/batchingMaterialNeed/updateNeedState.action?needDetails='+ids,
				    success:function(msg){
					    try{
					        if(msg.result==true) {
						        workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
								WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query('query');
					        }
				        } catch(e){}
				    }
			    });
		});	
	}	

				};
	
	/**
	 * 保存完毕回调
	 * @method WOM.batchingMaterialNeed.batchingMaterialNeed.callBackInfo
	 */
	WOM.batchingMaterialNeed.batchingMaterialNeed.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('WOM_batchingMaterialNeed_batchingMaterialNeed_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.Dlg.close();closeLoadPanel();}catch(e){}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.checkSelectedValid = function(type) {
		if(WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query.selectedRows[i].valid === false){
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
	 * @method WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.checkSelectedAny = function() {
		if(datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.checkSelectedMore = function() {
		if(datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.dbClickViewbatchNeedList =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=WOM_7.5.0.0_batchingMaterialNeed&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.otherParams || {};
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
										list_operate_batchingMaterialNeed_batchNeedList.${funcname};
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
			
			
			
		}
		
		if(otherParams && otherParams.dialogType != 'OTHER') {
			width = null;
			height = null;
		}
		if(otherParams && otherParams.viewShowType != 'VIEW') {
			buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){
					list_operate_batchingMaterialNeed_batchNeedList.CUI('#'+formId).submit();
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
		if ( WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.Dlg ) {
			WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.Dlg._config.url = url;
			WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.Dlg._config.formId = formId;
			WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.Dlg.setTitle( title )
			WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.Dlg.setButtonbar( buttons );
		}else{
			WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_batchingMaterialNeed_batchNeedList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_batchingMaterialNeed_batchingMaterialNeed', element : $('#WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_fileupload_button a:eq(1)')});
		}
		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.approvalDialog = function(url,formId,title,width,height) {
		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{WOM.batchingMaterialNeed.batchingMaterialNeed.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.AppDlg.show();
	};

	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.beforeCommonQuery === 'function') {
	   		var ret = WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.cancelSelectedNode == 'function') {
	   WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.cancelSelectedNode();
	   WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.node = null;
	  }
	  if(typeof WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_cancelSelectedNode == 'function') {
	   WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_cancelSelectedNode();
	   WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.node = null;
	  }
	  WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query
	 */
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query = function(type,pageNo,sortFlag){
		var node = WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.node = null;
		if(!checkListValid("ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query._sortKey && datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query._sortMethod){
			CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query._sortKey);
			CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm #dataTableSortColName').val(datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query._sortColumnName);
			CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query._sortMethod);
		}else{
			datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query._sortKey = '';
			CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_batchingMaterialNeed_batchNeedList";
		condobj.modelAlias="batchingMaterialNeed";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm *[name="'+ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'WOM_7.5.0.0_batchingMaterialNeed_batchNeedList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_batchingMaterialNeed";
		openExportFrame(url);
	}
WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.otherParams = {};
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.otherParams.dialogType = dialogType;
	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.batchingMaterialNeed.batchingMaterialNeed.editCallBackInfo
 */
WOM.batchingMaterialNeed.batchingMaterialNeed.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_getLayout == "function"){
    		var layout = WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget._sortKey && ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget._sortKey && ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget._sortKey && ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_getLayout == "function"){
			var layout = WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query('query');
	    	}
			if(modelCode == 'WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query('query',_Current_PageNo,needSort);
	    	} else {
	    		WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query('query');
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
})(jQuery);	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_batchingMaterialNeed_batchNeedList,js,WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed,WOM_7.5.0.0) */
// 自定义代码


        var _dialog;

		WOM.batchingMaterialNeed.makeBatOrderHead=WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList;

		WOM.batchingMaterialNeed.makeBatOrderHead.callBackInfo=function(){ 
         
          setTimeout(function(){   
            		 _dialog.close();
					// CUI.Dialog.toggleAllButton();       
				},800);
		 }



      function makeBatchingOrder(makeOrderStaff,exeOrderStaff,needArriveDate,orderDetails){
         $.ajax({
              url : "/WOM/batchingMaterialNeed/batchingMaterialNeed/makeBatchingOrder.action",
              type : 'post',
              traditional: true,
              async : false,
              data:{"makeOrderStaff":makeOrderStaff,"exeOrderStaff":exeOrderStaff,"needArriveDate":needArriveDate,"orderDetails":orderDetails},
              success : function(res) {
                  if(res.dealSuccessFlag==true){

                  }
              }
          });
      }
//清空双击打开视图功能
WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.dbClickViewbatchNeedList = function(event, oRow) {}        
        
var batMaterial_dialog;
//已下达指令数量 点击触发
function showHasOrderNum(nRow){
	var batMaterialId=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getCellValue(nRow,"id");
	url = "/WOM/batchingMaterial/batchingMaterial/batMaterialShowRef.action?condition="+encodeURIComponent("batMaterialId="+batMaterialId);
	batMaterial_dialog = foundation.common.select({
		pageType : 'other',
		closePage : true,
		callBackFuncName : '_callback_BatMaterial',
		url : url,
		title : "${getText('WOM.showMessage00000019')}",
		params : ''
	});
};
function _callback_CheckItem(objs){}

var batMaterialPart_dialog;
//已下达指令数量 点击触发
function showUseNum(nRow){
	var batMaterialId=ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_queryWidget.getCellValue(nRow,"id");
	url = "/WOM/batchingMaterial/batchingMaterialPart/batPartShowRef.action?condition="+encodeURIComponent("batMaterialId="+batMaterialId);
	batMaterialPart_dialog = foundation.common.select({
		pageType : 'other',
		closePage : true,
		callBackFuncName : '_callback_BatMaterialPart',
		url : url,
		title : "${getText('WOM.showMessage00000019')}",
		params : ''
	});
};
function _callback_BatMaterialPart(objs){}
/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_batchingMaterialNeed_batchNeedList' idprefix='ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList' queryUrl='/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedList-query.action' queryFunc="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList.query" ns="WOM.batchingMaterialNeed.batchingMaterialNeed.batchNeedList" />
<@exportexcel action="/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedList-query.action"   getRequireDataAction="/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed&&viewCode=WOM_7.5.0.0_batchingMaterialNeed_batchNeedList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_batchingMaterialNeed_batchNeedList')}" prefix="ec_WOM_batchingMaterialNeed_batchingMaterialNeed_batchNeedList_query" modelCode="WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed"  importFlag="false" viewCode="WOM_7.5.0.0_batchingMaterialNeed_batchNeedList" />
