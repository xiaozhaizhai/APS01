<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1491802393153" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<needID.id IsHiddenField="true"></needID.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign needID_id_defaultValue=''>
												<#assign needID_id_defaultValue=''>
				<#if (needID_id_defaultValue!)?string=="currentUser">
					<#assign needID_id_defaultValue='${staffJson!}'>
				<#elseif (needID_id_defaultValue!)?string=="currentPost">
					<#assign needID_id_defaultValue='${postJson!}'>
				<#elseif (needID_id_defaultValue!)?string=="currentDepart">
					<#assign needID_id_defaultValue='${deptJson!}'>
				<#elseif (needID_id_defaultValue!)?string=="currentComp">
					<#assign needID_id_defaultValue='${compJson!}'>
				</#if>
				<#assign needID_id_defaultText=''>
				<needID.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(MakeBatOrderPart_dg1491802393153Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(MakeBatOrderPart_dg1491802393153Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/batchingMaterialNeed/batchingMaterialNeed/batchNeedRef.action','dg1491802393153needID.id','${getText("WOM.viewtitle.randon1491792578939")}',sPTGridID,nRow,sFieldName,MakeBatOrderPart_dg1491802393153Widget,null,false,false,'','WOM_7.5.0.0_batchingMaterialNeed_batchNeedRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="MakeBatOrderPart_dg1491802393153Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_id_permit = checkFieldPermission('needID.id','WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart','WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_id')>
						<#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_id_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_id_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (needID_id_defaultValue)?? &&(needID_id_defaultValue)?has_content>
							defaultValue='${(needID_id_defaultValue!)?string}'
						</#if>
						<#if (needID_id_defaultText)?? &&(needID_id_defaultText)?has_content>
							defaultText='${(needID_id_defaultText!)?string}'
						</#if>
						
					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">ID</needID.id>
				<#assign isRef = false >
				<#assign needID_productId_productCode_defaultValue=''>
												<#assign needID_productId_productCode_defaultValue=''>
				<#if (needID_productId_productCode_defaultValue!)?string=="currentUser">
					<#assign needID_productId_productCode_defaultValue='${staffJson!}'>
				<#elseif (needID_productId_productCode_defaultValue!)?string=="currentPost">
					<#assign needID_productId_productCode_defaultValue='${postJson!}'>
				<#elseif (needID_productId_productCode_defaultValue!)?string=="currentDepart">
					<#assign needID_productId_productCode_defaultValue='${deptJson!}'>
				<#elseif (needID_productId_productCode_defaultValue!)?string=="currentComp">
					<#assign needID_productId_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign needID_productId_productCode_defaultText=''>
				<needID.productId.productCode
					sort="false"  onPropertyChange="MakeBatOrderPart_dg1491802393153Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('needID.productId.productCode','WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart','MESBasic_1_product_Product_productCode')>
						<#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productCode_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productCode_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (needID_productId_productCode_defaultValue)?? &&(needID_productId_productCode_defaultValue)?has_content>
							defaultValue='${(needID_productId_productCode_defaultValue!)?string}'
						</#if>
						<#if (needID_productId_productCode_defaultText)?? &&(needID_productId_productCode_defaultText)?has_content>
							defaultText='${(needID_productId_productCode_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品编码</needID.productId.productCode>
				<#assign isRef = false >
				<#assign needID_productId_productName_defaultValue=''>
												<#assign needID_productId_productName_defaultValue=''>
				<#if (needID_productId_productName_defaultValue!)?string=="currentUser">
					<#assign needID_productId_productName_defaultValue='${staffJson!}'>
				<#elseif (needID_productId_productName_defaultValue!)?string=="currentPost">
					<#assign needID_productId_productName_defaultValue='${postJson!}'>
				<#elseif (needID_productId_productName_defaultValue!)?string=="currentDepart">
					<#assign needID_productId_productName_defaultValue='${deptJson!}'>
				<#elseif (needID_productId_productName_defaultValue!)?string=="currentComp">
					<#assign needID_productId_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign needID_productId_productName_defaultText=''>
				<needID.productId.productName
					sort="false"  onPropertyChange="MakeBatOrderPart_dg1491802393153Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('needID.productId.productName','WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart','MESBasic_1_product_Product_productName')>
						<#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (needID_productId_productName_defaultValue)?? &&(needID_productId_productName_defaultValue)?has_content>
							defaultValue='${(needID_productId_productName_defaultValue!)?string}'
						</#if>
						<#if (needID_productId_productName_defaultText)?? &&(needID_productId_productName_defaultText)?has_content>
							defaultText='${(needID_productId_productName_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品名称</needID.productId.productName>
				<#assign isRef = false >
				<#assign num_defaultValue=''>
						 						<#assign num_defaultValue=''>
				<#assign num_defaultText=''>
				<num
					sort="false"  onPropertyChange="MakeBatOrderPart_dg1491802393153Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_num_permit = checkFieldPermission('num','WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart','WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart_num')>
						<#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_num_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_num_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
						 dataType="float"
						
						<#if (num_defaultValue)?? &&(num_defaultValue)?has_content>
							defaultValue='${(num_defaultValue!)?string}'
						</#if>
						<#if (num_defaultText)?? &&(num_defaultText)?has_content>
							defaultText='${(num_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">配料数量</num>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="false"  onPropertyChange="MakeBatOrderPart_dg1491802393153Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_remark_permit = checkFieldPermission('remark','WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart','WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart_remark')>
						<#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_remark_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_remark_permit == 1>
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
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="MakeBatOrderPart_dg1491802393153Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.needID.id)!}</c>
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
					<#if !WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_id_permit??>
					<#assign WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_id_permit = checkFieldPermission('needID.id','WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart','WOM_7.5.0.0_batchingMaterialNeed_BatchingMaterialNeed_id')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_id_permit != 0><#if (row.needID.id)?has_content>${(row.needID.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('needID.productId.productCode','WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productCode_permit != 0><#if (row.needID.productId.productCode)?has_content>${(row.needID.productId.productCode)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('needID.productId.productName','WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart','MESBasic_1_product_Product_productName')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_needID_WOM_7_5_0_0_batchingMaterialNeed_BatchingMaterialNeed_productId_MESBasic_1_product_Product_productName_permit != 0><#if (row.needID.productId.productName)?has_content>${(row.needID.productId.productName)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_num_permit??>
					<#assign WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_num_permit = checkFieldPermission('num','WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart','WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart_num')>
					</#if>
						<c><#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_num_permit != 0><#if (row.num)?has_content>#{(row.num)!; m6M6}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_remark_permit??>
					<#assign WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_remark_permit = checkFieldPermission('remark','WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart','WOM_7.5.0.0_batchingMaterialNeed_MakeBatOrderPart_remark')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterialNeed_MakeBatOrderPart_remark_permit != 0><#if (row.remark)?has_content>${(row.remark)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>