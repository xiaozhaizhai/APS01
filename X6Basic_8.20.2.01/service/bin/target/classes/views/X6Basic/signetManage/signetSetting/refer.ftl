<script type="text/javascript">
	CUI.ns("X6Basic.signetManage.signetSetting.refer");
</script>
<input type="hidden" name="X6Basic_signetManage_signetSetting_refer_callBackFuncName" id="X6Basic_signetManage_signetSetting_refer_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="X6Basic_signetManage_signetSetting_referErrorbar" />
<@frameset id="ec_X6Basic_signetManage_signetSetting_refer_container" border=0>
	<@frame id="ec_X6Basic_signetManage_signetSetting_refer_container_main"  offsetH=4 region="center" class="center_in">
	<#include "refer-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<!-- CUSTOM HTML START -->
<!-- 定制的HTML代码区域 -->

<!-- CUSTOM HTML END -->
<script type="text/javascript">
	/**
	 * 查询
	 * @method X6Basic.signetManage.signetSetting.refer.query
	 */
	X6Basic.signetManage.signetSetting.refer.query = function(type,pageNo){
		if(!checkListValid("ec_X6Basic_signetManage_signetSetting_refer_queryForm")) {
				return false;
		}
		var node = X6Basic.signetManage.signetSetting.refer.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		var dataPost="";
		var url = "/X6Basic/signetManage/signetSetting/refer-query.action";
		CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_signetManage_signetSetting_refer_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific'){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent(CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+fastCol+'"]').prop('checked'));
					}
				} else {
					var fastColValue = CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+fastCol+'"]').val();
					if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
						if(fastCol.endsWith('_start')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType && dateType == 'date') {
								fastColValue += " 00:00:00";
							}
						}
						if(fastCol.endsWith('_end')) {
							var dateType = CUI(this).attr('dateType');
							if(dateType && dateType == 'date') {
								fastColValue += " 23:59:59";
							}
						}
						var multable = CUI(this).attr('multable');
						if(multable && multable == "yes") {
							dataPost += "&" + fastCol + "=," + encodeURIComponent(fastColValue) + ",";
						} else {
							dataPost += "&" + fastCol + "=" + encodeURIComponent(fastColValue);
						}
					}
				}	
			}
		});
		var pageSize=CUI('input[name="ec_X6Basic_signetManage_signetSetting_refer_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#X6Basic_signetManage_signetSetting_refer_condition').val();
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'X6Basic_1.0_signetManage_refer';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
	 	datatable_ec_X6Basic_signetManage_signetSetting_refer_query.setRequestDataUrl(url,dataPost);
		return false;
		
	};
	
	X6Basic.signetManage.signetSetting.refer._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.signetManage.signetSetting.refer._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.signetManage.signetSetting.refer._prefix += '.';
			}
			X6Basic.signetManage.signetSetting.refer._prefix += arr[i];
		}
		X6Basic.signetManage.signetSetting.refer._suffix = arr[arr.length -1];
		if(X6Basic.signetManage.signetSetting.refer._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.signetManage.signetSetting.refer._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.signetManage.signetSetting.refer._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.signetManage.signetSetting.refer.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.signetManage.signetSetting.refer.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+X6Basic.signetManage.signetSetting.refer._prefix + '.' + X6Basic.signetManage.signetSetting.refer._suffix +'"]').val(obj[0][X6Basic.signetManage.signetSetting.refer._suffix]);
		CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+X6Basic.signetManage.signetSetting.refer._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name^="'+X6Basic.signetManage.signetSetting.refer._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+X6Basic.signetManage.signetSetting.refer._prefix + '.' + X6Basic.signetManage.signetSetting.refer._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_signetManage_signetSetting_refer_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(X6Basic.signetManage.signetSetting.refer._dialog) {
			X6Basic.signetManage.signetSetting.refer._dialog.close();
		}
	};
	
	X6Basic.signetManage.signetSetting.refer._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.signetManage.signetSetting.refer.query_"+obj+")!='undefined'") ? eval('X6Basic.signetManage.signetSetting.refer.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_X6Basic_signetManage_signetSetting_refer_query.selectedRows.length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		X6Basic.signetManage.signetSetting.refer.sendBackrefer(null,datatable_ec_X6Basic_signetManage_signetSetting_refer_query.selectedRows[0]);
	};
	/**
	 * 双击事件
	 * @method X6Basic.signetManage.signetSetting.refer.sendBackrefer
	 */
	X6Basic.signetManage.signetSetting.refer.sendBackrefer = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_X6Basic_signetManage_signetSetting_refer_query.selectedRows;
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('X6Basic.signetSetting.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#X6Basic_signetManage_signetSetting_refer_callBackFuncName").val() != ""){
				eval(CUI("#X6Basic_signetManage_signetSetting_refer_callBackFuncName").val() + "(arrObj)");
			}else{
				getDepartmentInfo(arrObj);
			}
			X6Basic_signetManage_signetSetting_referErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			X6Basic_signetManage_signetSetting_referErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
