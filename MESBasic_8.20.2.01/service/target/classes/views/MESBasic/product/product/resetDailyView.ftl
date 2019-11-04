<!-- MESBasic_1/product/resetDailyView -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.randon1476060824900')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_product_resetDailyView,head,MESBasic_1_product_Product,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->

</head>

<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>


<style type="text/css">
.ewc-dialog-el{height:100%;} 
.ewc-dialog-el .edit-table{width:98%;margin:0 auto;}
.edit-content-dialog-fullwidth .edit-tabs {width: 100%;margin-left: 0;}
</style>
<script type="text/javascript">
	CUI.ns('MESBasic.product.product.resetDailyView');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "MESBasic_product_product">
	<#assign fileuploadLinkId = id!>
<#assign viewType = "create">
<#assign newObj = editNew!true >
<#if newObj>
<#assign viewType = "create">
<#else>
<#assign viewType = "edit">
</#if>
<#if refId?? && (refId>0)>
	<#assign newObj = false >
</#if>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<#assign viewType = "readonly">
<#assign callbackName ="MESBasic.product.product.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="MESBasic_product_product_resetDailyView_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="MESBasic_product_product_resetDailyView_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="MESBasic.product.product.resetDailyView.beforeSubmitMethod()" ecAction="/MESBasic/product/product/resetDailyView/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="resetDailyView">
	<input type="hidden" name="viewCode" value="MESBasic_1_product_resetDailyView">
	<input type="hidden" name="datagridKey" value="MESBasic_product_product_resetDailyView_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="product.version" value="${(product.version)!0}" />
	<input type="hidden" name="product.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
	<div id="MESBasic_resetDailyView_edit_div" style="height:100%">
		<div id="MESBasic_product_product_resetDailyView_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "MESBasic_product_product_resetDailyView_form"+"_attcount";
