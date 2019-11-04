<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1506058953963" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<productId.id IsHiddenField="true"></productId.id>
				<headId.id IsHiddenField="true"></headId.id>
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
					sort="false"  onPropertyChange="ProduceMaterialSum_dg1506058953963Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','WOM_7.5.0.0_produceTask_ProduceMaterialSum','MESBasic_1_product_Product_productCode')>
						<#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productCode_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productCode_permit == 1>
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
					width="120">物料编码</productId.productCode>
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
					onFocus="CUI.toggleClearBtn_DG_IE(ProduceMaterialSum_dg1506058953963Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProduceMaterialSum_dg1506058953963Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1506058953963productId.productName','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,ProduceMaterialSum_dg1506058953963Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProduceMaterialSum_dg1506058953963Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','WOM_7.5.0.0_produceTask_ProduceMaterialSum','MESBasic_1_product_Product_productName')>
						<#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productName_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productName_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (productId_productName_defaultValue)?? &&(productId_productName_defaultValue)?has_content>
							defaultValue='${(productId_productName_defaultValue!)?string}'
						</#if>
						<#if (productId_productName_defaultText)?? &&(productId_productName_defaultText)?has_content>
							defaultText='${(productId_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="120">物料名称</productId.productName>
				<#assign isRef = false >
				<#assign property_defaultValue=''>
						 						<#assign property_defaultValue=''>
				<#assign property_defaultText=''>
				<property.id
					sort="false"  onPropertyChange="ProduceMaterialSum_dg1506058953963Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceMaterialSum_property_permit = checkFieldPermission('property','WOM_7.5.0.0_produceTask_ProduceMaterialSum','WOM_7.5.0.0_produceTask_ProduceMaterialSum_property')>
						<#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_property_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_property_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
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
				<#assign planNum_defaultValue=''>
						 						<#assign planNum_defaultValue=''>
				<#assign planNum_defaultText=''>
				<planNum
					sort="false"  onPropertyChange="ProduceMaterialSum_dg1506058953963Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceMaterialSum_planNum_permit = checkFieldPermission('planNum','WOM_7.5.0.0_produceTask_ProduceMaterialSum','WOM_7.5.0.0_produceTask_ProduceMaterialSum_planNum')>
						<#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_planNum_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_planNum_permit == 1>
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
					width="120">计划数量</planNum>
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
					sort="false"  onPropertyChange="ProduceMaterialSum_dg1506058953963Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit = checkFieldPermission('productId.productBaseUnit.name','WOM_7.5.0.0_produceTask_ProduceMaterialSum','X6Basic_1.0_unitGroup_BaseUnit_name')>
						<#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productBaseUnit_name_defaultValue)?? &&(productId_productBaseUnit_name_defaultValue)?has_content>
							defaultValue='${(productId_productBaseUnit_name_defaultValue!)?string}'
						</#if>
						<#if (productId_productBaseUnit_name_defaultText)?? &&(productId_productBaseUnit_name_defaultText)?has_content>
							defaultText='${(productId_productBaseUnit_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="60">单位</productId.productBaseUnit.name>
				<#assign isRef = false >
				<#assign batchNum_defaultValue=''>
						 						<#assign batchNum_defaultValue=''>
				<#assign batchNum_defaultText=''>
				<batchNum
					sort="false"  onPropertyChange="ProduceMaterialSum_dg1506058953963Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceMaterialSum_batchNum_permit = checkFieldPermission('batchNum','WOM_7.5.0.0_produceTask_ProduceMaterialSum','WOM_7.5.0.0_produceTask_ProduceMaterialSum_batchNum')>
						<#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_batchNum_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_batchNum_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (batchNum_defaultValue)?? &&(batchNum_defaultValue)?has_content>
							defaultValue='${(batchNum_defaultValue!)?string}'
						</#if>
						<#if (batchNum_defaultText)?? &&(batchNum_defaultText)?has_content>
							defaultText='${(batchNum_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">批号</batchNum>
				<#assign isRef = false >
				<#assign headId_formularId_setProcess_defaultValue=''>
												<#assign headId_formularId_setProcess_defaultValue=''>
				<#if (headId_formularId_setProcess_defaultValue!)?string=="currentUser">
					<#assign headId_formularId_setProcess_defaultValue='${staffJson!}'>
				<#elseif (headId_formularId_setProcess_defaultValue!)?string=="currentPost">
					<#assign headId_formularId_setProcess_defaultValue='${postJson!}'>
				<#elseif (headId_formularId_setProcess_defaultValue!)?string=="currentDepart">
					<#assign headId_formularId_setProcess_defaultValue='${deptJson!}'>
				<#elseif (headId_formularId_setProcess_defaultValue!)?string=="currentComp">
					<#assign headId_formularId_setProcess_defaultValue='${compJson!}'>
				</#if>
				<#assign headId_formularId_setProcess_defaultText=''>
				<headId.formularId.setProcess.id
					sort="false"  onPropertyChange="ProduceMaterialSum_dg1506058953963Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_produceTask_ProduceMaterialSum_headId_WOM_7_5_0_0_produceTask_ProduceTask_formularId_RM_7_5_0_0_formula_Formula_setProcess_permit = checkFieldPermission('headId.formularId.setProcess','WOM_7.5.0.0_produceTask_ProduceMaterialSum','RM_7.5.0.0_formula_Formula_setProcess')>
						<#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_headId_WOM_7_5_0_0_produceTask_ProduceTask_formularId_RM_7_5_0_0_formula_Formula_setProcess_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_headId_WOM_7_5_0_0_produceTask_ProduceTask_formularId_RM_7_5_0_0_formula_Formula_setProcess_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
								<#assign optionMap = getSystemCodeList('formulaProperty')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						 IsHiddenField="true"					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">配方属性</headId.formularId.setProcess.id>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ProduceMaterialSum_dg1506058953963Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.productId.id)!}</c>
					<c>${(row.headId.id)!}</c>
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
					<#if !WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','WOM_7.5.0.0_produceTask_ProduceMaterialSum','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productCode_permit != 0><#if (row.productId.productCode)?has_content>${(row.productId.productCode)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','WOM_7.5.0.0_produceTask_ProduceMaterialSum','MESBasic_1_product_Product_productName')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productName_permit != 0><#if (row.productId.productName)?has_content>${(row.productId.productName)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceMaterialSum_property_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceMaterialSum_property_permit = checkFieldPermission('property','WOM_7.5.0.0_produceTask_ProduceMaterialSum','WOM_7.5.0.0_produceTask_ProduceMaterialSum_property')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_property_permit != 0><#if (row.property.id)?has_content>${(row.property.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceMaterialSum_planNum_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceMaterialSum_planNum_permit = checkFieldPermission('planNum','WOM_7.5.0.0_produceTask_ProduceMaterialSum','WOM_7.5.0.0_produceTask_ProduceMaterialSum_planNum')>
					</#if>
						<c><#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_planNum_permit != 0><#if (row.planNum)?has_content>#{(row.planNum)!; m2M2}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit = checkFieldPermission('productId.productBaseUnit.name','WOM_7.5.0.0_produceTask_ProduceMaterialSum','X6Basic_1.0_unitGroup_BaseUnit_name')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_productId_MESBasic_1_product_Product_productBaseUnit_X6Basic_1_0_unitGroup_BaseUnit_name_permit != 0><#if (row.productId.productBaseUnit.name)?has_content>${(row.productId.productBaseUnit.name)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceMaterialSum_batchNum_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceMaterialSum_batchNum_permit = checkFieldPermission('batchNum','WOM_7.5.0.0_produceTask_ProduceMaterialSum','WOM_7.5.0.0_produceTask_ProduceMaterialSum_batchNum')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_batchNum_permit != 0><#if (row.batchNum)?has_content>${(row.batchNum)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_produceTask_ProduceMaterialSum_headId_WOM_7_5_0_0_produceTask_ProduceTask_formularId_RM_7_5_0_0_formula_Formula_setProcess_permit??>
					<#assign WOM_7_5_0_0_produceTask_ProduceMaterialSum_headId_WOM_7_5_0_0_produceTask_ProduceTask_formularId_RM_7_5_0_0_formula_Formula_setProcess_permit = checkFieldPermission('headId.formularId.setProcess','WOM_7.5.0.0_produceTask_ProduceMaterialSum','RM_7.5.0.0_formula_Formula_setProcess')>
					</#if>
							<c><#if WOM_7_5_0_0_produceTask_ProduceMaterialSum_headId_WOM_7_5_0_0_produceTask_ProduceTask_formularId_RM_7_5_0_0_formula_Formula_setProcess_permit != 0><#if (row.headId.formularId.setProcess.id)?has_content>${(row.headId.formularId.setProcess.id)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>