X6Basic_signetManage_signetSetting_refer_refresh = function(node){
	//var url = "/X6Basic/signetManage/signetSetting/refer-query.action";
	//if(node.layRec){
	//	datatable_ec_X6Basic_signetManage_signetSetting_refer_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_X6Basic_signetManage_signetSetting_refer_query.setRequestDataUrl(url,'',false);
	//}
	X6Basic.signetManage.signetSetting.refer.node = node;
	X6Basic.signetManage.signetSetting.refer.query("query");
}

X6Basic_signetManage_signetSetting_refer_getList = function() {
	return "X6Basic.signetManage.signetSetting.refer";
}
	
	/**
	 * 显示增加对话框
	 * @method X6Basic.signetManage.signetSetting.refer.showDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.signetManage.signetSetting.refer.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = X6Basic.signetManage.signetSetting.refer.otherParams || {};
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
		if(otherParams && otherParams.dialogType != 'OTHER') {
			width = null;
			height = null;
		}
		if(otherParams && otherParams.viewShowType != 'VIEW') {
			buttons.push({	
				name:"${getText('common.button.save')}",
				handler:function(){CUI('#'+formId).submit();}
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
		X6Basic.signetManage.signetSetting.refer.Dlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 460,
			height: height || 330,
			type : otherParams.dialogType,
			leaveConfirm : true,
			buttons:buttons
		});
		X6Basic.signetManage.signetSetting.refer.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'X6Basic_signetManage_signetSetting', element : $('#X6Basic_signetManage_signetSetting_refer_fileupload_button a:eq(1)')});
		}
		X6Basic.signetManage.signetSetting.refer.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method X6Basic.signetManage.signetSetting.refer.approvalDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.signetManage.signetSetting.refer.approvalDialog = function(url,formId,title,width,height) {
		X6Basic.signetManage.signetSetting.refer.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){X6Basic.signetManage.signetSetting.approval();}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		X6Basic.signetManage.signetSetting.refer.AppDlg.show();
	};
	
	X6Basic.signetManage.signetSetting.refer.commonQuery = function(type) {
	  if(typeof X6Basic.signetManage.signetSetting.refer.cancelSelectedNode == 'function') {
	   X6Basic.signetManage.signetSetting.refer.cancelSelectedNode();
	  }
	  X6Basic.signetManage.signetSetting.refer.query(type);
	 };
	
	
X6Basic.signetManage.signetSetting.refer.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	X6Basic.signetManage.signetSetting.refer.otherParams = {};
	X6Basic.signetManage.signetSetting.refer.otherParams.dialogType = dialogType;
	X6Basic.signetManage.signetSetting.refer.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.signetManage.signetSetting.refer.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};




	
		/* CUSTOM JS START */
		/* CUSTOM JS END */
</script>
<@exportexcel action="/X6Basic/signetManage/signetSetting/refer-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" permissionCode="${permissionCode?default('X6Basic_1.0_signetManage_refer')}" prefix="ec_X6Basic_signetManage_signetSetting_refer_query"/>
