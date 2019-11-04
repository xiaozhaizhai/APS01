<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${getText('WOM.viewtitle.randon1490346987719')}</title>
<@maincss/>
<@mainjs/>
</head>

<body id="dialog_page">
<@loadpanel></@loadpanel>
<@errorbar id="workbenchErrorBar" offsetY=0></@errorbar>
</#if>


<style type="text/css">
.ewc-dialog-el{height:100%;} 
.ewc-dialog-el .edit-table{width:98%;margin:0 auto;}
</style>
<script type="text/javascript">
	CUI.ns('WOM.produceTask.produceTaskActive.batchNumEdit');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign fileuploadType = "Table">
	<#assign fileuploadLinkId = tableInfoId!>
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
<#assign callbackName ="WOM.produceTask.produceTaskActive.callBackInfo">
<#if (Parameters.callbackName)?? && (Parameters.callbackName)?length gt 0 >
<#assign callbackName = Parameters.callbackName >
</#if>
<@errorbar id="WOM_produceTask_produceTaskActive_batchNumEdit_formDialogErrorBar" />
<#assign mneIframe = false>
<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
<#assign callbackName="parent." + callbackName>
<#assign mneIframe = true>
</#if>
<@s.form id="WOM_produceTask_produceTaskActive_batchNumEdit_form" cssStyle="height:100%;" hiddenField="" onsubmitMethod="WOM.produceTask.produceTaskActive.batchNumEdit.beforeSubmitMethod()" ecAction="/WOM/produceTask/produceTaskActive/batchNumEdit/submit.action?__pc__=${(Parameters.__pc__)!}" callback=callbackName ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="batchNumEdit">
	<input type="hidden" name="viewCode" value="WOM_7.5.0.0_produceTask_batchNumEdit">
	<input type="hidden" name="datagridKey" value="WOM_produceTask_produceTaskActive_batchNumEdit_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="produceTaskActive.version" value="${(produceTaskActive.version)!0}" />
	<input type="hidden" name="produceTaskActive.extraCol" value='' />
	<div id="WOM_batchNumEdit_edit_div" style="height:100%">
		<div id="WOM_produceTask_produceTaskActive_batchNumEdit_main_div" class="edit-content-dialog">
