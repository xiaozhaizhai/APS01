<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1470194009997" pageSize="${dg1470194009997Page.pageSize}" totalCount="${dg1470194009997Page.totalCount}" totalPages="${dg1470194009997Page.totalPages}" pageNo="${dg1470194009997Page.pageNo}" hasPre="${dg1470194009997Page.hasPre?string}" hasNext="${dg1470194009997Page.hasNext?string}" prePage="${dg1470194009997Page.prePage}" nextPage="${dg1470194009997Page.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<productID.id IsHiddenField="true"></productID.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign clevel_defaultValue=''>
						 						<#assign clevel_defaultValue=''>
				<#assign clevel_defaultText=''>
				<clevel
					sort="false"  onPropertyChange="ProdLevel_dg1470194009997Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_product_ProdLevel_clevel_permit = checkFieldPermission('clevel','MESBasic_1_product_ProdLevel','MESBasic_1_product_ProdLevel_clevel')>
						<#if MESBasic_1_product_ProdLevel_clevel_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_product_ProdLevel_clevel_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (clevel_defaultValue)?? &&(clevel_defaultValue)?has_content>
							defaultValue='${(clevel_defaultValue!)?string}'
						</#if>
						<#if (clevel_defaultText)?? &&(clevel_defaultText)?has_content>
							defaultText='${(clevel_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">等级</clevel>
				<#assign isRef = false >
				<#assign corder_defaultValue=''>
						 						<#assign corder_defaultValue=''>
				<#assign corder_defaultText=''>
				<corder
					sort="false"  onPropertyChange="ProdLevel_dg1470194009997Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_product_ProdLevel_corder_permit = checkFieldPermission('corder','MESBasic_1_product_ProdLevel','MESBasic_1_product_ProdLevel_corder')>
						<#if MESBasic_1_product_ProdLevel_corder_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_product_ProdLevel_corder_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						 dataType="float" decLength="0"
						<#if (corder_defaultValue)?? &&(corder_defaultValue)?has_content>
							defaultValue='${(corder_defaultValue!)?string}'
						</#if>
						<#if (corder_defaultText)?? &&(corder_defaultText)?has_content>
							defaultText='${(corder_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">顺序</corder>
				<#assign isRef = false >
				<#assign rejectLvl_defaultValue=''>
						 						<#assign rejectLvl_defaultValue=''>
				<#assign rejectLvl_defaultText=''>
				<rejectLvl
					sort="false"  onPropertyChange="ProdLevel_dg1470194009997Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_product_ProdLevel_rejectLvl_permit = checkFieldPermission('rejectLvl','MESBasic_1_product_ProdLevel','MESBasic_1_product_ProdLevel_rejectLvl')>
						<#if MESBasic_1_product_ProdLevel_rejectLvl_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_product_ProdLevel_rejectLvl_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (rejectLvl_defaultValue)?? &&(rejectLvl_defaultValue)?has_content>
							defaultValue='${(rejectLvl_defaultValue!)?string}'
						</#if>
						<#if (rejectLvl_defaultText)?? &&(rejectLvl_defaultText)?has_content>
							defaultText='${(rejectLvl_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">不合格</rejectLvl>
				<#assign isRef = false >
				<#assign levelMemo_defaultValue=''>
						 						<#assign levelMemo_defaultValue=''>
				<#assign levelMemo_defaultText=''>
				<levelMemo
					sort="false"  onPropertyChange="ProdLevel_dg1470194009997Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_product_ProdLevel_levelMemo_permit = checkFieldPermission('levelMemo','MESBasic_1_product_ProdLevel','MESBasic_1_product_ProdLevel_levelMemo')>
						<#if MESBasic_1_product_ProdLevel_levelMemo_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_product_ProdLevel_levelMemo_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (levelMemo_defaultValue)?? &&(levelMemo_defaultValue)?has_content>
							defaultValue='${(levelMemo_defaultValue!)?string}'
						</#if>
						<#if (levelMemo_defaultText)?? &&(levelMemo_defaultText)?has_content>
							defaultText='${(levelMemo_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTAREA" 
					width="100">备注</levelMemo>
				<#assign isRef = false >
				<#assign itemChange_defaultValue=''>
						 						<#assign itemChange_defaultValue=''>
				<#assign itemChange_defaultText=''>
				<itemChange
					sort="false"  onPropertyChange="ProdLevel_dg1470194009997Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_product_ProdLevel_itemChange_permit = checkFieldPermission('itemChange','MESBasic_1_product_ProdLevel','MESBasic_1_product_ProdLevel_itemChange')>
						<#if MESBasic_1_product_ProdLevel_itemChange_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_product_ProdLevel_itemChange_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (itemChange_defaultValue)?? &&(itemChange_defaultValue)?has_content>
							defaultValue='${(itemChange_defaultValue!)?string}'
						</#if>
						<#if (itemChange_defaultText)?? &&(itemChange_defaultText)?has_content>
							defaultText='${(itemChange_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">变更物品</itemChange>
				<#assign isRef = false >
				<#assign productID_productName_defaultValue=''>
												<#assign productID_productName_defaultValue=''>
				<#if (productID_productName_defaultValue!)?string=="currentUser">
					<#assign productID_productName_defaultValue='${staffJson!}'>
				<#elseif (productID_productName_defaultValue!)?string=="currentPost">
					<#assign productID_productName_defaultValue='${postJson!}'>
				<#elseif (productID_productName_defaultValue!)?string=="currentDepart">
					<#assign productID_productName_defaultValue='${deptJson!}'>
				<#elseif (productID_productName_defaultValue!)?string=="currentComp">
					<#assign productID_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign productID_productName_defaultText=''>
				<productID.productName
					sort="false"  onPropertyChange="ProdLevel_dg1470194009997Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_product_ProdLevel_productID_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productID.productName','MESBasic_1_product_ProdLevel','MESBasic_1_product_Product_productName')>
						<#if MESBasic_1_product_ProdLevel_productID_MESBasic_1_product_Product_productName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_product_ProdLevel_productID_MESBasic_1_product_Product_productName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productID_productName_defaultValue)?? &&(productID_productName_defaultValue)?has_content>
							defaultValue='${(productID_productName_defaultValue!)?string}'
						</#if>
						<#if (productID_productName_defaultText)?? &&(productID_productName_defaultText)?has_content>
							defaultText='${(productID_productName_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品名称</productID.productName>
				<#assign isRef = false >
				<#assign productID_productCode_defaultValue=''>
												<#assign productID_productCode_defaultValue=''>
				<#if (productID_productCode_defaultValue!)?string=="currentUser">
					<#assign productID_productCode_defaultValue='${staffJson!}'>
				<#elseif (productID_productCode_defaultValue!)?string=="currentPost">
					<#assign productID_productCode_defaultValue='${postJson!}'>
				<#elseif (productID_productCode_defaultValue!)?string=="currentDepart">
					<#assign productID_productCode_defaultValue='${deptJson!}'>
				<#elseif (productID_productCode_defaultValue!)?string=="currentComp">
					<#assign productID_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign productID_productCode_defaultText=''>
				<productID.productCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ProdLevel_dg1470194009997Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ProdLevel_dg1470194009997Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/ref.action','dg1470194009997productID.productCode','${getText("MESBasic.viewtitle.randon1428027703233")}',sPTGridID,nRow,sFieldName,ProdLevel_dg1470194009997Widget,null,false,false,'','MESBasic_1_product_ref')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ProdLevel_dg1470194009997Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_product_ProdLevel_productID_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productID.productCode','MESBasic_1_product_ProdLevel','MESBasic_1_product_Product_productCode')>
						<#if MESBasic_1_product_ProdLevel_productID_MESBasic_1_product_Product_productCode_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_product_ProdLevel_productID_MESBasic_1_product_Product_productCode_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (productID_productCode_defaultValue)?? &&(productID_productCode_defaultValue)?has_content>
							defaultValue='${(productID_productCode_defaultValue!)?string}'
						</#if>
						<#if (productID_productCode_defaultText)?? &&(productID_productCode_defaultText)?has_content>
							defaultText='${(productID_productCode_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物品编码</productID.productCode>
	</thead>
	<tbody>
		<#list dg1470194009997Page.result as row>
		<row  onClick="ProdLevel_dg1470194009997Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.productID.id)!}</c>
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
					<#if !MESBasic_1_product_ProdLevel_clevel_permit??>
					<#assign MESBasic_1_product_ProdLevel_clevel_permit = checkFieldPermission('clevel','MESBasic_1_product_ProdLevel','MESBasic_1_product_ProdLevel_clevel')>
					</#if>
							<c><#if MESBasic_1_product_ProdLevel_clevel_permit != 0><#if (row.clevel)?has_content>${(row.clevel)!}</#if></#if></c>
					<#if !MESBasic_1_product_ProdLevel_corder_permit??>
					<#assign MESBasic_1_product_ProdLevel_corder_permit = checkFieldPermission('corder','MESBasic_1_product_ProdLevel','MESBasic_1_product_ProdLevel_corder')>
					</#if>
							<c><#if MESBasic_1_product_ProdLevel_corder_permit != 0><#if (row.corder)?has_content>${(row.corder)!}</#if></#if></c>
					<#if !MESBasic_1_product_ProdLevel_rejectLvl_permit??>
					<#assign MESBasic_1_product_ProdLevel_rejectLvl_permit = checkFieldPermission('rejectLvl','MESBasic_1_product_ProdLevel','MESBasic_1_product_ProdLevel_rejectLvl')>
					</#if>
							<c><#if MESBasic_1_product_ProdLevel_rejectLvl_permit != 0><#if (row.rejectLvl)?has_content>${(row.rejectLvl?string)!}<#else>false</#if></#if></c>
					<#if !MESBasic_1_product_ProdLevel_levelMemo_permit??>
					<#assign MESBasic_1_product_ProdLevel_levelMemo_permit = checkFieldPermission('levelMemo','MESBasic_1_product_ProdLevel','MESBasic_1_product_ProdLevel_levelMemo')>
					</#if>
							<c><#if MESBasic_1_product_ProdLevel_levelMemo_permit != 0><#if (row.levelMemo)?has_content>${(row.levelMemo)!}</#if></#if></c>
					<#if !MESBasic_1_product_ProdLevel_itemChange_permit??>
					<#assign MESBasic_1_product_ProdLevel_itemChange_permit = checkFieldPermission('itemChange','MESBasic_1_product_ProdLevel','MESBasic_1_product_ProdLevel_itemChange')>
					</#if>
							<c><#if MESBasic_1_product_ProdLevel_itemChange_permit != 0><#if (row.itemChange)?has_content>${(row.itemChange?string)!}<#else>false</#if></#if></c>
					<#if !MESBasic_1_product_ProdLevel_productID_MESBasic_1_product_Product_productName_permit??>
					<#assign MESBasic_1_product_ProdLevel_productID_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productID.productName','MESBasic_1_product_ProdLevel','MESBasic_1_product_Product_productName')>
					</#if>
							<c><#if MESBasic_1_product_ProdLevel_productID_MESBasic_1_product_Product_productName_permit != 0><#if (row.productID.productName)?has_content>${(row.productID.productName)!}</#if></#if></c>
					<#if !MESBasic_1_product_ProdLevel_productID_MESBasic_1_product_Product_productCode_permit??>
					<#assign MESBasic_1_product_ProdLevel_productID_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productID.productCode','MESBasic_1_product_ProdLevel','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if MESBasic_1_product_ProdLevel_productID_MESBasic_1_product_Product_productCode_permit != 0><#if (row.productID.productCode)?has_content>${(row.productID.productCode)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>