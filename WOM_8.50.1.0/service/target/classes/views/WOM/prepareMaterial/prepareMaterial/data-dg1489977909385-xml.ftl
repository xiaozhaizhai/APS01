<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1489977909385" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<productId.id IsHiddenField="true"></productId.id>
				<useNeedRef.id IsHiddenField="true"></useNeedRef.id>
				<ware.id IsHiddenField="true"></ware.id>
				<manuOrder.id IsHiddenField="true"></manuOrder.id>
				<storeID.id IsHiddenField="true"></storeID.id>
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
					onFocus="CUI.toggleClearBtn_DG_IE(PrepareMaterialPart_dg1489977909385Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PrepareMaterialPart_dg1489977909385Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/refProductLayout_kc.action','dg1489977909385productId.productCode','${getText("MESBasic.viewtitle.randon1478746948423")}',sPTGridID,nRow,sFieldName,PrepareMaterialPart_dg1489977909385Widget,null,false,false,'','MESBasic_1_product_refProductLayout_kc')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
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
						style="font-color:0303B3"
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (productId_productName_defaultValue)?? &&(productId_productName_defaultValue)?has_content>
							defaultValue='${(productId_productName_defaultValue!)?string}'
						</#if>
						<#if (productId_productName_defaultText)?? &&(productId_productName_defaultText)?has_content>
							defaultText='${(productId_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="150">物料名称</productId.productName>
				<#assign isRef = false >
				<#assign hasDoneNum_defaultValue=''>
						 						<#assign hasDoneNum_defaultValue=''>
				<#assign hasDoneNum_defaultText=''>
				<hasDoneNum
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="3"
						 IsHiddenField="true"					align="left" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">理论计划数量</hasDoneNum>
				<#assign isRef = false >
				<#assign useNeedRef_batchText_defaultValue=''>
												<#assign useNeedRef_batchText_defaultValue=''>
				<#if (useNeedRef_batchText_defaultValue!)?string=="currentUser">
					<#assign useNeedRef_batchText_defaultValue='${staffJson!}'>
				<#elseif (useNeedRef_batchText_defaultValue!)?string=="currentPost">
					<#assign useNeedRef_batchText_defaultValue='${postJson!}'>
				<#elseif (useNeedRef_batchText_defaultValue!)?string=="currentDepart">
					<#assign useNeedRef_batchText_defaultValue='${deptJson!}'>
				<#elseif (useNeedRef_batchText_defaultValue!)?string=="currentComp">
					<#assign useNeedRef_batchText_defaultValue='${compJson!}'>
				</#if>
				<#assign useNeedRef_batchText_defaultText=''>
				<useNeedRef.batchText
						showFormatFunc="createStaff_name_showFormatFunc" 
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PrepareMaterialPart_dg1489977909385Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PrepareMaterialPart_dg1489977909385Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/standingcropRef/standingcropRef/manulOrderRef.action','dg1489977909385useNeedRef.batchText','${getText("WOM.viewtitle.randon1564130461575")}',sPTGridID,nRow,sFieldName,PrepareMaterialPart_dg1489977909385Widget,'callbackPosition(obj)',false,false,'','WOM_7.5.0.0_standingcropRef_manulOrderRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (useNeedRef_batchText_defaultValue)?? &&(useNeedRef_batchText_defaultValue)?has_content>
							defaultValue='${(useNeedRef_batchText_defaultValue!)?string}'
						</#if>
						<#if (useNeedRef_batchText_defaultText)?? &&(useNeedRef_batchText_defaultText)?has_content>
							defaultText='${(useNeedRef_batchText_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">现存量</useNeedRef.batchText>
				<#assign isRef = false >
				<#assign useNum_defaultValue=''>
						 						<#assign useNum_defaultValue=''>
				<#assign useNum_defaultText=''>
				<useNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="3"
						
						 dataType="float"
						
						<#if (useNum_defaultValue)?? &&(useNum_defaultValue)?has_content>
							defaultValue='${(useNum_defaultValue!)?string}'
						</#if>
						<#if (useNum_defaultText)?? &&(useNum_defaultText)?has_content>
							defaultText='${(useNum_defaultText!)?string}'
						</#if>
						
					align="left" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">数量</useNum>
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
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
				<#assign batchNum_defaultValue=''>
						 						<#assign batchNum_defaultValue=''>
				<#assign batchNum_defaultText=''>
				<batchNum
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">物料批号</batchNum>
				<#assign isRef = false >
				<#assign materialBatchNum_defaultValue=''>
						 						<#assign materialBatchNum_defaultValue=''>
				<#assign materialBatchNum_defaultText=''>
				<materialBatchNum
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						 IsHiddenField="true"					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">原料批号（文本）</materialBatchNum>
				<#assign isRef = false >
				<#assign wareCode_defaultValue=''>
						 						<#assign wareCode_defaultValue=''>
				<#assign wareCode_defaultText=''>
				<wareCode
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						 IsHiddenField="true"					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">仓库编码（文本）</wareCode>
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
					onFocus="CUI.toggleClearBtn_DG_IE(PrepareMaterialPart_dg1489977909385Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PrepareMaterialPart_dg1489977909385Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/wareMan/ware/wareRef.action','dg1489977909385ware.wareCode','${getText("MESBasic.viewtitle.randon1484031981880")}',sPTGridID,nRow,sFieldName,PrepareMaterialPart_dg1489977909385Widget,null,false,false,'','MESBasic_1_wareMan_wareRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
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
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
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
				<#assign edition_defaultValue=''>
						 						<#assign edition_defaultValue=''>
				<#assign edition_defaultText=''>
				<edition
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">特殊库存标记</edition>
				<#assign isRef = false >
				<#assign manuOrder_materialBatchNum_defaultValue=''>
												<#assign manuOrder_materialBatchNum_defaultValue=''>
				<#if (manuOrder_materialBatchNum_defaultValue!)?string=="currentUser">
					<#assign manuOrder_materialBatchNum_defaultValue='${staffJson!}'>
				<#elseif (manuOrder_materialBatchNum_defaultValue!)?string=="currentPost">
					<#assign manuOrder_materialBatchNum_defaultValue='${postJson!}'>
				<#elseif (manuOrder_materialBatchNum_defaultValue!)?string=="currentDepart">
					<#assign manuOrder_materialBatchNum_defaultValue='${deptJson!}'>
				<#elseif (manuOrder_materialBatchNum_defaultValue!)?string=="currentComp">
					<#assign manuOrder_materialBatchNum_defaultValue='${compJson!}'>
				</#if>
				<#assign manuOrder_materialBatchNum_defaultText=''>
				<manuOrder.materialBatchNum
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PrepareMaterialPart_dg1489977909385Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PrepareMaterialPart_dg1489977909385Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/manulOrder/manulOrderMaterial/orderMaterialRef.action','dg1489977909385manuOrder.materialBatchNum','${getText("WOM.viewtitle.randon1564039926491")}',sPTGridID,nRow,sFieldName,PrepareMaterialPart_dg1489977909385Widget,null,false,false,'','WOM_7.5.0.0_manulOrder_orderMaterialRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						 IsHiddenField="true"					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物料批号（参照）</manuOrder.materialBatchNum>
				<#assign isRef = false >
				<#assign storeID_placeSetName_defaultValue=''>
												<#assign storeID_placeSetName_defaultValue=''>
				<#if (storeID_placeSetName_defaultValue!)?string=="currentUser">
					<#assign storeID_placeSetName_defaultValue='${staffJson!}'>
				<#elseif (storeID_placeSetName_defaultValue!)?string=="currentPost">
					<#assign storeID_placeSetName_defaultValue='${postJson!}'>
				<#elseif (storeID_placeSetName_defaultValue!)?string=="currentDepart">
					<#assign storeID_placeSetName_defaultValue='${deptJson!}'>
				<#elseif (storeID_placeSetName_defaultValue!)?string=="currentComp">
					<#assign storeID_placeSetName_defaultValue='${compJson!}'>
				</#if>
				<#assign storeID_placeSetName_defaultText=''>
				<storeID.placeSetName
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="150">货位名称</storeID.placeSetName>
				<#assign isRef = false >
				<#assign storeID_placeSetCode_defaultValue=''>
												<#assign storeID_placeSetCode_defaultValue=''>
				<#if (storeID_placeSetCode_defaultValue!)?string=="currentUser">
					<#assign storeID_placeSetCode_defaultValue='${staffJson!}'>
				<#elseif (storeID_placeSetCode_defaultValue!)?string=="currentPost">
					<#assign storeID_placeSetCode_defaultValue='${postJson!}'>
				<#elseif (storeID_placeSetCode_defaultValue!)?string=="currentDepart">
					<#assign storeID_placeSetCode_defaultValue='${deptJson!}'>
				<#elseif (storeID_placeSetCode_defaultValue!)?string=="currentComp">
					<#assign storeID_placeSetCode_defaultValue='${compJson!}'>
				</#if>
				<#assign storeID_placeSetCode_defaultText=''>
				<storeID.placeSetCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PrepareMaterialPart_dg1489977909385Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PrepareMaterialPart_dg1489977909385Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/storeSet/storeSet/storeRef.action','dg1489977909385storeID.placeSetCode','${getText("MESBasic.viewtitle.randon1489735291062")}',sPTGridID,nRow,sFieldName,PrepareMaterialPart_dg1489977909385Widget,null,false,false,'','MESBasic_1_storeSet_storeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PrepareMaterialPart_dg1489977909385Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						 IsHiddenField="true"					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="150">货位编码</storeID.placeSetCode>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="PrepareMaterialPart_dg1489977909385Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.productId.id)!}</c>
					<c>${(row.useNeedRef.id)!}</c>
					<c>${(row.ware.id)!}</c>
					<c>${(row.manuOrder.id)!}</c>
					<c>${(row.storeID.id)!}</c>
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
