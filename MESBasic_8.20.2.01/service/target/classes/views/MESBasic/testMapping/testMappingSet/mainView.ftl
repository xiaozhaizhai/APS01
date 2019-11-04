<style type="text/css">
.ewc-dialog-el{height:100%;} 
.ewc-dialog-el .edit-table{width:98%;margin:0 auto;}
</style>
<script type="text/javascript">
	CUI.ns('MESBasic.testMapping.testMappingSet.mainView');
</script>
<@ecStyleCss />
<#assign randomNum = datetime()?datetime?string("yyyyMMddHHmmssSSS")>
<#assign isAttachment = false> 
	<#assign  fileuploadType = "MESBasic_testMapping_testMappingSet">
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
<@errorbar id="MESBasic_testMapping_testMappingSet_mainView_formDialogErrorBar" />
<@s.form id="MESBasic_testMapping_testMappingSet_mainView_form" cssStyle="height:100%;" hiddenField="testMappingSet.product.id," onsubmitMethod="MESBasic.testMapping.testMappingSet.mainView.beforeSubmitMethod()" ecAction="/MESBasic/testMapping/testMappingSet/mainView/submit.action?__pc__=${(Parameters.__pc__)!}" callback="MESBasic.testMapping.testMappingSet.callBackInfo" ecform="true">
	<input type="hidden" name="bap_validate_user_id" value="${(Session.user.id)!}" />
	<input type="hidden" name="operateType" value="submit">
	<input type="hidden" name="viewselect" value="mainView">
	<input type="hidden" name="viewCode" value="MESBasic_1_testMapping_mainView">
	<input type="hidden" name="datagridKey" value="MESBasic_testMapping_testMappingSet_mainView_datagrids">
	<input type="hidden" id="id" name="id" value="${id!}" />
	<input type="hidden" name="testMappingSet.version" value="${(testMappingSet.version)!0}" />
	<input type="hidden" name="testMappingSet.extraCol" value='' />
		<input type="hidden" name="testMappingSet.product.id" value="${(testMappingSet.product.id)!""}"/>
	<div id="MESBasic_mainView_edit_div" style="height:100%">
		<div id="MESBasic_testMapping_testMappingSet_mainView_main_div" class="edit-content-dialog">
<script type="text/javascript">
var attcountid = "MESBasic_testMapping_testMappingSet_mainView_form"+"_attcount";
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
		$('#attachmentDiv').load('/foundation/workbench/fileupload-init.action?linkId=${fileuploadLinkId}&type=${fileuploadType}&entityCode=MESBasic_1_testMapping', null, function(){
			alert('loaded!!!');
		});
	});
	</#if>
});
</script>			<div class="edit-panes" style="margin-top:0px;padding:0px;">
				<div>
				<div class="edit-panes-w">

