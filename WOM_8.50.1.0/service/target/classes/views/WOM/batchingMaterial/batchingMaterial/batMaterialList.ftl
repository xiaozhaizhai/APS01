<!-- WOM_7.5.0.0/batchingMaterial/batMaterialList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1491790754775')}</title>
<@maincss/>
<@mainjs/>
	<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_batchingMaterial_batMaterialList,head,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
</head>

<body id="dialog_page" class="view-list">
<@loadpanel></@loadpanel>
</#if>
  
<script type="text/javascript">
	CUI.ns("WOM.batchingMaterial.batchingMaterial","WOM.batchingMaterial.batchingMaterial.batMaterialList");
</script>	
<@errorbar id="workbenchErrorBar" offsetY=0 /><@loadpanel/>
<@frameset id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_container" border=0>
	<@frame id="ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "batMaterialList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_batchingMaterial_batMaterialList,html,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) -->
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
	function ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_openWork(url){
		if(url.indexOf('?') > 0) url+='&';
		else url += '?';
		url +='entityCode=WOM_7.5.0.0_batchingMaterial';
		openFullScreen(url);
	};
	
	WOM.batchingMaterial.batchingMaterial.batMaterialList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.batchingMaterial.batchingMaterial.batMaterialList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.batchingMaterial.batchingMaterial.batMaterialList._prefix += '.';
			}
			WOM.batchingMaterial.batchingMaterial.batMaterialList._prefix += arr[i];
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialList._suffix = arr[arr.length -1];
		if(WOM.batchingMaterial.batchingMaterial.batMaterialList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.batchingMaterial.batchingMaterial.batMaterialList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.batchingMaterial.batchingMaterial.batMaterialList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.batchingMaterial.batchingMaterial.batMaterialList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm *[name="'+WOM.batchingMaterial.batchingMaterial.batMaterialList._prefix + '.' + WOM.batchingMaterial.batchingMaterial.batMaterialList._suffix +'"]').val(obj[0][WOM.batchingMaterial.batchingMaterial.batMaterialList._suffix]);
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm *[name="'+WOM.batchingMaterial.batchingMaterial.batMaterialList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm *[name^="'+WOM.batchingMaterial.batchingMaterial.batMaterialList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm *[name="'+WOM.batchingMaterial.batchingMaterial.batMaterialList._prefix + '.' + WOM.batchingMaterial.batchingMaterial.batMaterialList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.batchingMaterial.batchingMaterial.batMaterialList._dialog) {
			WOM.batchingMaterial.batchingMaterial.batMaterialList._dialog.close();
		}
	};
	
	WOM.batchingMaterial.batchingMaterial.batMaterialList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.batchingMaterial.batchingMaterial.batMaterialList.query_"+obj+")!='undefined'") ? eval('WOM.batchingMaterial.batchingMaterial.batMaterialList.query_'+obj+'()') : null;
		return str;
	
	};
	
WOM.batchingMaterial.batchingMaterial.batMaterialList.rowDblClick = function(event,row){
		var url = '';
		var url = "/foundation/user/open-pending.action?tableInfoId=" + row.tableInfoId + "&id=" + row.id + "&entityCode=WOM_7.5.0.0_batchingMaterial&__pc__=${(Parameters.__pc__)!}";
		if(row.pending != null && ${userId!-1} == row.pending.userId && row.status == 88) url += "&pendingId=" + row.pending.id;
	openFullScreen(url);
	};
	
	WOM.batchingMaterial.batchingMaterial.batMaterialList.rowDblClickQuery = function(event,row){
		WOM.batchingMaterial.batchingMaterial.batMaterialList.rowDblClick(event,row);
	};
	
	
//自定义点击事件
WOM_batchingMaterial_batchingMaterial_batMaterialList_refresh = function(node){
WOM.batchingMaterial.batchingMaterial.batMaterialList.node = node;
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
	WOM.batchingMaterial.batchingMaterial.batMaterialList.query("query");
}

