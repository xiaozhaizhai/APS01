
<script type="text/javascript">
	CUI.ns("RM.formula.formulaBom","RM.formula.formulaBom.formulaBomRef");
</script>
<div class="container"  style="padding-top:10px;">
	<input type="hidden" name="RM_formula_formulaBom_formulaBomRef_callBackFuncName" id="RM_formula_formulaBom_formulaBomRef_callBackFuncName" value="${(callBackFuncName)!'getcallBackInfo'}"/>
	<div>
		<div class="row">

	<div id="ec_RM_formula_formulaBom_formulaBomRef_queryForm_inputValue">
	<#if businessCenterCode?? >
	<div class="edit-menubar"><span class="title-bar">${getText('RM.entityname.randon1487075671473')}</span></div>
	</#if>
	<@errorbar id="ec_RM_formula_formulaBom_formulaBomRef_queryFormErrorBar" />
	<form onsubmit="return false" id="ec_RM_formula_formulaBom_formulaBomRef_queryForm" exportUrl="/RM/formula/formulaBom/formulaBomRef-query.action">
		<input type="hidden" reset="false" name="RM_formula_formulaBom_formulaBomRef_condition" id="RM_formula_formulaBom_formulaBomRef_condition" value="${(condition)!''}"/>
		<#assign isCrossCompany = Parameters.crossCompanyFlag!false>
		<input type="hidden" reset="false" id="page.fileName" name="page.fileName" value="${getText('RM.modelname.randon1487243065955')}_${getText('RM.viewtitle.randon1505786231333')}.xls" />
		<input type="hidden" id="advQueryCond" name="advQueryCond" />
		<input type="hidden" id="classifyCodes" name="classifyCodes" />
		<input type="hidden" id="dataTableSortColKey" name="dataTableSortColKey"  />
		<input type="hidden" id="dataTableSortColOrder" name="dataTableSortColOrder" />
						<@quickquery unique="LAST_QUERY_ec_RM_formula_formulaBom_formulaBomRef_queryForm" formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" idprefix="ec_RM_formula_formulaBom_formulaBomRef" expandType="all" expand=true fieldcodes="RM_7_5_0_0_formula_Formula_code_formulaId_code:RM.formula.randon1488246312092||MESBasic_1_product_Product_productCode_productId_productCode:RM.propertydisplayName.radion14157726448331||MESBasic_1_product_Product_productName_productId_productName:RM.propertydisplayName.radion14157727407371" >
							<#assign formulaId_code_defaultValue  = ''>
									<#assign formulaId_code_defaultValue  = ''>
							<div  field-unique-code="RM_7_5_0_0_formula_Formula_code_formulaId_code" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "RM_7_5_0_0_formula_Formula_code_formulaId_code">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.formula.randon1488246312092')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="formulaId.id" name="formulaId.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('')}"  conditionfunc="RM.formula.formulaBom.formulaBomRef._querycustomFunc('formulaId_code')" name="formulaId.code" id="ec_RM_formula_formulaBom_formulaBomRef_queryForm_formulaId_code" displayFieldName="code" type="other" exp="equal" classStyle="form-control" url="" clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" searchClick="RM.formula.formulaBom.formulaBomRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign productId_productCode_defaultValue  = ''>
									<#assign productId_productCode_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productCode_productId_productCode" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productCode_productId_productCode">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.radion14157726448331')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
											<input type="hidden" id="productId.id" name="productId.id" value="" />
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('')}"  conditionfunc="RM.formula.formulaBom.formulaBomRef._querycustomFunc('productId_productCode')" name="productId.productCode" id="ec_RM_formula_formulaBom_formulaBomRef_queryForm_productId_productCode" displayFieldName="productCode" type="other" exp="like" classStyle="form-control" url="" clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" searchClick="RM.formula.formulaBom.formulaBomRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
							<#assign productId_productName_defaultValue  = ''>
									<#assign productId_productName_defaultValue  = ''>
							<div  field-unique-code="MESBasic_1_product_Product_productName_productId_productName" class="mobi-dropdown col-xs-12 col-sm-6 col-md-4 col-lg-4 <#if (lastQuery.value)?? && lastQuery.value == "MESBasic_1_product_Product_productName_productId_productName">mobi-dropdown-active</#if>"> 
								<div class="row">
									<div class="col-xs-12 col-sm-3 col-md-4  col-lg-4 mobi-dropdown-label"><label class="label-wd">
										${getText('RM.propertydisplayName.radion14157727407371')}
									</label></div>
									<div class="col-xs-12 col-sm-9 col-md-8 col-lg-8 margin-bottom-5">
									
												<@mneclient mneenable=true isPrecise=true isCrossCompany=isCrossCompany reftitle="${getText('')}"  conditionfunc="RM.formula.formulaBom.formulaBomRef._querycustomFunc('productId_productName')" name="productId.productName" id="ec_RM_formula_formulaBom_formulaBomRef_queryForm_productId_productName" displayFieldName="productName" type="other" exp="like" classStyle="form-control" url="" clicked=true multiple=false mnewidth=260 formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" searchClick="RM.formula.formulaBom.formulaBomRef.commonQuery('query')" />
											
									</div>			
								</div>
							</div>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 margin-bottom-5">						
				       	<@querybutton formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" type="search" onclick="RM.formula.formulaBom.formulaBomRef.commonQuery('query')" /> 
				 		<@querybutton formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" type="clear"  /> 
				 		</div>
			</@quickquery>
	</form>
