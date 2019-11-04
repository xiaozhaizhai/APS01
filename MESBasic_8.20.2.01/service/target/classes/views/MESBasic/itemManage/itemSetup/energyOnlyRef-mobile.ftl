
<script type="text/javascript">
	CUI.ns("MESBasic.itemManage.itemSetup","MESBasic.itemManage.itemSetup.energyOnlyRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_itemManage_itemSetup_energyOnlyRef_callBackFuncName" id="MESBasic_itemManage_itemSetup_energyOnlyRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415258377559')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm" exportUrl="/MESBasic/itemManage/itemSetup/energyOnlyRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="department" />
		<input type="hidden" reset="false" name="MESBasic_itemManage_itemSetup_energyOnlyRef_condition" id="MESBasic_itemManage_itemSetup_energyOnlyRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415258423663')}_${getText('MESBasic.viewtitle.radion1417771253001')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm" formId="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm" idprefix="ec_MESBasic_itemManage_itemSetup_energyOnlyRef" expandType="all" expand=true fieldcodes="MESBasic_1_itemManage_ItemSetup_itemName_itemName:MESBasic.propertydisplayName.radion1415258813793||MESBasic_1_itemManage_ItemSetup_itemNumber_itemNumber:MESBasic.propertydisplayName.radion1415258842136||MESBasic_1_itemManage_ItemSetup_energyType_energyType:MESBasic.propertydisplayName.radion1417588204115||MESBasic_1_itemManage_ItemSetup_code_code:MESBasic.propertydisplayName.radion1415261315358||MESBasic_1_itemManage_ItemSetup_virtualTag_virtualTag:MESBasic.propertydisplayName.radion1415261562719||MESBasic_1_itemManage_ItemSetup_itemClass_itemClass:MESBasic.propertydisplayName.radion1416380194525||MESBasic_1_itemManage_ItemSetup_tagType_tagType:MESBasic.propertydisplayName.radion1415260997658" >
							<#assign itemName_defaultValue  = ''>
									<#assign itemName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_itemManage_ItemSetup_itemName_itemName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_itemManage_ItemSetup_itemName_itemName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415258813793')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (itemName_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${itemName_defaultValue!}" deValue="${itemName_defaultValue!}"   conditionfunc="MESBasic.itemManage.itemSetup.energyOnlyRef._querycustomFunc('itemName')" name="itemName" id="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm_itemName" displayFieldName="itemName" exp="like" classStyle="form-control"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.itemManage.itemSetup.energyOnlyRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.itemManage.itemSetup.energyOnlyRef._querycustomFunc('itemName')" name="itemName" id="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm_itemName" displayFieldName="itemName" exp="like" classStyle="form-control"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.itemManage.itemSetup.energyOnlyRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign itemNumber_defaultValue  = ''>
									<#assign itemNumber_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_itemManage_ItemSetup_itemNumber_itemNumber" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_itemManage_ItemSetup_itemNumber_itemNumber">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415258842136')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (itemNumber_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${itemNumber_defaultValue!}" deValue="${itemNumber_defaultValue!}"   conditionfunc="MESBasic.itemManage.itemSetup.energyOnlyRef._querycustomFunc('itemNumber')" name="itemNumber" id="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm_itemNumber" displayFieldName="itemNumber" exp="like" classStyle="form-control"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.itemManage.itemSetup.energyOnlyRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.itemManage.itemSetup.energyOnlyRef._querycustomFunc('itemNumber')" name="itemNumber" id="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm_itemNumber" displayFieldName="itemNumber" exp="like" classStyle="form-control"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.itemManage.itemSetup.energyOnlyRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign energyType_defaultValue  = ''>
									<#assign energyType_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_itemManage_ItemSetup_energyType_energyType" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_itemManage_ItemSetup_energyType_energyType">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1417588204115')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${energyType_defaultValue}"   name="energyType" code="ItemClass" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_itemManage_ItemSetup_code_code" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_itemManage_ItemSetup_code_code">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415261315358')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (code_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.itemManage.itemSetup.energyOnlyRef._querycustomFunc('code')" name="code" id="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm_code" displayFieldName="code" exp="like" classStyle="form-control"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.itemManage.itemSetup.energyOnlyRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.itemManage.itemSetup.energyOnlyRef._querycustomFunc('code')" name="code" id="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm_code" displayFieldName="code" exp="like" classStyle="form-control"  url="/MESBasic/itemManage/itemSetup/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.itemManage.itemSetup.energyOnlyRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign virtualTag_defaultValue  = ''>
									<#assign virtualTag_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_itemManage_ItemSetup_virtualTag_virtualTag" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_itemManage_ItemSetup_virtualTag_virtualTag">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415261562719')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<select class="form-control" deValue="${virtualTag_defaultValue!}" name="virtualTag" id="virtualTag" exp="equal"  value=""> 
												<option value=""></option>
												<option value="1" <#if (virtualTag_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
												<option value="0" <#if (virtualTag_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											</select>
									
									</div>			
								</div>
							</div>
							<#assign itemClass_defaultValue  = ''>
									<#assign itemClass_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_itemManage_ItemSetup_itemClass_itemClass" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_itemManage_ItemSetup_itemClass_itemClass">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1416380194525')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${itemClass_defaultValue}"   name="itemClass" code="ITEM_PROPERTY" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
							<#assign tagType_defaultValue  = ''>
									<#assign tagType_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_itemManage_ItemSetup_tagType_tagType" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_itemManage_ItemSetup_tagType_tagType">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415260997658')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${tagType_defaultValue}"   name="tagType" code="TAG_TYPE" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm" type="search" onclick="MESBasic.itemManage.itemSetup.energyOnlyRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm' );
		if( buttons.length > 0 ){
			// 去掉按钮间的空格
			var parentNode = buttons.parent()[0];
			var textNodes = [];
			for ( var i = 0, l = parentNode.childNodes.length; i < l; i++ ) { 
				// 文本节点
				if ( parentNode.childNodes[i].nodeType == 3  ) { 
					textNodes.push( parentNode.childNodes[i] ); 
				} 
			}
			for ( var i = 0, l = textNodes.length; i < l; i++ ) { 
				textNodes[i].parentNode.removeChild( textNodes[i] );
			}
			// 设置样式
			buttons.addClass( "btn-center" );
			buttons.first().removeClass( "btn-center" ).addClass( "btn-left" );
			buttons.last().removeClass( "btn-center" ).addClass( "btn-right" );
			
			switch( buttons.length ){
				case 2:
					buttons.css( 'width', '50%' );
					break;
				case 3:
					buttons.css( 'width', '33.3%' );
					break;
				case 4:
					buttons.css( 'width', '25%' );
					break;
				case 5:
					buttons.css( 'width', '20%' );
					break;
			}
			
			$(document.body).css( 'visibility', 'visible');
			
			buttons.unbind( 'touchstart.changeStyle' ).unbind( 'touchend.changeStyle' ).bind( {
				'touchstart.changeStyle': function ( ) {
					$(this).addClass('touch-style');
				},
				'touchend.changeStyle': function ( ) {
					var self = $(this);
					setTimeout( function ( ) {
						self.removeClass('touch-style');
					}, 200)
				}
			} )
		}	
	})

ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info={};
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["itemName"]={};
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["itemName"].dbColumnType="TEXT";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["itemName"].layRec="itemName";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["itemName"].columnName="IS_ITEMNAME";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["itemNumber"]={};
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["itemNumber"].dbColumnType="TEXT";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["itemNumber"].layRec="itemNumber";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["itemNumber"].columnName="IS_ITEMNUMBER";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["energyType"]={};
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["energyType"].dbColumnType="SYSTEMCODE";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["energyType"].layRec="energyType";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["energyType"].columnName="IS_ITEMCLASS";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["code"]={};
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["code"].layRec="code";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["code"].columnName="CODE";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["virtualTag"]={};
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["virtualTag"].dbColumnType="BOOLEAN";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["virtualTag"].layRec="virtualTag";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["virtualTag"].columnName="VIRTUAL_TAG";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["itemClass"]={};
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["itemClass"].dbColumnType="SYSTEMCODE";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["itemClass"].layRec="itemClass";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["itemClass"].columnName="MEASURE_CLASS";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["tagType"]={};
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["tagType"].dbColumnType="SYSTEMCODE";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["tagType"].layRec="tagType";
ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["tagType"].columnName="TAG_TYPE";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.itemManage.itemSetup.energyOnlyRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/itemManage/itemSetup/energyOnlyRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_query" renderOverEvent="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_RenderOverEvent"  modelCode="MESBasic_1_itemManage_ItemSetup" noPermissionKeys="code,itemNumber,itemName,energyType,virtualTag,itemPlace.placeName,crtValue,updatTime" hidekeyPrefix="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','energyType.id','itemClass.id','tagType.id','itemPlace.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
				<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30/>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1415261315358')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign itemNumber_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${itemNumber_displayDefaultType!}"  key="itemNumber"   label="${getText('MESBasic.propertydisplayName.radion1415258842136')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign itemName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${itemName_displayDefaultType!}"  key="itemName"   label="${getText('MESBasic.propertydisplayName.radion1415258813793')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign energyType_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${energyType_displayDefaultType!}"  key="energyType.value"   label="${getText('MESBasic.propertydisplayName.radion1417588204115')}" textalign="left"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign virtualTag_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECT" defaultDisplay="${virtualTag_displayDefaultType!}"  key="virtualTag"   label="${getText('MESBasic.propertydisplayName.radion1415261562719')}" textalign="center"  width=100   type="boolean"    showFormatFunc=""/>
			<#assign itemPlace_placeName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${itemPlace_placeName_displayDefaultType!}"  key="itemPlace.placeName"   label="${getText('MESBasic.propertydisplayName.radion1418607347494')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign crtValue_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${crtValue_displayDefaultType!}"  key="crtValue"   label="${getText('MESBasic.propertydisplayName.radion1415260736864')}" textalign="right" decimal="4" width=100   type="decimal"    showFormatFunc=""/>
			<#assign updatTime_displayDefaultType  = ''>
			<@datacolumn   showFormat="YMD_HMS" defaultDisplay="${updatTime_displayDefaultType!}"  key="updatTime"   label="${getText('MESBasic.propertydisplayName.radion1415260814187')}" textalign="center"  width=100   type="datetime"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_itemManage_itemSetup_energyOnlyRef_RenderOverEvent(){
}
	
	
	
	
	
	
	
	
</script>			</div>
		</div>
	</div>
	