<div class="edit-panes-s" style="width:98%;margin-left:10px;">
	<table class="edit-table" style="">
		<tr style='border:none;height:0px; '><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:29%'></td><td style='height:0px;border:none;width:22%'></td><td style='height:0px;border:none;width:29%'></td></tr>
		<tr class="dialog_tr">
				
							 					<#if !MESBasic_1_testMapping_TestMappingSet_testName_permit??>
					<#assign MESBasic_1_testMapping_TestMappingSet_testName_permit = checkFieldPermission('testMappingSet.testName','MESBasic_1_testMapping_TestMappingSet','MESBasic_1_testMapping_TestMappingSet_testName')>
					</#if>
					<td <#if MESBasic_1_testMapping_TestMappingSet_testName_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_testMapping_TestMappingSet_testName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1430808486471')}" >${getText('MESBasic.propertydisplayName.randon1430808486471')}</label>
				</td>
				
						<#assign testMappingSet_testName_defaultValue  = ''>
							 							<#assign testMappingSet_testName_defaultValue  = ''>
					<#if !MESBasic_1_testMapping_TestMappingSet_testName_permit??>
					<#assign MESBasic_1_testMapping_TestMappingSet_testName_permit = checkFieldPermission('testMappingSet.testName','MESBasic_1_testMapping_TestMappingSet','MESBasic_1_testMapping_TestMappingSet_testName')>
					</#if>
					<td <#if MESBasic_1_testMapping_TestMappingSet_testName_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if MESBasic_1_testMapping_TestMappingSet_testName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="testMappingSet.testName" id="testMappingSet_testName"  style=";" originalvalue="<#if !newObj || (testMappingSet.testName)?has_content>${(testMappingSet.testName?html)!}<#else>${testMappingSet_testName_defaultValue!}</#if>" value="<#if !newObj || (testMappingSet.testName)?has_content>${(testMappingSet.testName?html)!}<#else>${testMappingSet_testName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				
							 					<#if !MESBasic_1_testMapping_TestMappingSet_testShortName_permit??>
					<#assign MESBasic_1_testMapping_TestMappingSet_testShortName_permit = checkFieldPermission('testMappingSet.testShortName','MESBasic_1_testMapping_TestMappingSet','MESBasic_1_testMapping_TestMappingSet_testShortName')>
					</#if>
					<td <#if MESBasic_1_testMapping_TestMappingSet_testShortName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_testMapping_TestMappingSet_testShortName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1430808617634')}" >${getText('MESBasic.propertydisplayName.randon1430808617634')}</label>
				</td>
				
						<#assign testMappingSet_testShortName_defaultValue  = ''>
							 							<#assign testMappingSet_testShortName_defaultValue  = ''>
					<#if !MESBasic_1_testMapping_TestMappingSet_testShortName_permit??>
					<#assign MESBasic_1_testMapping_TestMappingSet_testShortName_permit = checkFieldPermission('testMappingSet.testShortName','MESBasic_1_testMapping_TestMappingSet','MESBasic_1_testMapping_TestMappingSet_testShortName')>
					</#if>
					<td <#if MESBasic_1_testMapping_TestMappingSet_testShortName_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if MESBasic_1_testMapping_TestMappingSet_testShortName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="testMappingSet.testShortName" id="testMappingSet_testShortName"  style=";" originalvalue="<#if !newObj || (testMappingSet.testShortName)?has_content>${(testMappingSet.testShortName?html)!}<#else>${testMappingSet_testShortName_defaultValue!}</#if>" value="<#if !newObj || (testMappingSet.testShortName)?has_content>${(testMappingSet.testShortName?html)!}<#else>${testMappingSet_testShortName_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
												<#if !MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productName_permit??>
					<#assign MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productName_permit = checkFieldPermission('testMappingSet.product.productName','MESBasic_1_testMapping_TestMappingSet','MESBasic_1_product_Product_productName')>
					</#if>
					<td <#if MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productName_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productName_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772740737')}" >${getText('MESBasic.propertydisplayName.radion1415772740737')}</label>
				</td>
				
						<#assign testMappingSet_product_productName_defaultValue  = ''>
														<#assign testMappingSet_product_productName_defaultValue  = ''>
					<#if !MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productName_permit??>
					<#assign MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productName_permit = checkFieldPermission('testMappingSet.product.productName','MESBasic_1_testMapping_TestMappingSet','MESBasic_1_product_Product_productName')>
					</#if>
					<td <#if MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productName_permit != 3>nofieldPermission="true"</#if> nullable=false class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productName_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
								
								
								<#if MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productName_permit == 1>
									<@mneclient property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.radion1415773613713')}" conditionfunc="MESBasic.testMapping.testMappingSet.mainView._querycustomFunc('testMappingSet_product_productName')" view=true value="${(testMappingSet.product.productName)!}" displayFieldName="productName" name="testMappingSet.product.productName" id="testMappingSet_product_productName" type="other" url="/MESBasic/product/product/productRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_testMapping_testMappingSet_mainView_form" editCustomCallback=";" onkeyupfuncname="_callback_testMappingSet_product_productName(obj);" cssStyle="" isEdit=true   isCrossCompany=false editLinkCallBack="_callback_testMappingSet_product_productName_edit"/>
								<#else>
									<@mneclient property_type="TEXT" reftitle="${getText('MESBasic.viewtitle.radion1415773613713')}" viewType="${viewType!}" deValue="${testMappingSet_product_productName_defaultValue!}" conditionfunc="MESBasic.testMapping.testMappingSet.mainView._querycustomFunc('testMappingSet_product_productName')" view=true  value="${(testMappingSet.product.productName)!}" displayFieldName="productName" name="testMappingSet.product.productName" id="testMappingSet_product_productName" type="other" url="/MESBasic/product/product/productRef.action" clicked=true multiple=false mnewidth=260 formId="MESBasic_testMapping_testMappingSet_mainView_form" editCustomCallback=";" onkeyupfuncname="_callback_testMappingSet_product_productName(obj);" cssStyle="" isEdit=true   isCrossCompany=false  editLinkCallBack="_callback_testMappingSet_product_productName_edit" delCustomCallback="_del_callback_testMappingSet_product_productName()"/>
								</#if>
								
								<script type="text/javascript">
									var _callback_testMappingSet_product_productName_obj;
									
									function _del_callback_testMappingSet_product_productName(){
										var label = $('input[name="testMappingSet.product.productName"]').parents('td').prev().find('label');
										label.html(label.attr("value"));
									}
								
									function _callback_testMappingSet_product_productName_edit(obj){
										var label = $('input[name="testMappingSet.product.productName"]').parents('td').prev().find('label');
										_callback_testMappingSet_product_productName_obj = obj[0];
										label.html("<span class='edit-table-symbol-span' onclick='_opendialog_testMappingSet_product_productName()'>" + label.attr("value") + "</span>");
									}
									<#if (testMappingSet.product.productName)?? >
									(function(){
										var name = 'testMappingSet.product.id';
										var id = $('input[name="'+name+'"]').val();
										if(id != null && id != ""){
											var label = $('input[name="testMappingSet.product.productName"]').parents('td').prev().find('label');
											_callback_testMappingSet_product_productName_obj = new Object();
											_callback_testMappingSet_product_productName_obj.id = id;
											label.html("<span class='edit-table-symbol-span' onclick='_opendialog_testMappingSet_product_productName()'>" + label.attr("value") + "</span>");
										}
									})();
									</#if>
									function _opendialog_testMappingSet_product_productName(){
										var url = "/MESBasic/product/product/productView.action?entityCode=MESBasic_1_product&id="+_callback_testMappingSet_product_productName_obj.id+"&${getPowerCode('','MESBasic_1_product_productView')}";
										if("frame" == "dialog"){
											var buttons = [];
											buttons.push({
												name:"${getText('foundation.common.closed')}",
												type:"cancel"
											});
											_callback_testMappingSet_product_productName_Dlg = new CUI.Dialog({
												title: "${getText('MESBasic.viewtitle.radion1415772862746')}",
												url : url,
												modal: true,
												type : '1',
												buttons:buttons
											});
											_callback_testMappingSet_product_productName_Dlg.show();
										}else{
											openFullScreen(url);
										}
									}
								</script>
								
								<script type="text/javascript">
								<#if !(testMappingSet.id)?? && (testMappingSet.product.id)?has_content>
									(function($){
										$(function(){
											var obj = {'id' : '${testMappingSet.product.id}'};
											if(obj.id !== '-1') {
												obj = foundation.common.getObject('MESBasic_testMapping_testMappingSet_mainView_form',obj, 'testMappingSet.product', '/MESBasic/product/product/productRef.action');
												CUI.commonFills('MESBasic_testMapping_testMappingSet_mainView_form', 'testMappingSet.product',obj,true);
											}
										});
									})(jQuery);
								</#if>
								
								</script>
							</#if>
				</td>
				
												<#if !MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productCode_permit??>
					<#assign MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('testMappingSet.product.productCode','MESBasic_1_testMapping_TestMappingSet','MESBasic_1_product_Product_productCode')>
					</#if>
					<td <#if MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productCode_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productCode_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.radion1415772644833')}" >${getText('MESBasic.propertydisplayName.radion1415772644833')}</label>
				</td>
				
						<#assign testMappingSet_product_productCode_defaultValue  = ''>
														<#assign testMappingSet_product_productCode_defaultValue  = ''>
					<#if !MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productCode_permit??>
					<#assign MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('testMappingSet.product.productCode','MESBasic_1_testMapping_TestMappingSet','MESBasic_1_product_Product_productCode')>
					</#if>
					<td <#if MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productCode_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   style="text-align: left;;" >
							<#if MESBasic_1_testMapping_TestMappingSet_product_MESBasic_1_product_Product_productCode_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
								<input property_type="TEXT" name="testMappingSet.product.productCode" id="testMappingSet_product_productCode"  style=";" originalvalue="<#if !newObj || (testMappingSet.product.productCode)?has_content>${(testMappingSet.product.productCode?html)!}<#else>${testMappingSet_product_productCode_defaultValue!}</#if>" value="<#if !newObj || (testMappingSet.product.productCode)?has_content>${(testMappingSet.product.productCode?html)!}<#else>${testMappingSet_product_productCode_defaultValue!}</#if>" type="text" class="cui-noborder-input " readonly="readonly" />
							</div>
							<script type="text/javascript">
							</script>
							</#if>
				</td>
				</tr><tr class="dialog_tr">
							 					<#if !MESBasic_1_testMapping_TestMappingSet_basicPure_permit??>
					<#assign MESBasic_1_testMapping_TestMappingSet_basicPure_permit = checkFieldPermission('testMappingSet.basicPure','MESBasic_1_testMapping_TestMappingSet','MESBasic_1_testMapping_TestMappingSet_basicPure')>
					</#if>
					<td <#if MESBasic_1_testMapping_TestMappingSet_basicPure_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-symbol"   align="right" style="text-align: right;;" >
							<label style="<#if MESBasic_1_testMapping_TestMappingSet_basicPure_permit != 3>color:#B1B1B1;</#if>width:100%;;" value="${getText('MESBasic.propertydisplayName.randon1432645975472')}" >${getText('MESBasic.propertydisplayName.randon1432645975472')}</label>
				</td>
				
						<#assign testMappingSet_basicPure_defaultValue  = ''>
							 							<#assign testMappingSet_basicPure_defaultValue  = ''>
					<#if !MESBasic_1_testMapping_TestMappingSet_basicPure_permit??>
					<#assign MESBasic_1_testMapping_TestMappingSet_basicPure_permit = checkFieldPermission('testMappingSet.basicPure','MESBasic_1_testMapping_TestMappingSet','MESBasic_1_testMapping_TestMappingSet_basicPure')>
					</#if>
					<td <#if MESBasic_1_testMapping_TestMappingSet_basicPure_permit != 3>nofieldPermission="true"</#if> nullable=true class="edit-table-content"   align="left" style="text-align: left;;" >
							<#if MESBasic_1_testMapping_TestMappingSet_basicPure_permit == 0>
							<div class="fix-input-readonly"><input type="text" class="cui-noborder-input nopermit" readonly="readonly" value="${getText('ec.view.nofieldpermission')}"/></div>
							<#else>
							<div class="fix-input-readonly">
									<input property_type="DECIMAL" type="hidden" id="testMappingSet_basicPure_per_hide" name="testMappingSet.basicPure" originalvalue="<#if newObj && !(testMappingSet.basicPure)?has_content>${testMappingSet_basicPure_defaultValue!}<#elseif (testMappingSet.basicPure)?has_content>#{(testMappingSet.basicPure)!; m2M2}</#if>" value="<#if newObj && !(testMappingSet.basicPure)?has_content>${testMappingSet_basicPure_defaultValue!}<#elseif (testMappingSet.basicPure)?has_content>#{(testMappingSet.basicPure)!; m2M2}</#if>" />
									<input property_type="DECIMAL" id="testMappingSet_basicPure_per" name="testMappingSet_basicPure"  style=";" originalvalue="<#if newObj&& !(testMappingSet.basicPure)?has_content>${testMappingSet_basicPure_defaultValue!}<#elseif (testMappingSet.basicPure)?has_content>#{(testMappingSet.basicPure)!; m2M2}</#if>" value="<#if newObj&& !(testMappingSet.basicPure)?has_content>${testMappingSet_basicPure_defaultValue!}<#elseif (testMappingSet.basicPure)?has_content>#{(testMappingSet.basicPure)!; m2M2}</#if>" type="text" class="cui-noborder-input numberField" readonly="readonly" />
							</div>
							<script type="text/javascript">
								$(function(){
									if($('#testMappingSet_basicPure_per').val()!='' && $('#testMappingSet_basicPure_per').val()!=0){
										var percision = 2;
										var num1 = (parseInt(percision) - 2 >=0)?(parseInt(percision) - 2):0;
										var temp1 = ($('#testMappingSet_basicPure_per').val() * 100).toFixed(num1)+"%";
										$('#testMappingSet_basicPure_per').val(temp1)
										$('#testMappingSet_basicPure_per').attr("originalvalue",temp1);
									}
								});
							</script>
							</#if>
				</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
				
				<td class="edit-table-symbol">&nbsp;</td>
		</tr>
	</table>