</div>
<script>
	$(function(){
		var buttons = $( 'button.btn-list', '#ec_RM_formula_formulaBom_formulaBomRef_queryForm' );
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

ec_RM_formula_formulaBom_formulaBomRef_quickquery_info={};
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.code"]={};
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.code"].dbColumnType="BAPCODE";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.code"].layRec="RM_FORMULAS,ID,RM_FORMULA_BOMS,FORMULA_ID-code";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.code"].columnName="CODE";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.id"]={};
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.id"].dbColumnType="LONG";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.id"].layRec="RM_FORMULAS,ID,RM_FORMULA_BOMS,FORMULA_ID-code";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["formulaId.id"].columnName="ID";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productCode"]={};
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productCode"].dbColumnType="TEXT";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productCode"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULA_BOMS,PRODUCT_ID-productCode";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productCode"].columnName="PRODUCT_CODE";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.id"]={};
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULA_BOMS,PRODUCT_ID-productCode";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.id"].columnName="ID";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productName"]={};
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productName"].dbColumnType="TEXT";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productName"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULA_BOMS,PRODUCT_ID-productName";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.productName"].columnName="PRODUCT_NAME";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.id"]={};
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.id"].dbColumnType="LONG";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.id"].layRec="S2BASE_PRODUCT,PRODUCT_ID,RM_FORMULA_BOMS,PRODUCT_ID-productName";
ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["productId.id"].columnName="ID";
</script>		</div>
	</div> 
	
	<div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 margin-bottom-5">

