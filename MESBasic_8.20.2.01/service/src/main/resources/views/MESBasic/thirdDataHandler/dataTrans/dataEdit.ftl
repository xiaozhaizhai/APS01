<!-- MESBasic_1/thirdDataHandler/dataEdit -->
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "MESBasic_thirdDataHandler_dataTrans">
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
<#assign userJson= Session.user.toJSON()>
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<#-- 实体对象 -->
<#assign tableObj = dataTrans>
<#-- 命名空间 -->
<#assign editPageNs = "MESBasic.thirdDataHandler.dataTrans.dataEdit">
<#-- 模型名称-->
<#assign modelName = "dataTrans">
<#-- 视图编码-->
<#assign viewCode = "MESBasic_1_thirdDataHandler_dataEdit">
<#-- 实体编码-->
<#assign entity_code = "MESBasic_1_thirdDataHandler">
<#-- 视图名称-->
<#assign viewName = "dataEdit">
<#-- datagrid编码-->
<#assign datagridCode = "MESBasic_thirdDataHandler_dataTrans_dataEdit_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "DataTrans">
<#-- 页面打印按钮 -->
<#assign isPrint = false>
<#-- 控件打印按钮 -->
<#assign controlPrint = false>
<#-- 是否只读 -->
<#assign allReadOnly = false>
<#-- 是否是参照视图 -->
<#assign isReference =false>
<#-- 是否可弃审 -->
<#assign retrialFlag = false>
<#-- formid -->
<#assign editFormId = "MESBasic_thirdDataHandler_dataTrans_dataEdit_form">
<#-- 待办状态 -->
<#assign pendingstatus =( dataTrans.pending.taskDescription)!>
<#-- 打印控件名称 -->
<#assign controlName = "ec.print.controlPrint">
<#-- 批量？？ -->
<#assign isBatch = false>
<#assign payCloseAttention = false>
<#-- 自定义按钮 -->
<#assign operateButtons =[] >
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
	
		
	
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <#assign configTitle = getText('MESBasic.viewtitle.radion1414981093912')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#MESBasic_thirdDataHandler_dataTrans_dataEdit_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('MESBasic.thirdDataHandler.dataTrans.dataEdit');
			MESBasic.thirdDataHandler.dataTrans.dataEdit.currentUser = ${userJson};
			MESBasic.thirdDataHandler.dataTrans.dataEdit.currentStaff = ${staffJson};
			MESBasic.thirdDataHandler.dataTrans.dataEdit.currentDepartment = ${deptJson};
			MESBasic.thirdDataHandler.dataTrans.dataEdit.currentPosition = ${postJson};
			MESBasic.thirdDataHandler.dataTrans.dataEdit.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_thirdDataHandler_dataEdit,head,MESBasic_1_thirdDataHandler_DataTrans,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="" onsubmitMethod="MESBasic.thirdDataHandler.dataTrans.dataEdit.beforeSubmitMethod()" id="MESBasic_thirdDataHandler_dataTrans_dataEdit_form" namespace="/MESBasic/thirdDataHandler/dataTrans/dataEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=MESBasic_1_thirdDataHandler_DataTrans&_bapFieldPermissonModelName_=DataTrans" editPageNs="MESBasic.thirdDataHandler.dataTrans.dataEdit" callback="MESBasic.thirdDataHandler.dataTrans.dataEdit._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="MESBasic_thirdDataHandler_dataTrans_dataEdit">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "MESBasic_thirdDataHandler_dataTrans_dataEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_thirdDataHandler', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>				<div class="edit-panes edit-panes-w edit-container clearfix">
				<div class="cui-elements pd-top">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
<style>
	.surfacefilediv {
		width: calc(100% - 7px) !important;
	}
