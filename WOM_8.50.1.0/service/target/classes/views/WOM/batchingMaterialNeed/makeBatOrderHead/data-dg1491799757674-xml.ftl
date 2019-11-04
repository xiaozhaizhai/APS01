<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1491799757674" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
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
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialNeed_dg1491799757674Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialNeed_dg1491799757674Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1491799757674productId.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,BatchingMaterialNeed_dg1491799757674Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="BatchingMaterialNeed_dg1491799757674Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed','MESBasic_1_product_Product_productCode')>
						<#if WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productCode_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productCode_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (productId_productCode_defaultValue)?? &&(productId_productCode_defaultValue)?has_content>
							defaultValue='${(productId_productCode_defaultValue!)?string}'
						</#if>
						<#if (productId_productCode_defaultText)?? &&(productId_productCode_defaultText)?has_content>
							defaultText='${(productId_productCode_defaultText!)?string}'
						</#if>
						
					align="center" 
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
					sort="false"  onPropertyChange="BatchingMaterialNeed_dg1491799757674Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed','MESBasic_1_product_Product_productName')>
						<#if WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productName_defaultValue)?? &&(productId_productName_defaultValue)?has_content>
							defaultValue='${(productId_productName_defaultValue!)?string}'
						</#if>
						<#if (productId_productName_defaultText)?? &&(productId_productName_defaultText)?has_content>
							defaultText='${(productId_productName_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品名称</productId.productName>
				<#assign isRef = false >
				<#assign offerSystem_defaultValue=''>
						 						<#assign offerSystem_defaultValue=''>
				<#assign offerSystem_defaultText=''>
				<offerSystem.id
					sort="false"  onPropertyChange="BatchingMaterialNeed_dg1491799757674Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem_permit = checkFieldPermission('offerSystem','WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed','WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem')>
						<#if WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
								<#assign optionMap = getSystemCodeList('RMsystem')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (offerSystem_defaultValue)?? &&(offerSystem_defaultValue)?has_content>
							defaultValue='${(offerSystem_defaultValue!)?string}'
						</#if>
						<#if (offerSystem_defaultText)?? &&(offerSystem_defaultText)?has_content>
							defaultText='${(offerSystem_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">配料系统</offerSystem.id>
				<#assign isRef = false >
				<#assign planNum_defaultValue=''>
						 						<#assign planNum_defaultValue=''>
				<#assign planNum_defaultText=''>
				<planNum
					sort="false"  onPropertyChange="BatchingMaterialNeed_dg1491799757674Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_planNum_permit = checkFieldPermission('planNum','WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed','WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_planNum')>
						<#if WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_planNum_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_planNum_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
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
					width="100">配送数量</planNum>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="BatchingMaterialNeed_dg1491799757674Widget._DT._autoAddNewRow(nRow)" >
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
					<#if !WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productCode_permit != 0><#if (row.productId.productCode)?has_content>${(row.productId.productCode)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed','MESBasic_1_product_Product_productName')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productName_permit != 0><#if (row.productId.productName)?has_content>${(row.productId.productName)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem_permit??>
					<#assign WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem_permit = checkFieldPermission('offerSystem','WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed','WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_offerSystem_permit != 0><#if (row.offerSystem.id)?has_content>${(row.offerSystem.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_planNum_permit??>
					<#assign WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_planNum_permit = checkFieldPermission('planNum','WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed','WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_planNum')>
					</#if>
						<c><#if WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_planNum_permit != 0><#if (row.planNum)?has_content>#{(row.planNum)!; m6M6}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>