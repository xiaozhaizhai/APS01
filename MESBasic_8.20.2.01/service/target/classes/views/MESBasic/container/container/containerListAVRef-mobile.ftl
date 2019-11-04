
<script type="text/javascript">
	CUI.ns("MESBasic.container.container","MESBasic.container.container.containerListAVRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="MESBasic_container_container_containerListAVRef_callBackFuncName" id="MESBasic_container_container_containerListAVRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_MESBasic_container_container_containerListAVRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('MESBasic.entityname.radion1415252093775')}</span></div>
	</#if>
	<@errorbar id="ec_MESBasic_container_container_containerListAVRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_MESBasic_container_container_containerListAVRef_queryForm" exportUrl="/MESBasic/container/container/containerListAVRef-query.action">
		<input type="hidden" id="sysbase_1_0_department_base_department" value="ownerDepartment" />
		<input type="hidden" id="sysbase_1_0_position_base_position" value="ownerPosition" />
		<input type="hidden" id="MESBasic_1_tankModel_TankModel" value="model" />
		<input type="hidden" id="sysbase_1_0_department_base_department" value="department" />
		<input type="hidden" reset="false" name="MESBasic_container_container_containerListAVRef_condition" id="MESBasic_container_container_containerListAVRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('MESBasic.modelname.radion1415252141275')}_${getText('MESBasic.viewtitle.radion1418789997648')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_MESBasic_container_container_containerListAVRef_queryForm" formId="ec_MESBasic_container_container_containerListAVRef_queryForm" idprefix="ec_MESBasic_container_container_containerListAVRef" expandType="all" expand=true fieldcodes="MESBasic_1_container_Container_code_code:MESBasic.propertydisplayName.radion1415268359829||MESBasic_1_container_Container_containerStatus_containerStatus:MESBasic.propertydisplayName.radion1415322023968||MESBasic_1_container_Container_containerType_containerType:MESBasic.propertydisplayName.radion1415320693399||MESBasic_1_container_Container_name_name:MESBasic.propertydisplayName.radion1415268393452||MESBasic_1_container_Container_produceMgr_produceMgr:MESBasic.propertydisplayName.radion1415847889766||MESBasic_1_container_Container_tankMgr_tankMgr:MESBasic.propertydisplayName.radion1415847847462||MESBasic_1_equipManage_Equipment_name_equip_name:MESBasic.propertydisplayName.randon1423967231438" >
							<#assign code_defaultValue  = ''>
									<#assign code_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_container_Container_code_code" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_container_Container_code_code">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415268359829')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (code_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_container_container_containerListAVRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${code_defaultValue!}" deValue="${code_defaultValue!}"   conditionfunc="MESBasic.container.container.containerListAVRef._querycustomFunc('code')" name="code" id="ec_MESBasic_container_container_containerListAVRef_queryForm_code" displayFieldName="code" exp="like" classStyle="form-control"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.container.container.containerListAVRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_container_container_containerListAVRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.container.container.containerListAVRef._querycustomFunc('code')" name="code" id="ec_MESBasic_container_container_containerListAVRef_queryForm_code" displayFieldName="code" exp="like" classStyle="form-control"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.container.container.containerListAVRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign containerStatus_defaultValue  = 'CONTAINER_STATUS/0'>
									<#assign containerStatus_defaultValue  = 'CONTAINER_STATUS/0'>
							<div  field-unique-code="MESBasic_1_container_Container_containerStatus_containerStatus" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_container_Container_containerStatus_containerStatus">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415322023968')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${containerStatus_defaultValue}"   name="containerStatus" code="CONTAINER_STATUS" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
							<#assign containerType_defaultValue  = ''>
									<#assign containerType_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_container_Container_containerType_containerType" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_container_Container_containerType_containerType">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415320693399')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<@systemcode onchange="" ecFlag=true multable=false deValue="${containerType_defaultValue}"   name="containerType" code="CONTAINER_TYPE" classStyle="form-control" value="" />
											
									</div>			
								</div>
							</div>
							<#assign name_defaultValue  = ''>
									<#assign name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_container_Container_name_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_container_Container_name_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415268393452')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<#if (name_defaultValue)?has_content>
												<@mneclient formId="ec_MESBasic_container_container_containerListAVRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany value="${name_defaultValue!}" deValue="${name_defaultValue!}"   conditionfunc="MESBasic.container.container.containerListAVRef._querycustomFunc('name')" name="name" id="ec_MESBasic_container_container_containerListAVRef_queryForm_name" displayFieldName="name" exp="like" classStyle="form-control"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.container.container.containerListAVRef.commonQuery('query')" />
											<#else>
												<@mneclient formId="ec_MESBasic_container_container_containerListAVRef_queryForm" isPrecise=true isCrossCompany=isCrossCompany  conditionfunc="MESBasic.container.container.containerListAVRef._querycustomFunc('name')" name="name" id="ec_MESBasic_container_container_containerListAVRef_queryForm_name" displayFieldName="name" exp="like" classStyle="form-control"  url="/MESBasic/container/container/mneClient.action" multiple=false mnewidth=260 searchClick="MESBasic.container.container.containerListAVRef.commonQuery('query')" />
											</#if>
											
									</div>			
								</div>
							</div>
							<#assign produceMgr_defaultValue  = ''>
									<#assign produceMgr_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_container_Container_produceMgr_produceMgr" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_container_Container_produceMgr_produceMgr">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415847889766')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<select class="form-control" deValue="${produceMgr_defaultValue!}" name="produceMgr" id="produceMgr" exp="equal"  value=""> 
												<option value=""></option>
												<option value="1" <#if (produceMgr_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
												<option value="0" <#if (produceMgr_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											</select>
									
									</div>			
								</div>
							</div>
							<#assign tankMgr_defaultValue  = ''>
									<#assign tankMgr_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_container_Container_tankMgr_tankMgr" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_container_Container_tankMgr_tankMgr">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.radion1415847847462')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<select class="form-control" deValue="${tankMgr_defaultValue!}" name="tankMgr" id="tankMgr" exp="equal"  value=""> 
												<option value=""></option>
												<option value="1" <#if (tankMgr_defaultValue!)=='true'>selected='selected'</#if>>${getText('ec.select.yes')}</option>
												<option value="0" <#if (tankMgr_defaultValue!)=='false'>selected='selected'</#if>>${getText('ec.select.no')}</option>
											</select>
									
									</div>			
								</div>
							</div>
							<#assign equip_name_defaultValue  = ''>
									<#assign equip_name_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_equipManage_Equipment_name_equip_name" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_equipManage_Equipment_name_equip_name">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('MESBasic.propertydisplayName.randon1423967231438')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="equip.id" name="equip.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('MESBasic.viewtitle.randon1423967959681')}"  conditionfunc="MESBasic.container.container.containerListAVRef._querycustomFunc('equip_name')" name="equip.name" id="ec_MESBasic_container_container_containerListAVRef_queryForm_equip_name" displayFieldName="name" type="other" exp="like" classStyle="form-control" url="/MESBasic/equipManage/equipment/ref.action" clicked=true multiple=false mnewidth=260 formId="ec_MESBasic_container_container_containerListAVRef_queryForm" searchClick="MESBasic.container.container.containerListAVRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_MESBasic_container_container_containerListAVRef_queryForm" type="search" onclick="MESBasic.container.container.containerListAVRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_MESBasic_container_container_containerListAVRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_MESBasic_container_container_containerListAVRef_queryForm' );
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

