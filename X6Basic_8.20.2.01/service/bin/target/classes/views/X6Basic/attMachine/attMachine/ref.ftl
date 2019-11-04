<script type="text/javascript">
	CUI.ns("X6Basic.attMachine.attMachine.ref");
</script>
<input type="hidden" name="X6Basic_attMachine_attMachine_ref_callBackFuncName" id="X6Basic_attMachine_attMachine_ref_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
<@errorbar id="X6Basic_attMachine_attMachine_refErrorbar" />
<@frameset id="ec_X6Basic_attMachine_attMachine_ref_container" border=0>
	<@frame id="ec_X6Basic_attMachine_attMachine_ref_container_main"  offsetH=4 region="center" class="center_in">
	<#include "ref-fastquery-datatable.ftl">
	</@frame>
</@frameset>
<!-- CUSTOM HTML START -->
<!-- 定制的HTML代码区域 -->

<!-- CUSTOM HTML END -->
<script type="text/javascript">
	/**
	 * 查询
	 * @method X6Basic.attMachine.attMachine.ref.query
	 */
	X6Basic.attMachine.attMachine.ref.query = function(type,pageNo){
		if(!checkListValid("ec_X6Basic_attMachine_attMachine_ref_queryForm")) {
				return false;
		}
		var node = X6Basic.attMachine.attMachine.ref.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = node.modelName+'.layRec=' + node.layRec;
		}
		var dataPost="";
		var url = "/X6Basic/attMachine/attMachine/ref-query.action";
		CUI('#ec_X6Basic_attMachine_attMachine_ref_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_X6Basic_attMachine_attMachine_ref_queryForm #advQueryCond').val('');
		}
		CUI('input,select', CUI('#ec_X6Basic_attMachine_attMachine_ref_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific'){
				var fastCol = CUI(this).attr('name');
				if(fastCol.indexOf(".") > -1 && !fastCol.endsWith(".id") && !fastCol.endsWith("_bapLower")) {
					var keyIdValue = CUI('#ec_X6Basic_attMachine_attMachine_ref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('.'))+'.id"]').val();
					if(keyIdValue != null && keyIdValue != "undefined" && keyIdValue != "") {
						return;
					}
				}
				if(CUI(this).attr('type') == 'checkbox' && fastCol.endsWith("_bapLower")) {
					var compareKeyValue = CUI('#ec_X6Basic_attMachine_attMachine_ref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'"]').val();
					if(CUI(this).attr('columnType') == 'DATE' || CUI(this).attr('columnType') == 'DATETIME' || CUI(this).attr('columnType') == 'MONEY' || CUI(this).attr('columnType') == 'INTEGER' || CUI(this).attr('columnType') == 'DECIMAL' || CUI(this).attr('columnType') == 'LONG') {
						compareKeyValue = CUI('#ec_X6Basic_attMachine_attMachine_ref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_start"]').val();
						if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
							compareKeyValue = CUI('#ec_X6Basic_attMachine_attMachine_ref_queryForm *[name="'+fastCol.substr(0,fastCol.lastIndexOf('_bapLower'))+'_end"]').val();
						}
					}
					if(compareKeyValue != null && compareKeyValue != "undefined" && compareKeyValue != "") {
						dataPost += "&" + fastCol + "=" + encodeURIComponent(CUI('#ec_X6Basic_attMachine_attMachine_ref_queryForm *[name="'+fastCol+'"]').prop('checked'));
					}
				} else {
					var fastColValue = CUI('#ec_X6Basic_attMachine_attMachine_ref_queryForm *[name="'+fastCol+'"]').val();
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
		var pageSize=CUI('input[name="ec_X6Basic_attMachine_attMachine_ref_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#X6Basic_attMachine_attMachine_ref_condition').val();
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'X6Basic_1.0_attMachine_ref';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
	 	datatable_ec_X6Basic_attMachine_attMachine_ref_query.setRequestDataUrl(url,dataPost);
		return false;
		
	};
	
	X6Basic.attMachine.attMachine.ref._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		X6Basic.attMachine.attMachine.ref._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				X6Basic.attMachine.attMachine.ref._prefix += '.';
			}
			X6Basic.attMachine.attMachine.ref._prefix += arr[i];
		}
		X6Basic.attMachine.attMachine.ref._suffix = arr[arr.length -1];
		if(X6Basic.attMachine.attMachine.ref._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(X6Basic.attMachine.attMachine.ref._querycustomFunc(objName.replace(/\./g, '_')));
		}
		X6Basic.attMachine.attMachine.ref._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'X6Basic.attMachine.attMachine.ref.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	X6Basic.attMachine.attMachine.ref.getcallBackInfo = function(obj){
		CUI('#ec_X6Basic_attMachine_attMachine_ref_queryForm *[name="'+X6Basic.attMachine.attMachine.ref._prefix + '.' + X6Basic.attMachine.attMachine.ref._suffix +'"]').val(obj[0][X6Basic.attMachine.attMachine.ref._suffix]);
		CUI('#ec_X6Basic_attMachine_attMachine_ref_queryForm *[name="'+X6Basic.attMachine.attMachine.ref._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_X6Basic_attMachine_attMachine_ref_queryForm *[name^="'+X6Basic.attMachine.attMachine.ref._prefix + '."]').unbind("change");
		CUI('#ec_X6Basic_attMachine_attMachine_ref_queryForm *[name="'+X6Basic.attMachine.attMachine.ref._prefix + '.' + X6Basic.attMachine.attMachine.ref._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_X6Basic_attMachine_attMachine_ref_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
		if(X6Basic.attMachine.attMachine.ref._dialog) {
			X6Basic.attMachine.attMachine.ref._dialog.close();
		}
	};
	
	X6Basic.attMachine.attMachine.ref._querycustomFunc = function(obj) {
		var str = eval("typeof(X6Basic.attMachine.attMachine.ref.query_"+obj+")!='undefined'") ? eval('X6Basic.attMachine.attMachine.ref.query_'+obj+'()') : null;
		return str;
	
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_X6Basic_attMachine_attMachine_ref_query.selectedRows.length == 0){
			CUI.Dialog.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		X6Basic.attMachine.attMachine.ref.sendBackref(null,datatable_ec_X6Basic_attMachine_attMachine_ref_query.selectedRows[0]);
	};
	/**
	 * 双击事件
	 * @method X6Basic.attMachine.attMachine.ref.sendBackref
	 */
	X6Basic.attMachine.attMachine.ref.sendBackref = function(event, oRow) {
		var arrObj = new Array();
		var oRows = new Array();
		if(event == undefined){
			oRows = datatable_ec_X6Basic_attMachine_attMachine_ref_query.selectedRows;
		}else{
			oRows.push(oRow);
		}
		if(oRows.length == 0){
			CUI.Dialog.alert("${getText('X6Basic.attMachine.checkselected')}");
			return false;
		}
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#X6Basic_attMachine_attMachine_ref_callBackFuncName").val() != ""){
				eval(CUI("#X6Basic_attMachine_attMachine_ref_callBackFuncName").val() + "(arrObj)");
			}else{
				getDepartmentInfo(arrObj);
			}
			X6Basic_attMachine_attMachine_refErrorbarWidget.showMessage("${getText('foundation.add.success')}","s");
		}catch(e){
			X6Basic_attMachine_attMachine_refErrorbarWidget.showMessage("${getText('foundation.add.failure')}");
		}
	};
	
