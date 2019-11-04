<!-- MESBasic_1/placeManage/placeView -->
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('MESBasic.viewtitle.radion1418607809406')}</title>
<@maincss/>
<@mainjs/>
<@extracss />

<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_placeManage_placeView,head,MESBasic_1_placeManage_PlaceManage,MESBasic_1) -->
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
	CUI.ns('MESBasic.placeManage.placeManage.placeView');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "MESBasic_placeManage_placeManage">
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
<#assign callbackName ="MESBasic.placeManage.placeManage.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="MESBasic_placeManage_placeManage_placeView_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="MESBasic_placeManage_placeManage_placeView_form" cssStyle="height:100%;" hiddenField="placeManage.placeManager.id,placeManage.factoryNode.id," onsubmitMethod="MESBasic.placeManage.placeManage.placeView.beforeSubmitMethod()" ecAction="/MESBasic/placeManage/placeManage/placeView/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="placeView">
	<input type="hidden" name="viewCode" value="MESBasic_1_placeManage_placeView">
	<input type="hidden" name="datagridKey" value="MESBasic_placeManage_placeManage_placeView_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="placeManage.version" value="${(placeManage.version)!0}" />
	<input type="hidden" name="placeManage.extraCol" value='' />
	<input type="hidden" name="buttonCode" value="${request.getParameter('buttonCode')!}"/>
	<input type="hidden" name="namespace" value="${request.getParameter('namespace')!}"/>
		<input type="hidden" name="placeManage.placeManager.id" value="${(placeManage.placeManager.id)!""}"/>
		<input type="hidden" name="placeManage.factoryNode.id" value="${(placeManage.factoryNode.id)!""}"/>
	<div id="MESBasic_placeView_edit_div" style="height:100%">
		<div id="MESBasic_placeManage_placeManage_placeView_main_div" class="edit-content-dialog edit-content-dialog-fullwidth">