</style>
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('ec.common.createTime')}" >${getText('ec.common.createTime')}</label>
				</td>
				
						<#assign dataTrans_createTime_defaultValue  = 'currentTime'>
							 							<#assign dataTrans_createTime_defaultValue  = 'currentTime'>
					<#if (dataTrans_createTime_defaultValue)?? &&(dataTrans_createTime_defaultValue)?has_content>
							<#assign dataTrans_createTime_defaultValue  = getDefaultDateTime(dataTrans_createTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  align="left" style="text-align: left;;" >
					
							
							<#if newObj && !(dataTrans.createTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="dataTrans.createTime" value="${dataTrans_createTime_defaultValue!}" type="dateTime"  id="dataTrans.createTime"  view=true cssStyle=""   align="left"/>
								
							<#else>
							<#if (dataTrans.createTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="dataTrans.createTime" value="${dataTrans.createTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="dataTrans.createTime"  view=true cssStyle="" align="left"  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="dataTrans.createTime" value="" type="dateTime" id="dataTrans.createTime" cssStyle=""  view=true align="left"/>
								
							</#if>
							</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1414978911978')}" >${getText('MESBasic.propertydisplayName.radion1414978911978')}</label>
				</td>
				
						<#assign dataTrans_dataTime_defaultValue  = ''>
							 							<#assign dataTrans_dataTime_defaultValue  = ''>
					<#if (dataTrans_dataTime_defaultValue)?? &&(dataTrans_dataTime_defaultValue)?has_content>
							<#assign dataTrans_dataTime_defaultValue  = getDefaultDateTime(dataTrans_dataTime_defaultValue!)?datetime>
					</#if>
					<td  nullable=true class="edit-table-content" celltype="DATETIME"  style="text-align: left;;" >
					
							
							<#if newObj && !(dataTrans.dataTime)?has_content>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="dataTrans.dataTime" value="${dataTrans_dataTime_defaultValue!}" type="dateTime"  id="dataTrans.dataTime"  cssStyle=""  />
								
							<#else>
							<#if (dataTrans.dataTime)??>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="dataTrans.dataTime" value="${dataTrans.dataTime?string('yyyy-MM-dd HH:mm:ss')}" type="dateTime"  id="dataTrans.dataTime"  cssStyle=""  />
								
							<#else>
								
								<@datepicker  onchange="" property_type="DATETIME" cssClass="cui-noborder-input" name="dataTrans.dataTime" value="" type="dateTime" id="dataTrans.dataTime" cssStyle="" />
								
							</#if>
							</#if>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1414980623415')}" >${getText('MESBasic.propertydisplayName.radion1414980623415')}</label>
				</td>
				
						<#assign dataTrans_businessType_defaultValue  = ''>
							 							<#assign dataTrans_businessType_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								<#if newObj>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}" deValue="${dataTrans_businessType_defaultValue!}" formId="MESBasic_thirdDataHandler_dataTrans_dataEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="dataTrans.businessType.id" code="Business_Type" value="${(dataTrans.businessType.id)!}"  />
									
								<#else>
									
									<@systemcode property_type="SYSTEMCODE" showType="SELECTCOMP" onchange=""  viewType="${viewType!}"  formId="MESBasic_thirdDataHandler_dataTrans_dataEdit_form" classStyle="cui-noborder-input" ecFlag=true multable=false  name="dataTrans.businessType.id" code="Business_Type" value="${(dataTrans.businessType.id)!}"  />
									
								</#if>
							
				</td>
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1414979937365')}" >${getText('MESBasic.propertydisplayName.radion1414979937365')}</label>
				</td>
				
						<#assign dataTrans_tag_defaultValue  = ''>
							 							<#assign dataTrans_tag_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
								<input property_type="TEXT" name="dataTrans.tag" id="dataTrans_tag"  style=";" originalvalue="<#if !newObj || (dataTrans.tag)?has_content>${(dataTrans.tag?html)!}<#else>${dataTrans_tag_defaultValue!}</#if>" value="<#if !newObj || (dataTrans.tag)?has_content>${(dataTrans.tag?html)!}<#else>${dataTrans_tag_defaultValue!}</#if>" type="text" class="cui-noborder-input " />
							</div>
							<script type="text/javascript">
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1555573356578')}" >${getText('MESBasic.propertydisplayName.randon1555573356578')}</label>
				</td>
				
						<#assign dataTrans_tvalue_defaultValue  = ''>
							 							<#assign dataTrans_tvalue_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
							<div class="fix-input">
									<input name="dataTrans.tvalue" id="dataTrans_tvalue"  style=";" originalvalue="<#if newObj&& !(dataTrans.tvalue)?has_content>${dataTrans_tvalue_defaultValue!}<#elseif (dataTrans.tvalue)?has_content>#{(dataTrans.tvalue)!; m4M4}</#if>" value="<#if newObj&& !(dataTrans.tvalue)?has_content>${dataTrans_tvalue_defaultValue!}<#elseif (dataTrans.tvalue)?has_content>#{(dataTrans.tvalue)!; m4M4}</#if>" type="text" class="cui-noborder-input numberField" />
							</div>
							<script type="text/javascript">
								$(function(){
									$('#dataTrans_tvalue').unbind('blur').bind('blur',function(){
										var percision = 4;
										if(!isDecimal($(this).val())){
											//workbenchErrorBarWidget.showMessage("${getText('ec.common.validate.double.format.error','${getText("MESBasic.propertydisplayName.randon1555573356578")}')}");
											return;
										}
										if(parseInt(percision) > -1 && $(this).val()!=undefined && $(this).val()!='' && isDecimal($(this).val())){
											$(this).val(($(this).val() * 1).toFixed(percision));
										}
									});
								});
							</script>
							
				</td>
				
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1414980054820')}" >${getText('MESBasic.propertydisplayName.radion1414980054820')}</label>
				</td>
				
						<#assign dataTrans_processed_defaultValue  = ''>
							 							<#assign dataTrans_processed_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
					
							
								
								<input property_type="BOOLEAN" type="checkbox" style=";" class="ec_radio" name="dataTrans.processed_check" originalvalue="<#if !newObj><#if (dataTrans.processed)??>${(dataTrans.processed!false)?string('true','false')}<#else>false</#if><#elseif dataTrans_processed_defaultValue?has_content>${(dataTrans_processed_defaultValue!true)?string}<#else>false</#if>" value="<#if !newObj><#if (dataTrans.processed)??>${(dataTrans.processed!false)?string('true','false')}<#else>false</#if><#else>${(dataTrans_processed_defaultValue!true)?string}</#if>"  />
								
								<input property_type="BOOLEAN" type="hidden" name="dataTrans.processed" originalvalue="<#if ((dataTrans.processed)?? &&  dataTrans.processed)||(dataTrans_processed_defaultValue!)?string=='true'>true<#else>false</#if>" value="<#if ((dataTrans.processed)?? &&  dataTrans.processed)||(dataTrans_processed_defaultValue!)?string=='true'>true<#else>false</#if>"/>
								<script type="text/javascript">
									$(function(){
										try{
											var checkbox_view = $('input[name="dataTrans.processed_check"]');
											if(null != checkbox_view.next().val() && "" != checkbox_view.next().val()){
												if(checkbox_view.val()==checkbox_view.next().val() && checkbox_view.val()=='true'){
													checkbox_view.prop('checked',true);
												}
											}
											checkbox_view.bind('click', function(){
												var tempObj = $('input[name="dataTrans.processed"]');
												CUI('input[name="dataTrans.processed_check"]').each(function(){
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
				</tr><tr >
							 					<td  nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
					
							<label style="width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1414980110091')}" >${getText('MESBasic.propertydisplayName.radion1414980110091')}</label>
				</td>
				
						<#assign dataTrans_content_defaultValue  = ''>
							 							<#assign dataTrans_content_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   colspan="5" align="left" style="text-align: left;;" >
					
							
							<div class="fix-input fix-ie7-textarea"><textarea property_type="TEXT" id="dataTrans_content" originalvalue="<#if !newObj || (dataTrans.content)?has_content>${(dataTrans.content?html)!}<#else>${dataTrans_content_defaultValue?html}</#if>"  name="dataTrans.content" class="cui-noborder-textarea cui-textarea-auto" style=";" ><#if !newObj || (dataTrans.content)?has_content>${(dataTrans.content)!}<#else>${dataTrans_content_defaultValue}</#if></textarea></div>
							
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
		<#if businessCenterList??>
	     	<#list businessCenterList as l>
		<div style="float:none;width:auto;display:none;" class="edit-main grid-s5m0 col-main main-wrap" id="otherContentDiv_${l.relatingModel.code.replace('.','')}">
	     	</div>
	     	</#list>
     	</#if>
     	
		<div id="MESBasic_thirdDataHandler_dataTrans_dataEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="MESBasic.thirdDataHandler.dataTrans.dataEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_thirdDataHandler_dataEdit,html,MESBasic_1_thirdDataHandler_DataTrans,MESBasic_1) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
		<@errorbar id="workbenchErrorBar" offsetY=42 />
		
		<script type="text/javascript">
		$(function(){
			//修复select下拉框不能跟随滚动条一起滚动的bug
			$(".cui-elements").bind("scroll", function(){ 
			    $(".edit-select-box").hide();
				$(".select-iframe").hide();     
			});
			$(window).resize(function(){
				//var isoldie = $.browser.msie&&($.browser.version == "6.0")&&!$.support.style;
				//var body = isoldie?(document.documentElement||document.body):document.body;
				var width = parseInt($('html').width(),10);
				var w1 = parseInt($(window).width(),10);
				if($("#edit_sidebar").css("display") == "block"){
					w1 = w1 - 150;
				}
				if (width <= 800) {
					if($("#edit_sidebar").length==0 || $("#edit_sidebar").css("display")=="none"){
						$("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			MESBasic.thirdDataHandler.dataTrans.dataEdit.initCount = 0;
			MESBasic.thirdDataHandler.dataTrans.dataEdit.initSize = function(nTabIndex){
				var panesHeight;
				var thisHeight;
				var h = $(window).height();
			    var w = $(window).width();
			    var width_ = 0;
			    if($('#edit_side_btn').length > 0){
				 $('#edit_side_btn').hasClass('edit-side-btn-r') ? width_ = 0 : width_ = 145;			
				}
				<#if businessCenterList??&&businessCenterList?size gt 0 >
				if($("#edit_sidebar").css("display") === "none"){
					$("div.edit-workflow").css("left",1);
				}else{
					$("div.edit-workflow").css("left",145);
				}
				$("#edit_sidebar").height(h);
				$("div.edit-sidebar-inner").height(h);
				$("#edit_side_btn").css("top",(h-50)/2);
				CUI('div[id^="otherContentDiv_"]').height(h);
				</#if>
				var conHeight = h-$("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div .edit-head").height()-$("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div .edit-workflow").height()</#if>;
				$("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('MESBasic_thirdDataHandler_dataTrans_dataEdit_datagrids');
				var padding_bottom=16;
				$("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div .pd_bottom,#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div .edit-panes-s").each(function(index){
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
							$(this).parent().height(thisHeight);			//解决存在存在pt的情况，当页面resize时，造成的高度设定不正确问题， BugID=27472			--fukun
							datatableHeight = conHeight - thisHeight;
						}
					} else {
						if(thisHeight > conHeight) {
							$(this).parent().height(conHeight);
							$(this).parent().css("overflow-y","auto");
						} else if(thisHeight && thisHeight > 0) {
							$(this).parent().height(conHeight);  //如果实际高度小于分配给它的高度，就使用分配给它的高度 BugID=18196     --xudihui
						}
					}
					if(datagrids && datagrids.length > 0) {
						if(datagrids[index].length > 0) {
							datatableHeight = datatableHeight; 
							var perHeight = datatableHeight/datagrids[index].length;
							for(var dg=0;dg<datagrids[index].length;dg++) {
								
								var dgwidget = eval(datagrids[index][dg]+'Widget');
								
								if(dgwidget) {
									var dg_container = dgwidget._DT ? ( dgwidget.isJS ? dgwidget._DT.container :  dgwidget._DT.oGridDiv ) : dgwidget.container;
									if ( $( dg_container ).is( ':visible' ) ) {
									   	 if( dgwidget._oGrid || dgwidget._DT._oGrid ){
                                          dgwidget.setHeight(perHeight - 78); 
										  if ( $('._DT_blank','#' + datagrids[index] + '_wrapper').length == 0 ) {
										     $('#' + datagrids[index] + '_wrapper').append('<div style="height:11px" class="_DT_blank" ></div>')  //当使用控件PT的时候，为底部增加10px的div，  xudihui  2015.01.27
										   } 
                                         }
									     else{
									      dgwidget.setHeight(perHeight - 68);
									     }	
									}
								} else {
									if(MESBasic.thirdDataHandler.dataTrans.dataEdit.initCount <= 2) {
										setTimeout(function(){MESBasic.thirdDataHandler.dataTrans.dataEdit.initSize();}, 200);
										MESBasic.thirdDataHandler.dataTrans.dataEdit.initCount++;
									}/* else {
										MESBasic.thirdDataHandler.dataTrans.dataEdit.initCount = 0;
									}*/
								}
							}
						}
					} else {
						if(thisHeight < conHeight){ //当此页签下面的实际内容高度小于分配给它的高度
						    $(this).parent().height(conHeight);
						}
						else{     //当此页签下面的实际内容高度大于分配给它的高度
							$(this).parent().height(conHeight);
							if(($("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div .edit-workflow").length > 0) && ($("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
							 $(this).parent().height(conHeight-14); //有处理结果浮动层的时候，底部留白14像素
							}	
							$(this).parent().css("overflow-y","auto");
						}
					}
					/*
					// 文档申明换成更标准的之后,这个问题不会出现在真实的ie8及以上的浏览器中, 这里的算法会产生其他问题BugID=18197,先注释掉这段代码，后面如果有需要再调整这块代码 ———— lidong
					if($(this).parent().css("overflow-y")=="auto"){  //IE7 下面当内容出现滚动条的时候，不会主动去腾出滚动条的宽度，需要手动计算
						if(YAHOO.env.ua.ie < 8 ){
	                         var width = parseInt($(window).width());
							if($("#edit_side_btn").length>0){
							   $("#edit_side_btn").hasClass('edit-side-btn-r') ? width = width : width = width-145;
							}
							if($('.edit-tabs').length>0){
							   width = width*0.98; //IE7下面把总宽度的98%赋值给它的分配宽度，保持跟IE高版本一致
							}
							var style = ';width:' + (width-48) + 'px;';  //IE7下面把它的分配宽度再减去右侧滚动条的宽度
							$(this).attr('style',style);
							$(this).parent().parent().find('.edit-datatable').each(function(){ //IE7下面如果pt内容为空，直接隐藏，不然会有一个默认高度
								if($(this).html() ==''){$(this).css('display','none');}
							});
						}					
					}
					*/						
				});
			}
			$(function(){
				$('#MESBasic_thirdDataHandler_dataTrans_dataEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				MESBasic.thirdDataHandler.dataTrans.dataEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				MESBasic.thirdDataHandler.dataTrans.dataEdit.initSize();
				if(YAHOO.env.ua.ie == 6){
					$("#loading_wrap_first").css("display","block");
				}
				$("#load_mask_first").remove();
				$("#load_iframe_ie_first").remove();
				$("#loading_wrap_first").remove();
				<#if businessCenterList??&&businessCenterList?size gt 0 >
					$(window).resize(function(){
						for(var i=0; i<CUI.DataTable.Arrays.length; i++){
							if( CUI.DataTable.Arrays[i] && document.getElementById( CUI.DataTable.Arrays[i].dataTableId ) &&  $( CUI.DataTable.Arrays[i].container ).is(':visible') ){
								CUI.DataTable.Arrays[i]._initDomElements();
							}else if( CUI.DataTable.Arrays[i] && !document.getElementById( CUI.DataTable.Arrays[i].dataTableId ) ){
								CUI.DataTable.Arrays[i] = null;
								CUI.DataTable.Arrays.splice(i, 1);
							}
						}
					})
					$(".edit-workflow").css("left",145);
					$("#edit_side_btn").toggle(function(){
						if(parseInt($("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div").css("width"),10)==650){
							$("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//MESBasic.thirdDataHandler.dataTrans.dataEdit.resizeLayout();
						//MESBasic.thirdDataHandler.dataTrans.dataEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div").css("width"),10)==800){
							$("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//MESBasic.thirdDataHandler.dataTrans.dataEdit.resizeLayout();
						//MESBasic.thirdDataHandler.dataTrans.dataEdit.initSize();
						$('body').trigger('resize');
					});
				<#else>	
					$(".main-wrap").css("margin-left",0);
					$(".col-sub").width(0);
					$("#edit_side_btn").css("left",0);
					$(".edit-workflow").css("left",1);
					
				</#if>

				if($("ul.edit-tabs li").length > 0) {
			     	$("ul.edit-tabs").tabs("div.edit-panes > div");
			    }
				var datatableHeight;
				var bh = $(".edit-workflow tr:gt(0)").height();
				<#if pendingId?? || editNew>
				$("#workflow_toggle").toggle(function(){
					$(".edit-workflow tr:gt(0)").hide();
					MESBasic.thirdDataHandler.dataTrans.dataEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					MESBasic.thirdDataHandler.dataTrans.dataEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){MESBasic.thirdDataHandler.dataTrans.dataEdit.initSize();});
				/*
				MESBasic.thirdDataHandler.dataTrans.dataEdit.resizeLayout=function(){
					CUI("div[class='elm-layout-doc elm-layout-doc-in-wrap']").each(function(){
						var id=CUI(this).attr("id");
						var layoutObj=eval(id+"Widget");
						layoutObj.resize();
					})
				}
				*/
			});
		</script>
		<script type="text/javascript">
		
		$(function(){
			//解决合并单元格后，同行（tr）内的所有td跨行数（rowspan）相同时,组态期表现为tr占n行单元格，在运行期错乱的bug
			var editContainer = $( 'div.edit-container' );
		    var editTr=editContainer.find(".edit-table tr");
		    $.each(editTr,function(i,item){
		        var editTd=$(item).find("td");
		        var isSameRowSpan=true;//单元格跨行数是否相等
		        var rsTemp;//跨行数
		        var csTemp=0;//跨列数（需累加）
		        for(var k=0;k<editTd.length;k++){
		           var ele=editTd[k];
		           var rowspan=$(ele).attr("rowspan");
		           var colspan=$(ele).attr("colspan");
		           if(!rowspan||rowspan=="") rowspan=1;
		           if(!colspan||colspan=="") colspan=1;
		           csTemp+=Number(colspan);
		           if(!rsTemp){
		              rsTemp=Number(rowspan);
		           }else{
		              if(rsTemp!=rowspan){
		                 isSameRowSpan=false;
		              }
		           }  
		        }
		        //单元格跨行数相等且不为1的情况下，重组本行内容
		        if(isSameRowSpan&&rsTemp!=1){
		           recombineTr(item,rsTemp,csTemp);
		        }
		    });
		    //对满足条件的行进行跨行重组
		    function recombineTr(editTr,rsNum,csNum){
		        var editTd=$(editTr).find("td");
		        $.each(editTd,function(i,item){
		           $(item).attr({"rowspan":"1","data-row":rsNum});
		        });
		        var appendTr="";
		        for(var i=0;i<rsNum-1;i++){
		          appendTr+="<tr data-tag='appendrow'><td class='edit-table-symbol' colspan='"+csNum+"'>&nbsp;</td></tr>";
		        }
		        $(appendTr).insertAfter(editTr);
		    }
		});

		MESBasic.thirdDataHandler.dataTrans.dataEdit.validate = function(){
		    <#if dealSet?? && dealSet == 1>
			var cancelItem = $('input[name="workFlowVarStatus"]');
	        validateRequiredFlag = $('input[name="operateType"]').val()=='submit' && (!cancelItem || cancelItem.length == 0 || !(cancelItem.val()=='cancel'));
			if(validateRequiredFlag){
				var comments = $.trim(CUI("#workflow_comments").val());
			 	if(comments != null && comments == ""){
		        	workbenchErrorBarWidget.showMessage("${getText('ec.property.dealinfo.isNotNull')}", 'f');
		        	return false;
				}
			}
		    </#if>
		    return true;
		}
		MESBasic.thirdDataHandler.dataTrans.dataEdit.beforeSaveProcess = function(){

			var extraCol = '<extra-data>';
			$('#MESBasic_thirdDataHandler_dataTrans_dataEdit_form').trigger('beforeSubmit');
			//dataTrans.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="dataTrans.extraCol"]').val(extraCol);
		}
		MESBasic.thirdDataHandler.dataTrans.dataEdit.processDataGrid = function(){
		};
		MESBasic.thirdDataHandler.dataTrans.dataEdit.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!MESBasic.thirdDataHandler.dataTrans.dataEdit.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//MESBasic.thirdDataHandler.dataTrans.dataEdit.beforeSaveProcess();

			//MESBasic.thirdDataHandler.dataTrans.dataEdit.processDataGrid();
			$('#MESBasic_thirdDataHandler_dataTrans_dataEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('MESBasic_thirdDataHandler_dataTrans_dataEdit_form','MESBasic_thirdDataHandler_dataTrans_dataEdit_datagrids')) {      
		            return "${getText('ec.view.losedata')}";      
		        }else{
		        	 if($('#workflow_comments').length!=0){
			        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
			        		return "${getText('ec.view.losedata')}";
			        	}
				     }  
		        }   
	    });
		<#else>
		$(window).bind('beforeunload',function(){
		        if($('#workflow_comments').length!=0){
		        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
		        		return "${getText('ec.view.losedata')}";
		        	}
		        }  		  
		});		
		</#if>
		//打印
		MESBasic.thirdDataHandler.dataTrans.dataEdit.print = function(){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			var printId = 0;
			var printVersion = 0;
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
							printId = msg.id;
							printVersion = msg.version;
						}
					}
				});
				$("#printCookie_id").val(printId);
				$("#printCookie_version").val(printVersion);
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
				data += "&dealInfoGroup=" + $('#dealInfoGroup').val();

				var url = document.location.href;
				// TODO 去掉url后的'#'，将来页面上有锚点时，在打印可能也会有问题
				while(url.endsWith('#')) {
					url = url.substring(0, url.length - 1);
				}
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
		
		MESBasic.thirdDataHandler.dataTrans.dataEdit.saveSetting = function(){
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
		
		MESBasic.thirdDataHandler.dataTrans.dataEdit.printSetting = function(){
			var viewCode = $('input[name="viewCode"]').val();
			var value = "";
			var printId = 0;
			var printVersion = 0;
			if(viewCode!=undefined && viewCode!=null && viewCode!=''){
				$.ajax({
					url : "/ec/print/getAjaxSetting.action",
					type : 'post',
					async : false,
					data:{"printCookie.type":viewCode},
					success : function(msg) {
						if(msg!=null){
							value = msg.value;
							printId = msg.id;
							printVersion = msg.version;
						}
					}
				});
				$("#printCookie_id").val(printId);
				$("#printCookie_version").val(printVersion);
				var values = {};
				if(value!=undefined && value!=null && value != ""){
					values = value.split(/\|/g);
				}
				if(values != null && values.length > 0){
					for(var i=0;i < values.length;i++){
						var item = values[i].split("=");
						if(item[1]=='true'){
							$('#' + item[0]).prop('checked',true);
						}else{
							$('#' + item[0]).prop('checked',false);
						}
					}
				}else{
					$('#mainContent').prop('checked',true);
					$('#dealInfo').prop('checked',true);
					$('#attachmentInfo').prop('checked',true);
				}
				<#if isWorkflow?? && isWorkflow>
				$('td[name="deal"]').show();
				<#else>
				$('td[name="deal"]').hide();
				$('#dealInfo').prop('checked',false);
				</#if>
				<#if isAttachment?? && isAttachment>
				$('td[name="att"]').show();
				<#else>
				$('td[name="att"]').hide();
				$('#attachmentInfo').prop('checked',false);
				</#if>
				MESBasic.thirdDataHandler.dataTrans.dataEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.thirdDataHandler.dataTrans.dataEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				MESBasic.thirdDataHandler.dataTrans.dataEdit.settingDialog.show();
			}
		}
		
		
		MESBasic.thirdDataHandler.dataTrans.dataEdit._callBackInfo = function(res){
			if(res.dealSuccessFlag){
					var showMsg ;
				if(res.operateType == 'save'){
					showMsg = "${getText("ec.common.savesuccessful")}";
				}else{
					showMsg = "${getText("ec.common.saveandclosesuccessful")}";
				}
				
				//提交成功时隐藏之前的错误信息
				workbenchErrorBarWidget.close();
				
				if(containerLoadPanelWidget && containerLoadPanelWidget.loading && YUD.get("loading_wrap")){
 					YUD.get("loading_wrap").innerHTML = "<div class='success-middle'></div>" ;
 				}

 				try{
					window.opener.refreshPortal('workflow');
					window.opener.timeData();
				}catch(e){
					try{
 						window.opener.MESBasic.thirdDataHandler.dataTrans.editCallBackInfo(res); 						
					}catch(e2){
						try{
							if(typeof window.opener.refViewRefresh == 'function'){
								window.opener.refViewRefresh()
							} else {
								window.opener.location.reload();
							}
						}catch(e3){}
					}
				};

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.MESBasic.thirdDataHandler.dataTrans.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		refViewRefresh = function(){
			if($("[name='refViewRefresh']").val() != undefined && "" != $("[name='refViewRefresh']").val()){
				eval($("[name='refViewRefresh']").val());
			}
		}
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany,isObjCustomProp,objCustomPropNames,viewCode){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				MESBasic.thirdDataHandler.dataTrans.dataEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				MESBasic.thirdDataHandler.dataTrans.dataEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				MESBasic.thirdDataHandler.dataTrans.dataEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				MESBasic.thirdDataHandler.dataTrans.dataEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				MESBasic.thirdDataHandler.dataTrans.dataEdit._refViewCode_IE = viewCode;
			} else {
				MESBasic.thirdDataHandler.dataTrans.dataEdit._refViewCode_IE = '';
			}
			MESBasic.thirdDataHandler.dataTrans.dataEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		MESBasic.thirdDataHandler.dataTrans.dataEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			MESBasic.thirdDataHandler.dataTrans.dataEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			MESBasic.thirdDataHandler.dataTrans.dataEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			MESBasic.thirdDataHandler.dataTrans.dataEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			MESBasic.thirdDataHandler.dataTrans.dataEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		MESBasic.thirdDataHandler.dataTrans.dataEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(MESBasic.thirdDataHandler.dataTrans.dataEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(MESBasic.thirdDataHandler.dataTrans.dataEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				MESBasic.thirdDataHandler.dataTrans.dataEdit.gridEventObj = gridEventObj;
				callbackName = "MESBasic.thirdDataHandler.dataTrans.dataEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "MESBasic.thirdDataHandler.dataTrans.dataEdit.getMultiselectCallBackInfo_DG" : "MESBasic.thirdDataHandler.dataTrans.dataEdit.getcallBackInfo_DG";
				MESBasic.thirdDataHandler.dataTrans.dataEdit._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="MESBasic.thirdDataHandler.dataTrans.dataEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				MESBasic.thirdDataHandler.dataTrans.dataEdit._prefix = _prefix.substring(1);
			}
			
			MESBasic.thirdDataHandler.dataTrans.dataEdit._oGrid = oGrid;
			MESBasic.thirdDataHandler.dataTrans.dataEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					MESBasic.thirdDataHandler.dataTrans.dataEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					MESBasic.thirdDataHandler.dataTrans.dataEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					MESBasic.thirdDataHandler.dataTrans.dataEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					MESBasic.thirdDataHandler.dataTrans.dataEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					MESBasic.thirdDataHandler.dataTrans.dataEdit._refViewCode = oColumn.viewCode;
				} else {
					MESBasic.thirdDataHandler.dataTrans.dataEdit._refViewCode = '';
				}
			} else {
				MESBasic.thirdDataHandler.dataTrans.dataEdit._isObjCustomProp = false;
				MESBasic.thirdDataHandler.dataTrans.dataEdit._objCustomPropNames = '';
				MESBasic.thirdDataHandler.dataTrans.dataEdit._refViewCode = '';
			}
			if (MESBasic.thirdDataHandler.dataTrans.dataEdit._isObjCustomProp == true && MESBasic.thirdDataHandler.dataTrans.dataEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				MESBasic.thirdDataHandler.dataTrans.dataEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack = customCallBack;
			}
			if(MESBasic.thirdDataHandler.dataTrans.dataEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.thirdDataHandler.dataTrans.dataEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof MESBasic.thirdDataHandler.dataTrans.dataEdit._querycustomFuncN == "function") {
				refparam += MESBasic.thirdDataHandler.dataTrans.dataEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			MESBasic.thirdDataHandler.dataTrans.dataEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.thirdDataHandler.dataTrans.dataEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(MESBasic.thirdDataHandler.dataTrans.dataEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.thirdDataHandler.dataTrans.dataEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			MESBasic.thirdDataHandler.dataTrans.dataEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'MESBasic.thirdDataHandler.dataTrans.dataEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.thirdDataHandler.dataTrans.dataEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(MESBasic.thirdDataHandler.dataTrans.dataEdit.query_"+obj+")!='undefined'") ? eval('MESBasic.thirdDataHandler.dataTrans.dataEdit.query_'+obj+'()') : null;
			return str;
		};
		MESBasic.thirdDataHandler.dataTrans.dataEdit.getcallBackGroupInfo = function(obj){
			var ids = "";
			var names = "";
			for(var i = 0 ; i < obj.length; i++){
				ids += "," + obj[i].id;
				names += "," + obj[i].name;
			}
			if(ids){ids = ids.substring(1);}
			if(names){names = names.substring(1);}
			$('#groupInfoIds').val(ids);
			$('#groupInfos').val(names);
			MESBasic.thirdDataHandler.dataTrans.dataEdit._dialog.close();
		}
		MESBasic.thirdDataHandler.dataTrans.dataEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('MESBasic_thirdDataHandler_dataTrans_dataEdit_form',obj[0], MESBasic.thirdDataHandler.dataTrans.dataEdit._prefix, MESBasic.thirdDataHandler.dataTrans.dataEdit._sUrl);
			CUI.commonFills('MESBasic_thirdDataHandler_dataTrans_dataEdit_form',MESBasic.thirdDataHandler.dataTrans.dataEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (MESBasic.thirdDataHandler.dataTrans.dataEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack) {
					eval(MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack);
					MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.thirdDataHandler.dataTrans.dataEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		MESBasic.thirdDataHandler.dataTrans.dataEdit.getcallBackInfo_DG_IE = function(obj){
			if(MESBasic.thirdDataHandler.dataTrans.dataEdit._customBeforeCallBack) {
				var flag = eval(MESBasic.thirdDataHandler.dataTrans.dataEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = MESBasic.thirdDataHandler.dataTrans.dataEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( MESBasic.thirdDataHandler.dataTrans.dataEdit._isObjCustomProp_IE == true && MESBasic.thirdDataHandler.dataTrans.dataEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,MESBasic.thirdDataHandler.dataTrans.dataEdit._sUrl,MESBasic.thirdDataHandler.dataTrans.dataEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.thirdDataHandler.dataTrans.dataEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (MESBasic.thirdDataHandler.dataTrans.dataEdit._isObjCustomProp_IE == true && MESBasic.thirdDataHandler.dataTrans.dataEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = MESBasic.thirdDataHandler.dataTrans.dataEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = MESBasic.thirdDataHandler.dataTrans.dataEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
				for( var i = 0; i < xmlHead.children().length; i++ ){
					var tagName = xmlHead.children()[i].tagName;
					if ( tagName == (rootKey + 'MainDisplay') ) {
						try{
							var showVal = eval('jsonObj.' + showName);
						}catch(e){
							var showVal = eval('jsonObj["' + showName + '"]');
						}
						if (showVal != undefined ) {
							gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,showVal);
						} else {
							try {
								var trueVal = eval('jsonObj.' + trueName);
							} catch(e) {
								var trueVal = eval('jsonObj["' + trueName + '"]');
							}
							trueVal = ( trueVal != undefined ? trueVal : '' );
							gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,trueVal);
						}
					} else if ( tagName == rootKey ) {
						try{
							var trueVal = eval('jsonObj.' + trueName);
						}catch(e){
							var trueVal = eval('jsonObj["' + trueName + '"]');
						}
						trueVal = ( trueVal != undefined ? trueVal : '' );
						gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,trueVal);
					}
				}
			} else {
				for( var i = 0; i < xmlHead.children().length; i++ ){
					var tagName = xmlHead.children()[i].tagName;
					if( tagName.indexOf(rootKey) == 0 ){
						try{
							var value = eval('jsonObj.' + tagName.substring(rootKey.length+1));
						}catch(e){
							var value = eval('jsonObj["' + tagName.substring(rootKey.length+1)+'"]');
						}
						//判断符合条件的key是否存在
						value = ( value != undefined ? value : '' );
						gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);			
					}
				}
			}
			// 自定义字段参照回填
			if ( $('#dg_cp_info_' + gridEventObj.oGrid._DT.opts.id).length > 0 ) {
				var dg_cp_info = $('#dg_cp_info_' + gridEventObj.oGrid._DT.opts.id).val();
				var id = jsonObj.id;
				var relationMap;
				if (dg_cp_info && id && MESBasic.thirdDataHandler.dataTrans.dataEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + MESBasic.thirdDataHandler.dataTrans.dataEdit._refViewCode_IE + '&id=' + id,
						success : function(res){
							if (res.dealSuccessFlag && res.relationMap) {
								relationMap = res.relationMap;
							}
						}
					});
					if (relationMap) {
						var objs = new Object();
						var infoArr = dg_cp_info.split(',');
						for (var n in infoArr) {
							var info = infoArr[n].split('||');
							var key = info[0];
							var name = info[1];
							var propCode = '';
							if (info.length > 2) {
								propCode = info[2];
							}
							var val = relationMap[key];
							if (val) {
								objs[name] = val;
								if (propCode) {
									$.ajax({
										async   : false,
										type    : 'POST',
										url     : '/foundation/customProp/getMainDisplayValue.action',
										data    : 'code=' + propCode + '&id=' + val,
										success : function(res){
											if (res.dealSuccessFlag && res.displayValue) {
												var displayName = name + 'MainDisplay';
												objs[displayName] = res.displayValue;
											}
										}
									});
								}
							}
						}
						// console.log(objs);
						if (objs) {
							for( var i = 0; i < xmlHead.children().length; i++ ){
								var tagName = xmlHead.children()[i].tagName;
								try{
									var value = eval('objs.' + tagName);
								}catch(e){
									var value = eval('objs["' + tagName + '"]');
								}
								if( value != undefined ){
									gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
								}else if( objs.hasOwnProperty(  tagName  ) ){
									value = '';
									gridEventObj.oGrid.setCellValue(gridEventObj.nRow,tagName,value);
								}								
							}
						}
					}
				}
			}
			try{
				if(MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack) {
					eval(MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack);
					MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.thirdDataHandler.dataTrans.dataEdit._dialog.close();
			} catch(e){}
			
			try{
				var errorMsg = ''
				for ( var item in  CUI.error_msg_DG_CP_map ){
					errorMsg += ( '<b>' + gridEventObj.oGrid._DT._oGrid.ColGetProperty(item,'caption') +  '</b>第<b>' + ( gridEventObj.nRow + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
				}
				if( errorMsg ){
					workbenchErrorBarWidget.showMessage( errorMsg );
				}	
			}catch(e){};
			
			gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
		}
		
		MESBasic.thirdDataHandler.dataTrans.dataEdit.getcallBackInfo_DG = function(obj){
			if(MESBasic.thirdDataHandler.dataTrans.dataEdit._customBeforeCallBack) {
				var flag = eval(MESBasic.thirdDataHandler.dataTrans.dataEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(MESBasic.thirdDataHandler.dataTrans.dataEdit._currRow).next().length==0){
						MESBasic.thirdDataHandler.dataTrans.dataEdit._oGrid.addNewRow();
					}	
					MESBasic.thirdDataHandler.dataTrans.dataEdit._currRow = $(MESBasic.thirdDataHandler.dataTrans.dataEdit._currRow).next();
					$(MESBasic.thirdDataHandler.dataTrans.dataEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(MESBasic.thirdDataHandler.dataTrans.dataEdit._currRow,obj[i], MESBasic.thirdDataHandler.dataTrans.dataEdit._prefix, MESBasic.thirdDataHandler.dataTrans.dataEdit._sUrl);
				if (MESBasic.thirdDataHandler.dataTrans.dataEdit._isObjCustomProp == true && MESBasic.thirdDataHandler.dataTrans.dataEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(MESBasic.thirdDataHandler.dataTrans.dataEdit._currRow,MESBasic.thirdDataHandler.dataTrans.dataEdit._prefix,obj[i],MESBasic.thirdDataHandler.dataTrans.dataEdit._oGrid,MESBasic.thirdDataHandler.dataTrans.dataEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(MESBasic.thirdDataHandler.dataTrans.dataEdit._currRow,MESBasic.thirdDataHandler.dataTrans.dataEdit._prefix,obj[i],MESBasic.thirdDataHandler.dataTrans.dataEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + MESBasic.thirdDataHandler.dataTrans.dataEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + MESBasic.thirdDataHandler.dataTrans.dataEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && MESBasic.thirdDataHandler.dataTrans.dataEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + MESBasic.thirdDataHandler.dataTrans.dataEdit._refViewCode + '&id=' + id,
							success : function(res){
								if (res.dealSuccessFlag && res.relationMap) {
									relationMap = res.relationMap;
								}
							}
						});
						if (relationMap) {
							var objs = new Object();
							var infoArr = dg_cp_info.split(',');
							for (var n in infoArr) {
								var info = infoArr[n].split('||');
								var key = info[0];
								var name = info[1];
								var propCode = '';
								if (info.length > 2) {
									propCode = info[2];
								}
								var val = relationMap[key];
								if (val) {
									name = MESBasic.thirdDataHandler.dataTrans.dataEdit._oGrid.configs.hidekeyPrefix + name;
									objs[name] = val;
									if (propCode) {
										$.ajax({
											async   : false,
											type    : 'POST',
											url     : '/foundation/customProp/getMainDisplayValue.action',
											data    : 'code=' + propCode + '&id=' + val,
											success : function(res){
												if (res.dealSuccessFlag && res.displayValue) {
													var displayName = name + 'MainDisplay';
													objs[displayName] = res.displayValue;
												}
											}
										});
									}
								}
							}
							// console.log(objs);
							if (objs) {
								CUI.commonFills_DG_CP(MESBasic.thirdDataHandler.dataTrans.dataEdit._currRow, objs, MESBasic.thirdDataHandler.dataTrans.dataEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack) {
					eval(MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack);
					MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.thirdDataHandler.dataTrans.dataEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + MESBasic.thirdDataHandler.dataTrans.dataEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		MESBasic.thirdDataHandler.dataTrans.dataEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(MESBasic.thirdDataHandler.dataTrans.dataEdit._oGrid, MESBasic.thirdDataHandler.dataTrans.dataEdit._currRow, MESBasic.thirdDataHandler.dataTrans.dataEdit._key, MESBasic.thirdDataHandler.dataTrans.dataEdit._displayFieldName, obj[i])
			}
			try{
				if(MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack) {
					eval(MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack);
					MESBasic.thirdDataHandler.dataTrans.dataEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.thirdDataHandler.dataTrans.dataEdit._dialog.close();
			} catch(e){}
		};
		
		MESBasic.thirdDataHandler.dataTrans.dataEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						MESBasic.thirdDataHandler.dataTrans.dataEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_thirdDataHandler_dataTrans_dataEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			MESBasic.thirdDataHandler.dataTrans.dataEdit.onloadForProduct();
			CUI("#dataTransbusinessTypeid").setValue("Business_Type/1");
CUI("#dataTransbusinessTypeid").disabledSelect();
		});

		MESBasic.thirdDataHandler.dataTrans.dataEdit.beforeSubmitMethodSettingInPage = function(){
			MESBasic.thirdDataHandler.dataTrans.dataEdit.onsaveForProduct();
		};
		MESBasic.thirdDataHandler.dataTrans.dataEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  MESBasic.thirdDataHandler.dataTrans.dataEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		MESBasic.thirdDataHandler.dataTrans.dataEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
			var id="#otherContentDiv_"+relatingModelCode;
			if(url.indexOf('?')==-1){
				url+="?mainBusinessId="+mainEntityId+"&businessCenterCode="+businessCenterCode;
			}else{
				url+="&mainBusinessId="+mainEntityId+"&businessCenterCode="+businessCenterCode;
			}
			if(showType == 'PART') {
				url += "&viewShowType=" + showType;
			}
			url += "&useInBusiness=yes";
			$('div[id^="otherContentDiv_"]').each(function(){
				CUI(this).hide();
			});
			CUI(id).show();
			if(CUI(id).html() == null || $.trim(CUI(id).html()) == ""){
				CUI(id).load(url);
				setTimeout(function(){
					CUI("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div").hide();
				},100);
				//CUI("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		MESBasic.thirdDataHandler.dataTrans.dataEdit.showThis = function(){
			if(!CUI("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div").is(':visible')) {
				CUI("#MESBasic_thirdDataHandler_dataTrans_dataEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		MESBasic.thirdDataHandler.dataTrans.dataEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			MESBasic.thirdDataHandler.dataTrans.dataEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "MESBasic_thirdDataHandler_dataTrans_dataEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=MESBasic&modelName=MESBasic_1_thirdDataHandler_DataTrans&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.thirdDataHandler.dataTrans.dataEdit.auditDialog.show();
			</#if>
		}
		
		
		MESBasic.thirdDataHandler.dataTrans.dataEdit.showInfoDialog=function(mode){
			
			MESBasic.thirdDataHandler.dataTrans.dataEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "MESBasic_thirdDataHandler_dataTrans_dataEdit_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.thirdDataHandler.dataTrans.dataEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		MESBasic.thirdDataHandler.dataTrans.dataEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_thirdDataHandler");
			}
		}
		
		MESBasic.thirdDataHandler.dataTrans.dataEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/MESBasic/thirdDataHandler/dataTrans/dealInfo-list.action&dlTableInfoId=${(dataTrans.tableInfoId)?default('')}");
			}
		}
		MESBasic.thirdDataHandler.dataTrans.dataEdit.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=MESBasic_1_thirdDataHandler_DataTrans&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(dataTrans.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=MESBasic_1_thirdDataHandler_DataTrans&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(dataTrans.tableInfoId)?default('')}");
				}		
			}else{
			  if(!isIE8){
			    //h5展现的情况下需重新适应视图大小
			    setTimeout(function(){
			      $("#flowH5Frame").contents().find("#resetFitView").trigger("click");//视图自适应容器大小 
			    },100); 
			  } 
			}
		}
		MESBasic.thirdDataHandler.dataTrans.dataEdit.supervision=function(){
			MESBasic.thirdDataHandler.dataTrans.dataEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(dataTrans.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				MESBasic.thirdDataHandler.dataTrans.dataEdit.modifyOwnerStaffDialog.show();
		}
		

		/* CUSTOM CODE START(view-EDIT-MESBasic_1_thirdDataHandler_dataEdit,js,MESBasic_1_thirdDataHandler_DataTrans,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		MESBasic.thirdDataHandler.dataTrans.dataEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_thirdDataHandler_dataEdit,onloadForProduct,MESBasic_1_thirdDataHandler_DataTrans,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */
		}

		MESBasic.thirdDataHandler.dataTrans.dataEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_thirdDataHandler_dataEdit,onsaveForProduct,MESBasic_1_thirdDataHandler_DataTrans,MESBasic_1) */
// 自定义代码

/* CUSTOM CODE END */		
		}
		
		</script>
		<script type="text/javascript">
		
		var __last_click_item = null;
		$(".edit-tabs li").click(function(){
			var li = $(this);
			var ul=$("#flowHead").parent()[0];
			if(__last_click_item != null){
				$(ul).children().eq(__last_click_item).next().addClass("bar");
			}
			if(__last_click_item == null){
				__last_click_item = li.index();
			}
			__last_click_item = li.index();
			if(li.index() == ($(".edit-tabs li").length-1)){
			}else{
				li.next().removeClass("bar");
			}
			if(li.index() != 0){
				li.addClass("bar");
			}
			// 触发 resize 事件, 解决用户在其他页签下缩放窗口后，再切换回来时pt等元素宽度会对不上
			setTimeout( function(){
				$(window).trigger('resize');
			}, 100)
		})
		
		</script>
		<script type="text/javascript">
			$(function(){
				$(".edit-btn").hover(
				  function () {
					$(this).addClass("edit-btn-hover");
				  },
				  function () {
					$(this).removeClass("edit-btn-hover");
				  });
				  $(".edit-btn").mousedown(
				  function () {
					$(this).addClass("edit-btn-click");
				  });
				  $(".edit-btn").mouseup(
				  function () {
					$(this).removeClass("edit-btn-click");
				  });
			})
		</script>
		</@s.form>
		<#if businessCenterList??&&businessCenterList?size gt 0 >
		<script type="text/javascript">
			$(function(){
				$(".col-sub").css("display","block");
				$(".main-wrap").css("margin-left",145);
			})
		</script>
		<div class="col-sub">
			<div id="edit_side_btn" class="edit-side-btn"></div>
			<div class="edit-sidebar" id="edit_sidebar" style='height:1000px;'>
			<div class="edit-sidebar-inner" style='height:1000px;'>
				<div class="sidebar-top"><a href="#"  onclick="MESBasic.thirdDataHandler.dataTrans.dataEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="MESBasic.thirdDataHandler.dataTrans.dataEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(dataTrans.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
							</#if>
						</li>
					    </#list>
					</ul>
				</div>
			</div>
			</div>				
		</div>
		</#if>
		
	<div id="printSettingDiv" style="display:none;width:100%;height:100%;text-align:center">
		<input type="hidden" id="printCookie_id" />
		<input type="hidden" id="printCookie_version" />
		<table width="100%" height="100%" align="center" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="td_right">
					<input type="checkbox" name="mainContent" id="mainContent" checked="checked" />
				</td>
				<td class="td_left">
					<label>正文</label>
				</td>
				<td class="td_right" name="att">
					<input type="checkbox" name="attachmentInfo" id="attachmentInfo" checked="checked"/>
				</td>
				<td class="td_left" name="att">
					<label>附件信息</label>
				</td>
				<td class="td_right" name="deal">
					<input type="checkbox" name="dealInfo" id="dealInfo" checked="checked"/>
				</td>
				<td class="td_left" name="deal">
					<label>处理意见</label>
				</td>
			</tr>
		</table>
	</div>
		<!--[if IE 6]><div style="clear:both;"></div><![endif]-->
		<iframe style="display:none;" id="downloadFrame" src="about:blank"/>
	</body>
</html>