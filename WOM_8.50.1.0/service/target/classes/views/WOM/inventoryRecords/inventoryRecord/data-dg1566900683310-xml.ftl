<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1566900683310" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<manulOrder.id IsHiddenField="true"></manulOrder.id>
				<material.id IsHiddenField="true"></material.id>
				<wareID.id IsHiddenField="true"></wareID.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign manulOrder_manulOrderNum_defaultValue=''>
												<#assign manulOrder_manulOrderNum_defaultValue=''>
				<#if (manulOrder_manulOrderNum_defaultValue!)?string=="currentUser">
					<#assign manulOrder_manulOrderNum_defaultValue='${staffJson!}'>
				<#elseif (manulOrder_manulOrderNum_defaultValue!)?string=="currentPost">
					<#assign manulOrder_manulOrderNum_defaultValue='${postJson!}'>
				<#elseif (manulOrder_manulOrderNum_defaultValue!)?string=="currentDepart">
					<#assign manulOrder_manulOrderNum_defaultValue='${deptJson!}'>
				<#elseif (manulOrder_manulOrderNum_defaultValue!)?string=="currentComp">
					<#assign manulOrder_manulOrderNum_defaultValue='${compJson!}'>
				</#if>
				<#assign manulOrder_manulOrderNum_defaultText=''>
				<manulOrder.manulOrderNum
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(InventoryDetail_dg1566900683310Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(InventoryDetail_dg1566900683310Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/manulOrder/manulOrderMain/manulOrdersRef.action','dg1566900683310manulOrder.manulOrderNum','${getText("WOM.viewtitle.randon1563350015905")}',sPTGridID,nRow,sFieldName,InventoryDetail_dg1566900683310Widget,null,false,false,'','WOM_7.5.0.0_manulOrder_manulOrdersRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="InventoryDetail_dg1566900683310Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (manulOrder_manulOrderNum_defaultValue)?? &&(manulOrder_manulOrderNum_defaultValue)?has_content>
							defaultValue='${(manulOrder_manulOrderNum_defaultValue!)?string}'
						</#if>
						<#if (manulOrder_manulOrderNum_defaultText)?? &&(manulOrder_manulOrderNum_defaultText)?has_content>
							defaultText='${(manulOrder_manulOrderNum_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">生产订单号</manulOrder.manulOrderNum>
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
					sort="false"  onPropertyChange="InventoryDetail_dg1566900683310Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">物品名称</material.productName>
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
					onFocus="CUI.toggleClearBtn_DG_IE(InventoryDetail_dg1566900683310Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(InventoryDetail_dg1566900683310Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/customRef.action','dg1566900683310material.productCode','${getText("MESBasic.viewtitle.randon1506341311049")}',sPTGridID,nRow,sFieldName,InventoryDetail_dg1566900683310Widget,null,false,false,'','MESBasic_1_product_customRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="InventoryDetail_dg1566900683310Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
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
				<#assign batchText_defaultValue=''>
						 						<#assign batchText_defaultValue=''>
				<#assign batchText_defaultText=''>
				<batchText
					sort="false"  onPropertyChange="InventoryDetail_dg1566900683310Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (batchText_defaultValue)?? &&(batchText_defaultValue)?has_content>
							defaultValue='${(batchText_defaultValue!)?string}'
						</#if>
						<#if (batchText_defaultText)?? &&(batchText_defaultText)?has_content>
							defaultText='${(batchText_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物料批号</batchText>
				<#assign isRef = false >
				<#assign wareID_wareName_defaultValue=''>
												<#assign wareID_wareName_defaultValue=''>
				<#if (wareID_wareName_defaultValue!)?string=="currentUser">
					<#assign wareID_wareName_defaultValue='${staffJson!}'>
				<#elseif (wareID_wareName_defaultValue!)?string=="currentPost">
					<#assign wareID_wareName_defaultValue='${postJson!}'>
				<#elseif (wareID_wareName_defaultValue!)?string=="currentDepart">
					<#assign wareID_wareName_defaultValue='${deptJson!}'>
				<#elseif (wareID_wareName_defaultValue!)?string=="currentComp">
					<#assign wareID_wareName_defaultValue='${compJson!}'>
				</#if>
				<#assign wareID_wareName_defaultText=''>
				<wareID.wareName
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(InventoryDetail_dg1566900683310Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(InventoryDetail_dg1566900683310Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/wareMan/ware/wareRef.action','dg1566900683310wareID.wareName','${getText("MESBasic.viewtitle.randon1484031981880")}',sPTGridID,nRow,sFieldName,InventoryDetail_dg1566900683310Widget,null,false,false,'','MESBasic_1_wareMan_wareRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="InventoryDetail_dg1566900683310Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (wareID_wareName_defaultValue)?? &&(wareID_wareName_defaultValue)?has_content>
							defaultValue='${(wareID_wareName_defaultValue!)?string}'
						</#if>
						<#if (wareID_wareName_defaultText)?? &&(wareID_wareName_defaultText)?has_content>
							defaultText='${(wareID_wareName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">库存地点</wareID.wareName>
				<#assign isRef = false >
				<#assign onhand_defaultValue=''>
						 						<#assign onhand_defaultValue=''>
				<#assign onhand_defaultText=''>
				<onhand
					sort="false"  onPropertyChange="InventoryDetail_dg1566900683310Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="6"
						
						 dataType="float"
						
						<#if (onhand_defaultValue)?? &&(onhand_defaultValue)?has_content>
							defaultValue='${(onhand_defaultValue!)?string}'
						</#if>
						<#if (onhand_defaultText)?? &&(onhand_defaultText)?has_content>
							defaultText='${(onhand_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">现存量</onhand>
				<#assign isRef = false >
				<#assign material_storeUnit_name_defaultValue=''>
												<#assign material_storeUnit_name_defaultValue=''>
				<#if (material_storeUnit_name_defaultValue!)?string=="currentUser">
					<#assign material_storeUnit_name_defaultValue='${staffJson!}'>
				<#elseif (material_storeUnit_name_defaultValue!)?string=="currentPost">
					<#assign material_storeUnit_name_defaultValue='${postJson!}'>
				<#elseif (material_storeUnit_name_defaultValue!)?string=="currentDepart">
					<#assign material_storeUnit_name_defaultValue='${deptJson!}'>
				<#elseif (material_storeUnit_name_defaultValue!)?string=="currentComp">
					<#assign material_storeUnit_name_defaultValue='${compJson!}'>
				</#if>
				<#assign material_storeUnit_name_defaultText=''>
				<material.storeUnit.name
					sort="false"  onPropertyChange="InventoryDetail_dg1566900683310Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (material_storeUnit_name_defaultValue)?? &&(material_storeUnit_name_defaultValue)?has_content>
							defaultValue='${(material_storeUnit_name_defaultValue!)?string}'
						</#if>
						<#if (material_storeUnit_name_defaultText)?? &&(material_storeUnit_name_defaultText)?has_content>
							defaultText='${(material_storeUnit_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">单位名称</material.storeUnit.name>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="InventoryDetail_dg1566900683310Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.manulOrder.id)!}</c>
					<c>${(row.material.id)!}</c>
					<c>${(row.wareID.id)!}</c>
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
