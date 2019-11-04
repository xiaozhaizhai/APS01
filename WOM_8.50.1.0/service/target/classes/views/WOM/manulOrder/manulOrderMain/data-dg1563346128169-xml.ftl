<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1563346128169" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<material.id IsHiddenField="true"></material.id>
				<ware.id IsHiddenField="true"></ware.id>
				<unit.id IsHiddenField="true"></unit.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign material_productCode_defaultValue=''>
												<#assign material_productCode_defaultValue=''>
				<#if (material_productCode_defaultValue!)?string=="currentUser">
					<#assign material_productCode_defaultValue='${staffJson!}'>
				<#elseif (material_productCode_defaultValue!)?string=="currentPost">
					<#assign material_productCode_defaultValue='${postJson!}'>
				<#elseif (material_productCode_defaultValue!)?string=="currentDepart">
					<#assign material_productCode_defaultValue='${deptJson!}'>
				<#elseif (material_productCode_defaultValue!)?string=="currentComp">
					<#assign material_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign material_productCode_defaultText=''>
				<material.productCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ManulOrderMaterial_dg1563346128169Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ManulOrderMaterial_dg1563346128169Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRef.action','dg1563346128169material.productCode','${getText("MESBasic.viewtitle.radion1415773613713")}',sPTGridID,nRow,sFieldName,ManulOrderMaterial_dg1563346128169Widget,null,false,false,'','MESBasic_1_product_productRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ManulOrderMaterial_dg1563346128169Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (material_productCode_defaultValue)?? &&(material_productCode_defaultValue)?has_content>
							defaultValue='${(material_productCode_defaultValue!)?string}'
						</#if>
						<#if (material_productCode_defaultText)?? &&(material_productCode_defaultText)?has_content>
							defaultText='${(material_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物品编码</material.productCode>
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
					sort="false"  onPropertyChange="ManulOrderMaterial_dg1563346128169Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (material_productName_defaultValue)?? &&(material_productName_defaultValue)?has_content>
							defaultValue='${(material_productName_defaultValue!)?string}'
						</#if>
						<#if (material_productName_defaultText)?? &&(material_productName_defaultText)?has_content>
							defaultText='${(material_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="50">物品名称</material.productName>
				<#assign isRef = false >
				<#assign ablePass_defaultValue=''>
						 						<#assign ablePass_defaultValue=''>
				<#assign ablePass_defaultText=''>
				<ablePass
					sort="false"  onPropertyChange="ManulOrderMaterial_dg1563346128169Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (ablePass_defaultValue)?? &&(ablePass_defaultValue)?has_content>
							defaultValue='${(ablePass_defaultValue!)?string}'
						</#if>
						<#if (ablePass_defaultText)?? &&(ablePass_defaultText)?has_content>
							defaultText='${(ablePass_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">允许发料</ablePass>
				<#assign isRef = false >
				<#assign ware_wareName_defaultValue=''>
												<#assign ware_wareName_defaultValue=''>
				<#if (ware_wareName_defaultValue!)?string=="currentUser">
					<#assign ware_wareName_defaultValue='${staffJson!}'>
				<#elseif (ware_wareName_defaultValue!)?string=="currentPost">
					<#assign ware_wareName_defaultValue='${postJson!}'>
				<#elseif (ware_wareName_defaultValue!)?string=="currentDepart">
					<#assign ware_wareName_defaultValue='${deptJson!}'>
				<#elseif (ware_wareName_defaultValue!)?string=="currentComp">
					<#assign ware_wareName_defaultValue='${compJson!}'>
				</#if>
				<#assign ware_wareName_defaultText=''>
				<ware.wareName
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ManulOrderMaterial_dg1563346128169Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ManulOrderMaterial_dg1563346128169Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/wareMan/ware/wareRef.action','dg1563346128169ware.wareName','${getText("MESBasic.viewtitle.randon1484031981880")}',sPTGridID,nRow,sFieldName,ManulOrderMaterial_dg1563346128169Widget,null,false,false,'','MESBasic_1_wareMan_wareRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ManulOrderMaterial_dg1563346128169Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (ware_wareName_defaultValue)?? &&(ware_wareName_defaultValue)?has_content>
							defaultValue='${(ware_wareName_defaultValue!)?string}'
						</#if>
						<#if (ware_wareName_defaultText)?? &&(ware_wareName_defaultText)?has_content>
							defaultText='${(ware_wareName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">原料仓库</ware.wareName>
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
					sort="false"  onPropertyChange="ManulOrderMaterial_dg1563346128169Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (ware_wareCode_defaultValue)?? &&(ware_wareCode_defaultValue)?has_content>
							defaultValue='${(ware_wareCode_defaultValue!)?string}'
						</#if>
						<#if (ware_wareCode_defaultText)?? &&(ware_wareCode_defaultText)?has_content>
							defaultText='${(ware_wareCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">仓库编码</ware.wareCode>
				<#assign isRef = false >
				<#assign unit_name_defaultValue=''>
												<#assign unit_name_defaultValue=''>
				<#if (unit_name_defaultValue!)?string=="currentUser">
					<#assign unit_name_defaultValue='${staffJson!}'>
				<#elseif (unit_name_defaultValue!)?string=="currentPost">
					<#assign unit_name_defaultValue='${postJson!}'>
				<#elseif (unit_name_defaultValue!)?string=="currentDepart">
					<#assign unit_name_defaultValue='${deptJson!}'>
				<#elseif (unit_name_defaultValue!)?string=="currentComp">
					<#assign unit_name_defaultValue='${compJson!}'>
				</#if>
				<#assign unit_name_defaultText=''>
				<unit.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ManulOrderMaterial_dg1563346128169Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ManulOrderMaterial_dg1563346128169Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/X6Basic/unitGroup/baseUnit/unitRef.action','dg1563346128169unit.name','${getText("X6Basic.viewtitle.radion1398240433147")}',sPTGridID,nRow,sFieldName,ManulOrderMaterial_dg1563346128169Widget,null,false,false,'','X6Basic_1.0_unitGroup_unitRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ManulOrderMaterial_dg1563346128169Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (unit_name_defaultValue)?? &&(unit_name_defaultValue)?has_content>
							defaultValue='${(unit_name_defaultValue!)?string}'
						</#if>
						<#if (unit_name_defaultText)?? &&(unit_name_defaultText)?has_content>
							defaultText='${(unit_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">单位名称</unit.name>
				<#assign isRef = false >
				<#assign needNumber_defaultValue=''>
						 						<#assign needNumber_defaultValue=''>
				<#assign needNumber_defaultText=''>
				<needNumber
					sort="false"  onPropertyChange="ManulOrderMaterial_dg1563346128169Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="3"
						
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
					sort="false"  onPropertyChange="ManulOrderMaterial_dg1563346128169Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">原料批次</materialBatchNum>
				<#assign isRef = false >
				<#assign edition_defaultValue=''>
						 						<#assign edition_defaultValue=''>
				<#assign edition_defaultText=''>
				<edition
					sort="false"  onPropertyChange="ManulOrderMaterial_dg1563346128169Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					sort="false"  onPropertyChange="ManulOrderMaterial_dg1563346128169Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">是否联产品</coOperation>
				<#assign isRef = false >
				<#assign rsNUM_defaultValue=''>
						 						<#assign rsNUM_defaultValue=''>
				<#assign rsNUM_defaultText=''>
				<rsNUM
					sort="false"  onPropertyChange="ManulOrderMaterial_dg1563346128169Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (rsNUM_defaultValue)?? &&(rsNUM_defaultValue)?has_content>
							defaultValue='${(rsNUM_defaultValue!)?string}'
						</#if>
						<#if (rsNUM_defaultText)?? &&(rsNUM_defaultText)?has_content>
							defaultText='${(rsNUM_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">预留号</rsNUM>
				<#assign isRef = false >
				<#assign rsPOS_defaultValue=''>
						 						<#assign rsPOS_defaultValue=''>
				<#assign rsPOS_defaultText=''>
				<rsPOS
					sort="false"  onPropertyChange="ManulOrderMaterial_dg1563346128169Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (rsPOS_defaultValue)?? &&(rsPOS_defaultValue)?has_content>
							defaultValue='${(rsPOS_defaultValue!)?string}'
						</#if>
						<#if (rsPOS_defaultText)?? &&(rsPOS_defaultText)?has_content>
							defaultText='${(rsPOS_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">预留行项目</rsPOS>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ManulOrderMaterial_dg1563346128169Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.material.id)!}</c>
					<c>${(row.ware.id)!}</c>
					<c>${(row.unit.id)!}</c>
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