ec_MESBasic_container_container_containerListAVRef_quickquery_info={};
ec_MESBasic_container_container_containerListAVRef_quickquery_info["code"]={};
ec_MESBasic_container_container_containerListAVRef_quickquery_info["code"].dbColumnType="TEXT";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["code"].layRec="code";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["code"].columnName="CODE";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["containerStatus"]={};
ec_MESBasic_container_container_containerListAVRef_quickquery_info["containerStatus"].dbColumnType="SYSTEMCODE";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["containerStatus"].layRec="containerStatus";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["containerStatus"].columnName="CONTAINER_STATUS";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["containerType"]={};
ec_MESBasic_container_container_containerListAVRef_quickquery_info["containerType"].dbColumnType="SYSTEMCODE";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["containerType"].layRec="containerType";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["containerType"].columnName="CONTAINER_TYPE";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["name"]={};
ec_MESBasic_container_container_containerListAVRef_quickquery_info["name"].dbColumnType="TEXT";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["name"].layRec="name";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["name"].columnName="NAME";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["produceMgr"]={};
ec_MESBasic_container_container_containerListAVRef_quickquery_info["produceMgr"].dbColumnType="BOOLEAN";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["produceMgr"].layRec="produceMgr";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["produceMgr"].columnName="PRODUCE_MGR";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["tankMgr"]={};
ec_MESBasic_container_container_containerListAVRef_quickquery_info["tankMgr"].dbColumnType="BOOLEAN";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["tankMgr"].layRec="tankMgr";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["tankMgr"].columnName="TANK_MGR";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["equip.name"]={};
ec_MESBasic_container_container_containerListAVRef_quickquery_info["equip.name"].dbColumnType="TEXT";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["equip.name"].layRec="EAM_BASEINFO,EAM_ID,MESBASIC_CONTAINERS,EQUIP-name";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["equip.name"].columnName="EAM_NAME";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["equip.id"]={};
ec_MESBasic_container_container_containerListAVRef_quickquery_info["equip.id"].dbColumnType="LONG";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["equip.id"].layRec="EAM_BASEINFO,EAM_ID,MESBASIC_CONTAINERS,EQUIP-name";
ec_MESBasic_container_container_containerListAVRef_quickquery_info["equip.id"].columnName="ID";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "MESBasic.container.container.containerListAVRef.query('query')">
<#assign datatable_dataUrl = "/MESBasic/container/container/containerListAVRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
</#if>
<@datatable id="ec_MESBasic_container_container_containerListAVRef_query" renderOverEvent="ec_MESBasic_container_container_containerListAVRef_RenderOverEvent"  modelCode="MESBasic_1_container_Container" noPermissionKeys="code,name,equip.name,containerType,containerStatus,department.name,model.name,product.productName" hidekeyPrefix="ec_MESBasic_container_container_containerListAVRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_MESBasic_container_container_containerListAVRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','containerType.id','containerStatus.id','equip.id','department.id','model.id','product.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign code_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${code_displayDefaultType!}"  key="code"   label="${getText('MESBasic.propertydisplayName.radion1415268359829')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${name_displayDefaultType!}"  key="name"   label="${getText('MESBasic.propertydisplayName.radion1415268393452')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign equip_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${equip_name_displayDefaultType!}"  key="equip.name"   label="${getText('MESBasic.propertydisplayName.randon1423967231438')}" textalign="left"  width=120   type="textfield"    showFormatFunc=""/>
			<#assign containerType_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${containerType_displayDefaultType!}"  key="containerType.value"   label="${getText('MESBasic.propertydisplayName.radion1415320693399')}" textalign="center"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign containerStatus_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${containerStatus_displayDefaultType!}"  key="containerStatus.value"   label="${getText('MESBasic.propertydisplayName.radion1415322023968')}" textalign="center"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign department_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${department_name_displayDefaultType!}"  key="department.name"   label="${getText('part.fzwdy.xm.mainPositionId.department.name')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign model_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${model_name_displayDefaultType!}"  key="model.name"   label="${getText('MESBasic.propertydisplayName.radion1415150519135')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign product_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${product_productName_displayDefaultType!}"  key="product.productName"   label="${getText('MESBasic.propertydisplayName.radion1415772740737')}" textalign="left"  width=140   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_MESBasic_container_container_containerListAVRef_RenderOverEvent(){
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
	 * @method MESBasic.container.container.containerListAVRef.query
	 */
	MESBasic.container.container.containerListAVRef.query = function(type,pageNo){
		var node = MESBasic.container.container.containerListAVRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		MESBasic.container.container.containerListAVRef.node = null;
		if(!checkListValid("ec_MESBasic_container_container_containerListAVRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/MESBasic/container/container/containerListAVRef-query.action";
		CUI('#ec_MESBasic_container_container_containerListAVRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_MESBasic_container_container_containerListAVRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="MESBasic_1_container_containerListAVRef";
		condobj.modelAlias="container";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_MESBasic_container_container_containerListAVRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_MESBasic_container_container_containerListAVRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_MESBasic_container_container_containerListAVRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_MESBasic_container_container_containerListAVRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_MESBasic_container_container_containerListAVRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_MESBasic_container_container_containerListAVRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_MESBasic_container_container_containerListAVRef_queryForm *[name="'+ec_MESBasic_container_container_containerListAVRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_MESBasic_container_container_containerListAVRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_MESBasic_container_container_containerListAVRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_MESBasic_container_container_containerListAVRef_quickquery_info["MainTableName"];
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
						var layrec=ec_MESBasic_container_container_containerListAVRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_MESBasic_container_container_containerListAVRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#MESBasic_container_container_containerListAVRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'MESBasic_1_container_containerListAVRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_MESBasic_container_container_containerListAVRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	MESBasic.container.container.containerListAVRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		MESBasic.container.container.containerListAVRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				MESBasic.container.container.containerListAVRef._prefix += '.';
			}
			MESBasic.container.container.containerListAVRef._prefix += arr[i];
		}
		MESBasic.container.container.containerListAVRef._suffix = arr[arr.length -1];
		if(MESBasic.container.container.containerListAVRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(MESBasic.container.container.containerListAVRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		MESBasic.container.container.containerListAVRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'MESBasic.container.container.containerListAVRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	MESBasic.container.container.containerListAVRef.getcallBackInfo = function(obj){
		CUI('#ec_MESBasic_container_container_containerListAVRef_queryForm *[name="'+MESBasic.container.container.containerListAVRef._prefix + '.' + MESBasic.container.container.containerListAVRef._suffix +'"]').val(obj[0][MESBasic.container.container.containerListAVRef._suffix]);
		CUI('#ec_MESBasic_container_container_containerListAVRef_queryForm *[name="'+MESBasic.container.container.containerListAVRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_MESBasic_container_container_containerListAVRef_queryForm *[name^="'+MESBasic.container.container.containerListAVRef._prefix + '."]').unbind("change");
		CUI('#ec_MESBasic_container_container_containerListAVRef_queryForm *[name="'+MESBasic.container.container.containerListAVRef._prefix + '.' + MESBasic.container.container.containerListAVRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_MESBasic_container_container_containerListAVRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	MESBasic.container.container.containerListAVRef._querycustomFunc = function(obj) {
		var str = eval("typeof(MESBasic.container.container.containerListAVRef.query_"+obj+")!='undefined'") ? eval('MESBasic.container.container.containerListAVRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_MESBasic_container_container_containerListAVRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_MESBasic_container_container_containerListAVRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('MESBasic.container.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#MESBasic_container_container_containerListAVRef_callBackFuncName").val() != ""){
				eval(CUI("#MESBasic_container_container_containerListAVRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
MESBasic_container_container_containerListAVRef_refresh = function(node){
	//var url = "/MESBasic/container/container/containerListAVRef-query.action";
	//if(node.layRec){
	//	datatable_ec_MESBasic_container_container_containerListAVRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_MESBasic_container_container_containerListAVRef_query.setRequestDataUrl(url,'',false);
	//}
	MESBasic.container.container.containerListAVRef.node = node;
	MESBasic.container.container.containerListAVRef.query("query");
}

MESBasic_container_container_containerListAVRef_getList = function() {
	return "MESBasic.container.container.containerListAVRef";
}

	MESBasic.container.container.containerListAVRef.commonQuery = function(type) {
	  if(typeof MESBasic.container.container.containerListAVRef.cancelSelectedNode == 'function') {
	   MESBasic.container.container.containerListAVRef.cancelSelectedNode();
	  }
	  MESBasic.container.container.containerListAVRef.query(type);
	 };
	
	

MESBasic.container.container.containerListAVRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	MESBasic.container.container.containerListAVRef.otherParams = {};
	MESBasic.container.container.containerListAVRef.otherParams.dialogType = dialogType;
	MESBasic.container.container.containerListAVRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		MESBasic.container.container.containerListAVRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-MESBasic_1_container_containerListAVRef,js,MESBasic_1_container_Container,MESBasic_1) */
// 自定义代码
/* CUSTOM CODE END */
	</script>
  </body>
</html>
