<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1489296435612" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<productId.id IsHiddenField="true"></productId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign property_defaultValue=''>
						 						<#assign property_defaultValue=''>
				<#assign property_defaultText=''>
				<property.id
					sort="true"  onPropertyChange="FormulaBom_dg1489296435612Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaBom_property_permit = checkFieldPermission('property','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_property')>
						<#if RM_7_5_0_0_formula_FormulaBom_property_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_property_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
								<#assign optionMap = getSystemCodeList('property')>
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
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(FormulaBom_dg1489296435612Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FormulaBom_dg1489296435612Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1489296435612productId.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,FormulaBom_dg1489296435612Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="FormulaBom_dg1489296435612Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','RM_7.5.0.0_formula_FormulaBom','MESBasic_1_product_Product_productCode')>
						<#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productCode_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productCode_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productCode_defaultValue)?? &&(productId_productCode_defaultValue)?has_content>
							defaultValue='${(productId_productCode_defaultValue!)?string}'
						</#if>
						<#if (productId_productCode_defaultText)?? &&(productId_productCode_defaultText)?has_content>
							defaultText='${(productId_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物品编码</productId.productCode>
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
					sort="true"  onPropertyChange="FormulaBom_dg1489296435612Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','RM_7.5.0.0_formula_FormulaBom','MESBasic_1_product_Product_productName')>
						<#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productName_defaultValue)?? &&(productId_productName_defaultValue)?has_content>
							defaultValue='${(productId_productName_defaultValue!)?string}'
						</#if>
						<#if (productId_productName_defaultText)?? &&(productId_productName_defaultText)?has_content>
							defaultText='${(productId_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品名称</productId.productName>
				<#assign isRef = false >
				<#assign isMixQuality_defaultValue=''>
						 						<#assign isMixQuality_defaultValue=''>
				<#assign isMixQuality_defaultText=''>
				<isMixQuality
					sort="true"  onPropertyChange="FormulaBom_dg1489296435612Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaBom_isMixQuality_permit = checkFieldPermission('isMixQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_isMixQuality')>
						<#if RM_7_5_0_0_formula_FormulaBom_isMixQuality_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_isMixQuality_permit == 1>
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
				<#assign unitQuality_defaultValue=''>
						 						<#assign unitQuality_defaultValue=''>
				<#assign unitQuality_defaultText=''>
				<unitQuality
					sort="true"  onPropertyChange="FormulaBom_dg1489296435612Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaBom_unitQuality_permit = checkFieldPermission('unitQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_unitQuality')>
						<#if RM_7_5_0_0_formula_FormulaBom_unitQuality_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_unitQuality_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
						 dataType="float"
						
						<#if (unitQuality_defaultValue)?? &&(unitQuality_defaultValue)?has_content>
							defaultValue='${(unitQuality_defaultValue!)?string}'
						</#if>
						<#if (unitQuality_defaultText)?? &&(unitQuality_defaultText)?has_content>
							defaultText='${(unitQuality_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">单位数量</unitQuality>
				<#assign isRef = false >
				<#assign minQuality_defaultValue=''>
						 						<#assign minQuality_defaultValue=''>
				<#assign minQuality_defaultText=''>
				<minQuality
					sort="true"  onPropertyChange="FormulaBom_dg1489296435612Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaBom_minQuality_permit = checkFieldPermission('minQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_minQuality')>
						<#if RM_7_5_0_0_formula_FormulaBom_minQuality_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_minQuality_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
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
					sort="true"  onPropertyChange="FormulaBom_dg1489296435612Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaBom_maxQuality_permit = checkFieldPermission('maxQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_maxQuality')>
						<#if RM_7_5_0_0_formula_FormulaBom_maxQuality_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_maxQuality_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
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
				<#assign meno_defaultValue=''>
						 						<#assign meno_defaultValue=''>
				<#assign meno_defaultText=''>
				<meno
					sort="true"  onPropertyChange="FormulaBom_dg1489296435612Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign RM_7_5_0_0_formula_FormulaBom_meno_permit = checkFieldPermission('meno','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_meno')>
						<#if RM_7_5_0_0_formula_FormulaBom_meno_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if RM_7_5_0_0_formula_FormulaBom_meno_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (meno_defaultValue)?? &&(meno_defaultValue)?has_content>
							defaultValue='${(meno_defaultValue!)?string}'
						</#if>
						<#if (meno_defaultText)?? &&(meno_defaultText)?has_content>
							defaultText='${(meno_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">备注</meno>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.productId.id)!}</c>
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
					<#if !RM_7_5_0_0_formula_FormulaBom_property_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_property_permit = checkFieldPermission('property','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_property')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaBom_property_permit != 0><#if (row.property.id)?has_content>${(row.property.id)!}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','RM_7.5.0.0_formula_FormulaBom','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productCode_permit != 0><#if (row.productId.productCode)?has_content>${(row.productId.productCode)!}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','RM_7.5.0.0_formula_FormulaBom','MESBasic_1_product_Product_productName')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaBom_productId_MESBasic_1_product_Product_productName_permit != 0><#if (row.productId.productName)?has_content>${(row.productId.productName)!}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaBom_isMixQuality_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_isMixQuality_permit = checkFieldPermission('isMixQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_isMixQuality')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaBom_isMixQuality_permit != 0><#if (row.isMixQuality)?has_content>${(row.isMixQuality?string)!}<#else>false</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaBom_unitQuality_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_unitQuality_permit = checkFieldPermission('unitQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_unitQuality')>
					</#if>
						<c><#if RM_7_5_0_0_formula_FormulaBom_unitQuality_permit != 0><#if (row.unitQuality)?has_content>#{(row.unitQuality)!; m6M6}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaBom_minQuality_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_minQuality_permit = checkFieldPermission('minQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_minQuality')>
					</#if>
						<c><#if RM_7_5_0_0_formula_FormulaBom_minQuality_permit != 0><#if (row.minQuality)?has_content>#{(row.minQuality)!; m6M6}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaBom_maxQuality_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_maxQuality_permit = checkFieldPermission('maxQuality','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_maxQuality')>
					</#if>
						<c><#if RM_7_5_0_0_formula_FormulaBom_maxQuality_permit != 0><#if (row.maxQuality)?has_content>#{(row.maxQuality)!; m6M6}</#if></#if></c>
					<#if !RM_7_5_0_0_formula_FormulaBom_meno_permit??>
					<#assign RM_7_5_0_0_formula_FormulaBom_meno_permit = checkFieldPermission('meno','RM_7.5.0.0_formula_FormulaBom','RM_7.5.0.0_formula_FormulaBom_meno')>
					</#if>
							<c><#if RM_7_5_0_0_formula_FormulaBom_meno_permit != 0><#if (row.meno)?has_content>${(row.meno)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>