<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formulaBom.formulaBomRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaBom/formulaBomRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
<#if useInBusiness?? && useInBusiness == 'yes'>
<#assign datatable_firstLoad = true>
<#assign datatable_queryFunc = "RM.formula.formulaBom.formulaBomRef.query('query')">
<#assign datatable_dataUrl = "/RM/formula/formulaBom/formulaBomRef-query.action?1=1&crossCompanyFlag=" + Parameters.crossCompanyFlag!>
</#if>
<@datatable id="ec_RM_formula_formulaBom_formulaBomRef_query" renderOverEvent="ec_RM_formula_formulaBom_formulaBomRef_RenderOverEvent"  modelCode="RM_7.5.0.0_formula_FormulaBom" noPermissionKeys="formulaId.code,productId.productCode,productId.productName,property,unitQuality,productId.productBaseUnit.name,isMixQuality,phase,sequence,needWeigh,minQuality,maxQuality,lossRate,meno" hidekeyPrefix="ec_RM_formula_formulaBom_formulaBomRef_query" orderMode="backstage" queryFunc=datatable_queryFunc formId="ec_RM_formula_formulaBom_formulaBomRef_queryForm" firstLoad=datatable_firstLoad  exportExcel=true style="margin-left:13px;margin-right:4px;" editable=false dtPage="page" dataUrl=datatable_dataUrl transMethod="post" hidekey="['id','version','formulaId.code','property.id','formulaId.id','productId.id','productId.productBaseUnit.id']" postData="&${(condition!'')}&permissionCode=${permissionCode!''}">
	<#if (Session['touchScreen']?? && Session['touchScreen']??)>
	</#if>
			<#if flowBulkFlag?? && flowBulkFlag==true>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="true" label="" width=30 />
    		<#else>
    		<@datacolumn key="checkbox" type="checkbox" textalign="center" checkall="false" label="" width=30 />
    		</#if>
			<#assign productId_productCode_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productCode_displayDefaultType!}"  key="productId.productCode"   label="${getText('RM.propertydisplayName.radion14157726448331')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign productId_productName_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productName_displayDefaultType!}"  key="productId.productName"   label="${getText('RM.propertydisplayName.radion14157727407371')}" textalign="left"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign property_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECTCOMP" defaultDisplay="${property_displayDefaultType!}"  key="property.value"   label="${getText('RM.propertydisplayName.randon1490010423584')}" textalign="left"  width=100   type="systemcode"    showFormatFunc=""/>
			<#assign unitQuality_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${unitQuality_displayDefaultType!}"  key="unitQuality"   label="${getText('RM.propertydisplayName.randon14872431390911')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign productId_productBaseUnit_name_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${productId_productBaseUnit_name_displayDefaultType!}"  key="productId.productBaseUnit.name"   label="${getText('RM.propertydisplayName.radion139823564048323')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
			<#assign isMixQuality_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECT" defaultDisplay="${isMixQuality_displayDefaultType!}"  key="isMixQuality"   label="${getText('RM.propertydisplayName.randon1488852241781')}" textalign="left"  width=100   type="boolean"    showFormatFunc=""/>
			<#assign phase_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${phase_displayDefaultType!}"  key="phase"   label="${getText('RM.propertydisplayName.randon1503477430704')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
			<#assign sequence_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${sequence_displayDefaultType!}"  key="sequence"   label="${getText('RM.propertydisplayName.randon1503477288458')}" textalign="right"  width=100   type="integer"    showFormatFunc=""/>
			<#assign needWeigh_displayDefaultType  = ''>
			<@datacolumn   showFormat="SELECT" defaultDisplay="${needWeigh_displayDefaultType!}"  key="needWeigh"   label="${getText('RM.propertydisplayName.randon150347726245811123123')}" textalign="center"  width=100   type="boolean"    showFormatFunc=""/>
			<#assign minQuality_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${minQuality_displayDefaultType!}"  key="minQuality"   label="${getText('RM.propertydisplayName.randon1488852437576')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign maxQuality_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${maxQuality_displayDefaultType!}"  key="maxQuality"   label="${getText('RM.propertydisplayName.randon1488852460357')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign lossRate_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${lossRate_displayDefaultType!}"  key="lossRate"   label="${getText('RM.propertydisplayName.randon1491544403180')}" textalign="right" decimal="2" width=100   type="decimal"    showFormatFunc=""/>
			<#assign meno_displayDefaultType  = ''>
			<@datacolumn   showFormat="TEXT" defaultDisplay="${meno_displayDefaultType!}"  key="meno"   label="${getText('RM.propertydisplayName.randon1488852483896')}" textalign="center"  width=100   type="textfield"    showFormatFunc=""/>
</@datatable>
<script type="text/javascript">
/**
 * PT加载完成后调用的renderOverEvent
 * 
 */
