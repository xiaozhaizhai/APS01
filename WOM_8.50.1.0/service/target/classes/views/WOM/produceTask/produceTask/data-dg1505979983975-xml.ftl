<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1505979983975" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<productId.id IsHiddenField="true"></productId.id>
				<batchNumObj.id IsHiddenField="true"></batchNumObj.id>
				<formulaBom.id IsHiddenField="true"></formulaBom.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign productId_productCode_defaultValue=''>
												<#assign productId_productCode_defaultValue=''>
				<#if (productId_productCode_defaultValue!)?string=="currentUser">
					<#assign productId_productCode_defaultValue='${staffJson!}'>
				<#elseif (productId_productCode_defaultValue!)?string=="currentPost">
					<#assign productId_productCode_defaultValue='${postJson!}'>
				<#elseif (productId_productCode_defaultValue!)?string=="currentDepart">
					<#assign productId_productCode_defaultValue='${deptJson!}'>
				<#elseif (productId_productCode_defaultValue!)?string=="currentComp">
					<#assign productId_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_productCode_defaultText=''>
				<productId.productCode
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productCode')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productCode_defaultValue)?? &&(productId_productCode_defaultValue)?has_content>
							defaultValue='${(productId_productCode_defaultValue!)?string}'
						</#if>
						<#if (productId_productCode_defaultText)?? &&(productId_productCode_defaultText)?has_content>
							defaultText='${(productId_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物料编码</productId.productCode>
				<#assign isRef = false >
				<#assign productId_id_defaultValue=''>
												<#assign productId_id_defaultValue=''>
				<#if (productId_id_defaultValue!)?string=="currentUser">
					<#assign productId_id_defaultValue='${staffJson!}'>
				<#elseif (productId_id_defaultValue!)?string=="currentPost">
					<#assign productId_id_defaultValue='${postJson!}'>
				<#elseif (productId_id_defaultValue!)?string=="currentDepart">
					<#assign productId_id_defaultValue='${deptJson!}'>
				<#elseif (productId_id_defaultValue!)?string=="currentComp">
					<#assign productId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_id_defaultText=''>
				<productId.id
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_id_permit = checkFieldPermission('productId.id','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_id')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_id_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_id_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</productId.id>
				<#assign isRef = false >
				<#assign productId_productName_defaultValue=''>
												<#assign productId_productName_defaultValue=''>
				<#if (productId_productName_defaultValue!)?string=="currentUser">
					<#assign productId_productName_defaultValue='${staffJson!}'>
				<#elseif (productId_productName_defaultValue!)?string=="currentPost">
					<#assign productId_productName_defaultValue='${postJson!}'>
				<#elseif (productId_productName_defaultValue!)?string=="currentDepart">
					<#assign productId_productName_defaultValue='${deptJson!}'>
				<#elseif (productId_productName_defaultValue!)?string=="currentComp">
					<#assign productId_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_productName_defaultText=''>
				<productId.productName
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1505979983975Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1505979983975Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1505979983975productId.productName','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1505979983975Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productName')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productName_defaultValue)?? &&(productId_productName_defaultValue)?has_content>
							defaultValue='${(productId_productName_defaultValue!)?string}'
						</#if>
						<#if (productId_productName_defaultText)?? &&(productId_productName_defaultText)?has_content>
							defaultText='${(productId_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物料名称</productId.productName>
				<#assign isRef = false >
				<#assign property_defaultValue=''>
						 						<#assign property_defaultValue=''>
				<#assign property_defaultText=''>
				<property.id
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_property_permit = checkFieldPermission('property','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_property')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_property_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_property_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
								<#assign optionMap = getSystemCodeList('RMproperty')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (property_defaultValue)?? &&(property_defaultValue)?has_content>
							defaultValue='${(property_defaultValue!)?string}'
						</#if>
						<#if (property_defaultText)?? &&(property_defaultText)?has_content>
							defaultText='${(property_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">性质</property.id>
				<#assign isRef = false >
				<#assign productId_productBaseUnit_name_defaultValue=''>
												<#assign productId_productBaseUnit_name_defaultValue=''>
				<#if (productId_productBaseUnit_name_defaultValue!)?string=="currentUser">
					<#assign productId_productBaseUnit_name_defaultValue='${staffJson!}'>
				<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentPost">
					<#assign productId_productBaseUnit_name_defaultValue='${postJson!}'>
				<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentDepart">
					<#assign productId_productBaseUnit_name_defaultValue='${deptJson!}'>
				<#elseif (productId_productBaseUnit_name_defaultValue!)?string=="currentComp">
					<#assign productId_productBaseUnit_name_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_productBaseUnit_name_defaultText=''>
				<productId.productBaseUnit.name
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit = checkFieldPermission('productId.productBaseUnit.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','X6Basic_1.0_unitGroup_BaseUnit_name')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productBaseUnit_name_defaultValue)?? &&(productId_productBaseUnit_name_defaultValue)?has_content>
							defaultValue='${(productId_productBaseUnit_name_defaultValue!)?string}'
						</#if>
						<#if (productId_productBaseUnit_name_defaultText)?? &&(productId_productBaseUnit_name_defaultText)?has_content>
							defaultText='${(productId_productBaseUnit_name_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">单位</productId.productBaseUnit.name>
				<#assign isRef = false >
				<#assign planNum_defaultValue=''>
						 						<#assign planNum_defaultValue=''>
				<#assign planNum_defaultText=''>
				<planNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit = checkFieldPermission('planNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_planNum')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (planNum_defaultValue)?? &&(planNum_defaultValue)?has_content>
							defaultValue='${(planNum_defaultValue!)?string}'
						</#if>
						<#if (planNum_defaultText)?? &&(planNum_defaultText)?has_content>
							defaultText='${(planNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">计划数量</planNum>
				<#assign isRef = false >
				<#assign phase_defaultValue=''>
						 						<#assign phase_defaultValue=''>
				<#assign phase_defaultText=''>
				<phase
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_phase_permit = checkFieldPermission('phase','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_phase')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_phase_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_phase_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						 dataType="float" decLength="0"
						<#if (phase_defaultValue)?? &&(phase_defaultValue)?has_content>
							defaultValue='${(phase_defaultValue!)?string}'
						</#if>
						<#if (phase_defaultText)?? &&(phase_defaultText)?has_content>
							defaultText='${(phase_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">阶段</phase>
				<#assign isRef = false >
				<#assign sequence_defaultValue=''>
						 						<#assign sequence_defaultValue=''>
				<#assign sequence_defaultText=''>
				<sequence
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_sequence_permit = checkFieldPermission('sequence','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_sequence')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_sequence_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_sequence_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						 dataType="float" decLength="0"
						<#if (sequence_defaultValue)?? &&(sequence_defaultValue)?has_content>
							defaultValue='${(sequence_defaultValue!)?string}'
						</#if>
						<#if (sequence_defaultText)?? &&(sequence_defaultText)?has_content>
							defaultText='${(sequence_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">次序</sequence>
				<#assign isRef = false >
				<#assign needWeigh_defaultValue=''>
						 						<#assign needWeigh_defaultValue=''>
				<#assign needWeigh_defaultText=''>
				<needWeigh
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_needWeigh_permit = checkFieldPermission('needWeigh','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_needWeigh')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_needWeigh_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_needWeigh_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (needWeigh_defaultValue)?? &&(needWeigh_defaultValue)?has_content>
							defaultValue='${(needWeigh_defaultValue!)?string}'
						</#if>
						<#if (needWeigh_defaultText)?? &&(needWeigh_defaultText)?has_content>
							defaultText='${(needWeigh_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">需要称重</needWeigh>
				<#assign isRef = false >
				<#assign isMixQuality_defaultValue=''>
						 						<#assign isMixQuality_defaultValue=''>
				<#assign isMixQuality_defaultText=''>
				<isMixQuality
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit = checkFieldPermission('isMixQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_isMixQuality')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (isMixQuality_defaultValue)?? &&(isMixQuality_defaultValue)?has_content>
							defaultValue='${(isMixQuality_defaultValue!)?string}'
						</#if>
						<#if (isMixQuality_defaultText)?? &&(isMixQuality_defaultText)?has_content>
							defaultText='${(isMixQuality_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">固定数量</isMixQuality>
				<#assign isRef = false >
				<#assign batchNumObj_batchText_defaultValue=''>
												<#assign batchNumObj_batchText_defaultValue=''>
				<#if (batchNumObj_batchText_defaultValue!)?string=="currentUser">
					<#assign batchNumObj_batchText_defaultValue='${staffJson!}'>
				<#elseif (batchNumObj_batchText_defaultValue!)?string=="currentPost">
					<#assign batchNumObj_batchText_defaultValue='${postJson!}'>
				<#elseif (batchNumObj_batchText_defaultValue!)?string=="currentDepart">
					<#assign batchNumObj_batchText_defaultValue='${deptJson!}'>
				<#elseif (batchNumObj_batchText_defaultValue!)?string=="currentComp">
					<#assign batchNumObj_batchText_defaultValue='${compJson!}'>
				</#if>
				<#assign batchNumObj_batchText_defaultText=''>
				<batchNumObj.batchText
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceTaskActive_dg1505979983975Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceTaskActive_dg1505979983975Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/standingcropRef/standingcropRef/batchNumOneMakeTask.action','dg1505979983975batchNumObj.batchText','${getText("WOM.viewtitle.randon1503994294075")}',sPTGridID,nRow,sFieldName,ProduceTaskActive_dg1505979983975Widget,null,false,false,'','WOM_7.5.0.0_standingcropRef_batchNumOneMakeTask')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_batchNumObj_WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_permit = checkFieldPermission('batchNumObj.batchText','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_batchNumObj_WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_batchNumObj_WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (batchNumObj_batchText_defaultValue)?? &&(batchNumObj_batchText_defaultValue)?has_content>
							defaultValue='${(batchNumObj_batchText_defaultValue!)?string}'
						</#if>
						<#if (batchNumObj_batchText_defaultText)?? &&(batchNumObj_batchText_defaultText)?has_content>
							defaultText='${(batchNumObj_batchText_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物料批号</batchNumObj.batchText>
				<#assign isRef = false >
				<#assign minQuality_defaultValue=''>
						 						<#assign minQuality_defaultValue=''>
				<#assign minQuality_defaultText=''>
				<minQuality
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit = checkFieldPermission('minQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_minQuality')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (minQuality_defaultValue)?? &&(minQuality_defaultValue)?has_content>
							defaultValue='${(minQuality_defaultValue!)?string}'
						</#if>
						<#if (minQuality_defaultText)?? &&(minQuality_defaultText)?has_content>
							defaultText='${(minQuality_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">区间下限</minQuality>
				<#assign isRef = false >
				<#assign maxQuality_defaultValue=''>
						 						<#assign maxQuality_defaultValue=''>
				<#assign maxQuality_defaultText=''>
				<maxQuality
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit = checkFieldPermission('maxQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_maxQuality')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (maxQuality_defaultValue)?? &&(maxQuality_defaultValue)?has_content>
							defaultValue='${(maxQuality_defaultValue!)?string}'
						</#if>
						<#if (maxQuality_defaultText)?? &&(maxQuality_defaultText)?has_content>
							defaultText='${(maxQuality_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">区间上限</maxQuality>
				<#assign isRef = false >
				<#assign lossRate_defaultValue=''>
						 						<#assign lossRate_defaultValue=''>
				<#assign lossRate_defaultText=''>
				<lossRate
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit = checkFieldPermission('lossRate','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_lossRate')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="2"
						
						 dataType="float"
						
						<#if (lossRate_defaultValue)?? &&(lossRate_defaultValue)?has_content>
							defaultValue='${(lossRate_defaultValue!)?string}'
						</#if>
						<#if (lossRate_defaultText)?? &&(lossRate_defaultText)?has_content>
							defaultText='${(lossRate_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">损耗率(%)</lossRate>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit = checkFieldPermission('remark','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_remark')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (remark_defaultValue)?? &&(remark_defaultValue)?has_content>
							defaultValue='${(remark_defaultValue!)?string}'
						</#if>
						<#if (remark_defaultText)?? &&(remark_defaultText)?has_content>
							defaultText='${(remark_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">备注</remark>
				<#assign isRef = false >
				<#assign formulaBom_productId_id_defaultValue=''>
												<#assign formulaBom_productId_id_defaultValue=''>
				<#if (formulaBom_productId_id_defaultValue!)?string=="currentUser">
					<#assign formulaBom_productId_id_defaultValue='${staffJson!}'>
				<#elseif (formulaBom_productId_id_defaultValue!)?string=="currentPost">
					<#assign formulaBom_productId_id_defaultValue='${postJson!}'>
				<#elseif (formulaBom_productId_id_defaultValue!)?string=="currentDepart">
					<#assign formulaBom_productId_id_defaultValue='${deptJson!}'>
				<#elseif (formulaBom_productId_id_defaultValue!)?string=="currentComp">
					<#assign formulaBom_productId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign formulaBom_productId_id_defaultText=''>
				<formulaBom.productId.id
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_formulaBom_RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_id_permit = checkFieldPermission('formulaBom.productId.id','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_id')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_formulaBom_RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_id_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_formulaBom_RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_id_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</formulaBom.productId.id>
				<#assign isRef = false >
				<#assign formulaBom_id_defaultValue=''>
												<#assign formulaBom_id_defaultValue=''>
				<#if (formulaBom_id_defaultValue!)?string=="currentUser">
					<#assign formulaBom_id_defaultValue='${staffJson!}'>
				<#elseif (formulaBom_id_defaultValue!)?string=="currentPost">
					<#assign formulaBom_id_defaultValue='${postJson!}'>
				<#elseif (formulaBom_id_defaultValue!)?string=="currentDepart">
					<#assign formulaBom_id_defaultValue='${deptJson!}'>
				<#elseif (formulaBom_id_defaultValue!)?string=="currentComp">
					<#assign formulaBom_id_defaultValue='${compJson!}'>
				</#if>
				<#assign formulaBom_id_defaultText=''>
				<formulaBom.id
					sort="false"  onPropertyChange="ProduceTaskActive_dg1505979983975Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_formulaBom_RM_7_5_0_0_formula_FormulaBom_id_permit = checkFieldPermission('formulaBom.id','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaBom_id')>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_formulaBom_RM_7_5_0_0_formula_FormulaBom_id_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceTaskActive_formulaBom_RM_7_5_0_0_formula_FormulaBom_id_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</formulaBom.id>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ProduceTaskActive_dg1505979983975Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.productId.id)!}</c>
					<c>${(row.batchNumObj.id)!}</c>
					<c>${(row.formulaBom.id)!}</c>
			<#if cpObjHideKey?? && cpObjHideKey?has_content>
				<#list cpObjHideKey?split(',') as key>
					<#assign cpvmHideVal = ''>
					<#assign keyArr = key?split('.')>
					<#if row[keyArr[0]]??>
						<#assign cpvmHideVal = row[keyArr[0]]>
						<#if keyArr?size gt 1>
							<#list 1..(keyArr?size - 1) as i>
								<#if cpvmHideVal?? && cpvmHideVal[keyArr[i]]??>
									<#assign cpvmHideVal = cpvmHideVal[keyArr[i]]>
								<#else>
									<#assign cpvmHideVal = ''>
									<#break>
								</#if>
							</#list>
						</#if>
					</#if>
					<c>${cpvmHideVal!}</c>
				</#list>
			</#if>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productCode_permit != 0><#if (row.productId.productCode)?has_content>${(row.productId.productCode)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_id_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_id_permit = checkFieldPermission('productId.id','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_id')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_id_permit != 0><#if (row.productId.id)?has_content>${(row.productId.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_productName')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productName_permit != 0><#if (row.productId.productName)?has_content>${(row.productId.productName)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_property_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_property_permit = checkFieldPermission('property','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_property')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_property_permit != 0><#if (row.property.id)?has_content>${(row.property.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit = checkFieldPermission('productId.productBaseUnit.name','WOM_7.5.0.0_produceTask_ProduceTaskActive','X6Basic_1.0_unitGroup_BaseUnit_name')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit != 0><#if (row.productId.productBaseUnit.name)?has_content>${(row.productId.productBaseUnit.name)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit = checkFieldPermission('planNum','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_planNum')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_planNum_permit != 0><#if (row.planNum)?has_content>#{(row.planNum)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_phase_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_phase_permit = checkFieldPermission('phase','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_phase')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_phase_permit != 0><#if (row.phase)?has_content>${(row.phase)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_sequence_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_sequence_permit = checkFieldPermission('sequence','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_sequence')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_sequence_permit != 0><#if (row.sequence)?has_content>${(row.sequence)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_needWeigh_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_needWeigh_permit = checkFieldPermission('needWeigh','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_needWeigh')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_needWeigh_permit != 0><#if (row.needWeigh)?has_content>${(row.needWeigh?string)!}<#else>false</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit = checkFieldPermission('isMixQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_isMixQuality')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_isMixQuality_permit != 0><#if (row.isMixQuality)?has_content>${(row.isMixQuality?string)!}<#else>false</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_batchNumObj_WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_batchNumObj_WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_permit = checkFieldPermission('batchNumObj.batchText','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_standingcropRef_StandingcropRef_batchText')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_batchNumObj_WOM_7_5_0_0_standingcropRef_StandingcropRef_batchText_permit != 0><#if (row.batchNumObj.batchText)?has_content>${(row.batchNumObj.batchText)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit = checkFieldPermission('minQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_minQuality')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_minQuality_permit != 0><#if (row.minQuality)?has_content>#{(row.minQuality)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit = checkFieldPermission('maxQuality','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_maxQuality')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_maxQuality_permit != 0><#if (row.maxQuality)?has_content>#{(row.maxQuality)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit = checkFieldPermission('lossRate','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_lossRate')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_lossRate_permit != 0><#if (row.lossRate)?has_content>#{(row.lossRate)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit = checkFieldPermission('remark','WOM_7.5.0.0_produceTask_ProduceTaskActive','WOM_7.5.0.0_produceTask_ProduceTaskActive_remark')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_remark_permit != 0><#if (row.remark)?has_content>${(row.remark)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_formulaBom_RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_id_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_formulaBom_RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_id_permit = checkFieldPermission('formulaBom.productId.id','WOM_7.5.0.0_produceTask_ProduceTaskActive','MESBasic_1_product_Product_id')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_formulaBom_RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_id_permit != 0><#if (row.formulaBom.productId.id)?has_content>${(row.formulaBom.productId.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceTaskActive_formulaBom_RM_7_5_0_0_formula_FormulaBom_id_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceTaskActive_formulaBom_RM_7_5_0_0_formula_FormulaBom_id_permit = checkFieldPermission('formulaBom.id','WOM_7.5.0.0_produceTask_ProduceTaskActive','RM_7.5.0.0_formula_FormulaBom_id')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceTaskActive_formulaBom_RM_7_5_0_0_formula_FormulaBom_id_permit != 0><#if (row.formulaBom.id)?has_content>${(row.formulaBom.id)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>