<script type="text/javascript">
var attcountid = "WOM_produceTask_produceTaskActive_batchNumEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_produceTask', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<div class="edit-panes-s" >
</div>				</div>	
				<div class="edit-datatable">	
				
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
			<#if false && isIE>
					<#assign routeFlag = "1">
			<#else>
					<#assign routeFlag = "0">
			</#if>

			<#assign cpObjHideKey = '' >
			<#assign cpvmInfo = ''>
								<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_MaterialBatchNums", "WOM_7.5.0.0_produceTask_batchNumEditdg1490347341669", "DATAGRID", "materialBatchNums")>
								<#list customPropViewMappings as cpvm>
									<#if cpvm.property.type == 'OBJECT' && cpObjHideKey?index_of(",'" +cpvm.propertyLayRec) lt 0>
										<#assign cpObjHideKey = cpObjHideKey + ",'" + cpvm.propertyLayRec + "'">
									</#if>
									<#if cpvm.propertyLayRec?index_of('.') lt 0 && cpvm.relatedKey?has_content>
										<#assign cpvmInfo = cpvmInfo + ',' + cpvm.relatedKey + "||" + cpvm.propertyLayRec>
										<#if cpvm.property.type == 'OBJECT'>
											<#assign cpvmInfo = cpvmInfo + "||" + cpvm.property.code>	
										</#if>
									</#if>
								</#list>
			
			<#if  refId?? && (refId > 0)>
				<#assign dUrl="/WOM/produceTask/produceTaskActive/data-dg1490347341669.action?produceTaskActive.id=${refId!-1}&refId=${refId!-1}&datagridCode=WOM_7.5.0.0_produceTask_batchNumEditdg1490347341669">
			<#else>
				<#assign dUrl="/WOM/produceTask/produceTaskActive/data-dg1490347341669.action?produceTaskActive.id=${(produceTaskActive.id)!-1}&datagridCode=WOM_7.5.0.0_produceTask_batchNumEditdg1490347341669">
			</#if>
			<#assign firstLoad = true>
				
			<#if newObj?? && !newObj && !(refId?? && (refId > 0))>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_MaterialBatchNums_dg1490347341669_deldatagrid();}}]">
				<#assign canImportExcel=false>
			<#else>
				<#assign buttons="[{text:\"${getText('ec.view.addline')}\",handler:function(event){this.addNewRow(event);},iconClass:\"cui-btn-add\",useInMore:\"false\"},{text:\"${getText('ec.view.deleteline')}\",iconClass:\"cui-btn-del\",useInMore:\"false\",handler:function(event){DT_MaterialBatchNums_dg1490347341669_deldatagrid();}}]">
				<#assign canImportExcel=false>
			</#if>
			
				<#if cpvmInfo?? && cpvmInfo?length gt 0>
					<#assign cpvmInfo = cpvmInfo?substring(1)>
					<input type="hidden" id="dg_cp_info_MaterialBatchNums_dg1490347341669" value="${cpvmInfo!}" />
				</#if>
			
			<input type="hidden" id="dg1490347341669_id" value="MaterialBatchNums_dg1490347341669" />
			
			<input type="hidden" id="dg1490347341669_url" value="${dUrl}" />
			
			<#assign assModelDisplayName = getText('WOM.modelname.randon1490066410355')!>
			<#assign assModelDisplayName = assModelDisplayName + getText('ec.common.validate.colon') >
			<@exportexcel action="/WOM/produceTask/produceTaskActive/data-dg1490347341669.action?operateType=export&datagridCode=WOM_7.5.0.0_produceTask_batchNumEditdg1490347341669"  settingtext="" settingUrl="" prepareParams="" formId="" look="text" width=250 height=170 text="" exportPageChoose=0 dtPage="dgPage" prefix="MaterialBatchNums_dg1490347341669" />
			<@datagrid withoutConfigTable=true id="MaterialBatchNums_dg1490347341669" viewType="${viewType}" renderOverEvent="dg1490347341669RenderOverEvent" route="${routeFlag}" formId="WOM_produceTask_produceTaskActive_batchNumEdit_form" noPermissionKeys="batchNum.batchText,batchNum.good.productCode,batchNum.good.productName,batchNum.onhand,batchNum.availiQuantity,planNum" modelCode="WOM_7.5.0.0_produceTask_MaterialBatchNums" dataUrl="${dUrl}" postData="&dgPage.pageSize=65536" dataGridName="dg1490347341669" dtPage="dgPage"  hidekeyPrefix="dg1490347341669" hidekey="['id','version','batchNum.id','batchNum.batchText','batchNum.id','batchNum.good.productCode','batchNum.id','batchNum.good.productName','batchNum.id','batchNum.onhand','batchNum.id','batchNum.availiQuantity'${cpObjHideKey!''}]" transMethod="post" paginator=false editable=true buttons="${buttons}"  canImportExcel=canImportExcel noPadding=true isEdit=true tabViewIndex=0 pageInitMethod="dg1490347341669PageInitMethod"  defaultNodeExpanded=nodeExpanded  cannotAddNewRow=true cannotDeleteRow=false assModelDisplayName=assModelDisplayName  activexButton="" exportExcel=exportExcel addNewRow=true   canInsertRow=false  insertRowAble=false firstLoad=firstLoad >		
							<#assign batchNum_batchText_displayDefaultType=''>
								<#assign batchNum_batchText_defaultValue=''>
										<#assign batchNum_batchText_defaultValue=''>
																	<#if (batchNum_batchText_defaultValue!)?string=="currentUser">
								<#assign batchNum_batchText_defaultValue='${staffJson!}'>
							<#elseif (batchNum_batchText_defaultValue!)?string=="currentPost">
								<#assign batchNum_batchText_defaultValue='${postJson!}'>
							<#elseif (batchNum_batchText_defaultValue!)?string=="currentDepart">
								<#assign batchNum_batchText_defaultValue='${deptJson!}'>
							<#elseif (batchNum_batchText_defaultValue!)?string=="currentComp">
								<#assign batchNum_batchText_defaultValue='${compJson!}'>
							</#if>

									<@datacolumn key="batchNum.batchText"        showFormat="SELECTCOMP" defaultValue="${(batchNum_batchText_defaultValue!)?string}" defaultDisplay="${(batchNum_batchText_displayDefaultType!)?string}" decimal="" editable=true type="selectcomp" showType="selectcomp" notnull=true   selectCompName="WOM.produceTask.produceTaskActive.batchNumEdit"  textalign="left"  viewUrl="/WOM/standingcropRef/standingcropRef/batchNumRef.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490065762725')}"  label="${getText('WOM.propertydisplayName.randon1490064501469')}" width=100 showFormatFunc=""/>
							<#assign batchNum_good_productCode_displayDefaultType=''>
								<#assign batchNum_good_productCode_defaultValue=''>
										<#assign batchNum_good_productCode_defaultValue=''>
																	<#if (batchNum_good_productCode_defaultValue!)?string=="currentUser">
								<#assign batchNum_good_productCode_defaultValue='${staffJson!}'>
							<#elseif (batchNum_good_productCode_defaultValue!)?string=="currentPost">
								<#assign batchNum_good_productCode_defaultValue='${postJson!}'>
							<#elseif (batchNum_good_productCode_defaultValue!)?string=="currentDepart">
								<#assign batchNum_good_productCode_defaultValue='${deptJson!}'>
							<#elseif (batchNum_good_productCode_defaultValue!)?string=="currentComp">
								<#assign batchNum_good_productCode_defaultValue='${compJson!}'>
							</#if>
 
									<@datacolumn key="batchNum.good.productCode"        showFormat="TEXT" defaultValue="${(batchNum_good_productCode_defaultValue!)?string}" defaultDisplay="${(batchNum_good_productCode_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTaskActive.batchNumEdit"  textalign="left"  viewUrl="/WOM/standingcropRef/standingcropRef/batchNumRef.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490065762725')}"  label="${getText('MESBasic.propertydisplayName.radion1415772644833')}" width=100 showFormatFunc=""/>
							<#assign batchNum_good_productName_displayDefaultType=''>
								<#assign batchNum_good_productName_defaultValue=''>
										<#assign batchNum_good_productName_defaultValue=''>
																	<#if (batchNum_good_productName_defaultValue!)?string=="currentUser">
								<#assign batchNum_good_productName_defaultValue='${staffJson!}'>
							<#elseif (batchNum_good_productName_defaultValue!)?string=="currentPost">
								<#assign batchNum_good_productName_defaultValue='${postJson!}'>
							<#elseif (batchNum_good_productName_defaultValue!)?string=="currentDepart">
								<#assign batchNum_good_productName_defaultValue='${deptJson!}'>
							<#elseif (batchNum_good_productName_defaultValue!)?string=="currentComp">
								<#assign batchNum_good_productName_defaultValue='${compJson!}'>
							</#if>
 
									<@datacolumn key="batchNum.good.productName"        showFormat="TEXT" defaultValue="${(batchNum_good_productName_defaultValue!)?string}" defaultDisplay="${(batchNum_good_productName_displayDefaultType!)?string}" decimal="" editable=false type="textfield" showType="textfield" notnull=false   selectCompName="WOM.produceTask.produceTaskActive.batchNumEdit"  textalign="left"  viewUrl="/WOM/standingcropRef/standingcropRef/batchNumRef.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490065762725')}"  label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" width=100 showFormatFunc=""/>
							<#assign batchNum_onhand_displayDefaultType=''>
								<#assign batchNum_onhand_defaultValue=''>
										<#assign batchNum_onhand_defaultValue=''>
																	<#if (batchNum_onhand_defaultValue!)?string=="currentUser">
								<#assign batchNum_onhand_defaultValue='${staffJson!}'>
							<#elseif (batchNum_onhand_defaultValue!)?string=="currentPost">
								<#assign batchNum_onhand_defaultValue='${postJson!}'>
							<#elseif (batchNum_onhand_defaultValue!)?string=="currentDepart">
								<#assign batchNum_onhand_defaultValue='${deptJson!}'>
							<#elseif (batchNum_onhand_defaultValue!)?string=="currentComp">
								<#assign batchNum_onhand_defaultValue='${compJson!}'>
							</#if>
 
									<@datacolumn key="batchNum.onhand"        showFormat="TEXT" defaultValue="${(batchNum_onhand_defaultValue!)?string}" defaultDisplay="${(batchNum_onhand_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false   selectCompName="WOM.produceTask.produceTaskActive.batchNumEdit"  textalign="right"  viewUrl="/WOM/standingcropRef/standingcropRef/batchNumRef.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490065762725')}"  label="${getText('WOM.propertydisplayName.randon1490064713692')}" width=100 showFormatFunc=""/>
							<#assign batchNum_availiQuantity_displayDefaultType=''>
								<#assign batchNum_availiQuantity_defaultValue=''>
										<#assign batchNum_availiQuantity_defaultValue=''>
																	<#if (batchNum_availiQuantity_defaultValue!)?string=="currentUser">
								<#assign batchNum_availiQuantity_defaultValue='${staffJson!}'>
							<#elseif (batchNum_availiQuantity_defaultValue!)?string=="currentPost">
								<#assign batchNum_availiQuantity_defaultValue='${postJson!}'>
							<#elseif (batchNum_availiQuantity_defaultValue!)?string=="currentDepart">
								<#assign batchNum_availiQuantity_defaultValue='${deptJson!}'>
							<#elseif (batchNum_availiQuantity_defaultValue!)?string=="currentComp">
								<#assign batchNum_availiQuantity_defaultValue='${compJson!}'>
							</#if>
 
									<@datacolumn key="batchNum.availiQuantity"        showFormat="TEXT" defaultValue="${(batchNum_availiQuantity_defaultValue!)?string}" defaultDisplay="${(batchNum_availiQuantity_displayDefaultType!)?string}" decimal="2" editable=false type="DECIMAL" showType="decimal" notnull=false   selectCompName="WOM.produceTask.produceTaskActive.batchNumEdit"  textalign="right"  viewUrl="/WOM/standingcropRef/standingcropRef/batchNumRef.action" viewCode="WOM_7.5.0.0_standingcropRef_batchNumRef" mneenable=false crossCompany=false viewTitle="${getText('WOM.viewtitle.randon1490065762725')}"  label="${getText('WOM.propertydisplayName.randon1490064478475')}" width=100 showFormatFunc=""/>
							<#assign planNum_displayDefaultType=''>
								<#assign planNum_defaultValue=''>
										  
									<@datacolumn key="planNum"        showFormat="TEXT" defaultValue="${(planNum_defaultValue!)?string}" defaultDisplay="${(planNum_displayDefaultType!)?string}" decimal="2" editable=true type="DECIMAL" showType="decimal" notnull=true     textalign="right"  viewUrl="" viewCode="" mneenable=false crossCompany=false viewTitle="${getText('')}"  label="${getText('WOM.propertydisplayName.randon1490346958585')}" width=100 showFormatFunc=""/>
							<#assign customPropViewMappings = getShowCustomProps("WOM_7.5.0.0_produceTask_MaterialBatchNums", "WOM_7.5.0.0_produceTask_batchNumEditdg1490347341669", "DATAGRID", "materialBatchNums")>
							<#-- 排布自定义字段 -->
							<#list customPropViewMappings as cpvm>
								<#assign cpvmColumnType = cpvm.property.type>
								<#assign cpvmKey = cpvm.propertyLayRec>
								<#assign cpvmType = cpvmColumnType?lower_case>
								
								<#assign cpEditable = true>
								<#if cpEditable && cpvmKey?index_of('.') gt -1>
									<#assign cpEditable = false>
								</#if>
								
								<#assign cpvmNotNull = false>
								<#if cpEditable && !(cpvm.nullable!true)>
									<#assign cpvmNotNull = true>
								</#if>
								
								<#assign cpvmWidth = 100>
								<#if cpvmColumnType == 'DATETIME'>
									<#assign cpvmWidth = 130>
								</#if>
								<#if cpvm.fieldType == 'TEXTAREA'>
									<#assign cpvmWidth = 200>
								</#if>
								
								<#if cpvmColumnType == 'TEXT'>
									<#assign cpvmType = 'textfield'>
								<#elseif cpvmColumnType == 'DATETIME' || cpvmColumnType == 'SYSTEMCODE' || cpvmColumnType == 'OBJECT'>
									<#assign cpvmType = cpvm.fieldType?lower_case>
								</#if>
								
								<#if cpvmColumnType == 'SYSTEMCODE'>
									<#assign cpvmSeniorSystemCode = false>
									<#if cpvm.property.seniorSystemCode?? && cpvm.property.seniorSystemCode>
										<#assign cpvmSeniorSystemCode = true>
									</#if>
									<@systemCodeColumn width=cpvmWidth label="${getText('${cpvm.displayName}')}" code="${(cpvm.property.fillcontentMap.fillContent)!}" key=cpvmKey editable=cpEditable type=cpvmType notnull=cpvmNotNull seniorSystemCode=cpvmSeniorSystemCode />
								<#else>
									<#assign viewUrl = ''>
									<#assign viewTitle = ''>
									<#assign viewCode = ''>
									<#assign selectCompName = ''>
									<#assign isObjCustomProp = false>
									<#assign objCustomPropNames = ''>
									<#if cpvmColumnType == 'OBJECT'>
										<#if cpvm.refView??>
											<#assign viewUrl = (cpvm.refView.url)!''>
											<#assign viewTitle = (cpvm.refView.title)!''>
											<#assign viewCode = (cpvm.refView.code)!''>
											<#assign selectCompName = 'WOM.produceTask.produceTaskActive.batchNumEdit'>
										</#if>
										<#assign pkName = ''>
										<#assign mainDisplayName = ''>
										<#list cpvm.property.associatedProperty.model.properties as p>
											<#if !pkName?has_content && p.isPk?? && p.isPk>
												<#assign pkName = p.name>
											</#if>
											<#if !mainDisplayName?has_content && p.isMainDisplay?? && p.isMainDisplay>
												<#assign mainDisplayName = p.name>
											</#if>
										</#list>
										<#assign cpvmKey = cpvmKey + 'MainDisplay'>
										<#assign isObjCustomProp = true>
										<#assign objCustomPropNames = (mainDisplayName!'name') + ',' + (pkName!'id')> 
									</#if>
									<@datacolumn key=cpvmKey width=cpvmWidth showFormat="${cpvm.format!'TEXT'}" decimal="${cpvm.property.decimalNum!}" editable=cpEditable type=cpvmType showType="${cpvm.fieldType}" notnull=cpvmNotNull callbackname="" selectCompName=selectCompName viewUrl="${viewUrl!}" viewCode="${viewCode!}" crossCompany=false viewTitle="${getText('${viewTitle!}')}" label="${getText('${cpvm.displayName}')}" isObjCustomProp=isObjCustomProp objCustomPropNames="${objCustomPropNames}" />
								</#if>
							</#list>
			
			</@datagrid>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
				<script type="text/javascript">
					
				</script>
			
			<script type="text/javascript">
				function MaterialBatchNums_dg1490347341669_check_datagridvalid(){
					//
					var errorObj =MaterialBatchNums_dg1490347341669Widget._DT.testData();
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
				
				function savedg1490347341669DataGrid(){
					<#if  refId?? && (refId gt 0)>
					MaterialBatchNums_dg1490347341669Widget.setAllRowEdited();
					</#if>
					// 针对需要全部更新的PT，把pt Id存到body的CHANGED_PT中，保存时，会自动保存全部数据
					var changed_pt_name = $('body').data('CHANGED_PT');
					if(changed_pt_name && changed_pt_name.indexOf('MaterialBatchNums_dg1490347341669Widget') > -1) {
						MaterialBatchNums_dg1490347341669Widget.setAllRowEdited();
					}
					var json = MaterialBatchNums_dg1490347341669Widget.parseEditedData();
					$('input[name="dg1490347341669ListJson"]').remove();
					$('input[name="dgLists[\'dg1490347341669\']"]').remove();
					$('input[name="dg1490347341669ModelCode"]').remove();
					$('<input type="hidden" name="dgLists[\'dg1490347341669\']">').val(json).appendTo($('#WOM_produceTask_produceTaskActive_batchNumEdit_form'));
					$('<input type="hidden" name="dg1490347341669ModelCode">').val('WOM_7.5.0.0_produceTask_MaterialBatchNums').appendTo($('#WOM_produceTask_produceTaskActive_batchNumEdit_form'));
					//兼容旧版本提交函数
					$('<input type="hidden" name="dg1490347341669ListJson">').val(json).appendTo($('#WOM_produceTask_produceTaskActive_batchNumEdit_form'));
				}
				function DT_MaterialBatchNums_dg1490347341669_deldatagrid(){
					var deleteRows = MaterialBatchNums_dg1490347341669Widget.deleteRows();
					if(!deleteRows || deleteRows.length == 0) {
						CUI.Dialog.alert("${getHtmlText('foundation.message.choicedel')}");
						return false;
					}
					var delproperty = "'id','version','activeId.id','batchNum.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1490347341669DeletedIds").length>0){
							$("#dg1490347341669DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1490347341669DeletedIds" name="dgDeletedIds[\'dg1490347341669\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTaskActive_batchNumEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1490347341669DeletedIds['+CUI('input[name^="dg1490347341669DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTaskActive_batchNumEdit_form'));
					});
				}
				function DT_MaterialBatchNums_dg1490347341669_delTreeNodes(){
					var deleteRows = MaterialBatchNums_dg1490347341669Widget._DT.removeTreeNode();
					if(!deleteRows || deleteRows.length == 0) {
						return false;
					}
					var delproperty = "'id','version','activeId.id','batchNum.id'";
					delproperty= delproperty.split(",")[0].substring(1).replace("'","");
					$.each(deleteRows, function(index, deleteRow){
						var tepID = eval("deleteRow."+delproperty);
						if(tepID==null || tepID == undefined || tepID == '') {
							return true;
						}
						if($("#dg1490347341669DeletedIds").length>0){
							$("#dg1490347341669DeletedIds")[0].value+=","+tepID;
						}else{
							CUI('<input type="hidden" id="dg1490347341669DeletedIds" name="dgDeletedIds[\'dg1490347341669\']" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTaskActive_batchNumEdit_form'));
						}
						//兼容旧版本提交函数
						CUI('<input type="hidden" name="dg1490347341669DeletedIds['+CUI('input[name^="dg1490347341669DeletedIds"]').length+']'+'" value="'+tepID+'">').appendTo(CUI('#WOM_produceTask_produceTaskActive_batchNumEdit_form'));
					});
				}
				$(function($){
					var datagrids = $('body').data('WOM_produceTask_produceTaskActive_batchNumEdit_datagrids');
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
							if(datagrids[0][i] == 'MaterialBatchNums_dg1490347341669') {
								break;
							}
							if(i==datagrids[0].length-1) {
								datagrids[0][datagrids[0].length] = 'MaterialBatchNums_dg1490347341669';
							}
						}
					} else {
						datagrids[0][datagrids[0].length] = 'MaterialBatchNums_dg1490347341669';
					}
					$('body').data('WOM_produceTask_produceTaskActive_batchNumEdit_datagrids', datagrids);
				});
				
				var MaterialBatchNums_dg1490347341669_importDialog = null;
				function MaterialBatchNums_dg1490347341669_showImportDialog(){
					try{
						if(MaterialBatchNums_dg1490347341669_importDialog!=null&&MaterialBatchNums_dg1490347341669_importDialog.isShow==1){
							return false;
						}
						var url = "/WOM/produceTask/produceTaskActive/initImport.action?datagridCode=WOM_7.5.0.0_produceTask_batchNumEditdg1490347341669&tid=${id!}&datagridName=dg1490347341669";
						MaterialBatchNums_dg1490347341669_importDialog = new CUI.Dialog({
							title: "${getHtmlText('common.button.import')}",
							url:url,
							modal:true,
							description:'',
							height:'330',
							width: '420',
							dragable:true,
							buttons:[{id:"import",name:"${getHtmlText('common.button.import')}",handler:function(){var dg = eval("MaterialBatchNums_dg1490347341669"+"Widget");if(dg && dg.checkEdited && dg.checkEdited()){CUI.Dialog.alert("${getHtmlText('ec.view.unsavedgdata')}");}else{foundation.importExcel.submitImportForm();}}},{name:"${getHtmlText('common.button.cancel')}",id:"close",handler:function(){setTimeout(function(){$('#importResponse').remove();MaterialBatchNums_dg1490347341669_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.Confirm')}",id:"ok",display:'hidden',handler:function(){setTimeout(function(){$('#importResponse').remove();MaterialBatchNums_dg1490347341669_importDialog.close();}, 200);}},{name:"${getHtmlText('common.button.back')}",id:"tback",display:'hidden',handler:function(){tback();}}],
							beforeCloseEvent:function(){$('#importResponse').remove();}
						});
						MaterialBatchNums_dg1490347341669_importDialog.show();
					}catch(e){}
				}	
				
				function MaterialBatchNums_dg1490347341669_downLoadFile(){
					var url = "/WOM/produceTask/produceTaskActive/downLoad.action?datagridCode=WOM_7.5.0.0_produceTask_batchNumEditdg1490347341669&templateRelatedModelCode=WOM_7.5.0.0_produceTask_batchNumEditdg1490347341669&downloadType=template&fileName=dg1490347341669";
					window.open(url,"","");
				}
				function dg1490347341669RenderOverEvent(){
				}
				function dg1490347341669PageInitMethod(nTabIndex){
					WOM.produceTask.produceTaskActive.batchNumEdit.initSize(nTabIndex);
				}
			</script>
			
			
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_batchNumEdit,html,WOM_7.5.0.0_produceTask_ProduceTaskActive,WOM_7.5.0.0) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	WOM.produceTask.produceTaskActive.batchNumEdit.beforeSaveProcess = function(){}
	WOM.produceTask.produceTaskActive.batchNumEdit.beforeSubmitMethod = function() {
		try{eval("savedg1490347341669DataGrid()");}catch(e){}
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(WOM.produceTask.produceTaskActive.batchNumEdit.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#WOM_produceTask_produceTaskActive_batchNumEdit_form').trigger('beforeSubmit');
		//produceTaskActive.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="produceTaskActive.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#WOM_produceTask_produceTaskActive_batchNumEdit_form ul.edit-tabs").tabs("div.edit-panes > div");
		});
	})(jQuery);
	WOM.produceTask.produceTaskActive.batchNumEdit.validate = function(){
		return true;
	}
	
	
	//打印
	WOM.produceTask.produceTaskActive.batchNumEdit.print = function(url){
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
		
		WOM.produceTask.produceTaskActive.batchNumEdit.saveSetting = function(){
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
		WOM.produceTask.produceTaskActive.batchNumEdit.printSetting = function(){
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
			WOM.produceTask.produceTaskActive.batchNumEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.produceTask.produceTaskActive.batchNumEdit.saveSetting()){this.close();}isPrintSettingDialogShow = false;}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close();isPrintSettingDialogShow = false;}
							}]
				})
				WOM.produceTask.produceTaskActive.batchNumEdit.settingDialog.show();
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
			WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack = customCallBack;
		}
		WOM.produceTask.produceTaskActive.batchNumEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	function setUpload(params){
			if($('#WOM_produceTask_produceTaskActive_batchNumEdit_fileupload').length == 0) {
				$('body').append('<div id="WOM_produceTask_produceTaskActive_batchNumEdit_fileupload"></div>');
			}
			WOM.produceTask.produceTaskActive.batchNumEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId : "WOM_produceTask_produceTaskActive_batchNumEdit_fileupload",
				modal:true,
				height:330,
				width: 460,
				buttons:[
						{	name:"${getText('foundation.common.closed')}",
							handler:function(){this.close()}
						}]
			});
			var dialogId = $('#WOM_produceTask_produceTaskActive_batchNumEdit_fileupload_button').parents('div[id^=dialog_]:first').attr('id');
			WOM.produceTask.produceTaskActive.batchNumEdit.infoDialog.show();
			if($('#WOM_produceTask_produceTaskActive_batchNumEdit_fileupload').html() == '') {
				$('#WOM_produceTask_produceTaskActive_batchNumEdit_fileupload').load("/foundation/workbench/fileupload-dialog-init.action?linkId=" + params.operateRecordId + "&type=WOM_produceTask_produceTaskActive&entityCode=WOM_7.5.0.0_produceTask&dialogId="+dialogId);
			}
		}
	//参照复制函数
	WOM.produceTask.produceTaskActive.batchNumEdit.referenceCopy = function(objName,url, dialog){
		var callbackName ="WOM.produceTask.produceTaskActive.batchNumEdit.referenceCopyBackInfo";
		WOM.produceTask.produceTaskActive.batchNumEdit.dialog = dialog;
		WOM.produceTask.produceTaskActive.batchNumEdit._dialog = foundation.common.select({
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
	
	WOM.produceTask.produceTaskActive.batchNumEdit.referenceCopyBackInfo = function(obj){
		if(WOM.produceTask.produceTaskActive.batchNumEdit._dialog){
			WOM.produceTask.produceTaskActive.batchNumEdit._dialog.close();
		}
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		
		<#else>
		createLoadPanel(false,WOM.produceTask.produceTaskActive.batchNumEdit.dialog._el);
		</#if>
		
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('WOM_produceTask_produceTaskActive_batchNumEdit_form','WOM_produceTask_produceTaskActive_batchNumEdit_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(WOM.produceTask.produceTaskActive.batchNumEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(WOM.produceTask.produceTaskActive.batchNumEdit.dialog._el).load('/WOM/produceTask/produceTaskActive/batchNumEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			parent.$( WOM.produceTask.produceTaskActive.batchNumEdit.dialog._el ).append( '<table id="dialog-iframe-loading" style="position:absolute;left:0;top:-20px;width:100%;height:100%;text-align:center;"><tr><td><label class="datagrid-loading">正在加载...</label></td></tr></table>' );
			parent.$( '#' + WOM.produceTask.produceTaskActive.batchNumEdit.dialog._config.iframe, WOM.produceTask.produceTaskActive.batchNumEdit.dialog._dialog ).prop( 'src', '/WOM/produceTask/produceTaskActive/batchNumEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}" + '&openType=frame' );
			<#else>
			$(WOM.produceTask.produceTaskActive.batchNumEdit.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(WOM.produceTask.produceTaskActive.batchNumEdit.dialog._el).load('/WOM/produceTask/produceTaskActive/batchNumEdit.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
	
	WOM.produceTask.produceTaskActive.batchNumEdit.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		WOM.produceTask.produceTaskActive.batchNumEdit.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		WOM.produceTask.produceTaskActive.batchNumEdit._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	WOM.produceTask.produceTaskActive.batchNumEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var extraFrameParam = objName.replace(/\./g, '_');
		var frameName = 'WOM_produceTask_produceTaskActive_batchNumEdit' + '_' + extraFrameParam;
		var callbackName="";
		WOM.produceTask.produceTaskActive.batchNumEdit._prefix = '';
		WOM.produceTask.produceTaskActive.batchNumEdit._oGrid = oGrid;
		WOM.produceTask.produceTaskActive.batchNumEdit._sUrl = url;
		if(customCallBack){
			WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			WOM.produceTask.produceTaskActive.batchNumEdit.gridEventObj = gridEventObj;
			callbackName = "WOM.produceTask.produceTaskActive.batchNumEdit.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				WOM.produceTask.produceTaskActive.batchNumEdit._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "WOM.produceTask.produceTaskActive.batchNumEdit.getMultiselectCallBackInfo_DG" : "WOM.produceTask.produceTaskActive.batchNumEdit.getcallBackInfo_DG";
			WOM.produceTask.produceTaskActive.batchNumEdit._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				WOM.produceTask.produceTaskActive.batchNumEdit._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="WOM.produceTask.produceTaskActive.batchNumEdit.getcallBackInfo";
		}
		if(WOM.produceTask.produceTaskActive.batchNumEdit._prefix!=''){
			WOM.produceTask.produceTaskActive.batchNumEdit._prefix = WOM.produceTask.produceTaskActive.batchNumEdit._prefix.substring(1);
		}
		if(WOM.produceTask.produceTaskActive.batchNumEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(WOM.produceTask.produceTaskActive.batchNumEdit._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof WOM.produceTask.produceTaskActive.batchNumEdit._querycustomFuncN == "function") {
				refparam += WOM.produceTask.produceTaskActive.batchNumEdit._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		WOM.produceTask.produceTaskActive.batchNumEdit._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			
			iframe: frameName + '_iframe',
			
			url : url,
			title : title,
			params : refparam
		});
	};
	
	WOM.produceTask.produceTaskActive.batchNumEdit._querycustomFunc = function(obj) {
		var str = eval("typeof(WOM.produceTask.produceTaskActive.batchNumEdit.query_"+obj+")!='undefined'") ? eval('WOM.produceTask.produceTaskActive.batchNumEdit.query_'+obj+'()') : null;
		return str;
	
	};
	
	WOM.produceTask.produceTaskActive.batchNumEdit.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('WOM_produceTask_produceTaskActive_batchNumEdit_form',obj[0], WOM.produceTask.produceTaskActive.batchNumEdit._prefix, WOM.produceTask.produceTaskActive.batchNumEdit._sUrl);
		CUI.commonFills('WOM_produceTask_produceTaskActive_batchNumEdit_form',WOM.produceTask.produceTaskActive.batchNumEdit._prefix,obj[0]);

		try{
			if(WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack) {
				eval(WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack);
				WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.produceTask.produceTaskActive.batchNumEdit._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	WOM.produceTask.produceTaskActive.batchNumEdit.getcallBackInfo_DG_IE = function(obj){
		if(WOM.produceTask.produceTaskActive.batchNumEdit._customBeforeCallBack) {
			var flag = eval(WOM.produceTask.produceTaskActive.batchNumEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = WOM.produceTask.produceTaskActive.batchNumEdit.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.produceTask.produceTaskActive.batchNumEdit._sUrl);
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
			if(WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack) {
				eval(WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack);
				WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			WOM.produceTask.produceTaskActive.batchNumEdit._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	WOM.produceTask.produceTaskActive.batchNumEdit.getcallBackInfo_DG = function(obj){
		if(WOM.produceTask.produceTaskActive.batchNumEdit._customBeforeCallBack) {
			var flag = eval(WOM.produceTask.produceTaskActive.batchNumEdit._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(WOM.produceTask.produceTaskActive.batchNumEdit._currRow).next().length==0){
					WOM.produceTask.produceTaskActive.batchNumEdit._oGrid.addNewRow();
				}	
				WOM.produceTask.produceTaskActive.batchNumEdit._currRow = $(WOM.produceTask.produceTaskActive.batchNumEdit._currRow).next();
				$(WOM.produceTask.produceTaskActive.batchNumEdit._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(WOM.produceTask.produceTaskActive.batchNumEdit._currRow,obj[i],WOM.produceTask.produceTaskActive.batchNumEdit._prefix,WOM.produceTask.produceTaskActive.batchNumEdit._sUrl);
			eval("CUI.commonFills_DG(WOM.produceTask.produceTaskActive.batchNumEdit._currRow,WOM.produceTask.produceTaskActive.batchNumEdit._prefix,obj[i],WOM.produceTask.produceTaskActive.batchNumEdit._oGrid)");
		}
		try{
			if(WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack) {
				eval(WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack);
				WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.produceTask.produceTaskActive.batchNumEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.produceTask.produceTaskActive.batchNumEdit.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(WOM.produceTask.produceTaskActive.batchNumEdit._oGrid, WOM.produceTask.produceTaskActive.batchNumEdit._currRow, WOM.produceTask.produceTaskActive.batchNumEdit._key, WOM.produceTask.produceTaskActive.batchNumEdit._displayFieldName, obj[i])
		}
		try{
			if(WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack) {
				eval(WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack);
				WOM.produceTask.produceTaskActive.batchNumEdit._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			WOM.produceTask.produceTaskActive.batchNumEdit._dialog.close();
		} catch(e){}
	};
	
	WOM.produceTask.produceTaskActive.batchNumEdit.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			WOM.produceTask.produceTaskActive.batchNumEdit.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_produceTask_produceTaskActive_batchNumEdit_form'));
        			}
        	   	}
        	}
      	});
	};
	WOM.produceTask.produceTaskActive.batchNumEdit.beforeSubmitMethodSettingInPage = function(){
		var rowLength = MaterialBatchNums_dg1490347341669Widget.getRowLength();
for(var i = 0 ; i < rowLength ; i++){
	if(MaterialBatchNums_dg1490347341669Widget.getCellValue(i,"planNum")==""){
		WOM_produceTask_produceTaskActive_batchNumEdit_formDialogErrorBarWidget.showMessage("${getText('WOM.showMessage00000007','"+(i+1)+"')}");
		return false;
	}
}
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	WOM.produceTask.produceTaskActive.batchNumEdit.initCount = 0;
	WOM.produceTask.produceTaskActive.batchNumEdit.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
		var h = $(window.frameElement).parents('div.content').first().height();
		<#else>
		var h = $('#WOM_batchNumEdit_edit_div').parents('div.content').first().height();
		</#if>
		var datagrids = $('body').data('WOM_produceTask_produceTaskActive_batchNumEdit_datagrids');	
		var	conHeight = h-$("#WOM_produceTask_produceTaskActive_batchNumEdit_main_div .edit-tabs").height() - 6;
		panesHeight = conHeight*0.4;
		$("#WOM_produceTask_produceTaskActive_batchNumEdit_main_div .edit-panes-s").each(function(index){
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
							if(WOM.produceTask.produceTaskActive.batchNumEdit.initCount <= 2) {
								setTimeout(function(){WOM.produceTask.produceTaskActive.batchNumEdit.initSize();}, 200);
								WOM.produceTask.produceTaskActive.batchNumEdit.initCount++;
							}/* else {
								WOM.produceTask.produceTaskActive.batchNumEdit.initCount = 0;
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
		WOM.produceTask.produceTaskActive.batchNumEdit.initSize();
		$(window).bind("dialog.resize",function(){WOM.produceTask.produceTaskActive.batchNumEdit.initSize();});
	});
</script>
<script type="text/javascript">
	




	/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_produceTask_batchNumEdit,js,WOM_7.5.0.0_produceTask_ProduceTaskActive,WOM_7.5.0.0) */
// 自定义代码
	//获取url参数值的方法
	function GetQueryString(name)
	{
    	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     	var r = window.location.search.substr(1).match(reg);
     	if(r!=null)return  unescape(r[2]); return null;
	}
	WOM.produceTask.produceTaskActive.batchNumEdit.query_dg1490347341669batchNum_batchText = function(){
      var goodID ="${goodID!}";
      return "goodID="+goodID;
  }
/* CUSTOM CODE END */
</script>

<#if (Parameters.openType)?? && (Parameters.openType) == 'frame'>
</body>
</html>
</#if>