function ec_RM_formula_formulaBom_formulaBomRef_RenderOverEvent(){
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
	 * @method RM.formula.formulaBom.formulaBomRef.query
	 */
	RM.formula.formulaBom.formulaBomRef.query = function(type,pageNo){
		var node = RM.formula.formulaBom.formulaBomRef.node;
		var nodeParam = "";
		if(node!=null && node.layRec){
			nodeParam = '&'+node.modelName+'.layRec=' + node.layRec;
		}
		RM.formula.formulaBom.formulaBomRef.node = null;
		if(!checkListValid("ec_RM_formula_formulaBom_formulaBomRef_queryForm")) {
				return false;
		}
		var dataPost = "";
		var url = "/RM/formula/formulaBom/formulaBomRef-query.action";
		CUI('#ec_RM_formula_formulaBom_formulaBomRef_queryForm').attr('exportUrl',url);
		if(type != "adv") {
			$('#ec_RM_formula_formulaBom_formulaBomRef_queryForm #advQueryCond').val('');
		}
		var condobj={};
		condobj.viewCode="RM_7.5.0.0_formula_formulaBomRef";
		condobj.modelAlias="formulaBom";
		condobj.condName="fastCond";
		condobj.remark="fastCond";
		condobj.subconds=[];
		CUI('input,select', CUI('#ec_RM_formula_formulaBom_formulaBomRef_queryForm')).each(function(index){
			if(CUI(this).attr('name') && CUI(this).attr('typeUse') != 'dataClassific' && !CUI(this).attr('name').startsWith('tree-')){
				var fastCol = CUI(this).attr('name');
				var fastColValue = CUI('#ec_RM_formula_formulaBom_formulaBomRef_queryForm *[name="'+fastCol+'"]').val();
				var fieldName=fastCol.replace(/_start$/,"").replace(/_end$/,"");
				if(fastColValue != null && fastColValue != "undefined" && fastColValue != "") {
					if(ec_RM_formula_formulaBom_formulaBomRef_quickquery_info[fieldName]){
						var fieldObj={};
						fieldObj.type="0";
						fieldObj.columnName=ec_RM_formula_formulaBom_formulaBomRef_quickquery_info[fieldName].columnName;
						fieldObj.dbColumnType=ec_RM_formula_formulaBom_formulaBomRef_quickquery_info[fieldName].dbColumnType;
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
							if(ec_RM_formula_formulaBom_formulaBomRef_quickquery_info[fieldName].showField){
								var lowerCheck=CUI('#ec_RM_formula_formulaBom_formulaBomRef_queryForm *[name="'+ec_RM_formula_formulaBom_formulaBomRef_quickquery_info[fieldName].showField+'_bapLower"]');
							}else{
								var lowerCheck=CUI('#ec_RM_formula_formulaBom_formulaBomRef_queryForm *[name="'+fieldName+'_bapLower"]');
							}
							if(lowerCheck.length>0&&lowerCheck.prop('checked')){
								var layRec=ec_RM_formula_formulaBom_formulaBomRef_quickquery_info[fieldName].layRec;
								var tableName="";
								if(layRec.split(",").length>1){
									tableName=layRec.split(",")[0];
								}else{
									tableName=ec_RM_formula_formulaBom_formulaBomRef_quickquery_info["MainTableName"];
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
						var layrec=ec_RM_formula_formulaBom_formulaBomRef_quickquery_info[fieldName].layRec;
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
		var pageSize=CUI('input[name="ec_RM_formula_formulaBom_formulaBomRef_query_PageLink_PageCount"]').val();
		if(null != pageSize && undefined != pageSize && "" != pageSize) {
			dataPost += "&page.pageSize="+encodeURIComponent(pageSize);
		}
		if(null != pageNo && undefined != pageNo && "" != pageNo) {
			dataPost += "&page.pageNo="+encodeURIComponent(pageNo);	
		}
		dataPost += "&"+$('#RM_formula_formulaBom_formulaBomRef_condition').val();
		
	 	url = url + "?" + nodeParam;
	 	var permissionCode ='${permissionCode!''}';
		if(permissionCode == ''){
			permissionCode = 'RM_7.5.0.0_formula_formulaBomRef';
		}
		if(url.indexOf(".action?")<0){
				url += "?1=1";
		}
		url += "&permissionCode="+permissionCode;
		url += "&crossCompanyFlag=${Parameters.crossCompanyFlag!}";
	 	datatable_ec_RM_formula_formulaBom_formulaBomRef_query.setRequestDataUrl(url,dataPost);
		return false;
	};
	
	RM.formula.formulaBom.formulaBomRef._selectEvent = function(objName,_selectType,url,title,refparam){
		var arr = objName.split('.');
		RM.formula.formulaBom.formulaBomRef._prefix = '';
		for(var i=0;i<arr.length-1;i++) {
			if(i!=0) {
				RM.formula.formulaBom.formulaBomRef._prefix += '.';
			}
			RM.formula.formulaBom.formulaBomRef._prefix += arr[i];
		}
		RM.formula.formulaBom.formulaBomRef._suffix = arr[arr.length -1];
		if(RM.formula.formulaBom.formulaBomRef._querycustomFunc(objName.replace(/\./g, '_')) != null) {
			if(refparam != null && refparam != "") {
				refparam += '&';
			} else {
			    refparam = '';
			}
			refparam += 'condition=' + encodeURIComponent(RM.formula.formulaBom.formulaBomRef._querycustomFunc(objName.replace(/\./g, '_')));
		}
		RM.formula.formulaBom.formulaBomRef._dialog = foundation.common.select({
			pageType : _selectType,
			closePage : true,
			callBackFuncName : 'RM.formula.formulaBom.formulaBomRef.getcallBackInfo',
			url : url,
			title : title,
			params : refparam
		});
	};
	
	RM.formula.formulaBom.formulaBomRef.getcallBackInfo = function(obj){
		CUI('#ec_RM_formula_formulaBom_formulaBomRef_queryForm *[name="'+RM.formula.formulaBom.formulaBomRef._prefix + '.' + RM.formula.formulaBom.formulaBomRef._suffix +'"]').val(obj[0][RM.formula.formulaBom.formulaBomRef._suffix]);
		CUI('#ec_RM_formula_formulaBom_formulaBomRef_queryForm *[name="'+RM.formula.formulaBom.formulaBomRef._prefix + '.id"]').val(obj[0].id);
		CUI('#ec_RM_formula_formulaBom_formulaBomRef_queryForm *[name^="'+RM.formula.formulaBom.formulaBomRef._prefix + '."]').unbind("change");
		CUI('#ec_RM_formula_formulaBom_formulaBomRef_queryForm *[name="'+RM.formula.formulaBom.formulaBomRef._prefix + '.' + RM.formula.formulaBom.formulaBomRef._suffix +'"]').bind("change",function(){
			var __name = $(this).attr('name');
			var __prefix = __name.substring(0,__name.lastIndexOf("."));
			CUI('#ec_RM_formula_formulaBom_formulaBomRef_queryForm *[name="'+ __prefix + '.id"]').val('');
		});
	};
	
	RM.formula.formulaBom.formulaBomRef._querycustomFunc = function(obj) {
		var str = eval("typeof(RM.formula.formulaBom.formulaBomRef.query_"+obj+")!='undefined'") ? eval('RM.formula.formulaBom.formulaBomRef.query_'+obj+'()') : null;
		return str;
	};
	
	<#assign requestUri = ((request.requestURI)!'')?split('.action')[0]>
	<#assign requestUri = requestUri?replace('/', '_', 'r')>
	// 供外部调用
	foundation.common.${requestUri!}__callbackFunction = function(){
		if(datatable_ec_RM_formula_formulaBom_formulaBomRef_query.getSelectedRow().length == 0){
			CUI.alert("${getText('foundation.common.selectNullData')}");
			return false;
		}
		var oRows = datatable_ec_RM_formula_formulaBom_formulaBomRef_query.getSelectedRow();
		if(oRows.length == 0){
			CUI.alert("${getText('RM.formulaBom.checkselected')}");
			return false;
		}
		var arrObj = [];
		for(var i=0; i<oRows.length; i++){
			oRows[i].rowIndex = CUI("#rowIndex").val();
			arrObj.push(oRows[i]);
		}
		try{
			if(CUI("#RM_formula_formulaBom_formulaBomRef_callBackFuncName").val() != ""){
				eval(CUI("#RM_formula_formulaBom_formulaBomRef_callBackFuncName").val() + "(arrObj)");
			}
		}catch(e){
		}
	};
	
RM_formula_formulaBom_formulaBomRef_refresh = function(node){
	//var url = "/RM/formula/formulaBom/formulaBomRef-query.action";
	//if(node.layRec){
	//	datatable_ec_RM_formula_formulaBom_formulaBomRef_query.setRequestDataUrl(url,'&'+node.modelName+'.layRec=' + node.layRec,false);
	//}else{
	//	datatable_ec_RM_formula_formulaBom_formulaBomRef_query.setRequestDataUrl(url,'',false);
	//}
	RM.formula.formulaBom.formulaBomRef.node = node;
	RM.formula.formulaBom.formulaBomRef.query("query");
}

RM_formula_formulaBom_formulaBomRef_getList = function() {
	return "RM.formula.formulaBom.formulaBomRef";
}

	RM.formula.formulaBom.formulaBomRef.commonQuery = function(type) {
	  if(typeof RM.formula.formulaBom.formulaBomRef.cancelSelectedNode == 'function') {
	   RM.formula.formulaBom.formulaBomRef.cancelSelectedNode();
	  }
	  RM.formula.formulaBom.formulaBomRef.query(type);
	 };
	
	

RM.formula.formulaBom.formulaBomRef.showLinkView = function(url,propertyId,row,formId,title,width,height,dialogType){
	RM.formula.formulaBom.formulaBomRef.otherParams = {};
	RM.formula.formulaBom.formulaBomRef.otherParams.dialogType = dialogType;
	RM.formula.formulaBom.formulaBomRef.otherParams.viewShowType = 'VIEW';
	if(url.indexOf('?') > 0) {
		url += '&';
	} else {
		url += '?';
	}
	url += 'id=' + eval('row.' + propertyId);
	if(formId) {
		RM.formula.formulaBom.formulaBomRef.showDialog(url,formId,title,width,height);
	}else {
		openFullScreen(url);
	}
};

function checkListValid(formId){return true;};





	/* CUSTOM CODE START(view-REFERENCE-RM_7.5.0.0_formula_formulaBomRef,js,RM_7.5.0.0_formula_FormulaBom,RM_7.5.0.0) */
// 自定义代码

/* CUSTOM CODE END */
	</script>
  </body>
</html>