WOM_batchingMaterial_batchingMaterial_batMaterialList_getList = function() {
	return "WOM.batchingMaterial.batchingMaterial.batMaterialList";
}
WOM.batchingMaterial.batchingMaterial.batMaterialList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_batchingMaterial_batchingMaterial_batMaterialListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.batchingMaterial.batchingMaterial.batMaterialList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.batchingMaterial.batchingMaterial.batMaterialList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_batchingMaterial_batchingMaterial_batMaterialList_fileupload_button",
		handler:function(){
				list_operate_batchingMaterial_batMaterialList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.batchingMaterial.batchingMaterial.batMaterialList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterial_batMaterialList.WOM.batchingMaterial.batchingMaterial." + params.viewName + ".referenceCopy");
			funcName('batchingMaterial', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.batchingMaterial.batchingMaterial.batMaterialList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterial_batMaterialList.WOM.batchingMaterial.batchingMaterial." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.batchingMaterial.batchingMaterial.batMaterialList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_batchingMaterial_batMaterialList.WOM.batchingMaterial.batchingMaterial." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function openBatchMaterial(){ 
							  
	if(WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedAny()){
		if(WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedMore()){
			if(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[0].status==99){
				workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000033')}");
				return false;
			}
			//表头id
			var headID = ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[0].id;
			//物品id
			var proID = ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[0].productId.id;
			//物品Code
			var proCode = ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[0].productId.productCode;
			//物品Name
			var proName = ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[0].productId.productName;
			var url = "/WOM/batchingMaterial/batchingMaterialPart/batchMaterialEdit.action?headID="+encodeURI(headID)+"&proID="+encodeURI(proID)+"&proCode="+encodeURI(proCode)+"&proName="+encodeURI(proName);
			selectDialog = new CUI.Dialog({
				title:"${getHtmlText('WOM.showMessage00000016')}",
				url :url,
				formId: "WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form",
				modal:true,
				type:4,
				buttons:[
				{ 
					name:"${getHtmlText('common.button.save')}",
					handler:function(){
						CUI('#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form').submit();	
						//this.close();
						openNew = false;
					}
				},
				{ 
					name:"${getHtmlText('WOM.showMessage00000026')}",
					handler:function(){
						CUI('#WOM_batchingMaterial_batchingMaterialPart_batchMaterialEdit_form').submit();	
						//this.close();
						openNew = true;
					}
				},
				{ 
					name:"${getHtmlText('common.button.cancel')}",
	      			handler:function(){this.close()}
				}]
  			});
  			selectDialog.show();
		}
	}

				}
var selectDialog;
var openNew;;
				function arrayBatchMaterial(){ 
							  
	if(WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedAny()){
		var headIds = "";
		var tableInfoIds = "";
		for(var abm = 0 ; abm < ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow().length;abm++){
			if(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[abm].status==99){
				workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000033')}");
				return false;
			}
			if(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[abm].needPartId.offerSystem.value!="MES系统"){
				workbenchErrorBarWidget.showMessage("配料系统不是mes系统，不允许配料");
				return false;
			}
			//表头id
			headIds += ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[abm].id+",";
			//console.log(headIds);
			tableInfoIds += ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[abm].tableInfoId+",";
		}
		headIds = headIds.substr(0,headIds.length-1);
		tableInfoIds = tableInfoIds.substr(0,tableInfoIds.length-1)
		var url = "/WOM/batchingMaterial/batchingMaterial/arrayBatchingEdit.action?entityCode=WOM_7.5.0.0_batchingMaterial&superEdit=true&__pc__=YmF0TWF0ZXJpYWxMaXN0X2FycmF5QmF0Y2hfYWRkX1dPTV83LjUuMC4wX2JhdGNoaW5nTWF0ZXJpYWxfYmF0TWF0ZXJpYWxMaXN0fA__&tableInfoIds=" + tableInfoIds + "&headIds=" + headIds;
		window.open(url); 
	}

				};
				function endBat(){ 
							
	if(WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedAny()){
		var checkTrue ;
		//选中条数
		var selLength = ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow().length;
		//组织参数，参数为tableinfoid串
		var queryString = "";
		var hasPrint ;
		for(var i = 0 ; i < selLength ; i++){
			queryString += ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[i].tableInfoId+",";
			queryString.substring(0,queryString.length-2);
			//console.log(queryString);
			$.ajax({
				url : "/WOM/batchingMaterial/batchingMaterial/checkPrintCount.action",
				type : 'post',
				async : false,
				data:{"tableInfoIds":queryString},
				success : function(res) {
				//console.log(res.dealSuccessFlag);
					if(res.dealSuccessFlag==false){
						workbenchErrorBarWidget.showMessage("存在配料记录未打印，请先打印后再配送");
						return false;
					}else{
						hasPrint = true;
					}
				}
			});
			
		}
		if(hasPrint){
			for(var i = 0 ; i < selLength ; i++){
				if(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[i].doneNum==""){
					workbenchErrorBarWidget.showMessage("存在已配数量为空数据，请配料后再配送");
					return false;
				}
				if(parseFloat(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[i].doneNum) ==0 ){
					workbenchErrorBarWidget.showMessage("存在已配数量为0数据，请修改后再配送");
					return false;
				}
				if(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[i].needNum!="" && 
				ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[i].doneNum!="" &&
				parseFloat(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[i].doneNum)>
				parseFloat(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[i].needNum)){
					checkTrue = true;
					break;
				}else{
					checkTrue = false;
					
				}
			}
			for(var i = 0 ; i < selLength ; i++){
				//存在生效数据时不允许再次生效
				if(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[i].status==99){
					workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000018')}");
					return false;
				}
			}
			if(checkTrue==true){
				CUI.Dialog.confirm("${getText('WOM.showMessage00000032')}",
				function(){
					if(WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedAny()){
						//选中条数
						var selLength = ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow().length;
						//组织参数，参数为tableinfoid串
						var queryString = "";
						for(var i = 0 ; i < selLength ; i++){
							//存在生效数据时不允许再次生效
							if(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[i].status==99){
								workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000018')}");
								return false;
							}
							queryString += ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[i].tableInfoId+",";
						}
						queryString.substring(0,queryString.length-2);
						/**
						*根据tableinfoid将单子一步生效
						*将单子状态改为已配送
						*/
						$.ajax({
							url : "/WOM/batchingMaterial/batchingMaterial/endBat.action",
							type : 'post',
							traditional: true,
							async : false,
							data:{"tableInfoIds":queryString},
							success : function(res) {
								if(res.dealSuccessFlag==true){
									//刷新表体
									ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.setRequestDataUrl(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.requestUrl);
								}
							}
						});
					}
				});
			}else{
				CUI.Dialog.confirm("${getText('WOM.showMessage00000022')}",
				function(){
					if(WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedAny()){
						//选中条数
						var selLength = ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow().length;
						//组织参数，参数为tableinfoid串
						var queryString = "";
						for(var i = 0 ; i < selLength ; i++){
							//存在生效数据时不允许再次生效
							if(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[i].status==99){
								workbenchErrorBarWidget.showMessage("${getText('WOM.showMessage00000018')}");
								return false;
							}
							queryString += ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.getSelectedRow()[i].tableInfoId+",";
						}
						queryString.substring(0,queryString.length-2);
						/**
						*根据tableinfoid将单子一步生效
						*将单子状态改为已配送
						*/
						$.ajax({
							url : "/WOM/batchingMaterial/batchingMaterial/endBat.action",
							type : 'post',
							traditional: true,
							async : false,
							data:{"tableInfoIds":queryString},
							success : function(res) {
								if(res.dealSuccessFlag==true){
									//刷新表体
									ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.setRequestDataUrl(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.requestUrl);
								}
							}
						});
					}
				});	
			}
		}
	}

				};
	
	/**
	 * 保存完毕回调
	 * @method WOM.batchingMaterial.batchingMaterial.callBackInfo
	 */
	WOM.batchingMaterial.batchingMaterial.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('WOM_batchingMaterial_batchingMaterial_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{WOM.batchingMaterial.batchingMaterial.batMaterialList.Dlg.close();closeLoadPanel();}catch(e){}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedValid = function(type) {
		if(WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.selectedRows[i].valid === false){
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
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedAny = function() {
		if(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedMore = function() {
		if(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	/**
	 * 显示增加对话框
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.batchingMaterial.batchingMaterial.batMaterialList.otherParams || {};
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
										list_operate_batchingMaterial_batMaterialList.${funcname};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_batchingMaterial_batchMaterialView'||!viewCode){
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
					list_operate_batchingMaterial_batMaterialList.CUI('#'+formId).submit();
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
		if ( WOM.batchingMaterial.batchingMaterial.batMaterialList.Dlg ) {
			WOM.batchingMaterial.batchingMaterial.batMaterialList.Dlg._config.url = url;
			WOM.batchingMaterial.batchingMaterial.batMaterialList.Dlg._config.formId = formId;
			WOM.batchingMaterial.batchingMaterial.batMaterialList.Dlg.setTitle( title )
			WOM.batchingMaterial.batchingMaterial.batMaterialList.Dlg.setButtonbar( buttons );
		}else{
			WOM.batchingMaterial.batchingMaterial.batMaterialList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_batchingMaterial_batMaterialList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.batchingMaterial.batchingMaterial.batMaterialList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_batchingMaterial_batchingMaterial', element : $('#WOM_batchingMaterial_batchingMaterial_batMaterialList_fileupload_button a:eq(1)')});
		}
		WOM.batchingMaterial.batchingMaterial.batMaterialList.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialList.approvalDialog
	 * @param {String} url
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialList.approvalDialog = function(url,formId,title,width,height) {
		WOM.batchingMaterial.batchingMaterial.batMaterialList.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){try{WOM.batchingMaterial.batchingMaterial.approval();}catch(e){}}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		WOM.batchingMaterial.batchingMaterial.batMaterialList.AppDlg.show();
	};

	WOM.batchingMaterial.batchingMaterial.batMaterialList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.batchingMaterial.batchingMaterial.batMaterialList.beforeCommonQuery === 'function') {
	   		var ret = WOM.batchingMaterial.batchingMaterial.batMaterialList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.batchingMaterial.batchingMaterial.batMaterialList.cancelSelectedNode == 'function') {
	   WOM.batchingMaterial.batchingMaterial.batMaterialList.cancelSelectedNode();
	   WOM.batchingMaterial.batchingMaterial.batMaterialList.node = null;
	  }
	  if(typeof WOM_batchingMaterial_batchingMaterial_batMaterialList_cancelSelectedNode == 'function') {
	   WOM_batchingMaterial_batchingMaterial_batMaterialList_cancelSelectedNode();
	   WOM.batchingMaterial.batchingMaterial.batMaterialList.node = null;
	  }
	  WOM.batchingMaterial.batchingMaterial.batMaterialList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialList.query
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialList.query = function(type,pageNo,sortFlag){
		var node = WOM.batchingMaterial.batchingMaterial.batMaterialList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.batchingMaterial.batchingMaterial.batMaterialList.node = null;
		if(!checkListValid("ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query._sortKey && datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query._sortMethod){
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query._sortKey);
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm #dataTableSortColName').val(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query._sortColumnName);
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query._sortMethod);
		}else{
			datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query._sortKey = '';
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
		if(type && type == 'pending') {
			if(null != datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.get('dblclick') && datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.get('dblclick').length > 0) {
				datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'WOM.batchingMaterial.batchingMaterial.batMaterialList.rowDblClick'
		            });
			}
	        datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.batchingMaterial.batchingMaterial.batMaterialList.query('pending')"
            });    
	    } 
	    if(type && type == 'query') {
	    	if(null != datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.get('dblclick') && datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.get('dblclick').length > 0) {
		    	datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.setAttributeConfig('dblclick', {
		                writeOnce: true,
		                value: 'WOM.batchingMaterial.batchingMaterial.batMaterialList.rowDblClickQuery'
		            });
		    }
	        datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.batchingMaterial.batchingMaterial.batMaterialList.query('query')"
            }); 
	    } 
	    if(type && type == 'adv') {
	    	datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.batchingMaterial.batchingMaterial.batMaterialList.query('adv')"
            });
	    }
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/batchingMaterial/batchingMaterial/batMaterialList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/batchingMaterial/batchingMaterial/batMaterialList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_batchingMaterial_batMaterialList";
		condobj.modelAlias="batchingMaterial";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm *[name="'+ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query_PageLink_PageCount"]').val();
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
			dataPost += "&pending-beginDate=${pendingBeginDate!''}";
			dataPost += "&pending-endDate=${pendingEndDate!''}";
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
			permissionCode = 'WOM_7.5.0.0_batchingMaterial_batMaterialList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.batchingMaterial.batchingMaterial.batMaterialList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_batchingMaterial";
		openExportFrame(url);
	}
WOM.batchingMaterial.batchingMaterial.batMaterialList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.batchingMaterial.batchingMaterial.batMaterialList.otherParams = {};
	WOM.batchingMaterial.batchingMaterial.batMaterialList.otherParams.dialogType = dialogType;
	WOM.batchingMaterial.batchingMaterial.batMaterialList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.batchingMaterial.batchingMaterial.batMaterialList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.batchingMaterial.batchingMaterial.editCallBackInfo
 */
WOM.batchingMaterial.batchingMaterial.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_batchingMaterial_batchingMaterial_batMaterialList_getLayout == "function"){
    		var layout = WOM_batchingMaterial_batchingMaterial_batMaterialList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.batchingMaterial.batchingMaterial.batMaterialList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_batchingMaterial_BatchingMaterial'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget._sortKey && ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_batchingMaterial_batchingMaterial_batMaterialList_getLayout == "function"){
			var layout = WOM_batchingMaterial_batchingMaterial_batMaterialList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.batchingMaterial.batchingMaterial.batMaterialList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.batchingMaterial.batchingMaterial.batMaterialList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.batchingMaterial.batchingMaterial.batMaterialList.query('pending');
	    	}
			if(modelCode == 'WOM_7.5.0.0_batchingMaterial_BatchingMaterial'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.batchingMaterial.batchingMaterial.batMaterialList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.batchingMaterial.batchingMaterial.batMaterialList.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="arriveTime_start"]').val()!= null && $('#' + formId + ' input[name^="arriveTime_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="arriveTime_start"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491789966310')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="arriveTime_end"]').val()!= null && $('#' + formId + ' input[name^="arriveTime_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="arriveTime_end"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491789966310')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="arriveTime_start"]').val()!='' && $('#' + formId + ' input[name="arriveTime_end"]').val()!=''){if($('#' + formId + ' input[name="arriveTime_start"]').val() > $('#' + formId + ' input[name="arriveTime_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1491789966310')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1491789966310')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);
function replace(str,symbol){
	var arr = str.split(symbol);
	var s1 = "";
	var len = arr.length;
	for(i=0;i<len;i++){
		if(i%2!=0){
			if(i==len-1){
				s1 = s1 +"&nbsp;&nbsp;"+ arr[i];
			}else{
				s1 = s1 +"&nbsp;&nbsp;"+ arr[i]+"</br>";
			}
		}else{
			if(i==len-1){
				s1 = s1 +"&nbsp;&nbsp;&nbsp;&nbsp;"+ arr[i];
			}else{
				s1 = s1 +"&nbsp;&nbsp;&nbsp;&nbsp;"+ arr[i]+symbol;
			}
		}
	}
	return s1;	
}
/**
 * 批量处理事件
 * 
 */
WOM.batchingMaterial.batchingMaterial.batMaterialList.approval=function(obj){
	var selectrows = datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.selectedRows;
	selectrows=selectrows.sort(sortLineInTabOrder);//按表单顺序重新排序
	var atn = "";
	var deploymentId = "";
	var processid="";
	var ids = ""; //application ID
	var pendingIds = ""; //待办ID
	var activityType = "";
	var des = "";
	var alertContent="<div style='margin-right:10px;padding:5px;height:245px;overflow:auto;line-height:20px'><p style='font-weight:bold'>${getHtmlText('ec.list.batch.failed')}</p>";//提示内容
	var nopending="";//无待办
	var noflag="";//未启用批量
	var others="";//其他
	var flag = true;
	var outcomeStr = "";//路由信息 ||activeType（活动类型），outcome（路由code），dec（路由描述），assignUser（指定人员的用户ids）;activeType，outcome，dec，assignUser||activeType，outcome，dec，assignUser;activeType，outcome，dec，assignUser
	var isHandOut = "";//挂起
	var isEffective = "";//生效
	var notSingleTask = false; // 单据状态不唯一
	if(selectrows!=null&&selectrows.length>0){
		var map={};
		processid=selectrows[0].pending.processId;
		var isdeploy = false;
		$.each(selectrows,function(i,st){
			var no = st.tableNo;
			var status = st.status;
			if(status=="77"){
				isHandOut = status;
				return false;
			}
			if(st.pending==null||st.pending==undefined||st.pending.id==null||st.pending.id==undefined||st.pending.bulkDealFlag==null||st.pending.bulkDealFlag==undefined){
				if(nopending==""){
					nopending=no;
				}else{
					nopending=nopending+"${getText('ec.list.batch.semicolon')}"+no;
				}
				flag = false;
			}
			if (st.pending.taskDescription) {
				var length = st.pending.taskDescription.split(",").length;
				if(length > 1){
					notSingleTask = true;
					return false;
				}
			}
			if(st.pending.bulkDealFlag==false){
				if(noflag==""){
					noflag=no;
				}else{
					noflag=noflag+"${getText('ec.list.batch.semicolon')}"+no;
				}
				flag = false;
			}
			if(deploymentId==""){
					deploymentId = st.pending.deploymentId;
					if(st.pending.processDescription!=null&&st.pending.processVersion!=null){
						if(map[st.pending.processDescription+"("+st.pending.processVersion+")"]==null||map[st.pending.processDescription+"("+st.pending.processVersion+")"]==""){
							map[st.pending.processDescription+"("+st.pending.processVersion+")"]=no;
						}else{
							map[st.pending.processDescription+"("+st.pending.processVersion+")"]=map[st.pending.processDescription+"("+st.pending.processVersion+")"]+"${getText('ec.list.batch.semicolon')}"+no;
						}
					}
			}
			if(atn==""){
				atn = st.pending.activityName;
				des = st.pending.taskDescription;
				des = encodeURI(des);
				des = encodeURI(des);
			}
			if(st.pending.deploymentId!=deploymentId){
				if(st.pending.processDescription!=null&&st.pending.processVersion!=null){
					if(map[st.pending.processDescription+"("+st.pending.processVersion+")"]==null||map[st.pending.processDescription+"("+st.pending.processVersion+")"]==""){
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=no;
					}else{
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=map[st.pending.processDescription+"("+st.pending.processVersion+")"]+"${getText('ec.list.batch.semicolon')}"+no;
					}
					isdeploy = true;
				}
				flag = false;
				isdeploy = true;
			}else if(st.pending.activityName!=atn){
				if(st.pending.processDescription!=null&&st.pending.processVersion!=null){
					if(map[st.pending.processDescription+"("+st.pending.processVersion+")"]==null||map[st.pending.processDescription+"("+st.pending.processVersion+")"]==""){
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=no;
					}else{
						map[st.pending.processDescription+"("+st.pending.processVersion+")"]=map[st.pending.processDescription+"("+st.pending.processVersion+")"]+"${getText('ec.list.batch.semicolon')}"+no;
					}
					isdeploy = true;
				}
				flag = false;
				
			}
			if(activityType==""){
				activityType = st.pending.activityType;
			}
			if(flag){
				if(ids==""){
					ids = st.id;
				}else{
					ids=ids+","+st.id;
				}
				if(pendingIds==""){
					pendingIds = st.pending.id;
				}else{
					pendingIds=pendingIds+","+st.pending.id;
				}
			}
		});
		if(isHandOut=="77"){
			CUI.Dialog.alert("所选记录中包含已被挂起的流程，无法处理！");
			return false;
		}
		if (notSingleTask) {
			CUI.Dialog.alert("${getHtmlText('ec.list.batch.notSingleTask')}");
			return false;
		}
		if(!flag){
			if(nopending!=""){
				alertContent=alertContent+"<p style='font-weight:bold'>1.${getHtmlText('ec.list.batch.billHasNoPending')}</p>"+replace(nopending,"${getHtmlText('ec.list.batch.semicolon')}");
				if(noflag!=""){
					alertContent=alertContent+"</br><p style='font-weight:bold'>2.${getHtmlText('ec.list.batch.batchEnabled')}</p>"+replace(noflag,"${getHtmlText('ec.list.batch.semicolon')}");
					if(isdeploy){
						alertContent=alertContent+"</br><p style='font-weight:bold'>3.${getHtmlText('ec.list.batch.inconsistent')}</p>";
						$.each(map,function(key,value){
							alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
						});
					}
				}else if(isdeploy){
					alertContent=alertContent+"</br><p style='font-weight:bold'>2.${getHtmlText('ec.list.batch.inconsistent')}</p>";
					$.each(map,function(key,value){
							alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
					});
				}
			}else if(noflag!=""){
				alertContent=alertContent+"<p style='font-weight:bold'>1.${getHtmlText('ec.list.batch.batchEnabled')}</p>"+replace(noflag,"${getHtmlText('ec.list.batch.semicolon')}");
					if(isdeploy){
						alertContent=alertContent+"</br><p style='font-weight:bold'>2.${getHtmlText('ec.list.batch.inconsistent')}</p>";
						$.each(map,function(key,value){
							alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
						});
					}
			}else if(isdeploy){
				alertContent=alertContent+"<p style='font-weight:bold'>1.${getHtmlText('ec.list.batch.inconsistent')}</p>";
				$.each(map,function(key,value){
					alertContent=alertContent+"<span style='font-weight:bold'>"+key+"：</span></br>"+replace(value,"${getHtmlText('ec.list.batch.semicolon')}")+"</br>"
				});
			}
			alertContent =alertContent+"</div>"
			CUI.Dialog.alert(alertContent, null, null,300,500);
			return false;
		}
	}else{
		CUI.Dialog.alert("${getHtmlText('ec.list.selectLeastOne')}");
		flag = false;
		return false;
	}
	if(flag){
		var url="/WOM/batchingMaterial/batchingMaterial/approval.action?processId="+processid+"&activityName="+atn+"&pendingIds="+pendingIds+"&deploymentId="+deploymentId+"&ids="+ids+"&activityType="+activityType+"&des="+des+"";
		var formid="WOM_batchingMaterial_batchingMaterial_approval_form";
		var title="${getText('ec.list.batchApproval')}";
		var width=500;
		var height=300;
		WOM.batchingMaterial.batchingMaterial.batMaterialList.approvalDialog(url,formid,title,width,height);
	}
}
/*bug#496:重新对选择行进行排序，使选择的行顺序按照表单顺序，而非选择操作的顺序*/
function sortLineInTabOrder(a,b){
    var value1 = $(a.rowHtmlObj).index();
    var value2 = $(b.rowHtmlObj).index();
    return value1 - value2;
}
	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_batchingMaterial_batMaterialList,js,WOM_7.5.0.0_batchingMaterial_BatchingMaterial,WOM_7.5.0.0) */
// 自定义代码
	/**
	 * 确认是否选中任何记录
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedAny = function() {
		if(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.batchingMaterial.batchingMaterial.batMaterialList.checkSelectedMore = function() {
		if(datatable_ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};



	WOM.batchingMaterial.batchingMaterialPart=WOM.batchingMaterial.batchingMaterial.batMaterialList;
	WOM.batchingMaterial.batchingMaterialPart.callBackInfo=function(){ 
		setTimeout(function(){
			selectDialog.close();
		},600);
        if(openNew){
          	setTimeout(function(){
          		openBatchMaterial();
           	},600);
        }else{
          CUI.Dialog.toggleAllButton('mobi_ptEntity_mainModel_edit_std1_form');
          		//ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.setRequestDataUrl(ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_queryWidget.requestUrl);
        }
	}
/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_batchingMaterial_batMaterialList' idprefix='ec_WOM_batchingMaterial_batchingMaterial_batMaterialList' queryUrl='/WOM/batchingMaterial/batchingMaterial/batMaterialList-query.action' queryFunc="WOM.batchingMaterial.batchingMaterial.batMaterialList.query" ns="WOM.batchingMaterial.batchingMaterial.batMaterialList" />
<@exportexcel action="/WOM/batchingMaterial/batchingMaterial/batMaterialList-query.action"   getRequireDataAction="/WOM/batchingMaterial/batchingMaterial/batMaterialList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_batchingMaterial_BatchingMaterial&&viewCode=WOM_7.5.0.0_batchingMaterial_batMaterialList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_batchingMaterial_batMaterialList')}" prefix="ec_WOM_batchingMaterial_batchingMaterial_batMaterialList_query" modelCode="WOM_7.5.0.0_batchingMaterial_BatchingMaterial"  importFlag="false" viewCode="WOM_7.5.0.0_batchingMaterial_batMaterialList" />
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
