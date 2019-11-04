<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1567404925228" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<productId.id IsHiddenField="true"></productId.id>
				<ware.id IsHiddenField="true"></ware.id>
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
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PrepareMaterialPart_dg1567404925228Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PrepareMaterialPart_dg1567404925228Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/refProductLayout_kc.action','dg1567404925228productId.productCode','${getText("MESBasic.viewtitle.randon1478746948423")}',sPTGridID,nRow,sFieldName,PrepareMaterialPart_dg1567404925228Widget,null,false,false,'','MESBasic_1_product_refProductLayout_kc')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="PrepareMaterialPart_dg1567404925228Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (productId_productCode_defaultValue)?? &&(productId_productCode_defaultValue)?has_content>
							defaultValue='${(productId_productCode_defaultValue!)?string}'
						</#if>
						<#if (productId_productCode_defaultText)?? &&(productId_productCode_defaultText)?has_content>
							defaultText='${(productId_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="150">物料编码</productId.productCode>
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
					onFocus="CUI.toggleClearBtn_DG_IE(PrepareMaterialPart_dg1567404925228Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PrepareMaterialPart_dg1567404925228Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1567404925228productId.productName','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,PrepareMaterialPart_dg1567404925228Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="PrepareMaterialPart_dg1567404925228Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (productId_productName_defaultValue)?? &&(productId_productName_defaultValue)?has_content>
							defaultValue='${(productId_productName_defaultValue!)?string}'
						</#if>
						<#if (productId_productName_defaultText)?? &&(productId_productName_defaultText)?has_content>
							defaultText='${(productId_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="150">物料名称</productId.productName>
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
					sort="true"  onPropertyChange="PrepareMaterialPart_dg1567404925228Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (productId_productBaseUnit_name_defaultValue)?? &&(productId_productBaseUnit_name_defaultValue)?has_content>
							defaultValue='${(productId_productBaseUnit_name_defaultValue!)?string}'
						</#if>
						<#if (productId_productBaseUnit_name_defaultText)?? &&(productId_productBaseUnit_name_defaultText)?has_content>
							defaultText='${(productId_productBaseUnit_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">单位</productId.productBaseUnit.name>
				<#assign isRef = false >
				<#assign useNum_defaultValue=''>
						 						<#assign useNum_defaultValue=''>
				<#assign useNum_defaultText=''>
				<useNum
						style="font-color:0303B3"
					sort="true"  onPropertyChange="PrepareMaterialPart_dg1567404925228Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="3"
						
						 dataType="float"
						
						<#if (useNum_defaultValue)?? &&(useNum_defaultValue)?has_content>
							defaultValue='${(useNum_defaultValue!)?string}'
						</#if>
						<#if (useNum_defaultText)?? &&(useNum_defaultText)?has_content>
							defaultText='${(useNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">数量</useNum>
				<#assign isRef = false >
				<#assign hasDoneNum_defaultValue=''>
						 						<#assign hasDoneNum_defaultValue=''>
				<#assign hasDoneNum_defaultText=''>
				<hasDoneNum
					sort="true"  onPropertyChange="PrepareMaterialPart_dg1567404925228Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="6"
						
						 dataType="float"
						
						<#if (hasDoneNum_defaultValue)?? &&(hasDoneNum_defaultValue)?has_content>
							defaultValue='${(hasDoneNum_defaultValue!)?string}'
						</#if>
						<#if (hasDoneNum_defaultText)?? &&(hasDoneNum_defaultText)?has_content>
							defaultText='${(hasDoneNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">已备数量</hasDoneNum>
				<#assign isRef = false >
				<#assign ware_wareCode_defaultValue=''>
												<#assign ware_wareCode_defaultValue=''>
				<#if (ware_wareCode_defaultValue!)?string=="currentUser">
					<#assign ware_wareCode_defaultValue='${staffJson!}'>
				<#elseif (ware_wareCode_defaultValue!)?string=="currentPost">
					<#assign ware_wareCode_defaultValue='${postJson!}'>
				<#elseif (ware_wareCode_defaultValue!)?string=="currentDepart">
					<#assign ware_wareCode_defaultValue='${deptJson!}'>
				<#elseif (ware_wareCode_defaultValue!)?string=="currentComp">
					<#assign ware_wareCode_defaultValue='${compJson!}'>
				</#if>
				<#assign ware_wareCode_defaultText=''>
				<ware.wareCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PrepareMaterialPart_dg1567404925228Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PrepareMaterialPart_dg1567404925228Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/wareMan/ware/wareRef.action','dg1567404925228ware.wareCode','${getText("MESBasic.viewtitle.randon1484031981880")}',sPTGridID,nRow,sFieldName,PrepareMaterialPart_dg1567404925228Widget,null,false,false,'','MESBasic_1_wareMan_wareRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="PrepareMaterialPart_dg1567404925228Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (ware_wareCode_defaultValue)?? &&(ware_wareCode_defaultValue)?has_content>
							defaultValue='${(ware_wareCode_defaultValue!)?string}'
						</#if>
						<#if (ware_wareCode_defaultText)?? &&(ware_wareCode_defaultText)?has_content>
							defaultText='${(ware_wareCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">仓库编码</ware.wareCode>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="true"  onPropertyChange="PrepareMaterialPart_dg1567404925228Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (remark_defaultValue)?? &&(remark_defaultValue)?has_content>
							defaultValue='${(remark_defaultValue!)?string}'
						</#if>
						<#if (remark_defaultText)?? &&(remark_defaultText)?has_content>
							defaultText='${(remark_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="250">备注</remark>
				<#assign isRef = false >
				<#assign batchNum_defaultValue=''>
						 						<#assign batchNum_defaultValue=''>
				<#assign batchNum_defaultText=''>
				<batchNum
					sort="true"  onPropertyChange="PrepareMaterialPart_dg1567404925228Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物料批号</batchNum>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.productId.id)!}</c>
					<c>${(row.ware.id)!}</c>
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
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>
