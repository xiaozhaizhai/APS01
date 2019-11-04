<!-- WOM_7.5.0.0/prepareMaterial/prepareDetailsList -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1496907340768')}</title>
<@maincss/>
<@mainjs/>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_prepareMaterial_prepareDetailsList,head,WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart,WOM_7.5.0.0) -->
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
	CUI.ns('WOM.prepareMaterial.prepareMaterialPart','WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList');
</script>
<@frameset id="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_container" border=0>
	<@frame id="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_container_main"  offsetH=4 region="center" class="center_in">
	<#include "prepareDetailsList-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<#if (Parameters.openType)?? && (Parameters.openType) == 'page'>
</body>
</html>
</#if>
<!-- CUSTOM CODE START(view-LIST-WOM_7.5.0.0_prepareMaterial_prepareDetailsList,html,WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart,WOM_7.5.0.0) -->
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
	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._prefix += '.';
			}
			WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._prefix += arr[i];
		}
		WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._suffix = arr[arr.length -1];
		if(WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._querycustomFunc(objName.replace(/\./g, '_')));
		}
		WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.getcallBackInfo = function(obj){
		CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm *[name="'+WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._prefix + '.' + WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._suffix +'"]').val(obj[0][WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._suffix]);
		CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm *[name="'+WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm *[name^="'+WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._prefix + '."]').unbind("change");
		CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm *[name="'+WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._prefix + '.' + WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._dialog) {
			WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._dialog.close();
		}
	};
	
	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query_"+obj+")!='undefined'") ? eval('WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query_'+obj+'()') : null;
		return str;
	
	};
	
//自定义点击事件
WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_refresh = function(node){
WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.node = node;
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
	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query("query");
}

WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_getList = function() {
	return "WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList";
}
WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.showErrorMsg = function(msg) {
	// 优先使用当前独立页面的errorbar， 如果不存在尝试使用全局errorbar, 如果都不存在则使用浏览自带alert
	var errorbar = window.WOM_prepareMaterial_prepareMaterialPart_prepareDetailsListErrorbarWidget || window.workbenchErrorBarWidget;
	if (errorbar){
		errorbar.showMessage(msg,'f');
	} else {
		alert(msg);
	}
}

WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.node = null;

/**
 * dialog创建附件上传按钮
 * @private
 */
WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.createUploadBtn = function(params) {
	return {
		name:"${getText('foundation.upload.attachment')}",
		align:"left",
		id:"WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_fileupload_button",
		handler:function(){
				list_operate_prepareMaterial_prepareDetailsList.setUpload(params);
		}
	}
};
/**
 * dialog创建参照复制按钮
 * @private
 */
WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.createReferenceCopyBtn = function(params) {
	return {
		name:"${getText('common.button.refcopy')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prepareMaterial_prepareDetailsList.WOM.prepareMaterial.prepareMaterialPart." + params.viewName + ".referenceCopy");
			funcName('prepareMaterialPart', params.referenceUrl, this);
		}
	}
};
/**
 * dialog创建页面打印按钮
 * @private
 */
WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.createPrintBtn = function(editViewName,url){
	return {
		name:"${getText('ec.print.page.print')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prepareMaterial_prepareDetailsList.WOM.prepareMaterial.prepareMaterialPart." + editViewName + ".print");
			funcName(url);
		}
	}
};
/**
 * dialog创建打印设置按钮
 * @private
 */
WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.createPrintSettingBtn = function(editViewName){
	return {
		name:"${getText('ec.print.setting')}",
		align:"left",
		handler:function(){
			var funcName = eval("list_operate_prepareMaterial_prepareDetailsList.WOM.prepareMaterial.prepareMaterialPart." + editViewName + ".printSetting");
			funcName();
		}
	}
}
				function toAppropriation(){ 
							
			//是否已选
			if(WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.checkSelectedAny()){
				//所选obj对象list
				var objlist=ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryWidget.getSelectedRow();
				var idList="";
				for(var i=0;i<objlist.length;i++){
					idList+=objlist[i].id+"#";//备料明细id 拼接
				}
				//向后台传idlist字符串 并进行分割
				var url='/WOM/prepareMaterial/prepareMaterial/toAppropriation.action';
				CUI.Dialog.confirm("${getText('WOM.istoAppropriation123456')}",
				function(){
					$.ajax({
						url:url,
						type:'post',
						async:false,
						data:'idList='+idList,
						dataType:'json',
						success:function(res){
							//刷新List页面
							if(res.dealSuccessFlag==true){
								workbenchErrorBarWidget.showMessage('${getText('ec.common.saveandclosesuccessful')}','s');
								WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query('query');
							}
						}
					});
				});	
			}
		
				};
	
	/**
	 * 保存完毕回调
	 * @method WOM.prepareMaterial.prepareMaterialPart.callBackInfo
	 */
	WOM.prepareMaterial.prepareMaterialPart.callBackInfo = function(res){
		if(res.dealSuccessFlag){
			if(res.operateType == 'save'){
				var viewselect = res.viewselect;
				var errorBarWidget = eval('WOM_prepareMaterial_prepareMaterialPart_' + viewselect + '_formDialogErrorBarWidget');
				errorBarWidget.show("${getText('foundation.common.saveandclosesuccessful')}","s");
			} else if(res.operateType == 'delete') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.invalidandrefreshsuccessful')}","s");
			}  else if(res.operateType == 'restore') {
				workbenchErrorBarWidget.showMessage("${getText('foundation.common.restoreandrefreshsuccessful')}","s");
			} 
			setTimeout(function(){
				try{WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.Dlg.close();closeLoadPanel();}catch(e){}
			},1500);
		} else {
			CUI.showErrorInfos(res);
		}
	};
	
	/**
	 * 获取待操作的记录ID，从树或者列表上获取
	 * @method WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.getOperateRecordId
	 * @return {string} 待操作的记录ID
	 * @private
	 */
	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.getOperateRecordId = function(type) {
		var ids = "";
		for(var i = 0 ; i < datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query.selectedRows.length; i++) {
			ids += "," + datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query.selectedRows[i].id;
			if(type && type == 'del') {
				ids += '@' + datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query.selectedRows[i].version;
			}
		}
		return ids.substr(1);
	};
	
	/**
	 * 确认选中数据是否有效的
	 * @method WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.checkSelectedvalid
	 * @param  type 0无效数据返回true 1有效数据返回true 
	 * @return Boolean
	 * @private
	 */
	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.checkSelectedValid = function(type) {
		if(WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.checkSelectedAny()){
			for(var i=0;i<datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query.selectedRows.length;i++){
				if(type==0){
					if(datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query.selectedRows[i].valid){
						CUI.Dialog.alert("${getText('ec.common.checkvalidforrestore')}");
						return false;
					}
				}
				if(type==1){
					if(datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query.selectedRows[i].valid === false){
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
	 * @method WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.checkSelectedAny
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.checkSelectedAny = function() {
		if(datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query.selectedRows.length==0){
			CUI.Dialog.alert("${getText('ec.common.checkselected')}");
			return false;
		}
		return true;
	};
	
	/**
	 * 是否选择多条
	 * @method WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.checkSelectedMore
	 * @param {String} url
	 * @return {boolean}
	 * @private
	 */
	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.checkSelectedMore = function() {
		if(datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query.selectedRows.length > 1){
			CUI.Dialog.alert("${getText('ec.common.checkselectedmore')}");
			return false;
		}
		return true;
	};

	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.dbClickViewprepareDetailsList =  function(event, oRow) {
		var viewUrl = '';
		if(viewUrl == ''){
//			CUI.Dialog.alert("${getText('ec.view.noViewView')}");
			return;
		} else {
			openFullScreen(viewUrl + "?entityCode=WOM_7.5.0.0_prepareMaterial&id=" + oRow.id);
		}
	}
	/**
	 * 显示增加对话框
	 * @method WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.showDialog
	 * @param {String} url
	 * @private
	 */
	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.showDialog = function(url,formId,title,width,height,viewCode,buttonCode) {
		var buttons = [];
		var otherParams = WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.otherParams || {};
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
							<#assign linkview = getViewByCode('WOM_7.5.0.0_prepareMaterial_prepareMaterialView')>
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
										list_operate_prepareMaterial_prepareDetailsList.${funcname};
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
			
			
			
					if(viewCode=='WOM_7.5.0.0_prepareMaterial_prepareMaterialView'||!viewCode){
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
					list_operate_prepareMaterial_prepareDetailsList.CUI('#'+formId).submit();
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
		if ( WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.Dlg ) {
			WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.Dlg._config.url = url;
			WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.Dlg._config.formId = formId;
			WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.Dlg.setTitle( title )
			WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.Dlg.setButtonbar( buttons );
		}else{
			WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.Dlg =	new CUI.Dialog({
				title: title,
				url :url,
				formId: formId,
				modal:true,
				
				iframe: 'list_operate_prepareMaterial_prepareDetailsList',
				
				width:width || 460,
				height: height || 330,
				type : otherParams.dialogType,
				leaveConfirm : true,
				buttons:buttons
			});
		}	
		WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.Dlg.show();
		
		var dialog_width,  dialog_height;
		if( otherParams.dialogType && foundation.common.DIALOG_TYPE[ otherParams.dialogType ] ){
			dialog_width = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].width;
			dialog_height = foundation.common.DIALOG_TYPE[ otherParams.dialogType ].height;
		}else{
			dialog_width = width || 460;
			dialog_height = height || 330;
		}
		WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.Dlg.resetSize( dialog_width, dialog_height )
		
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'WOM_prepareMaterial_prepareMaterialPart', element : $('#WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_fileupload_button a:eq(1)')});
		}
		WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.otherParams = {};
	};

	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.commonQuery = function(type) {
	  // 快速查询前回调
	  try {
	  	if (typeof WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.beforeCommonQuery === 'function') {
	   		var ret = WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.beforeCommonQuery( type );
	   		if (ret === false) return;
	  	}
	  } catch(e) {}
	  $(".nodeInfo").removeAttr("id");
	  $(".nodeInfo").removeAttr("value");
	  $(".nodeInfo").removeAttr("name");
	  $("#treeNodeSelected").removeAttr("value");
	  if(typeof WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.cancelSelectedNode == 'function') {
	   WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.cancelSelectedNode();
	   WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.node = null;
	  }
	  if(typeof WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_cancelSelectedNode == 'function') {
	   WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_cancelSelectedNode();
	   WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.node = null;
	  }
	  WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query(type);
	 };
	
	/**
	 * 查询
	 * @method WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query
	 */
	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query = function(type,pageNo,sortFlag){
		var node = WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		//WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.node = null;
		if(!checkListValid("ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm")) {
				return false;
		}
		if(sortFlag && datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query._sortKey && datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query._sortMethod){
			CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm #dataTableSortColKey').val(datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query._sortKey);
			CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm #dataTableSortColName').val(datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query._sortColumnName);
			CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm #dataTableSortColOrder').val(datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query._sortMethod);
		}else{
			datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query._sortKey = '';
			CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm #dataTableSortColKey').val('');
			CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm #dataTableSortColName').val('');
			CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm #dataTableSortColOrder').val('');
		}
		var dataPost = "";
		var url = "";
			datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query.setAttributeConfig('queryFunc', {
                writeOnce: true,
                value: "WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query('"+type+"')"
            }); 
	    if(type && (type == 'pending' || type == 'goList')) {
			url = "/WOM/prepareMaterial/prepareMaterialPart/prepareDetailsList-pending.action";
	    	$("#currentSqlType").val(5);
	    } else {
	    	url = "/WOM/prepareMaterial/prepareMaterialPart/prepareDetailsList-query.action";
	   		$("#currentSqlType").val(6);
	    }  
		CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="WOM_7.5.0.0_prepareMaterial_prepareDetailsList";
		condobj.modelAlias="prepareMaterialPart";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info[fieldName].dbColumnType;
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
							if(ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm *[name="'+ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									var level=layRec.split("-").length-1;
									tableName=layRec.split("-")[level-1].split(",")[0];
								}else{
									tableName=ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info["MainTableName"];
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
						var layrec=ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query_PageLink_PageCount"]').val();
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
			permissionCode = 'WOM_7.5.0.0_prepareMaterial_prepareDetailsList';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		try{
		  	datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query.setRequestDataUrl(url,dataPost,sortFlag);
		}catch(e){
			try{
				setTimeout( function(){
				  	datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query.setRequestDataUrl(url,dataPost,sortFlag);
				}, 1000 )
			}catch(e){
			
			}
		}
			
		return false;
		
	};
	
	
	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.downAttachment = function(row) {
		var url = "/foundation/workbench/download.action?id="+row.document.id + "&entityCode=WOM_7.5.0.0_prepareMaterial";
		openExportFrame(url);
	}
WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType,viewCode){
	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.otherParams = {};
	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.otherParams.dialogType = dialogType;
	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.showDialog(url,formId,title,width,height,viewCode);
	}else {
		openFullScreen(url);
	}
};
/**
 * 编辑页面完毕回调
 * @method WOM.prepareMaterial.prepareMaterialPart.editCallBackInfo
 */
WOM.prepareMaterial.prepareMaterialPart.editCallBackInfo = function(res){
	//add by yubo20180119
	parent.closeLoginDialog();
	var queryFunc = datatable_ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query.get('queryFunc');
	var _Current_PageNo = CUI('#PageLink_PageSelect','#' + ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryWidget.dataTableId).val();
    if(null != queryFunc && "undefined" != queryFunc){			
		if(typeof WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_getLayout == "function"){
    		var layout = WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryWidget._sortKey && ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
			if(modelCode == 'WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
    	}else{
    		if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
    			eval(queryFunc.substr(0,queryFunc.lastIndexOf(')')) + "," + _Current_PageNo + "," +  (ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryWidget._sortKey && ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryWidget._sortMethod ? true : false) + ")");
	    	} else {
				eval(queryFunc);
	    	}
    	}			
	} else {
		var needSort = ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryWidget._sortKey && ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_queryWidget._sortMethod ? true : false;
		if(typeof WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_getLayout == "function"){
			var layout = WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_getLayout();
			var node = layout.getNode();
			var modelCode = node.modelCode;
	    	WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.node = node	
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query('pending');
	    	}
			if(modelCode == 'WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart'){
				var treeId = layout.refreshNodeId(node, res.operate);
				layout.refreshTree(treeId);
			}
		}else{
			if(null != _Current_PageNo && undefined != _Current_PageNo && "" != _Current_PageNo) {
	    		WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query('pending',_Current_PageNo,needSort);
	    	} else {
	    		WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query('pending');
	    	}
		}
		
	}
	if(typeof timeData == 'function') {
		timeData();
	}
}


function checkListValid(formId, errorbarWidget){errorbarWidget=errorbarWidget||workbenchErrorBarWidget;if($('#' + formId + ' input[name^="formulaId.applyDate_start"]').val()!= null && $('#' + formId + ' input[name^="formulaId.applyDate_start"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="formulaId.applyDate_start"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1492392059136')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name^="formulaId.applyDate_end"]').val()!= null && $('#' + formId + ' input[name^="formulaId.applyDate_end"]').val()!= ''){if(!isDateTime($('#' + formId + ' input[name^="formulaId.applyDate_end"]').val()+"")){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1492392059136')}${getText('ec.list.validate.datetime')}");return false;}}if($('#' + formId + ' input[name="formulaId.applyDate_start"]').val()!='' && $('#' + formId + ' input[name="formulaId.applyDate_end"]').val()!=''){if($('#' + formId + ' input[name="formulaId.applyDate_start"]').val() > $('#' + formId + ' input[name="formulaId.applyDate_end"]').val()){errorbarWidget.showMessage("${getText('WOM.propertydisplayName.randon1492392059136')}${getText('ec.list.validate.end')}${getText('ec.list.validate.compare')}${getText('WOM.propertydisplayName.randon1492392059136')}${getText('ec.list.validate.start')}");return false;}}return true;};



(function($){
	$(function(){
	});
})(jQuery);	/* CUSTOM CODE START(view-LIST-WOM_7.5.0.0_prepareMaterial_prepareDetailsList,js,WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart,WOM_7.5.0.0) */
// 自定义代码
    WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.dbClickViewprepareDetailsList = function(event, oRow) {
	}
/* CUSTOM CODE END */
</script>
<@newAdvQueryJs viewCode='WOM_7.5.0.0_prepareMaterial_prepareDetailsList' idprefix='ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList' queryUrl='/WOM/prepareMaterial/prepareMaterialPart/prepareDetailsList-query.action' queryFunc="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList.query" ns="WOM.prepareMaterial.prepareMaterialPart.prepareDetailsList" />
<@exportexcel action="/WOM/prepareMaterial/prepareMaterialPart/prepareDetailsList-query.action"   getRequireDataAction="/WOM/prepareMaterial/prepareMaterialPart/prepareDetailsList-getRequireData.action"    settingtext="设置" settingUrl="/foundation/workbench/getExportFilds.action?modelCode=WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart&&viewCode=WOM_7.5.0.0_prepareMaterial_prepareDetailsList" prepareParams="" formId="" look="text" width=250 height=170 text=""  permissionCode="${permissionCode?default('WOM_7.5.0.0_prepareMaterial_prepareDetailsList')}" prefix="ec_WOM_prepareMaterial_prepareMaterialPart_prepareDetailsList_query" modelCode="WOM_7.5.0.0_prepareMaterial_PrepareMaterialPart"  importFlag="false" viewCode="WOM_7.5.0.0_prepareMaterial_prepareDetailsList" />