</div>				</div>	
				<div class="edit-datatable">	
				</div>
				</div>
			</div>
		</div>
	</div>
</@s.form>
<!-- CUSTOM CODE START(view-VIEW-MESBasic_1_testMapping_mainView,html,MESBasic_1_testMapping_TestMappingSet,MESBasic_1) -->
<!-- 自定义代码 -->
<!-- CUSTOM CODE END -->
<script type="text/javascript">
	MESBasic.testMapping.testMappingSet.mainView.beforeSaveProcess = function(){}
	MESBasic.testMapping.testMappingSet.mainView.beforeSubmitMethod = function() {
		try{eval('beforeSubmitUploadForm()');}catch(e){}
		try{if(MESBasic.testMapping.testMappingSet.mainView.beforeSubmitMethodSettingInPage()==false) return false;}catch(e){}

		var extraCol = '<extra-data>';
		$('#MESBasic_testMapping_testMappingSet_mainView_form').trigger('beforeSubmit');
		//testMappingSet.extraCol
		$('*[name^="_complex_"]').each(function(index, item){
			if($(item).attr('type') != 'radio' || ($(item).attr('type') == 'radio' && $(item).prop('checked'))){
				if(CUI(item).attr('name') && CUI(item).attr('name').length > 9)
				var itemValue = CUI(item).val();
				extraCol += '<' + CUI(item).attr('name').substr(9) + '><![CDATA[' + itemValue + ']]></' + CUI(item).attr('name').substr(9) + '>';
			}
		});
		extraCol += '</extra-data>';
		$('input[name="testMappingSet.extraCol"]').val(extraCol);
		
	};
	(function($){

		$(function(){
			$("#MESBasic_testMapping_testMappingSet_mainView_form ul.edit-tabs").tabs("div.edit-panes > div");
		});
	})(jQuery);
	MESBasic.testMapping.testMappingSet.mainView.validate = function(){
		return true;
	}
	
	
	//打印
	MESBasic.testMapping.testMappingSet.mainView.print = function(url){
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
		
		MESBasic.testMapping.testMappingSet.mainView.saveSetting = function(){
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
		
		MESBasic.testMapping.testMappingSet.mainView.printSetting = function(){
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
			MESBasic.testMapping.testMappingSet.mainView.settingDialog = new CUI.Dialog({
					title: "${getText("ec.print.setting")}",
					url:url,
					modal:true,
					type:2,
					buttons:[
							{	name:"${getText("ec.flow.save")}",
								handler:function(){if(MESBasic.testMapping.testMappingSet.mainView.saveSetting()){this.close();}}
							},
							{	name:"${getText("ec.flow.cancal")}",
								handler:function(){this.close()}
							}]
				})
				MESBasic.testMapping.testMappingSet.mainView.settingDialog.show();
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
			MESBasic.testMapping.testMappingSet.mainView._customCallBack = customCallBack;
		}
		MESBasic.testMapping.testMappingSet.mainView._selectEvent(objNameCustomCondition,null,sUrl,sTitle,null,null,null,crossCompany,obj);
	}
	
	//参照复制函数
	MESBasic.testMapping.testMappingSet.mainView.referenceCopy = function(objName,url, dialog){
		var callbackName ="MESBasic.testMapping.testMappingSet.mainView.referenceCopyBackInfo";
		MESBasic.testMapping.testMappingSet.mainView.dialog = dialog;
		MESBasic.testMapping.testMappingSet.mainView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			url : url,
			title : "${getText('ec.view.property.refview')}",
			params : null
		});
	}
	
	MESBasic.testMapping.testMappingSet.mainView.referenceCopyBackInfo = function(obj){
		if(MESBasic.testMapping.testMappingSet.mainView._dialog){
			MESBasic.testMapping.testMappingSet.mainView._dialog.close();
		}
		createLoadPanel(false,MESBasic.testMapping.testMappingSet.mainView.dialog._el);
		var value = document.getElementById("id").value;
		<#if viewType != "readonly">
		if(isFormChanged('MESBasic_testMapping_testMappingSet_mainView_form','MESBasic_testMapping_testMappingSet_mainView_datagrids')){
			CUI.Dialog.confirm("${getText('ec.view.losedata')}", function(){	
				$(MESBasic.testMapping.testMappingSet.mainView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
				CUI(MESBasic.testMapping.testMappingSet.mainView.dialog._el).load('/MESBasic/testMapping/testMappingSet/mainView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
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
			$(MESBasic.testMapping.testMappingSet.mainView.dialog._el).html("<table style='width:100%;height:100%;text-align:center;'><tr><td><label class='datagrid-loading'>${getHtmlText("ec.view.loading")}</label></td></tr></table>");
			CUI(MESBasic.testMapping.testMappingSet.mainView.dialog._el).load('/MESBasic/testMapping/testMappingSet/mainView.action?id=' + value +'&refId='+obj[0].id+"&__pc__=${(Parameters.__pc__)!}",null,function(){
					closeLoadPanel();
					try{
						StrutsUtilsOnLoad();
					}catch(e){}
					try{
						if(me._config.onload != undefined) eval(me._config.onload + "(me)");
					}catch(e){}
			});
		<#if viewType != "readonly">
		}
		</#if>
	};
	
	MESBasic.testMapping.testMappingSet.mainView.initMnemonic_DG_IE = function(oConfig){
		var oGrid = oConfig.oGrid;
		// 获取控件PT  object
		var oPTGridEx = oGrid._DT || oGrid;
		// 存储当前操作相关信息
		MESBasic.testMapping.testMappingSet.mainView.gridEventObj = {
			"oGrid" : oGrid,
			"nRow" : oConfig.nRow - 1,
			"sKey":	oConfig.sFieldName
		}
		MESBasic.testMapping.testMappingSet.mainView._sUrl = oConfig.url;
		if(oConfig.customCallBack){
			MESBasic.testMapping.testMappingSet.mainView._customCallBack = oConfig.customCallBack;
		}
		// 自定义的表格对象
		var oInputField = oPTGridEx.getCell(oConfig.nRow,oConfig.sFieldName);
		oInputField.value = oConfig.value;
		oInputField.isCrossCompany = oConfig.isCrossCompany;
		selectKeyEvent({'keyCode':oConfig.keyCode},oInputField,oConfig.url,oConfig.displayfieldname,oConfig.type,oConfig.multiple,oConfig.mnewidth,oConfig.funcname,oConfig.conditionfunc);
	}
	
	MESBasic.testMapping.testMappingSet.mainView._selectEvent = function(objName,_selectType,url,title,refparam,obj,customCallBack,crossCompanyFlag,gridEventObj,oGrid,isMultiselect){
		var callbackName="";
		MESBasic.testMapping.testMappingSet.mainView._prefix = '';
		MESBasic.testMapping.testMappingSet.mainView._oGrid = oGrid;
		MESBasic.testMapping.testMappingSet.mainView._sUrl = url;
		if(customCallBack){
			MESBasic.testMapping.testMappingSet.mainView._customCallBack = customCallBack;
		}
		var arr = objName.split('.');
		if(gridEventObj) {
			MESBasic.testMapping.testMappingSet.mainView.gridEventObj = gridEventObj;
			callbackName = "MESBasic.testMapping.testMappingSet.mainView.getcallBackInfo_DG_IE";
		}else if(obj!=null && obj!=""){
			if(arr.length > 1){
				MESBasic.testMapping.testMappingSet.mainView._prefix = '.'+ arr[0];
			}
			callbackName = isMultiselect ? "MESBasic.testMapping.testMappingSet.mainView.getMultiselectCallBackInfo_DG" : "MESBasic.testMapping.testMappingSet.mainView.getcallBackInfo_DG";
			MESBasic.testMapping.testMappingSet.mainView._currRow = obj.parentNode.parentNode.parentNode;
		}else{
			if(arr.length > 2){
				MESBasic.testMapping.testMappingSet.mainView._prefix = '.'+ arr[0] + '.'+ arr[1];
			}
			callbackName ="MESBasic.testMapping.testMappingSet.mainView.getcallBackInfo";
		}
		if(MESBasic.testMapping.testMappingSet.mainView._prefix!=''){
			MESBasic.testMapping.testMappingSet.mainView._prefix = MESBasic.testMapping.testMappingSet.mainView._prefix.substring(1);
		}
		if(MESBasic.testMapping.testMappingSet.mainView._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.testMapping.testMappingSet.mainView._querycustomFunc(objName.replace(/\./g, '_')));
		}
		if(typeof MESBasic.testMapping.testMappingSet.mainView._querycustomFuncN == "function") {
				refparam += MESBasic.testMapping.testMappingSet.mainView._querycustomFuncN();
		}
		if(crossCompanyFlag && crossCompanyFlag == true) {
			refparam += "&crossCompanyFlag=true";
		}
		MESBasic.testMapping.testMappingSet.mainView._dialog = foundation.common.select({
			pageType : 'other',
			closePage : true,
			callBackFuncName : callbackName,
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.testMapping.testMappingSet.mainView._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.testMapping.testMappingSet.mainView.query_"+obj+")!='undefined'") ? eval('MESBasic.testMapping.testMappingSet.mainView.query_'+obj+'()') : null;
		return str;
	
	};
	
	MESBasic.testMapping.testMappingSet.mainView.getcallBackInfo = function(obj){
		obj[0] = foundation.common.getObject('MESBasic_testMapping_testMappingSet_mainView_form',obj[0], MESBasic.testMapping.testMappingSet.mainView._prefix, MESBasic.testMapping.testMappingSet.mainView._sUrl);
		CUI.commonFills('MESBasic_testMapping_testMappingSet_mainView_form',MESBasic.testMapping.testMappingSet.mainView._prefix,obj[0]);

		try{
			if(MESBasic.testMapping.testMappingSet.mainView._customCallBack) {
				eval(MESBasic.testMapping.testMappingSet.mainView._customCallBack);
				MESBasic.testMapping.testMappingSet.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.testMapping.testMappingSet.mainView._dialog.close();
		} catch(e){}
	};
	
	// 控件版PT回调
	MESBasic.testMapping.testMappingSet.mainView.getcallBackInfo_DG_IE = function(obj){
		if(MESBasic.testMapping.testMappingSet.mainView._customBeforeCallBack) {
			var flag = eval(MESBasic.testMapping.testMappingSet.mainView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		var gridEventObj = MESBasic.testMapping.testMappingSet.mainView.gridEventObj;
		var rootKey = gridEventObj.sKey.split('.')[0];
		var jsonObj = foundation.common.getObjectIE(gridEventObj,obj[0],rootKey,MESBasic.testMapping.testMappingSet.mainView._sUrl);
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
			if(MESBasic.testMapping.testMappingSet.mainView._customCallBack) {
				eval(MESBasic.testMapping.testMappingSet.mainView._customCallBack);
				MESBasic.testMapping.testMappingSet.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}

		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.testMapping.testMappingSet.mainView._dialog.close();
		} catch(e){}
		gridEventObj.oGrid._DT._oGrid.CellSetFocus(gridEventObj.nRow+1, gridEventObj.sKey);
	}
	
	MESBasic.testMapping.testMappingSet.mainView.getcallBackInfo_DG = function(obj){
		if(MESBasic.testMapping.testMappingSet.mainView._customBeforeCallBack) {
			var flag = eval(MESBasic.testMapping.testMappingSet.mainView._customBeforeCallBack.split("(")[0] + "(obj)");
			if(flag === false){
				return false;
			}
		}
		for(var i=0;i<obj.length;i++){
			if(i>0){
				if($(MESBasic.testMapping.testMappingSet.mainView._currRow).next().length==0){
					MESBasic.testMapping.testMappingSet.mainView._oGrid.addNewRow();
				}	
				MESBasic.testMapping.testMappingSet.mainView._currRow = $(MESBasic.testMapping.testMappingSet.mainView._currRow).next();
				$(MESBasic.testMapping.testMappingSet.mainView._currRow).attr('isEdited',true);
			}
			obj[i] = foundation.common.getObject(MESBasic.testMapping.testMappingSet.mainView._currRow,obj[i],MESBasic.testMapping.testMappingSet.mainView._prefix,MESBasic.testMapping.testMappingSet.mainView._sUrl);
			eval("CUI.commonFills_DG(MESBasic.testMapping.testMappingSet.mainView._currRow,MESBasic.testMapping.testMappingSet.mainView._prefix,obj[i],MESBasic.testMapping.testMappingSet.mainView._oGrid)");
		}
		try{
			if(MESBasic.testMapping.testMappingSet.mainView._customCallBack) {
				eval(MESBasic.testMapping.testMappingSet.mainView._customCallBack);
				MESBasic.testMapping.testMappingSet.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.testMapping.testMappingSet.mainView._dialog.close();
		} catch(e){}
	};
	
	MESBasic.testMapping.testMappingSet.mainView.getMultiselectCallBackInfo_DG = function(obj){
		for(var i=0;i<obj.length;i++){
			CUI.commonFillsMultiselect_DG(MESBasic.testMapping.testMappingSet.mainView._oGrid, MESBasic.testMapping.testMappingSet.mainView._currRow, MESBasic.testMapping.testMappingSet.mainView._key, MESBasic.testMapping.testMappingSet.mainView._displayFieldName, obj[i])
		}
		try{
			if(MESBasic.testMapping.testMappingSet.mainView._customCallBack) {
				eval(MESBasic.testMapping.testMappingSet.mainView._customCallBack);
				MESBasic.testMapping.testMappingSet.mainView._customCallBack = null;
			}
		} catch(e){CUI.Dialog.alert("${getHtmlText('ec.view.callback.error')}");}
		
		// 助记码也会调用此方法，容错处理
		try{
			MESBasic.testMapping.testMappingSet.mainView._dialog.close();
		} catch(e){}
	};
	
	MESBasic.testMapping.testMappingSet.mainView.generateInput = function(prefix, obj) {
		CUI.each(obj, function(key,value){
        	if(value!=null && key!='rowHtmlObj' && key!='cellHtmlObj'){
        		var name = prefix + '.' + key;
        		if(typeof value == 'object') {
        			MESBasic.testMapping.testMappingSet.mainView.generateInput(name, value);
        		} else {
        			if(value!=null&&value!='null'&&value!=undefined&&value!='') {
            			CUI('input[name="' + name + '"]').remove();
            			CUI('<input type="hidden" name="'+name+'" value="'+value+'">').appendTo(CUI('#MESBasic_testMapping_testMappingSet_mainView_form'));
        			}
        	   	}
        	}
      	});
	};
	MESBasic.testMapping.testMappingSet.mainView.beforeSubmitMethodSettingInPage = function(){
	};
	
</script>
<script type="text/javascript">

	var panesHeight;
	var thisHeight;
	MESBasic.testMapping.testMappingSet.mainView.initCount = 0;
	MESBasic.testMapping.testMappingSet.mainView.initSize = function(nTabIndex){
		var panesHeight;
		var thisHeight;
		var h = $('#MESBasic_mainView_edit_div').parents('div.content').first().height();
		var datagrids = $('body').data('MESBasic_testMapping_testMappingSet_mainView_datagrids');
		var	conHeight = h-$("#MESBasic_testMapping_testMappingSet_mainView_main_div .edit-tabs").height() - 6;
		panesHeight = conHeight*0.4;
		$("#MESBasic_testMapping_testMappingSet_mainView_main_div .edit-panes-s").each(function(index){
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
							if(MESBasic.testMapping.testMappingSet.mainView.initCount <= 2) {
								setTimeout(function(){MESBasic.testMapping.testMappingSet.mainView.initSize();}, 200);
								MESBasic.testMapping.testMappingSet.mainView.initCount++;
							}/* else {
								MESBasic.testMapping.testMappingSet.mainView.initCount = 0;
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
		MESBasic.testMapping.testMappingSet.mainView.initSize();
		$(window).bind("dialog.resize",function(){MESBasic.testMapping.testMappingSet.mainView.initSize();});
	});
</script>
<script type="text/javascript">
	


	/* CUSTOM CODE START(view-VIEW-MESBasic_1_testMapping_mainView,js,MESBasic_1_testMapping_TestMappingSet,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
</script>