</div>
	
<div id="load-mask" class="modal-backdrop fade in bg" style="display:none;overflow:auto;background-color:#000;opacity:0.6;filter: alpha(opacity=60);">
	<div style="position:absolute;top:50%;left:50%;width:50px;height:50px;margin-top:-10px;margin-left:-25px;">
		<img src="/bap/struts/mobile/img/loading.gif" width="48" height="48"/>
	</div>
</div>

<script type="text/javascript">
	/**
	 * 查询
	 * @method MESBasic.itemManage.itemSetup.energyOnlyRef.query
	 */
	MESBasic.itemManage.itemSetup.energyOnlyRef.query = function(type,pageNo){
		var node = MESBasic.itemManage.itemSetup.energyOnlyRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.itemManage.itemSetup.energyOnlyRef.node = null;
		if(!checkListValid("ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/itemManage/itemSetup/energyOnlyRef-query.action";
		CUI('#ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_itemManage_energyOnlyRef";
		condobj.modelAlias="itemSetup";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info[fieldName].dbColumnType;
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
									fastColValue += "-" + str[1] + "-" + lastDay + " 23:59:59";
								}
							}
							fieldObj.operator="<=";
							fieldObj.paramStr="?";
						}else{
							if(ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm *[name="'+ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_itemManage_itemSetup_energyOnlyRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_itemManage_itemSetup_energyOnlyRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_itemManage_itemSetup_energyOnlyRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_itemManage_energyOnlyRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_itemManage_itemSetup_energyOnlyRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.itemManage.itemSetup.energyOnlyRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.itemManage.itemSetup.energyOnlyRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.itemManage.itemSetup.energyOnlyRef._prefix += '.';
			}
			MESBasic.itemManage.itemSetup.energyOnlyRef._prefix += arr[i];
		}
		MESBasic.itemManage.itemSetup.energyOnlyRef._suffix = arr[arr.length -1];
		if(MESBasic.itemManage.itemSetup.energyOnlyRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.itemManage.itemSetup.energyOnlyRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.itemManage.itemSetup.energyOnlyRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.itemManage.itemSetup.energyOnlyRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.itemManage.itemSetup.energyOnlyRef.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm *[name="'+MESBasic.itemManage.itemSetup.energyOnlyRef._prefix + '.' + MESBasic.itemManage.itemSetup.energyOnlyRef._suffix +'"]').val(obj[0][MESBasic.itemManage.itemSetup.energyOnlyRef._suffix]);
		CUI('#ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm *[name="'+MESBasic.itemManage.itemSetup.energyOnlyRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm *[name^="'+MESBasic.itemManage.itemSetup.energyOnlyRef._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm *[name="'+MESBasic.itemManage.itemSetup.energyOnlyRef._prefix + '.' + MESBasic.itemManage.itemSetup.energyOnlyRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_itemManage_itemSetup_energyOnlyRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.itemManage.itemSetup.energyOnlyRef._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.itemManage.itemSetup.energyOnlyRef.query_"+obj+")!='undefined'") ? eval('MESBasic.itemManage.itemSetup.energyOnlyRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_itemManage_itemSetup_energyOnlyRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_itemManage_itemSetup_energyOnlyRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.itemSetup.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_itemManage_itemSetup_energyOnlyRef_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_itemManage_itemSetup_energyOnlyRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_itemManage_itemSetup_energyOnlyRef_refresh = function(node){
	//var url = "/MESBasic/itemManage/itemSetup/energyOnlyRef-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_itemManage_itemSetup_energyOnlyRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_itemManage_itemSetup_energyOnlyRef_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.itemManage.itemSetup.energyOnlyRef.node = node;
	MESBasic.itemManage.itemSetup.energyOnlyRef.query("query");
}

MESBasic_itemManage_itemSetup_energyOnlyRef_getList = function() {
	return "MESBasic.itemManage.itemSetup.energyOnlyRef";
}

	MESBasic.itemManage.itemSetup.energyOnlyRef.commonQuery = function(type) {
	  if(typeof MESBasic.itemManage.itemSetup.energyOnlyRef.cancelSelectedNode == 'function') {
	   MESBasic.itemManage.itemSetup.energyOnlyRef.cancelSelectedNode();
	  }
	  MESBasic.itemManage.itemSetup.energyOnlyRef.query(type);
	 };
	
	

MESBasic.itemManage.itemSetup.energyOnlyRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.itemManage.itemSetup.energyOnlyRef.otherParams = {};
	MESBasic.itemManage.itemSetup.energyOnlyRef.otherParams.dialogType = dialogType;
	MESBasic.itemManage.itemSetup.energyOnlyRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.itemManage.itemSetup.energyOnlyRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_itemManage_energyOnlyRef,js,MESBasic_1_itemManage_ItemSetup,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
