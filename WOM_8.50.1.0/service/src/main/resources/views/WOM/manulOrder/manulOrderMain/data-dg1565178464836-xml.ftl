<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1565178464836" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<material.id IsHiddenField="true"></material.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign material_productName_defaultValue=''>
												<#assign material_productName_defaultValue=''>
				<#if (material_productName_defaultValue!)?string=="currentUser">
					<#assign material_productName_defaultValue='${staffJson!}'>
				<#elseif (material_productName_defaultValue!)?string=="currentPost">
					<#assign material_productName_defaultValue='${postJson!}'>
				<#elseif (material_productName_defaultValue!)?string=="currentDepart">
					<#assign material_productName_defaultValue='${deptJson!}'>
				<#elseif (material_productName_defaultValue!)?string=="currentComp">
					<#assign material_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign material_productName_defaultText=''>
				<material.productName
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ManulOrderMaterial_dg1565178464836Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ManulOrderMaterial_dg1565178464836Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/customRef.action','dg1565178464836material.productName','${getText("MESBasic.viewtitle.randon1506341311049")}',sPTGridID,nRow,sFieldName,ManulOrderMaterial_dg1565178464836Widget,null,false,false,'','MESBasic_1_product_customRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="ManulOrderMaterial_dg1565178464836Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (material_productName_defaultValue)?? &&(material_productName_defaultValue)?has_content>
							defaultValue='${(material_productName_defaultValue!)?string}'
						</#if>
						<#if (material_productName_defaultText)?? &&(material_productName_defaultText)?has_content>
							defaultText='${(material_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物品名称</material.productName>
				<#assign isRef = false >
				<#assign material_unitGroup_name_defaultValue=''>
												<#assign material_unitGroup_name_defaultValue=''>
				<#if (material_unitGroup_name_defaultValue!)?string=="currentUser">
					<#assign material_unitGroup_name_defaultValue='${staffJson!}'>
				<#elseif (material_unitGroup_name_defaultValue!)?string=="currentPost">
					<#assign material_unitGroup_name_defaultValue='${postJson!}'>
				<#elseif (material_unitGroup_name_defaultValue!)?string=="currentDepart">
					<#assign material_unitGroup_name_defaultValue='${deptJson!}'>
				<#elseif (material_unitGroup_name_defaultValue!)?string=="currentComp">
					<#assign material_unitGroup_name_defaultValue='${compJson!}'>
				</#if>
				<#assign material_unitGroup_name_defaultText=''>
				<material.unitGroup.name
					sort="true"  onPropertyChange="ManulOrderMaterial_dg1565178464836Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (material_unitGroup_name_defaultValue)?? &&(material_unitGroup_name_defaultValue)?has_content>
							defaultValue='${(material_unitGroup_name_defaultValue!)?string}'
						</#if>
						<#if (material_unitGroup_name_defaultText)?? &&(material_unitGroup_name_defaultText)?has_content>
							defaultText='${(material_unitGroup_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">单位名称</material.unitGroup.name>
				<#assign isRef = false >
				<#assign needNumber_defaultValue=''>
						 						<#assign needNumber_defaultValue=''>
				<#assign needNumber_defaultText=''>
				<needNumber
					sort="true"  onPropertyChange="ManulOrderMaterial_dg1565178464836Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="2"
						
						 dataType="float"
						
						<#if (needNumber_defaultValue)?? &&(needNumber_defaultValue)?has_content>
							defaultValue='${(needNumber_defaultValue!)?string}'
						</#if>
						<#if (needNumber_defaultText)?? &&(needNumber_defaultText)?has_content>
							defaultText='${(needNumber_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">需求数量</needNumber>
				<#assign isRef = false >
				<#assign materialBatchNum_defaultValue=''>
						 						<#assign materialBatchNum_defaultValue=''>
				<#assign materialBatchNum_defaultText=''>
				<materialBatchNum
					sort="true"  onPropertyChange="ManulOrderMaterial_dg1565178464836Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (materialBatchNum_defaultValue)?? &&(materialBatchNum_defaultValue)?has_content>
							defaultValue='${(materialBatchNum_defaultValue!)?string}'
						</#if>
						<#if (materialBatchNum_defaultText)?? &&(materialBatchNum_defaultText)?has_content>
							defaultText='${(materialBatchNum_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">原料批次</materialBatchNum>
				<#assign isRef = false >
				<#assign rsNUM_defaultValue=''>
						 						<#assign rsNUM_defaultValue=''>
				<#assign rsNUM_defaultText=''>
				<rsNUM
					sort="true"  onPropertyChange="ManulOrderMaterial_dg1565178464836Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="2"
						
						 dataType="float"
						
						<#if (rsNUM_defaultValue)?? &&(rsNUM_defaultValue)?has_content>
							defaultValue='${(rsNUM_defaultValue!)?string}'
						</#if>
						<#if (rsNUM_defaultText)?? &&(rsNUM_defaultText)?has_content>
							defaultText='${(rsNUM_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">预留号</rsNUM>
				<#assign isRef = false >
				<#assign rsPOS_defaultValue=''>
						 						<#assign rsPOS_defaultValue=''>
				<#assign rsPOS_defaultText=''>
				<rsPOS
					sort="true"  onPropertyChange="ManulOrderMaterial_dg1565178464836Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="2"
						
						 dataType="float"
						
						<#if (rsPOS_defaultValue)?? &&(rsPOS_defaultValue)?has_content>
							defaultValue='${(rsPOS_defaultValue!)?string}'
						</#if>
						<#if (rsPOS_defaultText)?? &&(rsPOS_defaultText)?has_content>
							defaultText='${(rsPOS_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">预留行项目</rsPOS>
				<#assign isRef = false >
				<#assign edition_defaultValue=''>
						 						<#assign edition_defaultValue=''>
				<#assign edition_defaultText=''>
				<edition
					sort="true"  onPropertyChange="ManulOrderMaterial_dg1565178464836Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (edition_defaultValue)?? &&(edition_defaultValue)?has_content>
							defaultValue='${(edition_defaultValue!)?string}'
						</#if>
						<#if (edition_defaultText)?? &&(edition_defaultText)?has_content>
							defaultText='${(edition_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">特殊库存标志</edition>
				<#assign isRef = false >
				<#assign coOperation_defaultValue=''>
						 						<#assign coOperation_defaultValue=''>
				<#assign coOperation_defaultText=''>
				<coOperation
					sort="true"  onPropertyChange="ManulOrderMaterial_dg1565178464836Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (coOperation_defaultValue)?? &&(coOperation_defaultValue)?has_content>
							defaultValue='${(coOperation_defaultValue!)?string}'
						</#if>
						<#if (coOperation_defaultText)?? &&(coOperation_defaultText)?has_content>
							defaultText='${(coOperation_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">是否联副产品</coOperation>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.material.id)!}</c>
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
