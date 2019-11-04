<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "MESBasic_material_material">
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <#assign configTitle = getText('MESBasic.viewtitle.radion1415321085000')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		body{_width:100%;}
		.ewc-dialog-el{height:100%;}
		.flow-height{
			height:97%;
			height:94%\9;
		}
		#MESBasic_material_material_materialEdit_form{float:left;width:100%;}
		.pd-top{padding-top:10px}
		</style>
		<script type="text/javascript">
			CUI.ns('MESBasic.material.material.materialEdit');
			MESBasic.material.material.materialEdit.currentUser = ${userJson};
			MESBasic.material.material.materialEdit.currentStaff = ${staffJson};
			MESBasic.material.material.materialEdit.currentDepartment = ${deptJson};
			MESBasic.material.material.materialEdit.currentPosition = ${postJson};
			MESBasic.material.material.materialEdit.currentCompany = ${compJson};
		</script>
    </head>
	<body>
		<@loadpanel/>
		<div id="load_mask_first" class="load_mask_first"></div>
		<iframe id="load_iframe_ie_first" class="load_iframe_ie" style="z-index: 199; display: block;"></iframe>
		<div id="loading_wrap_first" class="loading_wrap_first">
			<div class="loading_process">
				<div class="loading_msg_first">${getText("foundation.common.data.waiting")}</div>
			</div>
		</div>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="" onsubmitMethod="MESBasic.material.material.materialEdit.beforeSubmitMethod()" id="MESBasic_material_material_materialEdit_form" namespace="/MESBasic/material/material/materialEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=MESBasic_1_material_Material&_bapFieldPermissonModelName_=Material" callback="MESBasic.material.material.materialEdit._callBackInfo" ecform="true">
		<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
		<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="MESBasic_material_material_materialEdit_main_div">
    					<div class="edit-head">
    						<#if !((Parameters.mobileFlag)?? && Parameters.mobileFlag == 'true')>
    						<div class="edit-menubar">
								<div class="fl">
									<#if !((material.status)?? && material.status == 77)>
									<div class="edit-btn" id="edit-save-btn" onclick="MESBasic.material.material.materialEdit.save()">
										<a class="cui-btn-l">&nbsp;</a>
										<a class="cui-btn-c">${getHtmlText("ec.flow.save")}</a>
										<a class="cui-btn-r">&nbsp;</a>
									</div>
									<#if pendingId??>
									<div class="edit-btn"  onclick="MESBasic.material.material.materialEdit.proxyPending(${pendingId})">
										<a class="cui-btn-l" >&nbsp;</a>
										<a class="cui-btn-c">${getHtmlText("ec.pending.proxyPending")}</a>
										<a class="cui-btn-r">&nbsp;</a>
									</div>
									</#if>
									</#if>
									<div class="edit-btn"  onclick="window.close()">
										<a class="cui-btn-l">&nbsp;</a>
										<a class="cui-btn-c">${getHtmlText("foundation.common.closeWindow")}</a>
										<a class="cui-btn-r">&nbsp;</a>
									</div>
								</div>
								<div class="fr">
									<ul>
										<li onMouseOver="this.style.color='#ffc001'" onMouseOut="this.style.color='#FFFFFF'"><a onclick="MESBasic.material.material.materialEdit.showInfoDialog('fileUpload')" <#if id??>style="position:relative\0;position:static\9\0;bottom:1px\0;"</#if>>${getHtmlText("foundation.upload.attachment")}<span id="MESBasic_material_material_materialEdit_form_attcount"></span></a></li>
									</ul>
								</div>
							</div>
							</#if>
							<div class="edit-title fix">								
								<span class="edit-title-edit"></span>
								<h1>${configTitle}</h1>
							</div>
    					</div>
    					<div class="edit-main" id="MESBasic_material_material_materialEdit">
    						<div class="edit-content">
								<input type="hidden" id="dealInfoGroup" name="dealInfoGroup" value="">
								<input type="hidden" name="viewselect" value="materialEdit">
								<input type="hidden" name="datagridKey" value="MESBasic_material_material_materialEdit_datagrids">
								<input type="hidden" name="viewCode" value="MESBasic_1_material_materialEdit">
								<input type="hidden" name="modelName" value="Material">
								<input type="hidden" id="id" name="id" value="${id!}" />
								<input type="hidden" name="material.version" value="${(material.version)!0}" />
								<input type="hidden" name="material.extraCol" value='' />
								<input type="hidden" name="operateType" id="operateType" />
								<input type="hidden" name="uploadDocIds" value="${uploadDocIds!''}">

		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "MESBasic_material_material_materialEdit_form"+"_attcount";
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
					CUI('#'+attcountid).html('(' + fileCount + ')');
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_material', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>								<div class="edit-panes edit-panes-w edit-container clearfix">

										<div class="cui-elements pd-top">