X6Basic_attMachine_attMachine_ref_refresh = function(node){
	//var url = "/X6Basic/attMachine/attMachine/ref-query.action";
	//if(node.layRec){
	//	datatable_ec_X6Basic_attMachine_attMachine_ref_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_X6Basic_attMachine_attMachine_ref_query.setRequestDataUrl(url,'',false);
	//}
	X6Basic.attMachine.attMachine.ref.node = node;
	X6Basic.attMachine.attMachine.ref.query("query");
}

X6Basic_attMachine_attMachine_ref_getList = function() {
	return "X6Basic.attMachine.attMachine.ref";
}
	
	/**
	 * 显示增加对话框
	 * @method X6Basic.attMachine.attMachine.ref.showDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.attMachine.attMachine.ref.showDialog = function(url,formId,title,width,height) {
		var buttons = [];
		var otherParams = X6Basic.attMachine.attMachine.ref.otherParams || {};
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
		X6Basic.attMachine.attMachine.ref.Dlg =	new CUI.Dialog({
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
		X6Basic.attMachine.attMachine.ref.Dlg.show();
		if(otherParams && otherParams.operateRecordId && otherParams.operateRecordId != -1) {
			foundation.common.uploadFileCount({linkId : otherParams.operateRecordId, type : 'X6Basic_attMachine_attMachine', element : $('#X6Basic_attMachine_attMachine_ref_fileupload_button a:eq(1)')});
		}
		X6Basic.attMachine.attMachine.ref.otherParams = {};
	};
	/**
	 * 显示批量处理对话框
	 * @method X6Basic.attMachine.attMachine.ref.approvalDialog
	 * @param {String} url
	 * @private
	 */
	X6Basic.attMachine.attMachine.ref.approvalDialog = function(url,formId,title,width,height) {
		X6Basic.attMachine.attMachine.ref.AppDlg =	new CUI.Dialog({
			title: title,
			url :url,
			formId: formId,
			modal:true,
			width:width || 500,
			height: height || 260,
			buttons:[{	
						name:"${getText('common.button.submit')}",
						handler:function(){X6Basic.attMachine.attMachine.approval();}
					},
					{	name:"${getText('common.button.cancel')}",
						handler:function(){this.close()}
					}]
		});
		X6Basic.attMachine.attMachine.ref.AppDlg.show();
	};
	
	X6Basic.attMachine.attMachine.ref.commonQuery = function(type) {
	  if(typeof X6Basic.attMachine.attMachine.ref.cancelSelectedNode == 'function') {
	   X6Basic.attMachine.attMachine.ref.cancelSelectedNode();
	  }
	  X6Basic.attMachine.attMachine.ref.query(type);
	 };
	
	
X6Basic.attMachine.attMachine.ref.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	X6Basic.attMachine.attMachine.ref.otherParams = {};
	X6Basic.attMachine.attMachine.ref.otherParams.dialogType = dialogType;
	X6Basic.attMachine.attMachine.ref.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		X6Basic.attMachine.attMachine.ref.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};




	
		/* CUSTOM JS START */
		/* CUSTOM JS END */
</script>
<@exportexcel action="/X6Basic/attMachine/attMachine/ref-query.action" settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" permissionCode="${permissionCode?default('X6Basic_1.0_attMachine_ref')}" prefix="ec_X6Basic_attMachine_attMachine_ref_query"/>
