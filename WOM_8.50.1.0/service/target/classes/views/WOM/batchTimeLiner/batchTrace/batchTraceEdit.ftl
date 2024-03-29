<!-- WOM_7.5.0.0/batchTimeLiner/batchTraceEdit -->
<#assign isWorkflow = false> 
<#assign isAttachment = true> 
	<#assign  fileuploadType = "WOM_batchTimeLiner_batchTrace">
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
<#assign tableObj = batchTrace>
<#-- 命名空间 -->
<#assign editPageNs = "WOM.batchTimeLiner.batchTrace.batchTraceEdit">
<#-- 模型名称-->
<#assign modelName = "batchTrace">
<#-- 视图编码-->
<#assign viewCode = "WOM_7.5.0.0_batchTimeLiner_batchTraceEdit">
<#-- 实体编码-->
<#assign entity_code = "WOM_7.5.0.0_batchTimeLiner">
<#-- 视图名称-->
<#assign viewName = "batchTraceEdit">
<#-- datagrid编码-->
<#assign datagridCode = "WOM_batchTimeLiner_batchTrace_batchTraceEdit_datagrids">
<#-- 首字母大写的模型名称-->
<#assign upcaseModelName = "BatchTrace">
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
<#assign editFormId = "WOM_batchTimeLiner_batchTrace_batchTraceEdit_form">
<#-- 待办状态 -->
<#assign pendingstatus =( batchTrace.pending.taskDescription)!>
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
        <#assign configTitle = getText('WOM.viewtitle.randon1544508931896')>
        <#if viewTitle?has_content>
			<#assign configTitle = viewTitle>
        </#if>
        <title>${configTitle}</title>
        <@editcss /><@editjstop /><@editjs />
		<style>
		
		#WOM_batchTimeLiner_batchTrace_batchTraceEdit_form{float:left;width:100%;}
		
		
		</style>
		<script type="text/javascript">
			CUI.ns('WOM.batchTimeLiner.batchTrace.batchTraceEdit');
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.currentUser = ${userJson};
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.currentStaff = ${staffJson};
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.currentDepartment = ${deptJson};
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.currentPosition = ${postJson};
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.currentCompany = ${compJson};
		</script>
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchTimeLiner_batchTraceEdit,head,WOM_7.5.0.0_batchTimeLiner_BatchTrace,WOM_7.5.0.0) -->
<!-- 自定义代码 -->

<!-- CUSTOM CODE END -->
    </head>
	<body class="view-edit ">
		<@loadpanel newType=true/>
		<@s.form errorBarId="workbenchErrorBar" hiddenField="batchTrace.prodTaskId.id," onsubmitMethod="WOM.batchTimeLiner.batchTrace.batchTraceEdit.beforeSubmitMethod()" id="WOM_batchTimeLiner_batchTrace_batchTraceEdit_form" namespace="/WOM/batchTimeLiner/batchTrace/batchTraceEdit" action="submit?__pc__=${(Parameters.__pc__)!}&_bapFieldPermissonModelCode_=WOM_7.5.0.0_batchTimeLiner_BatchTrace&_bapFieldPermissonModelName_=BatchTrace" editPageNs="WOM.batchTimeLiner.batchTrace.batchTraceEdit" callback="WOM.batchTimeLiner.batchTrace.batchTraceEdit._callBackInfo" ecform="true">
			<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
			<div style="float:none;width:auto;" class="edit-main grid-s5m0 col-main main-wrap" id="WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div">
			<div class="edit-head">
				<#include "../../../ec/tableInfo/operateheadbar_all.ftl" >
				<#include "../../../ec/tableInfo/creatorInfo.ftl" >
			</div>
    		<div class="edit-main" id="WOM_batchTimeLiner_batchTrace_batchTraceEdit">
    			<div class="edit-content">
    	<#include "../../../ec/tableInfo/formparam.ftl" >				
					<input type="hidden" name="batchTrace.prodTaskId.id" value="${(batchTrace.prodTaskId.id)!""}" originalvalue="${(batchTrace.prodTaskId.id)!""}"/>
		<div class="dash-line"></div>