function fileCountSpan(fileuploadLinkId,fileuploadType){
	if(!fileuploadLinkId) {
		fileuploadLinkId = '${fileuploadLinkId!}'
	}
	if(!fileuploadType) {
		fileuploadType = '${fileuploadType!}'
	}
	CUI.ajax({
		type : "POST",
		url : '/foundation/workbench/upload-count.action?linkId=' + fileuploadLinkId + '&type=' + fileuploadType,
		success : function(msg){
			try{
				if(msg!=null) {
					var fileCount = parseInt(msg);
					$('.total').show();
					//去掉两边的括号字符
					CUI('#'+attcountid).html(fileCount);
				}
			} catch(e){}
		}
	});
};
$(function(){
	var fileuploadLinkId= '${fileuploadLinkId!}';
	if(fileuploadLinkId != '') {
		fileCountSpan(fileuploadLinkId, '${fileuploadType}');
	}
	<#if hasAttachment?? && hasAttachment && false>
	$('#attachmentLi').one('click', function(){
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_product', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<div class="edit-panes-s" >
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				
					<#if  refId?? && (refId > 0)>
						<#assign nodeExpanded = true>
					<#else>
						<#assign nodeExpanded = false>
					</#if>
					
				<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign exportExcel=false>
				<#else>
				<#assign exportExcel=false>
				</#if>
			<#if false>
				<#assign routeFlag = "2">
			<#else>
				<#if false && isIE>
						<#assign routeFlag = "1">
				<#else>
						<#assign routeFlag = "0">
				</#if>
			</#if>

			<#assign cpObjHideKey = '' >
			<#assign cpvmInfo = ''>
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/MESBasic/product/product/data-dg1476060528897.action?product.id=${refId!-1}&refId=${refId!-1}&datagridCode=MESBasic_1_product_resetDailyViewdg1476060528897">
			<#else>
				<#assign dUrl="/MESBasic/product/product/data-dg1476060528897.action?product.id=${(product.id)!-1}&datagridCode=MESBasic_1_product_resetDailyViewdg1476060528897">
			</#if>
			<#assign firstLoad = true>
				
			<#if viewType?? && viewType != "readonly" && newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProdResetDaily_dg1476060528897_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_ProdResetDaily_dg1476060528897_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_ProdResetDaily_dg1476060528897" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1476060528897_id" value="ProdResetDaily_dg1476060528897" />
			
			<input type="hidden" id="dg1476060528897_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('MESBasic.modelname.randon1471690809334')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/MESBasic/product/product/data-dg1476060528897.action?operateType=export&datagridCode=MESBasic_1_product_resetDailyViewdg1476060528897"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="ProdResetDaily_dg1476060528897" />
			<@datagrid colAdminFlag=colAdmFlag withoutConfigTable=true id="ProdResetDaily_dg1476060528897" viewType="${viewType}" renderOverEvent="dg1476060528897RenderOverEvent" route="${routeFlag}" formId="MESBasic_product_product_resetDailyView_form" noPermissionKeys="resetCyc,notifyDays" modelCode="MESBasic_1_product_ProdResetDaily" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1476060528897" dtPage="dgPage"  hidekeyPrefix="dg1476060528897" hidekey="['id','version'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=false  buttons="${buttons}" noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1476060528897PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=false cannotDeleteRow=true assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=true firstLoad=firstLoad  copyRow=false  copyColumn=false  ptRealTimeLoad=0 >		
							<#assign resetCyc_displayDefaultType=''>
								<#assign resetCyc_defaultValue=''>
										<#assign resetCyc_defaultValue=''>
										 
									<@datacolumn key="resetCyc"        showFormat="TEXT" defaultValue="${(resetCyc_defaultValue!)?string}" defaultDisplay="${(resetCyc_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1471690864996')}" width=100 showFormatFunc=""  />
							<#assign notifyDays_displayDefaultType=''>
								<#assign notifyDays_defaultValue=''>
										<#assign notifyDays_defaultValue=''>
										 
									<@datacolumn key="notifyDays"        showFormat="TEXT" defaultValue="${(notifyDays_defaultValue!)?string}" defaultDisplay="${(notifyDays_displayDefaultType!)?string}" decimal="" editable=false type="INTEGER" showType="integer" notnull=false     textalign="right"  viewUrl="" viewCode=""  crossCompany=false viewTitle="${getText('')}"  label="${getText('MESBasic.propertydisplayName.randon1471690928381')}" width=100 showFormatFunc=""  />
			
			</@datagrid>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
				<script type="text/javascript">
					;
					//datagrid自定义参数方法
				</script>
			
			<script type="text/javascript">
				function ProdResetDaily_dg1476060528897_check_datagridvalid(){
					//
					var errorObj =ProdResetDaily_dg1476060528897Widget._DT.testData();
					var errorContent='';
					if(errorObj!=null){
					  for(var i=0;i<errorObj.length;i++){
						var obj1=errorObj[i];
						if(obj1.errorType=='date'){
						  errorContent+=obj1.label+'必须为日期类型！';
						  break;
						}else if(obj1.errorType=='integer'){
						  errorContent+=obj1.label+'必须为数字类型！';
						  break;
						}else if(obj1.errorType=='decimal'){
						  errorContent+=obj1.label+'必须为整数类型！';
						  break;
						}else if(obj1.errorType=='notnull'){
						   errorContent+=obj1.label+'不能为空';
						   break;
						}else if(obj1.errorType=='toolong'){
						   errorContent+=obj1.label+'字段长度不能超过'+obj1.length+'字节(注：英文字母占1个字节，中文字占3个字节)！';
						   break;
						}
					  }
					  if(errorContent!=""){
						hasErr = true;
					  }
					  if(hasErr){
						EditDialogErrorBarWidget.show(errorContent);
						return false;
					  }
					}
					return true;
				}
				
				function savedg1476060528897DataGrid(){
					<#if  refId?? && (refId gt 0)>
					ProdResetDaily_dg1476060528897Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('ProdResetDaily_dg1476060528897Widget') > -1) {
						ProdResetDaily_dg1476060528897Widget.setAllRowEdited();
					}
					var json = ProdResetDaily_dg1476060528897Widget.parseEditedData();
					$('input[name="dg1476060528897ListJson"]').remove();
					$('input[name="dgLists[\'dg1476060528897\']"]').remove();
					$('input[name="dg1476060528897ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1476060528897\']">').val(json).appendTo($('#MESBasic_product_product_resetDailyView_form'));
					$('<input type="hidden" name="dg1476060528897ModelCode">').val('MESBasic_1_product_ProdResetDaily').appendTo($('#MESBasic_product_product_resetDailyView_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1476060528897ListJson">').val(json).appendTo($('#MESBasic_product_product_resetDailyView_form'));
				}
				function DT_ProdResetDaily_dg1476060528897_deldatagrid(){
					var deleteRows = ProdResetDaily_dg1476060528897Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','productID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1476060528897DeletedIds").length>0){
							$("#dg1476060528897DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1476060528897DeletedIds" name="dgDeletedIds[\'dg1476060528897\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_resetDailyView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1476060528897DeletedIds['+CUI('input[name^="dg1476060528897DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_resetDailyView_form'));
					});
					return deleteRows;
				}
				function DT_ProdResetDaily_dg1476060528897_delTreeNodes(){
					var deleteRows = ProdResetDaily_dg1476060528897Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','productID.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1476060528897DeletedIds").length>0){
							$("#dg1476060528897DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1476060528897DeletedIds" name="dgDeletedIds[\'dg1476060528897\']" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_resetDailyView_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1476060528897DeletedIds['+CUI('input[name^="dg1476060528897DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#MESBasic_product_product_resetDailyView_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('MESBasic_product_product_resetDailyView_datagrids');
					if(!datagrids) {
						datagrids = [];
					}
					for(var i=0;i<1;i++) {
						if(!datagrids[i]) {
							datagrids[i] = [];
						}
					}
					if(datagrids[0].length>0) {
						for(var i=0;i<datagrids[0].length;i++) {
							if(datagrids[0][i] == 'ProdResetDaily_dg1476060528897') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'ProdResetDaily_dg1476060528897';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'ProdResetDaily_dg1476060528897';
					}
					$('body').data('MESBasic_product_product_resetDailyView_datagrids', datagrids);
				});
				
				var ProdResetDaily_dg1476060528897_importDialog = null;
				function ProdResetDaily_dg1476060528897_showImportDialog(){
					try{
						if(ProdResetDaily_dg1476060528897_importDialog!=null&&ProdResetDaily_dg1476060528897_importDialog.isShow==1){
							return false;
						}
						var url = "/MESBasic/product/product/initImport.action?datagridCode=MESBasic_1_product_resetDailyViewdg1476060528897&tid=${id!}&datagridName=dg1476060528897";
							<#if canImportExcel>
								var buttonCode="MESBasic_1_product_resetDailyViewdg1476060528897_BUTTON_dgImport";
								url+="&buttonCode="+buttonCode;
							</#if>
						ProdResetDaily_dg1476060528897_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("ProdResetDaily_dg1476060528897"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();ProdResetDaily_dg1476060528897_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();ProdResetDaily_dg1476060528897_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						ProdResetDaily_dg1476060528897_importDialog.show();
					}catch(e){}
				}	
				
				function ProdResetDaily_dg1476060528897_downLoadFile(){
					var url = "/MESBasic/product/product/downLoad.action?datagridCode=MESBasic_1_product_resetDailyViewdg1476060528897&templateRelatedModelCode=MESBasic_1_product_resetDailyViewdg1476060528897&downloadType=template&fileName=dg1476060528897";
					window.open(url,"","");
				}
				function dg1476060528897RenderOverEvent(){
				}
				function dg1476060528897PageInitMethod(nTabIndex){
					MESBasic.product.product.resetDailyView.initSize(nTabIndex);
				}
			</script>
			
			
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_product_resetDailyView,html,MESBasic_1_product_Product,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	MESBasic.product.product.resetDailyView.beforeSaveProcess = function(){}
	MESBasic.product.product.resetDailyView.beforeSubmitMethod = function() {
		try{eval("savedg1476060528897DataGrid()");}catch(e){}
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(MESBasic.product.product.resetDailyView.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#MESBasic_product_product_resetDailyView_form').trigger('beforeSubmit');
		//product.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="product.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#MESBasic_product_product_resetDailyView_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#MESBasic_product_product_resetDailyView_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	MESBasic.product.product.resetDailyView.validate = function(){
		return true;
	}
	
	
	//打印
	MESBasic.product.product.resetDailyView.print = function(url){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
						}
					}
				});
				var values = {};
				if(value!=undefined && value!=null && value != ""){
					values = value.split(/\|/g);
				}
				var data="";
				if(values != null && values.length > 0){
					for(var i=0;i < values.length;i++){
						var item = values[i];
						if(data!=""){
							data = data + "&" + item;
						}else{
							data = item;
						}
					}
				}else{
					data = "mainContent=true&attachmentInfo=true&dealInfo=true";
				}
				
				//var url = document.location.href;
				if(url!=undefined && url != null && url !=''){
					var index = url.indexOf(".action");
					var index0 = url.indexOf(".action?");
					if(index0 != -1){
						data = "&" + data;
					}else{
						data = "?" + data;
					}
					if(index != -1){
						var newUrl = url.substring(0,index) + "Print" + url.substring(index) + data;
						window.open(newUrl);
					}
				}
			}
		}
		
		MESBasic.product.product.resetDailyView.saveSetting = function(){
			var url = "/ec/print/saveSetting.action";
			var value = "mainContent="+$('#mainContent').prop('checked')+ "|attachmentInfo="+$('#attachmentInfo').prop('checked') +  "|dealInfo="+$('#dealInfo').prop('checked');
			var flag = false;
			$.ajax({
				url : url,
				type : 'post',
				async : false,
				data:{"printCookie.value": value, "printCookie.type":$('input[name="viewCode"]').val(),"printCookie.id":$('#printCookie_id').val(),"printCookie.version":$('#printCookie_version').val()},
				success : function(json) {flag = true;}
			});
			return flag;
		}
		
		var isPrintSettingDialogShow = false;//判断打印设置窗口是否打开，防止重复打开
		MESBasic.product.product.resetDailyView.printSetting = function(){
			if(typeof isPrintSettingDialogShow != 'undefined' && isPrintSettingDialogShow === true){
				return;
			}
			var url = "/ec/print/getSetting.action?printCookie.type=" + $('input[name="viewCode"]').val();
			<#if isWorkflow?? && isWorkflow>
			url = url + "&isWorkflow=true";
			<#else>
			url = url + "&isWorkflow=false";
			</#if>
			<#if isAttachment?? && isAttachment>
			url = url + "&isAttachment=true";
			<#else>
			url = url + "&isAttachment=false";
			</#if>
			MESBasic.product.product.resetDailyView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.product.product.resetDailyView.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				MESBasic.product.product.resetDailyView.settingDialog.show();
				isPrintSettingDialogShow = true;
		}
	
	//控件版PT选人查看按钮单击事件处理函数
	function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany){
		//保存当前单击事件的对象信息
		var obj = {
			"oGrid" : oGrid,
			"nRow" : nRow - 1,
			"sKey":	sFieldName
		}
		if(customCallBack){
			MESBasic.product.product.resetDailyView._customCallBack = customCallBack;
		}
		MESBasic.product.product.resetDailyView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#MESBasic_product_product_resetDailyView_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_product_product_resetDailyView_fileupload"></div>');
			}
			MESBasic.product.product.resetDailyView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_product_product_resetDailyView_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_product_product_resetDailyView_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.product.product.resetDailyView.infoDialog.show();
			if($('#MESBasic_product_product_resetDailyView_fileupload').html() == '') {
				$('#MESBasic_product_product_resetDailyView_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_product_product&entityCode=MESBasic_1_product&dialogId="+dialogId);
			}
		}
	//参照复制函数
	MESBasic.product.product.resetDailyView.referenceCopy = function(objName,url, dialog){
		var callbackName ="MESBasic.product.product.resetDailyView.referenceCopyBackInfo";
		MESBasic.product.product.resetDailyView.dialog = dialog;
		MESBasic.product.product.resetDailyView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
			iframe:'reference_copy_edit',
			</#if>
			
			url : url,
			title : "${getText('ec.view.property.refview')}",
			params : null
		});
	}
	
	MESBasic.product.product.resetDailyView.referenceCopyBackInfo = function(obj){
		if(MESBasic.product.product.resetDailyView._dialog){
			MESBasic.product.product.resetDailyView._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,MESBasic.product.product.resetDailyView.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('MESBasic_product_product_resetDailyView_form','MESBasic_product_product_resetDailyView_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(MESBasic.product.product.resetDailyView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(MESBasic.product.product.resetDailyView.dialog._el).load('/MESBasic/product/product/resetDailyView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
						closeLoadPanel();
						try{
							StrutsUtilsOnLoad();
						}catch(e){}
						try{
							if(me._config.onload != undefined) eval(me._config.onload + "(me)");
						}catch(e){}
				});
			});
		}else{
		</#if>
			
			<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
			parent.$( MESBasic.product.product.resetDailyView.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + MESBasic.product.product.resetDailyView.dialog._config.iframe, MESBasic.product.product.resetDailyView.dialog._dialog ).prop( 'src', '/MESBasic/product/product/resetDailyView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(MESBasic.product.product.resetDailyView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(MESBasic.product.product.resetDailyView.dialog._el).load('/MESBasic/product/product/resetDailyView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
					closeLoadPanel();
					try{
						StrutsUtilsOnLoad();
					}catch(e){}
					try{
						if(me._config.onload != undefined) eval(me._config.onload + "(me)");
					}catch(e){}
			});
			</#if>
				
			
		<#if viewType != "readonly">
		}
		</#if>
	};
	
	MESBasic.product.product.resetDailyView.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		MESBasic.product.product.resetDailyView.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		MESBasic.product.product.resetDailyView._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			MESBasic.product.product.resetDailyView._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	MESBasic.product.product.resetDailyView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'MESBasic_product_product_resetDailyView' + '_' + extraFrameParam;
		var callbackName="";
		MESBasic.product.product.resetDailyView._prefix = '';
		MESBasic.product.product.resetDailyView._oGrid = oGrid;
		MESBasic.product.product.resetDailyView._sUrl = url;
		if(customCallBack){
			MESBasic.product.product.resetDailyView._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			MESBasic.product.product.resetDailyView.gridEventObj = gridEventObj;
			callbackName = "MESBasic.product.product.resetDailyView.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				MESBasic.product.product.resetDailyView._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "MESBasic.product.product.resetDailyView.getMultiselectCallBackInfo_DG" : "MESBasic.product.product.resetDailyView.getcallBackInfo_DG";
			MESBasic.product.product.resetDailyView._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				MESBasic.product.product.resetDailyView._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="MESBasic.product.product.resetDailyView.getcallBackInfo";
		}
		if(MESBasic.product.product.resetDailyView._prefix!=''){
			MESBasic.product.product.resetDailyView._prefix = MESBasic.product.product.resetDailyView._prefix.substring(1);
		}
		if(MESBasic.product.product.resetDailyView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.product.product.resetDailyView._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof MESBasic.product.product.resetDailyView._querycustomFuncN == "function") {
				refparam += MESBasic.product.product.resetDailyView._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		MESBasic.product.product.resetDailyView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.product.product.resetDailyView._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.product.product.resetDailyView.query_"+obj+")!='undefined'") ? eval('MESBasic.product.product.resetDailyView.query_'+obj+'()') : null;
		return str;
	
	};
	
	MESBasic.product.product.resetDailyView.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('MESBasic_product_product_resetDailyView_form',obj[0], MESBasic.product.product.resetDailyView._prefix, MESBasic.product.product.resetDailyView._sUrl);
		CUI.commonFills('MESBasic_product_product_resetDailyView_form',MESBasic.product.product.resetDailyView._prefix,obj[0]);

		try{
			if(MESBasic.product.product.resetDailyView._customCallBack) {
				eval(MESBasic.product.product.resetDailyView._customCallBack);
				MESBasic.product.product.resetDailyView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.product.product.resetDailyView._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	MESBasic.product.product.resetDailyView.getcallBackInfo_DG_IE = function(obj){
		if(MESBasic.product.product.resetDailyView._customBeforeCallBack) {
			var flag = eval(MESBasic.product.product.resetDailyView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = MESBasic.product.product.resetDailyView.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.product.product.resetDailyView._sUrl);
		var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
		for( var i = 0; i < xmlHead.children().length; i++ ){
			var tagName = xmlHead.children()[i].tagName;
			if( tagName.indexOf(rootKey) == 0 ){
				try{
					var value = eval('jsonObj.' + tagName.substring(rootKey.length+1));
				}catch(e){
					var value = eval('jsonObj["' + tagName.substring(rootKey.length+1)+'"]');
				}
				//判断符合条件的key是否存在
				if(value != undefined){
					gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
				}	
			}
		}
		try{
			if(MESBasic.product.product.resetDailyView._customCallBack) {
				eval(MESBasic.product.product.resetDailyView._customCallBack);
				MESBasic.product.product.resetDailyView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.product.product.resetDailyView._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	MESBasic.product.product.resetDailyView.getcallBackInfo_DG = function(obj){
		if(MESBasic.product.product.resetDailyView._customBeforeCallBack) {
			var flag = eval(MESBasic.product.product.resetDailyView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(MESBasic.product.product.resetDailyView._currRow).next().length==0){
					MESBasic.product.product.resetDailyView._oGrid.addNewRow();
				}	
				MESBasic.product.product.resetDailyView._currRow = $(MESBasic.product.product.resetDailyView._currRow).next();
				$(MESBasic.product.product.resetDailyView._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(MESBasic.product.product.resetDailyView._currRow,obj[i],MESBasic.product.product.resetDailyView._prefix,MESBasic.product.product.resetDailyView._sUrl);
			eval("CUI.commonFills_DG(MESBasic.product.product.resetDailyView._currRow,MESBasic.product.product.resetDailyView._prefix,obj[i],MESBasic.product.product.resetDailyView._oGrid)");
		}
		try{
			if(MESBasic.product.product.resetDailyView._customCallBack) {
				eval(MESBasic.product.product.resetDailyView._customCallBack);
				MESBasic.product.product.resetDailyView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.product.product.resetDailyView._dialog.close();
		} catch(e){}
	};
	
	MESBasic.product.product.resetDailyView.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(MESBasic.product.product.resetDailyView._oGrid, MESBasic.product.product.resetDailyView._currRow, MESBasic.product.product.resetDailyView._key, MESBasic.product.product.resetDailyView._displayFieldName, obj[i])
		}
		try{
			if(MESBasic.product.product.resetDailyView._customCallBack) {
				eval(MESBasic.product.product.resetDailyView._customCallBack);
				MESBasic.product.product.resetDailyView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.product.product.resetDailyView._dialog.close();
		} catch(e){}
	};
	
	MESBasic.product.product.resetDailyView.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			MESBasic.product.product.resetDailyView.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_product_product_resetDailyView_form'));
        			}
        	   	}
        	}
      	});
	};
	MESBasic.product.product.resetDailyView.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	MESBasic.product.product.resetDailyView.initCount = 0;
	MESBasic.product.product.resetDailyView.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#MESBasic_resetDailyView_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('MESBasic_product_product_resetDailyView_datagrids');	
		var	conHeight = h-$("#MESBasic_product_product_resetDailyView_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#MESBasic_product_product_resetDailyView_main_div .edit-panes-s").each(function(index){
			//多页签切换时只计算本页签下的PT高度
			if(nTabIndex != undefined && typeof(nTabIndex) == 'number' && index != nTabIndex){
				return;
			}
			thisHeight = $(this).height();
			var datatableHeight = conHeight - panesHeight;
			if(datagrids&&datagrids.length>index&&datagrids[index].length>0) {
				if(thisHeight > panesHeight) {
					$(this).parent().height(panesHeight);
					$(this).parent().css("overflow-y","auto");
				} else {
					if(thisHeight && thisHeight > 0) {
						$(this).parent().height(thisHeight);
					}
					datatableHeight = conHeight - thisHeight;
				}
			} else {
				if(thisHeight > conHeight) {
					$(this).parent().height(conHeight);
					$(this).parent().css("overflow-y","auto");
				} else if(thisHeight && thisHeight > 0) {
					$(this).parent().height(thisHeight);
				}
			}
			if(datagrids && datagrids.length > 0) {
				if(datagrids[index].length > 0) {
					datatableHeight = datatableHeight - 15;
					var perHeight = datatableHeight/datagrids[index].length;
					for(var dg=0;dg<datagrids[index].length;dg++) {
						
						var dgwidget = eval(datagrids[index][dg]+'Widget');
						
						if(dgwidget) {
							
							dgwidget.setHeight(perHeight - 68 + 20);
							
						} else {
							if(MESBasic.product.product.resetDailyView.initCount <= 2) {
								setTimeout(function(){MESBasic.product.product.resetDailyView.initSize();}, 200);
								MESBasic.product.product.resetDailyView.initCount++;
							}/* else {
								MESBasic.product.product.resetDailyView.initCount = 0;
							}*/
						}
					}
				}
			} else {
				//$(this).parent().height(conHeight-30);
				$(this).parent().height(conHeight-7); //为什么减去7呢，因为要跟底部框保持一定的距离 by xudihui
				$(this).parent().css("overflow-y","auto");
			}
		});
	}

	$(function(){
		MESBasic.product.product.resetDailyView.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    MESBasic.product.product.resetDailyView.initSize(index);
		});
		$(window).bind("dialog.resize",function(){MESBasic.product.product.resetDailyView.initSize();});
	});
</script>
<script type="text/javascript">
	



	/* CUSTOM CODE START(view-VIEW-MESBasic_1_product_resetDailyView,js,MESBasic_1_product_Product,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>