<script type="text/javascript">
var attcountid = "MESBasic_placeManage_placeManage_placeView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_placeManage', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td><td style='height:0px;border:none;width:17%'></td><td style='height:0px;border:none;width:33%'></td></tr>
		<tr class="dialog_tr">
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1418607299231')}" >${getText('MESBasic.propertydisplayName.radion1418607299231')}</label>
				</td>
				
						<#assign placeManage_placeCode_defaultValue  = ''>
							 							<#assign placeManage_placeCode_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="placeManage.placeCode" id="placeManage_placeCode"  style=";" originalvalue="<#if !newObj || (placeManage.placeCode)?has_content>${(placeManage.placeCode?html)!}<#else>${placeManage_placeCode_defaultValue!}</#if>" value="<#if !newObj || (placeManage.placeCode)?has_content>${(placeManage.placeCode?html)!}<#else>${placeManage_placeCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1418607347494')}" >${getText('MESBasic.propertydisplayName.radion1418607347494')}</label>
				</td>
				
						<#assign placeManage_placeName_defaultValue  = ''>
							 							<#assign placeManage_placeName_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="placeManage.placeName" id="placeManage_placeName"  style=";" originalvalue="<#if !newObj || (placeManage.placeName)?has_content>${(placeManage.placeName?html)!}<#else>${placeManage_placeName_defaultValue!}</#if>" value="<#if !newObj || (placeManage.placeName)?has_content>${(placeManage.placeName?html)!}<#else>${placeManage_placeName_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				</tr><tr class="dialog_tr">
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1418607441891')}" >${getText('MESBasic.propertydisplayName.radion1418607441891')}</label>
				</td>
				
						<#assign placeManage_placeManager_name_defaultValue  = ''>
														<#assign placeManage_placeManager_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('foundation.ec.entity.view.reference')}" viewType="${viewType!}" deValue="${placeManage_placeManager_name_defaultValue!}" conditionfunc="MESBasic.placeManage.placeManage.placeView._querycustomFunc('placeManage_placeManager_name')"  value="${(placeManage.placeManager.name)!}" displayFieldName="name" name="placeManage.placeManager.name" id="placeManage_placeManager_name" type="Staff" url="/foundation/staff/common/staffListFrameset.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_placeManage_placeManage_placeView_form" editCustomCallback=";" refViewCode="sysbase_1.0_staff_ref" onkeyupfuncname=";_callback_placeManage_placeManager_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if newObj && (placeManage_placeManager_name_defaultValue)=='currentUser'>
									(function($){
										$(function(){
											var obj = {'id' : '${Session.staff.id}'};
											obj = foundation.common.getObject('MESBasic_placeManage_placeManage_placeView_form',obj, 'placeManage.placeManager', '/foundation/staff/common/staffListFrameset.action');
											CUI.commonFills('MESBasic_placeManage_placeManage_placeView_form', 'placeManage.placeManager',obj,true);
											$('input:hidden[name="placeManage.placeManager.id"]').attr('originalvalue',obj.id);
										});
									})(jQuery);
								</#if>
								<#if !(placeManage.id)?? && (placeManage.placeManager.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${placeManage.placeManager.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_placeManage_placeManage_placeView_form',obj, 'placeManage.placeManager', '/foundation/staff/common/staffListFrameset.action');
												CUI.commonFills('MESBasic_placeManage_placeManage_placeView_form', 'placeManage.placeManager',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
												<td  nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1419232393783')}" >${getText('MESBasic.propertydisplayName.radion1419232393783')}</label>
				</td>
				
						<#assign placeManage_factoryNode_name_defaultValue  = ''>
														<#assign placeManage_factoryNode_name_defaultValue  = ''>
					<td  nullable=false class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.radion1419491307826')}" viewType="${viewType!}" deValue="${placeManage_factoryNode_name_defaultValue!}" conditionfunc="MESBasic.placeManage.placeManage.placeView._querycustomFunc('placeManage_factoryNode_name')"  value="${(placeManage.factoryNode.name)!}" displayFieldName="name" name="placeManage.factoryNode.name" id="placeManage_factoryNode_name" type="other" url="/MESBasic/factoryModel/factoryModel/factroyRef1.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_placeManage_placeManage_placeView_form" editCustomCallback=";" refViewCode="MESBasic_1_factoryModel_factroyRef1" onkeyupfuncname=";_callback_placeManage_factoryNode_name(obj);" cssStyle="" isEdit=true     isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(placeManage.id)?? && (placeManage.factoryNode.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${placeManage.factoryNode.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_placeManage_placeManage_placeView_form',obj, 'placeManage.factoryNode', '/MESBasic/factoryModel/factoryModel/factroyRef1.action');
												CUI.commonFills('MESBasic_placeManage_placeManage_placeView_form', 'placeManage.factoryNode',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1422512892566')}" >${getText('MESBasic.propertydisplayName.randon1422512892566')}</label>
				</td>
				
						<#assign placeManage_isAll_defaultValue  = ''>
							 							<#assign placeManage_isAll_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="placeManage.isAll_check" originalvalue="<#if !newObj><#if (placeManage.isAll)??>${(placeManage.isAll!false)?string('true','false')}<#else>false</#if><#elseif placeManage_isAll_defaultValue?has_content>${(placeManage_isAll_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (placeManage.isAll)??>${(placeManage.isAll!false)?string('true','false')}<#else>false</#if><#else>${(placeManage_isAll_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="placeManage.isAll" originalvalue="<#if ((placeManage.isAll)?? &&  placeManage.isAll)||(placeManage_isAll_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((placeManage.isAll)?? &&  placeManage.isAll)||(placeManage_isAll_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="placeManage.isAll_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="placeManage.isAll"]');
												CUI('input[name="placeManage.isAll_check"]').each(function(){
													if(this.checked) {
														tempObj.val('true');
													} else {
														tempObj.val('false');
													}
												});
											});
										}catch(e){}	
									});
								</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr class="dialog_tr">
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1418607488747')}" >${getText('MESBasic.propertydisplayName.radion1418607488747')}</label>
				</td>
				
						<#assign placeManage_placeMemo_defaultValue  = ''>
							 							<#assign placeManage_placeMemo_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="3" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="placeManage_placeMemo" originalvalue="<#if !newObj || (placeManage.placeMemo)?has_content>${(placeManage.placeMemo?html)!}<#else>${placeManage_placeMemo_defaultValue?html}</#if>"  name="placeManage.placeMemo" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (placeManage.placeMemo)?has_content>${(placeManage.placeMemo)!}<#else>${placeManage_placeMemo_defaultValue}</#if></textarea></div>
							
				</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	