<script type="text/javascript">
var attcountid = "WOM_batchTimeLiner_batchTrace_batchTraceEdit_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=WOM_7.5.0.0_batchTimeLiner', null, function(){
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
					
							<label style="width:100%;;" value="${getText('WOM.propertydisplayName.randon1489668325364')}" >${getText('WOM.propertydisplayName.randon1489668325364')}</label>
				</td>
				
						<#assign batchTrace_prodTaskId_productBatchNum_defaultValue  = ''>
														<#assign batchTrace_prodTaskId_productBatchNum_defaultValue  = ''>
					<td  nullable=true class="edit-table-content"   style="text-align: left;;" >
					
							
								
								
								
									<@mneclient iframe=mneIframe!false property_type="BAPCODE" mneenable=false reftitle="${getText('WOM.viewtitle.randon1490145723075')}" viewType="${viewType!}" deValue="${batchTrace_prodTaskId_productBatchNum_defaultValue!}" conditionfunc="WOM.batchTimeLiner.batchTrace.batchTraceEdit._querycustomFunc('batchTrace_prodTaskId_productBatchNum')"  value="${(batchTrace.prodTaskId.productBatchNum)!}" displayFieldName="productBatchNum" name="batchTrace.prodTaskId.productBatchNum" id="batchTrace_prodTaskId_productBatchNum" type="other" url="/WOM/produceTask/produceTask/maketaskRef.action" clicked=true multiple=false mnewidth=260 formId="WOM_batchTimeLiner_batchTrace_batchTraceEdit_form" editCustomCallback=";" refViewCode="WOM_7.5.0.0_produceTask_maketaskRef"  onkeyupfuncname=";_callback_batchTrace_prodTaskId_productBatchNum(obj);" cssStyle="" isEdit=true   isCrossCompany=false  />
								
								
								
								<script type="text/javascript">
								<#if !(batchTrace.id)?? && (batchTrace.prodTaskId.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${batchTrace.prodTaskId.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('WOM_batchTimeLiner_batchTrace_batchTraceEdit_form',obj, 'batchTrace.prodTaskId', '/WOM/produceTask/produceTask/maketaskRef.action');
												CUI.commonFills('WOM_batchTimeLiner_batchTrace_batchTraceEdit_form', 'batchTrace.prodTaskId',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
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
     	
		<div id="WOM_batchTimeLiner_batchTrace_batchTraceEdit_dealInfo" style="display: none;margin-top:5px;">
			<ul class="edit-tabs">
				<li id="fileUploadHead" <#if !(superEdit!false)>class="bar"</#if> onclick="WOM.batchTimeLiner.batchTrace.batchTraceEdit.showFileUpload('fileUpload')"><span class="icon_file"></span>${getText("foundation.upload.attachment")}</li>
			</ul>
			<div class="edit-panes wid-hei"  style="padding:0px;">
				<div id="fileUploadDiv" class="wid-hei"></div>
			</div>
		</div>
		<!-- CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchTimeLiner_batchTraceEdit,html,WOM_7.5.0.0_batchTimeLiner_BatchTrace,WOM_7.5.0.0) -->
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
						$("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div").css("width",800);
						$(".edit-head").css("width",800);
						$(".edit-workflow").css("width",800);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}else{
						$("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div").css("width",650);
						$(".edit-head").css("width",650);
						$(".edit-workflow").css("width",650);
						$("body").css({"overflow-x":"scroll","position":"relative","zIndex":"100"});
					}
				}
				else {
					if (YAHOO.env.ua.ie == "6") {
						$("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div").css("width",w1);
						$(".edit-workflow").css("width",w1);
					}else{
						$("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div").css("width","auto");
						$(".edit-workflow").css("width","auto");
					}
					$("body").css({"overflow-x":"hidden"});
					$(".edit-head").css("width","auto");
				}
			});
		});
		
		</script>
		<script type="text/javascript">
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.initCount = 0;
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.initSize = function(nTabIndex){
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
				var conHeight = h-$("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div .edit-head").height()-$("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div .edit-tabs").height()<#if pendingId?? || editNew>-$("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div .edit-workflow").height()</#if>;
				$("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div .edit-tabs").length == 0 ? conHeight = conHeight : conHeight = conHeight-28 //再减去28px，28px是由.edit-tabs的margin-top:14px+6px边框+8px的底部边距组成
				panesHeight = conHeight*0.4;  //当表单跟pt共存的时候采用4/6开
				var datagrids = $('body').data('WOM_batchTimeLiner_batchTrace_batchTraceEdit_datagrids');
				var padding_bottom=16;
				$("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div .pd_bottom,#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div .edit-tabs").width(w-14*2-2-width_)  //把tab跟tab下面的内容宽度统一调整
				$("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div .edit-panes-s").each(function(index){
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
									if(WOM.batchTimeLiner.batchTrace.batchTraceEdit.initCount <= 2) {
										setTimeout(function(){WOM.batchTimeLiner.batchTrace.batchTraceEdit.initSize();}, 200);
										WOM.batchTimeLiner.batchTrace.batchTraceEdit.initCount++;
									}/* else {
										WOM.batchTimeLiner.batchTrace.batchTraceEdit.initCount = 0;
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
							if(($("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div .edit-workflow").length > 0) && ($("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div .edit-tabs").length > 0)){		// 底下有处理结果，并且头部有页签切换，此时底部留白14像素
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
				$('#WOM_batchTimeLiner_batchTrace_batchTraceEdit_form').get(0).onkeydown=function(event){
					event=event?event:window.event;
					var elm = event.target || event.srcElement;
					if(event.keyCode==13 && elm.nodeName.toUpperCase() !== 'TEXTAREA'){
						return false
					}
				};
				
				WOM.batchTimeLiner.batchTrace.batchTraceEdit.buttonBar = new CUI.ButtonBar( { panel: '#top_buttonbar' }  );
				WOM.batchTimeLiner.batchTrace.batchTraceEdit.initSize();
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
						if(parseInt($("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div").css("width"),10)==650){
							$("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div").css("width","800px");
							$(".edit-workflow").css("width","800px");
						}
						$(this).addClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",0);
						//$(".col-sub").width(0);
						$("#edit_side_btn").css("left",0);
						$(".edit-workflow").css("left",1);
						$("#edit_sidebar").css("display","none");
						//WOM.batchTimeLiner.batchTrace.batchTraceEdit.resizeLayout();
						//WOM.batchTimeLiner.batchTrace.batchTraceEdit.initSize();
						$('body').trigger('resize');
					},function(){
						if(parseInt($("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div").css("width"),10)==800){
							$("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div").css("width","650px");
							$(".edit-workflow").css("width","650px");
						}
						$(this).removeClass("edit-side-btn-r");
						$(".main-wrap").css("margin-left",145);
						//$(".col-sub").width(150);
						$("#edit_side_btn").css("left",145);
						$(".edit-workflow").css("left",145);
						$("#edit_sidebar").css("display","block");
						//WOM.batchTimeLiner.batchTrace.batchTraceEdit.resizeLayout();
						//WOM.batchTimeLiner.batchTrace.batchTraceEdit.initSize();
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
					WOM.batchTimeLiner.batchTrace.batchTraceEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-b').addClass('workflow-toggle-t');
				},function(){
					$(".edit-workflow tr:gt(0)").show();
					WOM.batchTimeLiner.batchTrace.batchTraceEdit.initSize();
					$("#workflow_toggle").removeClass('workflow-toggle-t').addClass('workflow-toggle-b');
				});
				</#if>
				$(window).resize(function(){WOM.batchTimeLiner.batchTrace.batchTraceEdit.initSize();});
				/*
				WOM.batchTimeLiner.batchTrace.batchTraceEdit.resizeLayout=function(){
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

		WOM.batchTimeLiner.batchTrace.batchTraceEdit.validate = function(){
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
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.beforeSaveProcess = function(){

			var extraCol = '<extra-data>';
			$('#WOM_batchTimeLiner_batchTrace_batchTraceEdit_form').trigger('beforeSubmit');
			//batchTrace.extraCol
			$('*[name^="_complex_"]').each(function(index, item){
				if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
					if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
					var itemValue = CUI(item).val();
					extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
				}
			});
			extraCol += '</extra-data>';
			$('input[name="batchTrace.extraCol"]').val(extraCol);
		}
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.processDataGrid = function(){
		};
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.save = function(){
			$('#operateType').val("submit");
			try{eval('beforeSubmitUploadForm()');}catch(e){}
			if(!WOM.batchTimeLiner.batchTrace.batchTraceEdit.validate()){return;}
			//延迟到延迟提交中处理,解决onchange事件无法触发问题
			//WOM.batchTimeLiner.batchTrace.batchTraceEdit.beforeSaveProcess();

			//WOM.batchTimeLiner.batchTrace.batchTraceEdit.processDataGrid();
			$('#WOM_batchTimeLiner_batchTrace_batchTraceEdit_form').submit();
		}
		
		<#if viewType != "readonly">
		$(window).bind('beforeunload',function(){
		        if(isFormChanged('WOM_batchTimeLiner_batchTrace_batchTraceEdit_form','WOM_batchTimeLiner_batchTrace_batchTraceEdit_datagrids')) {      
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
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.print = function(){
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
		
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.saveSetting = function(){
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
		
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.printSetting = function(){
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
				WOM.batchTimeLiner.batchTrace.batchTraceEdit.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					elementId:"printSettingDiv",
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(WOM.batchTimeLiner.batchTrace.batchTraceEdit.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
					})
				WOM.batchTimeLiner.batchTrace.batchTraceEdit.settingDialog.show();
			}
		}
		
		
		WOM.batchTimeLiner.batchTrace.batchTraceEdit._callBackInfo = function(res){
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
 						window.opener.WOM.batchTimeLiner.batchTrace.editCallBackInfo(res); 						
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
				//workbenchErrorBarWidget.showMessage(showMsg,'s',function(){closeLoadPanel();try{window.opener.WOM.batchTimeLiner.batchTrace.editCallBackInfo();}catch(e){try{window.opener.location.reload();}catch(e2){}};window.close();});
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
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack = customCallBack;
			}
			if (isObjCustomProp) {
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._isObjCustomProp_IE = isObjCustomProp;
			} else {
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._isObjCustomProp_IE = false;
			}
			if (objCustomPropNames) {
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._objCustomPropNames_IE = objCustomPropNames;
			} else {
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._objCustomPropNames_IE = '';
			}
			if (viewCode) {
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._refViewCode_IE = viewCode;
			} else {
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._refViewCode_IE = '';
			}
			WOM.batchTimeLiner.batchTrace.batchTraceEdit._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
		}
		
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.initMnemonic_DG_IE = function(oConfig){
			// 助记码也需要区分是否为自定义字段
			WOM.batchTimeLiner.batchTrace.batchTraceEdit._isObjCustomProp_IE = oConfig._isObjCustomProp_IE;
			WOM.batchTimeLiner.batchTrace.batchTraceEdit._objCustomPropNames_IE = oConfig._objCustomPropNames_IE;
			
			var oGrid = oConfig.oGrid;
			// 获取控件PT  object
			var oPTGridEx = oGrid._DT || oGrid;
			// 存储当前操作相关信息
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.gridEventObj = {
				"oGrid" : oGrid,
				"nRow" : oConfig.nRow - 1,
				"sKey":	oConfig.sFieldName
			}
			WOM.batchTimeLiner.batchTrace.batchTraceEdit._sUrl = oConfig.url;
			if(oConfig.customCallBack){
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack = oConfig.customCallBack;
			}
			// 自定义的表格对象
			var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
			oInputField.value = oConfig.value;
			oInputField.isCrossCompany = oConfig.isCrossCompany;
			selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
		}
		
		WOM.batchTimeLiner.batchTrace.batchTraceEdit._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect,oColumn){

			var callbackName="";
			var condition='';
			var _prefix= '';
			var arr = objName.split('.');
			if(WOM.batchTimeLiner.batchTrace.batchTraceEdit._querycustomFunc(objName.replace(/\./g, '_')) !=null){
				condition=encodeURIComponent(WOM.batchTimeLiner.batchTrace.batchTraceEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(gridEventObj) {
				WOM.batchTimeLiner.batchTrace.batchTraceEdit.gridEventObj = gridEventObj;
				callbackName = "WOM.batchTimeLiner.batchTrace.batchTraceEdit.getcallBackInfo_DG_IE";
			}else if(obj!=null && obj!=""){
				if(arr.length > 1){
					_prefix = '.'+ arr[0];
				}
				callbackName = isMultiselect ? "WOM.batchTimeLiner.batchTrace.batchTraceEdit.getMultiselectCallBackInfo_DG" : "WOM.batchTimeLiner.batchTrace.batchTraceEdit.getcallBackInfo_DG";
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._currRow = $(obj).closest('tr')[0];
			}else{
				if(arr.length > 2){
					_prefix = '.'+ arr[0] + '.'+ arr[1];
				}
				callbackName ="WOM.batchTimeLiner.batchTrace.batchTraceEdit.getcallBackInfo";
			}

			if(_prefix!=''){
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._prefix = _prefix.substring(1);
			}
			
			WOM.batchTimeLiner.batchTrace.batchTraceEdit._oGrid = oGrid;
			WOM.batchTimeLiner.batchTrace.batchTraceEdit._sUrl = url;
			if (oColumn) {
				if (oColumn.isObjCustomProp) {
					WOM.batchTimeLiner.batchTrace.batchTraceEdit._isObjCustomProp = oColumn.isObjCustomProp;
				} else {
					WOM.batchTimeLiner.batchTrace.batchTraceEdit._isObjCustomProp = false;
				} 
				if (oColumn.objCustomPropNames) {
					WOM.batchTimeLiner.batchTrace.batchTraceEdit._objCustomPropNames = oColumn.objCustomPropNames;
				} else {
					WOM.batchTimeLiner.batchTrace.batchTraceEdit._objCustomPropNames = '';
				}
				if (oColumn.viewCode) {
					WOM.batchTimeLiner.batchTrace.batchTraceEdit._refViewCode = oColumn.viewCode;
				} else {
					WOM.batchTimeLiner.batchTrace.batchTraceEdit._refViewCode = '';
				}
			} else {
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._isObjCustomProp = false;
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._objCustomPropNames = '';
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._refViewCode = '';
			}
			if (WOM.batchTimeLiner.batchTrace.batchTraceEdit._isObjCustomProp == true && WOM.batchTimeLiner.batchTrace.batchTraceEdit._objCustomPropNames && objName && objName.substring(objName.length - 'MainDisplay'.length) == 'MainDisplay') {
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._prefix = objName.substring(0, objName.length - 'MainDisplay'.length);
			}
			if(customCallBack){
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack = customCallBack;
			}
			if(WOM.batchTimeLiner.batchTrace.batchTraceEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.batchTimeLiner.batchTrace.batchTraceEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			if(typeof WOM.batchTimeLiner.batchTrace.batchTraceEdit._querycustomFuncN == "function") {
				refparam += WOM.batchTimeLiner.batchTrace.batchTraceEdit._querycustomFuncN();
			}
			if(crossCompanyFlag && crossCompanyFlag == true) {
				refparam += "&crossCompanyFlag=true";
			} else {
				refparam += "&crossCompanyFlag=false";
			}
			WOM.batchTimeLiner.batchTrace.batchTraceEdit._dialog = foundation.common.select({
				pageType : 'other',
				closePage : true,
				condition : condition,
				callBackFuncName : callbackName,
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.batchTimeLiner.batchTrace.batchTraceEdit._groupSelectEvent = function(objName,_selectType,url,title,refparam){
			if(WOM.batchTimeLiner.batchTrace.batchTraceEdit._querycustomFunc(objName.replace(/\./g, '_')) != null) {
				refparam = 'condition=' + encodeURIComponent(WOM.batchTimeLiner.batchTrace.batchTraceEdit._querycustomFunc(objName.replace(/\./g, '_')));
			}
			WOM.batchTimeLiner.batchTrace.batchTraceEdit._dialog = foundation.common.select({
				pageType : _selectType,
				closePage : true,
				callBackFuncName : 'WOM.batchTimeLiner.batchTrace.batchTraceEdit.getcallBackGroupInfo',
				url : url,
				title : title,
				params : refparam
			});
		}
		WOM.batchTimeLiner.batchTrace.batchTraceEdit._querycustomFunc = function(obj) {
			var str = eval("typeof(WOM.batchTimeLiner.batchTrace.batchTraceEdit.query_"+obj+")!='undefined'") ? eval('WOM.batchTimeLiner.batchTrace.batchTraceEdit.query_'+obj+'()') : null;
			return str;
		};
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.getcallBackGroupInfo = function(obj){
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
			WOM.batchTimeLiner.batchTrace.batchTraceEdit._dialog.close();
		}
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.getcallBackInfo = function(obj){
		
			obj[0] = foundation.common.getObject('WOM_batchTimeLiner_batchTrace_batchTraceEdit_form',obj[0], WOM.batchTimeLiner.batchTrace.batchTraceEdit._prefix, WOM.batchTimeLiner.batchTrace.batchTraceEdit._sUrl);
			CUI.commonFills('WOM_batchTimeLiner_batchTrace_batchTraceEdit_form',WOM.batchTimeLiner.batchTrace.batchTraceEdit._prefix,obj[0]);
			
			for(pro in obj[0]){
				try{
					var fname = "_callback_" + (WOM.batchTimeLiner.batchTrace.batchTraceEdit._prefix + "." + pro).replace(/\./g, '_')  + "_edit";
					if(typeof(eval(fname)) == "function"){
						eval(fname + "(obj)");
					}
				}catch(e){}
			}

			try{
				if(WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack) {
					eval(WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack);
					WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._dialog.close();
			} catch(e){}
		}
		
		// 控件版PT回调
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.getcallBackInfo_DG_IE = function(obj){
			if(WOM.batchTimeLiner.batchTrace.batchTraceEdit._customBeforeCallBack) {
				var flag = eval(WOM.batchTimeLiner.batchTrace.batchTraceEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			var gridEventObj = WOM.batchTimeLiner.batchTrace.batchTraceEdit.gridEventObj;
			var rootKey = gridEventObj.sKey.split('.')[0];
			var jsonObj;
			if ( WOM.batchTimeLiner.batchTrace.batchTraceEdit._isObjCustomProp_IE == true && WOM.batchTimeLiner.batchTrace.batchTraceEdit._objCustomPropNames_IE ) {
				jsonObj = foundation.common.getObjectIE_CP_OBJ(gridEventObj,obj[0],rootKey,WOM.batchTimeLiner.batchTrace.batchTraceEdit._sUrl,WOM.batchTimeLiner.batchTrace.batchTraceEdit._objCustomPropNames_IE);
			} else {
				jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,WOM.batchTimeLiner.batchTrace.batchTraceEdit._sUrl);
			}
			CUI.error_msg_DG_CP_map = {};
			var xmlHead = $(gridEventObj.oGrid._DT.opts.oXMLData).children( ':eq(0)' ).children( ':eq(0)' );
			if (WOM.batchTimeLiner.batchTrace.batchTraceEdit._isObjCustomProp_IE == true && WOM.batchTimeLiner.batchTrace.batchTraceEdit._objCustomPropNames_IE) { // 控件版PT显示自定义字段
				var showName = WOM.batchTimeLiner.batchTrace.batchTraceEdit._objCustomPropNames_IE.split(',')[0]; // 主显示字段名称
				var trueName = WOM.batchTimeLiner.batchTrace.batchTraceEdit._objCustomPropNames_IE.split(',')[1]; // 主键字段名称
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
				if (dg_cp_info && id && WOM.batchTimeLiner.batchTrace.batchTraceEdit._refViewCode_IE) {
					$.ajax({
						async   : false,
						type    : 'POST',
						url     : '/foundation/customProp/related.action',
						data    : 'code=' + WOM.batchTimeLiner.batchTrace.batchTraceEdit._refViewCode_IE + '&id=' + id,
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
				if(WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack) {
					eval(WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack);
					WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._dialog.close();
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
		
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.getcallBackInfo_DG = function(obj){
			if(WOM.batchTimeLiner.batchTrace.batchTraceEdit._customBeforeCallBack) {
				var flag = eval(WOM.batchTimeLiner.batchTrace.batchTraceEdit._customBeforeCallBack.split("(")[0] + "(obj)");
				if(flag === false){
					return false;
				}
			}
			CUI.error_msg_DG_CP_map = {};
			for(var i=0;i<obj.length;i++){
				if(i>0){
					if($(WOM.batchTimeLiner.batchTrace.batchTraceEdit._currRow).next().length==0){
						WOM.batchTimeLiner.batchTrace.batchTraceEdit._oGrid.addNewRow();
					}	
					WOM.batchTimeLiner.batchTrace.batchTraceEdit._currRow = $(WOM.batchTimeLiner.batchTrace.batchTraceEdit._currRow).next();
					$(WOM.batchTimeLiner.batchTrace.batchTraceEdit._currRow).attr('isEdited',true);
				}
				obj[i] = foundation.common.getObject(WOM.batchTimeLiner.batchTrace.batchTraceEdit._currRow,obj[i], WOM.batchTimeLiner.batchTrace.batchTraceEdit._prefix, WOM.batchTimeLiner.batchTrace.batchTraceEdit._sUrl);
				if (WOM.batchTimeLiner.batchTrace.batchTraceEdit._isObjCustomProp == true && WOM.batchTimeLiner.batchTrace.batchTraceEdit._objCustomPropNames) {
					eval("CUI.commonFills_DG_CP_OBJ(WOM.batchTimeLiner.batchTrace.batchTraceEdit._currRow,WOM.batchTimeLiner.batchTrace.batchTraceEdit._prefix,obj[i],WOM.batchTimeLiner.batchTrace.batchTraceEdit._oGrid,WOM.batchTimeLiner.batchTrace.batchTraceEdit._objCustomPropNames)");
				} else {
					eval("CUI.commonFills_DG(WOM.batchTimeLiner.batchTrace.batchTraceEdit._currRow,WOM.batchTimeLiner.batchTrace.batchTraceEdit._prefix,obj[i],WOM.batchTimeLiner.batchTrace.batchTraceEdit._oGrid)");
				}
				
				// 自定义字段参照回填
				if ( $('#dg_cp_info_' + WOM.batchTimeLiner.batchTrace.batchTraceEdit._oGrid.dataTableId).length > 0 ) {
					var dg_cp_info = $('#dg_cp_info_' + WOM.batchTimeLiner.batchTrace.batchTraceEdit._oGrid.dataTableId).val();
					var id = obj[i].id;
					var relationMap;
					if (dg_cp_info && id && WOM.batchTimeLiner.batchTrace.batchTraceEdit._refViewCode) {
						$.ajax({
							async   : false,
							type    : 'POST',
							url     : '/foundation/customProp/related.action',
							data    : 'code=' + WOM.batchTimeLiner.batchTrace.batchTraceEdit._refViewCode + '&id=' + id,
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
									name = WOM.batchTimeLiner.batchTrace.batchTraceEdit._oGrid.configs.hidekeyPrefix + name;
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
								CUI.commonFills_DG_CP(WOM.batchTimeLiner.batchTrace.batchTraceEdit._currRow, objs, WOM.batchTimeLiner.batchTrace.batchTraceEdit._oGrid);
							}
						}
					}
				}
			}
			try{
				if(WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack) {
					eval(WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack);
					WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._dialog.close();
			} catch(e){}
			
			setTimeout( function(){
				try{
					var errorMsg = ''
					for ( var item in  CUI.error_msg_DG_CP_map ){
						for ( var n in  CUI.error_msg_DG_CP_map[item] ){
							errorMsg += ( '<b>' + WOM.batchTimeLiner.batchTrace.batchTraceEdit._oGrid.getLabel(item) +  '</b>第<b>' + ( parseInt( n, 10 ) + 1)  + '</b>行回填失败！原因:系统编码值不匹配！<br/>' );
						}
					}
					if( errorMsg ){
						workbenchErrorBarWidget.showMessage( errorMsg );
					}		
				}catch(e){};
			}, 500 )
			
		}
		
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.getMultiselectCallBackInfo_DG = function(obj){
			for(var i=0;i<obj.length;i++){
				CUI.commonFillsMultiselect_DG(WOM.batchTimeLiner.batchTrace.batchTraceEdit._oGrid, WOM.batchTimeLiner.batchTrace.batchTraceEdit._currRow, WOM.batchTimeLiner.batchTrace.batchTraceEdit._key, WOM.batchTimeLiner.batchTrace.batchTraceEdit._displayFieldName, obj[i])
			}
			try{
				if(WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack) {
					eval(WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack);
					WOM.batchTimeLiner.batchTrace.batchTraceEdit._customCallBack = null;
				}
			} catch(e){alert('${getText('ec.view.callback.error')}');}

			// 助记码也会调用此方法，容错处理
			try{
				WOM.batchTimeLiner.batchTrace.batchTraceEdit._dialog.close();
			} catch(e){}
		};
		
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.generateInput = function(prefix, obj) {
			CUI.each(obj, function(key,value){
				if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
					var name = prefix + '.' + key;
					if(typeof value == 'object') {
						WOM.batchTimeLiner.batchTrace.batchTraceEdit.generateInput(name, value);
					} else {
						if(value!=null&&value!='null'&&value!=undefined&&value!='') {
							CUI('input[name="' + name + '"]').remove();
							CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#WOM_batchTimeLiner_batchTrace_batchTraceEdit_form'));
						}
					}
				}
			});
		};

		$(function(){
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.onloadForProduct();
		});

		WOM.batchTimeLiner.batchTrace.batchTraceEdit.beforeSubmitMethodSettingInPage = function(){
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.onsaveForProduct();
		};
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.beforeSubmitMethod = function(){
			<#if pending?? && pending.loop?? && pending.loop gt 0>
			if(CUI("#__workflow_outcome_countersign").prop("checked")){
				CUI('#__workflow_countersign_people').val(CUI('#countersignUsersMultiIDs').val());
			}
			</#if>
			

			var customOnsaveResult =  WOM.batchTimeLiner.batchTrace.batchTraceEdit.beforeSubmitMethodSettingInPage();
			if(customOnsaveResult === false) {
				return customOnsaveResult;
			}
			return customOnsaveResult;
		};
		</script>
		<script type="text/javascript">
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.showBusinessList = function(relatingModelCode,mainEntityId,businessCenterCode,url,showType){
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
					CUI("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div").hide();
				},100);
			}else{
			    CUI(id).load(url);
				setTimeout(function(){
				CUI("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div").hide();
				},100);
				//CUI("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div").hide();
			  	//$('body').trigger('resize');
			}
			setTimeout(function(){
				//try{closeLoadPanel();}catch(e){}
			},1000);
		};
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.showThis = function(){
			if(!CUI("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div").is(':visible')) {
				CUI("#WOM_batchTimeLiner_batchTrace_batchTraceEdit_main_div").show();
				CUI('div[id^="otherContentDiv_"]').each(function(){
					CUI(this).hide();
				});
				$('body').trigger('resize');
			}
		};
		function reload(){
			window.location.reload();
		}
		
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.showAudit=function(){
			<#if !id?? || editNew>
			CUI.Dialog.alert("${getText("foundation.base.audit.nolog")}")
			<#else>
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.auditDialog = new CUI.Dialog({
				title : "${getText("foundation.base.audit")}",
				iframe : "WOM_batchTimeLiner_batchTrace_batchTraceEdit_auditInfo",
				modal:true,
				url : "/audits/auditLogQuery/auditInfo.action?${getPowerCode('base_auditLogQuery_self')}&auditLog.module=WOM&modelName=WOM_7.5.0.0_batchTimeLiner_BatchTrace&businessKey=${id!}",
				height:600,
				width: 1024,
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.auditDialog.show();
			</#if>
		}
		
		
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.showInfoDialog=function(mode){
			
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.infoDialog = new CUI.Dialog({
				title: "${getText("ec.view.info.view")}",
				elementId: "WOM_batchTimeLiner_batchTrace_batchTraceEdit_dealInfo",
				modal:true,
				height:500,
				width: 950,//适应国际化版
				buttons:[
						{	name:"${getText("foundation.common.closed")}",
							handler:function(){this.close()}
						}]
			});
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.infoDialog.show();
		
			if(mode=='flow'){
				CUI("#flowHead").click();
			}else if(mode=='fileUpload'){
				CUI("#fileUploadHead").click();
			}else if(mode=='dealInfo'){
				CUI("#dealInfoHead").click();
			}
		
		}
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.showFileUpload=function(){
			if(CUI.trim(CUI("#fileUploadDiv").html())==""){
			CUI("#fileUploadDiv").load("/foundation/workbench/fileupload-new-init.action?linkId=${fileuploadLinkId!-1}&type=${fileuploadType!'Table'}&entityCode=WOM_7.5.0.0_batchTimeLiner");
			}
		}
		
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.showDealInfo=function(){
			if(CUI.trim(CUI("#dealInfoDiv").html())==""){
				CUI("#dealInfoDiv").load("/ec/workflow/dealInfo.action?expandDealInof=true&dealInfoGroup=byTime&dealDataUrl=/WOM/batchTimeLiner/batchTrace/dealInfo-list.action&dlTableInfoId=${(batchTrace.tableInfoId)?default('')}");
			}
		}
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.showFlowInfo=function(){
		     //IE8环境下使用旧版flash流程展现页面，其他情况使用html5流程展现页面
		    var browser=navigator.appName; 
			var b_version=navigator.appVersion; 
			var version=b_version.split(";"); 
			var trim_Version=version[1]&&version[1].replace(/[ ]/g,"");
			var isIE8=(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0")||($.browser.msie&&(Number($.browser.version)<= 8));//IE8兼容视图模式下浏览器版本判断逻辑补充
			if(CUI.trim(CUI("#flowDiv").html())==""){
				if(isIE8){
				    CUI("#flowDiv").load("/ec/workflow/flowView.action?env=runtime&modelCode=WOM_7.5.0.0_batchTimeLiner_BatchTrace&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(batchTrace.tableInfoId)?default('')}");
				}else{
				    CUI("#flowDiv").load("/ec/workflow/flowViewH5.action?env=runtime&modelCode=WOM_7.5.0.0_batchTimeLiner_BatchTrace&deploymentId=${deploymentId?default('')}&fvTableInfoId=${(batchTrace.tableInfoId)?default('')}");
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
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.supervision=function(){
			WOM.batchTimeLiner.batchTrace.batchTraceEdit.modifyOwnerStaffDialog = new CUI.Dialog({
					title: "${getText("ec.flow.supervision.modifyPending")}",
					url: "/ec/workflow/modifyPendingStaff.action?tableInfoId=${(batchTrace.tableInfoId)?default('')}&pendingId=${pendingId!}",
					modal:true,
					type:4,
					buttons:[
							{	name:"${getText("foundation.common.closed")}",
								handler:function(){this.close()}
							}]
				});
				WOM.batchTimeLiner.batchTrace.batchTraceEdit.modifyOwnerStaffDialog.show();
		}
		

		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchTimeLiner_batchTraceEdit,js,WOM_7.5.0.0_batchTimeLiner_BatchTrace,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		WOM.batchTimeLiner.batchTrace.batchTraceEdit.onloadForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchTimeLiner_batchTraceEdit,onloadForProduct,WOM_7.5.0.0_batchTimeLiner_BatchTrace,WOM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
		}

		WOM.batchTimeLiner.batchTrace.batchTraceEdit.onsaveForProduct = function(){
		/* CUSTOM CODE START(view-EDIT-WOM_7.5.0.0_batchTimeLiner_batchTraceEdit,onsaveForProduct,WOM_7.5.0.0_batchTimeLiner_BatchTrace,WOM_7.5.0.0) */
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
				<div class="sidebar-top"><a href="#"  onclick="WOM.batchTimeLiner.batchTrace.batchTraceEdit.showThis()">${getText("ec.view.tableInfo")}</a></div>
				<div class="sidebar-line"></div>
				<div class="sidebar-list">
					<ul>
						<#list businessCenterList as l>
						 <li>
							<#if editNew>
							    <a href="#"  onclick="return false;" style="color:#A9A9A9;cursor:default;" title="${getText(l.showName)!}">${getText(l.showName)!}</a>
							<#else>
								<a href="#"  onclick="WOM.batchTimeLiner.batchTrace.batchTraceEdit.showBusinessList('${l.relatingModel.code.replace('.','')}',${(batchTrace.id)!},'${l.code}','${l.assview.url}?${getPowerCode(l.assview.code+'_self')}','${l.assview.showType}')" title="${getText(l.showName)}(${(l.count)!})">${getText(l.showName)}(${(l.count)!})</a>
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