<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td><td style='height:0px;border:none;width:13%'></td><td style='height:0px;border:none;width:20%'></td></tr>
		<tr >
				
							 					<#if !MESBasic_1_material_Material_code_permit??>
					<#assign MESBasic_1_material_Material_code_permit = checkFieldPermission('material.code','MESBasic_1_material_Material','MESBasic_1_material_Material_code')>
					</#if>
					<td <#if MESBasic_1_material_Material_code_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_material_Material_code_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415321030666')}" >${getText('MESBasic.propertydisplayName.radion1415321030666')}</label>
				</td>
				
						<#assign material_code_defaultValue  = ''>
							 							<#assign material_code_defaultValue  = ''>
					<#if !MESBasic_1_material_Material_code_permit??>
					<#assign MESBasic_1_material_Material_code_permit = checkFieldPermission('material.code','MESBasic_1_material_Material','MESBasic_1_material_Material_code')>
					</#if>
					<td <#if MESBasic_1_material_Material_code_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   style="text-align: left;;" >
							<#if MESBasic_1_material_Material_code_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if MESBasic_1_material_Material_code_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="material.code" id="material_code"  style=";" originalvalue="<#if !newObj || (material.code)?has_content>${(material.code?html)!}<#else>${material_code_defaultValue!}</#if>" value="<#if !newObj || (material.code)?has_content>${(material.code?html)!}<#else>${material_code_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if MESBasic_1_material_Material_code_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !MESBasic_1_material_Material_name_permit??>
					<#assign MESBasic_1_material_Material_name_permit = checkFieldPermission('material.name','MESBasic_1_material_Material','MESBasic_1_material_Material_name')>
					</#if>
					<td <#if MESBasic_1_material_Material_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_material_Material_name_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415321054576')}" >${getText('MESBasic.propertydisplayName.radion1415321054576')}</label>
				</td>
				
						<#assign material_name_defaultValue  = ''>
							 							<#assign material_name_defaultValue  = ''>
					<#if !MESBasic_1_material_Material_name_permit??>
					<#assign MESBasic_1_material_Material_name_permit = checkFieldPermission('material.name','MESBasic_1_material_Material','MESBasic_1_material_Material_name')>
					</#if>
					<td <#if MESBasic_1_material_Material_name_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   style="text-align: left;;" >
							<#if MESBasic_1_material_Material_name_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input<#if MESBasic_1_material_Material_name_permit == 1>-readonly</#if>">
								<input property_type="TEXT" name="material.name" id="material_name"  style=";" originalvalue="<#if !newObj || (material.name)?has_content>${(material.name?html)!}<#else>${material_name_defaultValue!}</#if>" value="<#if !newObj || (material.name)?has_content>${(material.name?html)!}<#else>${material_name_defaultValue!}</#if>" type="text" class="cui-noborder-input "<#if MESBasic_1_material_Material_name_permit == 1> readonly=readonly</#if> />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				</tr><tr >
							 					<#if !MESBasic_1_material_Material_remark_permit??>
					<#assign MESBasic_1_material_Material_remark_permit = checkFieldPermission('material.remark','MESBasic_1_material_Material','MESBasic_1_material_Material_remark')>
					</#if>
					<td <#if MESBasic_1_material_Material_remark_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_material_Material_remark_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415607380055')}" >${getText('MESBasic.propertydisplayName.radion1415607380055')}</label>
				</td>
				
						<#assign material_remark_defaultValue  = ''>
							 							<#assign material_remark_defaultValue  = ''>
					<#if !MESBasic_1_material_Material_remark_permit??>
					<#assign MESBasic_1_material_Material_remark_permit = checkFieldPermission('material.remark','MESBasic_1_material_Material','MESBasic_1_material_Material_remark')>
					</#if>
					<td <#if MESBasic_1_material_Material_remark_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   colspan="4" align="left" style="text-align: left;;" >
							<#if MESBasic_1_material_Material_remark_permit == 0>
							<div class="fix-input-readonly fix-ie7-textarea"><textarea property_type="TEXT" id="material_remark" class="cui-noborder-textarea nopermit cui-textarea-auto" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"></textarea></div>
							<#else>
							<div class="fix-input<#if MESBasic_1_material_Material_remark_permit == 1>-readonly</#if> fix-ie7-textarea"><textarea property_type="TEXT" id="material_remark" originalvalue="<#if !newObj || (material.remark)?has_content>${(material.remark?html)!}<#else>${material_remark_defaultValue?html}</#if>"  name="material.remark" class="cui-noborder-textarea cui-textarea-auto"<#if MESBasic_1_material_Material_remark_permit == 1> readonly=readonly</#if> style=";" ><#if !newObj || (material.remark)?has_content>${(material.remark)!}<#else>${material_remark_defaultValue}</#if></textarea></div>
							</#if>
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
</div>										</div>
										<div class="edit-datatable">	
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
		<div id="MESBasic_material_material_materialEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" class="bar" onclick="MESBasic.material.material.materialEdit.showFileUpload('fileUpload')">${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-MESBasic_1_material_materialEdit,html,MESBasic_1_material_Material,MESBasic_1) -->
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
						$("#MESBasic_material_material_materialEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#MESBasic_material_material_materialEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#MESBasic_material_material_materialEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#MESBasic_material_material_materialEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			MESBasic.material.material.materialEdit.initCount = 0;
			MESBasic.material.material.materialEdit.initSize = function(nTabIndex){
				var panesHeight;
				var thisHeight;
				var h = $(window).height();
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
				var conHeight = h-$("#MESBasic_material_material_materialEdit_main_div .edit-head").height()-$("#MESBasic_material_material_materialEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#MESBasic_material_material_materialEdit_main_div .edit-workflow").height()</#if>;
				panesHeight = conHeight*0.4;
				var datagrids = $('body').data('MESBasic_material_material_materialEdit_datagrids');
				$("#MESBasic_material_material_materialEdit_main_div .edit-panes-s").each(function(index){
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
									// PT间距有调整，需要多减15
									dgwidget.setHeight(perHeight - 68);
									
								} else {
									if(MESBasic.material.material.materialEdit.initCount <= 2) {
										setTimeout(function(){MESBasic.material.material.materialEdit.initSize();}, 200);
										MESBasic.material.material.materialEdit.initCount++;
									}/* else {
										MESBasic.material.material.materialEdit.initCount = 0;
									}*/
								}
							}
						}
					} else {
						$(this).parent().height(conHeight-30);
						$(this).parent().css("overflow-y","auto");
					}
				});
			}
			
			
			$(function(){
				MESBasic.material.material.materialEdit.initSize();
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
							}
						}
					})
					$(".edit-workflow").css("left",145);
					$("#edit_side_btn").toggle(function(){
						if(parseInt($("#MESBasic_material_material_materialEdit_main_div").css("width"),10)==650){
							$("#MESBasic_material_material_materialEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//MESBasic.material.material.materialEdit.resizeLayout();
						//MESBasic.material.material.materialEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#MESBasic_material_material_materialEdit_main_div").css("width"),10)==800){
							$("#MESBasic_material_material_materialEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//MESBasic.material.material.materialEdit.resizeLayout();
						//MESBasic.material.material.materialEdit.initSize();
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
					MESBasic.material.material.materialEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					MESBasic.material.material.materialEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){MESBasic.material.material.materialEdit.initSize();});
				/*
				MESBasic.material.material.materialEdit.resizeLayout=function(){
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
		});

		MESBasic.material.material.materialEdit.validate = function(){
		<#if dealSet??&&dealSet==1>
		var cancelItem = $('input[name="workFlowVarStatus"]');
        validateRequiredFlag = $('input[name="operateType"]').val()=='submit' && (!cancelItem || cancelItem.length == 0 || !(cancelItem.val()=='cancel'));
		if(validateRequiredFlag){
			var comments=$.trim(CUI("#workflow_comments").val());
		 	if(comments!=null&&comments==""){
	        		 workbenchErrorBarWidget.showMessage("${getText('ec.property.dealinfo.isNotNull')}", 'f');
	        		 return false;
			}
		}
		</#if>
			return true;
		}
		MESBasic.material.material.materialEdit.beforeSaveProcess = function(){

			var extraCol = '<extra-data>';
			$('#MESBasic_material_material_materialEdit_form').trigger('beforeSubmit');
			//material.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="material.extraCol"]').val(extraCol);
		}
		MESBasic.material.material.materialEdit.processDataGrid = function(){
		};
		MESBasic.material.material.materialEdit.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!MESBasic.material.material.materialEdit.validate()){return;}
			MESBasic.material.material.materialEdit.beforeSaveProcess();

			//MESBasic.material.material.materialEdit.processDataGrid();
			$('#MESBasic_material_material_materialEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		window.onbeforeunload = function() {      
		        if(isFormChanged('MESBasic_material_material_materialEdit_form','MESBasic_material_material_materialEdit_datagrids')) {      
		            return "${getText('ec.view.losedata')}";      
		        }else{
		        	 if($('#workflow_comments').length!=0){
			        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
			        		return "${getText('ec.view.losedata')}";
			        	}
				     }  
		        }   
		}
		<#else>
		window.onbeforeunload = function() {      
		        if($('#workflow_comments').length!=0){
		        	if($('#workflow_comments').val()!=null && $('#workflow_comments').val()!=""){
		        		return "${getText('ec.view.losedata')}";
		        	}
		        }     
		}
		</#if>
		//打印
		MESBasic.material.material.materialEdit.print = function(){
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
		
		MESBasic.material.material.materialEdit.saveSetting = function(){
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
		
		MESBasic.material.material.materialEdit.printSetting = function(){
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
				MESBasic.material.material.materialEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.material.material.materialEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				MESBasic.material.material.materialEdit.settingDialog.show();
			}
		}
		
		
		MESBasic.material.material.materialEdit._callBackInfo = function(res){
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
 						window.opener.MESBasic.material.material.editCallBackInfo(res); 						
					}catch(e2){
						try{
							window.opener.reload();
						}catch(e3){}
					}
				};

 				setTimeout(function(){
					window.close();
				},1000);
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.MESBasic.material.material.editCallBackInfo();}catch(e){try{window.opener.reload();}catch(e2){}};window.close();});
			} else {
				CUI.showErrorInfos(res);
			}
		};
		
		//控件版PT选人查看按钮单击事件处理函数
		function dataGridBtnImgClick(sUrl,objNameCustomCondition,sTitle,sPTGridID,nRow,sFieldName,oGrid,customCallBack,crossCompany){
			//保存当前单击事件的对象信息
			var obj = {
				"oGrid" : oGrid,
				"nRow" : nRow - 1,
				"sKey":	sFieldName
			}
			if(customCallBack){
				MESBasic.material.material.materialEdit._customCallBack = customCallBack;
			}
			MESBasic.material.material.materialEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		MESBasic.material.material.materialEdit.initMnemonic_DG_IE = function(oConfig){
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			MESBasic.material.material.materialEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			MESBasic.material.material.materialEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				MESBasic.material.material.materialEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		MESBasic.material.material.materialEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){

			var callbackName="";
			var _prefix= '';
			var arr = objName.split('.');
			if(gridEventObj) {
				MESBasic.material.material.materialEdit.gridEventObj = gridEventObj;
				callbackName = "MESBasic.material.material.materialEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "MESBasic.material.material.materialEdit.getMultiselectCallBackInfo_DG" : "MESBasic.material.material.materialEdit.getcallBackInfo_DG";
				MESBasic.material.material.materialEdit._currRow = obj.parentNode.parentNode.parentNode;
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="MESBasic.material.material.materialEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				MESBasic.material.material.materialEdit._prefix = _prefix.substring(1);
			}
			
			MESBasic.material.material.materialEdit._oGrid = oGrid;
			MESBasic.material.material.materialEdit._sUrl = url;
			if(customCallBack){
				MESBasic.material.material.materialEdit._customCallBack = customCallBack;
			}
			if(MESBasic.material.material.materialEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.material.material.materialEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof MESBasic.material.material.materialEdit._querycustomFuncN == "function") {
				refparam += MESBasic.material.material.materialEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			MESBasic.material.material.materialEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.material.material.materialEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(MESBasic.material.material.materialEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(MESBasic.material.material.materialEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			MESBasic.material.material.materialEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'MESBasic.material.material.materialEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		MESBasic.material.material.materialEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(MESBasic.material.material.materialEdit.query_"+obj+")!='undefined'") ? eval('MESBasic.material.material.materialEdit.query_'+obj+'()') : null;
			return str;
		};
		MESBasic.material.material.materialEdit.getcallBackGroupInfo = function(obj){
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
			MESBasic.material.material.materialEdit._dialog.close();
		}
		MESBasic.material.material.materialEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('MESBasic_material_material_materialEdit_form',obj[0], MESBasic.material.material.materialEdit._prefix, MESBasic.material.material.materialEdit._sUrl);
			CUI.commonFills('MESBasic_material_material_materialEdit_form',MESBasic.material.material.materialEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (MESBasic.material.material.materialEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(MESBasic.material.material.materialEdit._customCallBack) {
					eval(MESBasic.material.material.materialEdit._customCallBack);
					MESBasic.material.material.materialEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.material.material.materialEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		MESBasic.material.material.materialEdit.getcallBackInfo_DG_IE = function(obj){
			if(MESBasic.material.material.materialEdit._customBeforeCallBack) {
				var flag = eval(MESBasic.material.material.materialEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = MESBasic.material.material.materialEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.material.material.materialEdit._sUrl);
			var xmlHead = gridEventObj.oGrid._DT.opts.oXMLData.childNodes[0].childNodes[0];
			for( var i = 0; i < xmlHead.childNodes.length; i++ ){
				var tagName = xmlHead.childNodes[i].tagName;
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
				if(MESBasic.material.material.materialEdit._customCallBack) {
					eval(MESBasic.material.material.materialEdit._customCallBack);
					MESBasic.material.material.materialEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.material.material.materialEdit._dialog.close();
			} catch(e){}
			gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
		}
		
		MESBasic.material.material.materialEdit.getcallBackInfo_DG = function(obj){
			if(MESBasic.material.material.materialEdit._customBeforeCallBack) {
				var flag = eval(MESBasic.material.material.materialEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(MESBasic.material.material.materialEdit._currRow).next().length==0){
						MESBasic.material.material.materialEdit._oGrid.addNewRow();
					}	
					MESBasic.material.material.materialEdit._currRow = $(MESBasic.material.material.materialEdit._currRow).next();
					$(MESBasic.material.material.materialEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(MESBasic.material.material.materialEdit._currRow,obj[i], MESBasic.material.material.materialEdit._prefix, MESBasic.material.material.materialEdit._sUrl);
				eval("CUI.commonFills_DG(MESBasic.material.material.materialEdit._currRow,MESBasic.material.material.materialEdit._prefix,obj[i],MESBasic.material.material.materialEdit._oGrid)");
			}
			try{
				if(MESBasic.material.material.materialEdit._customCallBack) {
					eval(MESBasic.material.material.materialEdit._customCallBack);
					MESBasic.material.material.materialEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.material.material.materialEdit._dialog.close();
			} catch(e){}
		}
		
		MESBasic.material.material.materialEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(MESBasic.material.material.materialEdit._oGrid, MESBasic.material.material.materialEdit._currRow, MESBasic.material.material.materialEdit._key, MESBasic.material.material.materialEdit._displayFieldName, obj[i])
			}
			try{
				if(MESBasic.material.material.materialEdit._customCallBack) {
					eval(MESBasic.material.material.materialEdit._customCallBack);
					MESBasic.material.material.materialEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				MESBasic.material.material.materialEdit._dialog.close();
			} catch(e){}
		};
		
		MESBasic.material.material.materialEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						MESBasic.material.material.materialEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_material_material_materialEdit_form'));
						}
					}
				}
			});
		};
		MESBasic.material.material.materialEdit.proxyPending=function(pendingId){
			var url="/ec/workflow/proxyPending.action?pendingId="+pendingId;
			CUI(function(){
				MESBasic.material.material.materialEdit.proxyPendingDialog = new CUI.Dialog({
					title: "${getText("ec.pending.proxyPending")}",
					url:url,
					modal:true,
					height:260,
					width: 450,
					dragable:true,
					buttons:[
							{	name:"${getText("ec.flow.submit")}",
								handler:function(){MESBasic.material.material.materialEdit.saveProxyPending()}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
				})
				MESBasic.material.material.materialEdit.proxyPendingDialog.show();
			});
		};
		MESBasic.material.material.materialEdit.proxyType="2";//2普通委托，3全权委托
		MESBasic.material.material.materialEdit.saveProxyPending=function(){
			if(CUI("#proxyUsers_MultiIDs").val()==""){
				alert("${getText("ec.proxyPending.proxyor")}");
				return ;
			}else{
				CUI("#proxyUsersInput").val(CUI("#proxyUsers_MultiIDs").val());
			}
				
			MESBasic.material.material.materialEdit.proxyType=CUI("input[name=proxyType]:checked").val();
			CUI('#SubmitForm').submit();
		};
		proxyPendingCallBackInfo=function(res){
			if(res.dealSuccessFlag == true){
				proxyPendIngDialogErrorBarWidget.show("${getText("ec.common.saveandclosesuccessful")}！","s");
				setTimeout(function(){
					try{
						if(MESBasic.material.material.materialEdit.proxyType=='3'){
							top.opener.reload();
							window.close();
						}else{
							MESBasic.material.material.materialEdit.proxyPendingDialog.close();	
						}
					}catch(e){}
					
				},1500);
			}else{
				alert('${getText("ec.common.unsuccessfully")}！','f');
			}
		};

		$(function(){
			MESBasic.material.material.materialEdit.onloadForProduct();
			
		});

		MESBasic.material.material.materialEdit.beforeSubmitMethodSettingInPage = function(){
			MESBasic.material.material.materialEdit.onsaveForProduct();
		};
		MESBasic.material.material.materialEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  MESBasic.material.material.materialEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		MESBasic.material.material.materialEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#MESBasic_material_material_materialEdit_main_div").hide();
				},500);
			}else{
				CUI("#MESBasic_material_material_materialEdit_main_div").hide();
			  	$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		MESBasic.material.material.materialEdit.showThis = function(){
			if(!CUI("#MESBasic_material_material_materialEdit_main_div").is(':visible')) {
				CUI("#MESBasic_material_material_materialEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload()
		}
		MESBasic.material.material.materialEdit.showInfoDialog=function(mode){
			
			MESBasic.material.material.materialEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "MESBasic_material_material_materialEdit_dealInfo",
				modal:true,
				height:500,
				width: 850,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.material.material.materialEdit.infoDialog.show();
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		MESBasic.material.material.materialEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=MESBasic_1_material");
			}
		}
		
		MESBasic.material.material.materialEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/MESBasic/material/material/dealInfo-list.action&dlTableInfoId=${(material.tableInfoId)?default('')}");
			}
		}
		MESBasic.material.material.materialEdit.showFlowInfo=function(){
			if(CUI.trim(CUI("#flowDiv").html())==""){
				CUI("#flowDiv").load("/ec/workflow/flowView.action?modelCode=MESBasic_1_material_Material&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(material.tableInfoId)?default('')}");
			}
		}
		
		MESBasic.material.material.materialEdit.remind=function(){
			MESBasic.material.material.materialEdit.remindDialog = new CUI.Dialog({
				title: "${getText("ec.pending.remind.view")}",
				url: "/ec/workflow/remindFrame.action?tableInfoId=${(material.tableInfoId)?default('')}&pendingId=${pendingId!}",
				modal:true,
				height:450,
				width: 750,
				buttons:[{	name:"${getText("foundation.common.checked")}",
							handler:function(){ec.remind.submitRemind();}
						},
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			MESBasic.material.material.materialEdit.remindDialog.show();
		}
		waitWork_remindCallBack=function(res){
			if(res.dealSuccessFlag == true){
				remidnSubmitFormDialogErrorBarWidget.showMessage("${getText("ec.common.saveandclosesuccessful")}！","s");
				setTimeout(function(){
					try{MESBasic.material.material.materialEdit.remindDialog.close();}catch(e){}
				},1500);
			}else{
				remidnSubmitFormDialogErrorBarWidget.showMessage("${getText("ec.common.unsuccessfully")}！",'f');
				if(CUI.Dialog) CUI.Dialog.toggleAllButton();
				
			}
		}
		MESBasic.material.material.materialEdit.supervision=function(){
			MESBasic.material.material.materialEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(material.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				MESBasic.material.material.materialEdit.modifyOwnerStaffDialog.show();
		}
		


		/* CUSTOM CODE START(view-EDIT-MESBasic_1_material_materialEdit,js,MESBasic_1_material_Material,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */

		MESBasic.material.material.materialEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_material_materialEdit,onloadForProduct,MESBasic_1_material_Material,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
		}

		MESBasic.material.material.materialEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-MESBasic_1_material_materialEdit,onsaveForProduct,MESBasic_1_material_Material,MESBasic_1) */
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
				<div class="sidebar-top"><a href="#"  onclick="MESBasic.material.material.materialEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
							 <li>
								<#if editNew>
								<a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;">${getText(l.relatingModel.name)}</a>
								<#else>
									<a href="#" onclick="MESBasic.material.material.materialEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(material.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')">${getText(l.relatingModel.entity.name)}(${(l.count)!})</a>
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