<#assign colAdmFlag=checkUserPermisition('ec_ptManage_list_view')>
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_placeManage_placeView,html,MESBasic_1_placeManage_PlaceManage,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
<script type="text/javascript" src="/bap/static/signature/${lang!}/signature.js"></script>
<script type="text/javascript">
	MESBasic.placeManage.placeManage.placeView.beforeSaveProcess = function(){}
	MESBasic.placeManage.placeManage.placeView.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(MESBasic.placeManage.placeManage.placeView.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#MESBasic_placeManage_placeManage_placeView_form').trigger('beforeSubmit');
		//placeManage.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="placeManage.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#MESBasic_placeManage_placeManage_placeView_form ul.edit-tabs").tabs("div.edit-panes > div");
			$('#MESBasic_placeManage_placeManage_placeView_form').get(0).onkeydown=function(event){event=event?event:window.event;if(event.keyCode==13){return false}};
		});
	})(jQuery);
	MESBasic.placeManage.placeManage.placeView.validate = function(){
		return true;
	}
	
	
	//打印
	MESBasic.placeManage.placeManage.placeView.print = function(url){
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
		
		MESBasic.placeManage.placeManage.placeView.saveSetting = function(){
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
		MESBasic.placeManage.placeManage.placeView.printSetting = function(){
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
			MESBasic.placeManage.placeManage.placeView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.placeManage.placeManage.placeView.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				MESBasic.placeManage.placeManage.placeView.settingDialog.show();
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
			MESBasic.placeManage.placeManage.placeView._customCallBack = customCallBack;
		}
		MESBasic.placeManage.placeManage.placeView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#MESBasic_placeManage_placeManage_placeView_fileupload').length == 0) {
				$('body').append('<div id="MESBasic_placeManage_placeManage_placeView_fileupload"></div>');
			}
			MESBasic.placeManage.placeManage.placeView.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "MESBasic_placeManage_placeManage_placeView_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#MESBasic_placeManage_placeManage_placeView_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			MESBasic.placeManage.placeManage.placeView.infoDialog.show();
			if($('#MESBasic_placeManage_placeManage_placeView_fileupload').html() == '') {
				$('#MESBasic_placeManage_placeManage_placeView_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=MESBasic_placeManage_placeManage&entityCode=MESBasic_1_placeManage&dialogId="+dialogId);
			}
		}
	//参照复制函数
	MESBasic.placeManage.placeManage.placeView.referenceCopy = function(objName,url, dialog){
		var callbackName ="MESBasic.placeManage.placeManage.placeView.referenceCopyBackInfo";
		MESBasic.placeManage.placeManage.placeView.dialog = dialog;
		MESBasic.placeManage.placeManage.placeView._dialog = foundation.common.select({
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
	
	MESBasic.placeManage.placeManage.placeView.referenceCopyBackInfo = function(obj){
		if(MESBasic.placeManage.placeManage.placeView._dialog){
			MESBasic.placeManage.placeManage.placeView._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,MESBasic.placeManage.placeManage.placeView.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('MESBasic_placeManage_placeManage_placeView_form','MESBasic_placeManage_placeManage_placeView_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(MESBasic.placeManage.placeManage.placeView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(MESBasic.placeManage.placeManage.placeView.dialog._el).load('/MESBasic/placeManage/placeManage/placeView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( MESBasic.placeManage.placeManage.placeView.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + MESBasic.placeManage.placeManage.placeView.dialog._config.iframe, MESBasic.placeManage.placeManage.placeView.dialog._dialog ).prop( 'src', '/MESBasic/placeManage/placeManage/placeView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(MESBasic.placeManage.placeManage.placeView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(MESBasic.placeManage.placeManage.placeView.dialog._el).load('/MESBasic/placeManage/placeManage/placeView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	MESBasic.placeManage.placeManage.placeView.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		MESBasic.placeManage.placeManage.placeView.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		MESBasic.placeManage.placeManage.placeView._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			MESBasic.placeManage.placeManage.placeView._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	MESBasic.placeManage.placeManage.placeView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'MESBasic_placeManage_placeManage_placeView' + '_' + extraFrameParam;
		var callbackName="";
		MESBasic.placeManage.placeManage.placeView._prefix = '';
		MESBasic.placeManage.placeManage.placeView._oGrid = oGrid;
		MESBasic.placeManage.placeManage.placeView._sUrl = url;
		if(customCallBack){
			MESBasic.placeManage.placeManage.placeView._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			MESBasic.placeManage.placeManage.placeView.gridEventObj = gridEventObj;
			callbackName = "MESBasic.placeManage.placeManage.placeView.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				MESBasic.placeManage.placeManage.placeView._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "MESBasic.placeManage.placeManage.placeView.getMultiselectCallBackInfo_DG" : "MESBasic.placeManage.placeManage.placeView.getcallBackInfo_DG";
			MESBasic.placeManage.placeManage.placeView._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				MESBasic.placeManage.placeManage.placeView._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="MESBasic.placeManage.placeManage.placeView.getcallBackInfo";
		}
		if(MESBasic.placeManage.placeManage.placeView._prefix!=''){
			MESBasic.placeManage.placeManage.placeView._prefix = MESBasic.placeManage.placeManage.placeView._prefix.substring(1);
		}
		if(MESBasic.placeManage.placeManage.placeView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.placeManage.placeManage.placeView._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof MESBasic.placeManage.placeManage.placeView._querycustomFuncN == "function") {
				refparam += MESBasic.placeManage.placeManage.placeView._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		MESBasic.placeManage.placeManage.placeView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.placeManage.placeManage.placeView._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.placeManage.placeManage.placeView.query_"+obj+")!='undefined'") ? eval('MESBasic.placeManage.placeManage.placeView.query_'+obj+'()') : null;
		return str;
	
	};
	
	MESBasic.placeManage.placeManage.placeView.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('MESBasic_placeManage_placeManage_placeView_form',obj[0], MESBasic.placeManage.placeManage.placeView._prefix, MESBasic.placeManage.placeManage.placeView._sUrl);
		CUI.commonFills('MESBasic_placeManage_placeManage_placeView_form',MESBasic.placeManage.placeManage.placeView._prefix,obj[0]);

		try{
			if(MESBasic.placeManage.placeManage.placeView._customCallBack) {
				eval(MESBasic.placeManage.placeManage.placeView._customCallBack);
				MESBasic.placeManage.placeManage.placeView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.placeManage.placeManage.placeView._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	MESBasic.placeManage.placeManage.placeView.getcallBackInfo_DG_IE = function(obj){
		if(MESBasic.placeManage.placeManage.placeView._customBeforeCallBack) {
			var flag = eval(MESBasic.placeManage.placeManage.placeView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = MESBasic.placeManage.placeManage.placeView.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.placeManage.placeManage.placeView._sUrl);
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
			if(MESBasic.placeManage.placeManage.placeView._customCallBack) {
				eval(MESBasic.placeManage.placeManage.placeView._customCallBack);
				MESBasic.placeManage.placeManage.placeView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.placeManage.placeManage.placeView._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	MESBasic.placeManage.placeManage.placeView.getcallBackInfo_DG = function(obj){
		if(MESBasic.placeManage.placeManage.placeView._customBeforeCallBack) {
			var flag = eval(MESBasic.placeManage.placeManage.placeView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(MESBasic.placeManage.placeManage.placeView._currRow).next().length==0){
					MESBasic.placeManage.placeManage.placeView._oGrid.addNewRow();
				}	
				MESBasic.placeManage.placeManage.placeView._currRow = $(MESBasic.placeManage.placeManage.placeView._currRow).next();
				$(MESBasic.placeManage.placeManage.placeView._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(MESBasic.placeManage.placeManage.placeView._currRow,obj[i],MESBasic.placeManage.placeManage.placeView._prefix,MESBasic.placeManage.placeManage.placeView._sUrl);
			eval("CUI.commonFills_DG(MESBasic.placeManage.placeManage.placeView._currRow,MESBasic.placeManage.placeManage.placeView._prefix,obj[i],MESBasic.placeManage.placeManage.placeView._oGrid)");
		}
		try{
			if(MESBasic.placeManage.placeManage.placeView._customCallBack) {
				eval(MESBasic.placeManage.placeManage.placeView._customCallBack);
				MESBasic.placeManage.placeManage.placeView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.placeManage.placeManage.placeView._dialog.close();
		} catch(e){}
	};
	
	MESBasic.placeManage.placeManage.placeView.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(MESBasic.placeManage.placeManage.placeView._oGrid, MESBasic.placeManage.placeManage.placeView._currRow, MESBasic.placeManage.placeManage.placeView._key, MESBasic.placeManage.placeManage.placeView._displayFieldName, obj[i])
		}
		try{
			if(MESBasic.placeManage.placeManage.placeView._customCallBack) {
				eval(MESBasic.placeManage.placeManage.placeView._customCallBack);
				MESBasic.placeManage.placeManage.placeView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.placeManage.placeManage.placeView._dialog.close();
		} catch(e){}
	};
	
	MESBasic.placeManage.placeManage.placeView.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			MESBasic.placeManage.placeManage.placeView.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_placeManage_placeManage_placeView_form'));
        			}
        	   	}
        	}
      	});
	};
	MESBasic.placeManage.placeManage.placeView.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	MESBasic.placeManage.placeManage.placeView.initCount = 0;
	MESBasic.placeManage.placeManage.placeView.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#MESBasic_placeView_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('MESBasic_placeManage_placeManage_placeView_datagrids');	
		var	conHeight = h-$("#MESBasic_placeManage_placeManage_placeView_main_div .edit-tabs").outerHeight() - 6;
		panesHeight = conHeight*0.4;
		$("#MESBasic_placeManage_placeManage_placeView_main_div .edit-panes-s").each(function(index){
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
							
							dgwidget.setHeight(perHeight - 68);
							
						} else {
							if(MESBasic.placeManage.placeManage.placeView.initCount <= 2) {
								setTimeout(function(){MESBasic.placeManage.placeManage.placeView.initSize();}, 200);
								MESBasic.placeManage.placeManage.placeView.initCount++;
							}/* else {
								MESBasic.placeManage.placeManage.placeView.initCount = 0;
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
		MESBasic.placeManage.placeManage.placeView.initSize();
		$(".edit-tabs li").click(function(){
		    var index = $(this).index();
		    MESBasic.placeManage.placeManage.placeView.initSize(index);
		});
		$(window).bind("dialog.resize",function(){MESBasic.placeManage.placeManage.placeView.initSize();});
	});
</script>
<script type="text/javascript">
	

	/* CUSTOM CODE START(view-EDIT-MESBasic_1_placeManage_placeView,js,MESBasic_1_placeManage_PlaceManage,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>