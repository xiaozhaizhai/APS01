<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1486955005699" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<ware.id IsHiddenField="true"></ware.id>
				<store.id IsHiddenField="true"></store.id>
				<product.id IsHiddenField="true"></product.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
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
						style="font-color:0303B3"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ObjWareStore_dg1486955005699Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ObjWareStore_dg1486955005699Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/wareMan/ware/wareRefStore.action','dg1486955005699ware.wareCode','${getText("MESBasic.viewtitle.randon1484032238590")}',sPTGridID,nRow,sFieldName,ObjWareStore_dg1486955005699Widget,null,false,false,'','MESBasic_1_wareMan_wareRefStore')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ObjWareStore_dg1486955005699Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_factoryModel_ObjWareStore_ware_MESBasic_1_wareMan_Ware_wareCode_permit = checkFieldPermission('ware.wareCode','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_wareMan_Ware_wareCode')>
						<#if MESBasic_1_factoryModel_ObjWareStore_ware_MESBasic_1_wareMan_Ware_wareCode_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_factoryModel_ObjWareStore_ware_MESBasic_1_wareMan_Ware_wareCode_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
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
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ObjWareStore_dg1486955005699Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_factoryModel_ObjWareStore_ware_MESBasic_1_wareMan_Ware_wareName_permit = checkFieldPermission('ware.wareName','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_wareMan_Ware_wareName')>
						<#if MESBasic_1_factoryModel_ObjWareStore_ware_MESBasic_1_wareMan_Ware_wareName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_factoryModel_ObjWareStore_ware_MESBasic_1_wareMan_Ware_wareName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (ware_wareName_defaultValue)?? &&(ware_wareName_defaultValue)?has_content>
							defaultValue='${(ware_wareName_defaultValue!)?string}'
						</#if>
						<#if (ware_wareName_defaultText)?? &&(ware_wareName_defaultText)?has_content>
							defaultText='${(ware_wareName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">仓库名称</ware.wareName>
				<#assign isRef = false >
				<#assign store_placeSetCode_defaultValue=''>
												<#assign store_placeSetCode_defaultValue=''>
				<#if (store_placeSetCode_defaultValue!)?string=="currentUser">
					<#assign store_placeSetCode_defaultValue='${staffJson!}'>
				<#elseif (store_placeSetCode_defaultValue!)?string=="currentPost">
					<#assign store_placeSetCode_defaultValue='${postJson!}'>
				<#elseif (store_placeSetCode_defaultValue!)?string=="currentDepart">
					<#assign store_placeSetCode_defaultValue='${deptJson!}'>
				<#elseif (store_placeSetCode_defaultValue!)?string=="currentComp">
					<#assign store_placeSetCode_defaultValue='${compJson!}'>
				</#if>
				<#assign store_placeSetCode_defaultText=''>
				<store.placeSetCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ObjWareStore_dg1486955005699Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ObjWareStore_dg1486955005699Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/storeSet/storeSet/storeRef.action','dg1486955005699store.placeSetCode','${getText("MESBasic.viewtitle.randon1486954640353")}',sPTGridID,nRow,sFieldName,ObjWareStore_dg1486955005699Widget,null,false,false,'','MESBasic_1_storeSet_storeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ObjWareStore_dg1486955005699Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_factoryModel_ObjWareStore_store_MESBasic_1_storeSet_StoreSet_placeSetCode_permit = checkFieldPermission('store.placeSetCode','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_storeSet_StoreSet_placeSetCode')>
						<#if MESBasic_1_factoryModel_ObjWareStore_store_MESBasic_1_storeSet_StoreSet_placeSetCode_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_factoryModel_ObjWareStore_store_MESBasic_1_storeSet_StoreSet_placeSetCode_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (store_placeSetCode_defaultValue)?? &&(store_placeSetCode_defaultValue)?has_content>
							defaultValue='${(store_placeSetCode_defaultValue!)?string}'
						</#if>
						<#if (store_placeSetCode_defaultText)?? &&(store_placeSetCode_defaultText)?has_content>
							defaultText='${(store_placeSetCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">货位编码</store.placeSetCode>
				<#assign isRef = false >
				<#assign store_placeSetName_defaultValue=''>
												<#assign store_placeSetName_defaultValue=''>
				<#if (store_placeSetName_defaultValue!)?string=="currentUser">
					<#assign store_placeSetName_defaultValue='${staffJson!}'>
				<#elseif (store_placeSetName_defaultValue!)?string=="currentPost">
					<#assign store_placeSetName_defaultValue='${postJson!}'>
				<#elseif (store_placeSetName_defaultValue!)?string=="currentDepart">
					<#assign store_placeSetName_defaultValue='${deptJson!}'>
				<#elseif (store_placeSetName_defaultValue!)?string=="currentComp">
					<#assign store_placeSetName_defaultValue='${compJson!}'>
				</#if>
				<#assign store_placeSetName_defaultText=''>
				<store.placeSetName
					sort="false"  onPropertyChange="ObjWareStore_dg1486955005699Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_factoryModel_ObjWareStore_store_MESBasic_1_storeSet_StoreSet_placeSetName_permit = checkFieldPermission('store.placeSetName','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_storeSet_StoreSet_placeSetName')>
						<#if MESBasic_1_factoryModel_ObjWareStore_store_MESBasic_1_storeSet_StoreSet_placeSetName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_factoryModel_ObjWareStore_store_MESBasic_1_storeSet_StoreSet_placeSetName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (store_placeSetName_defaultValue)?? &&(store_placeSetName_defaultValue)?has_content>
							defaultValue='${(store_placeSetName_defaultValue!)?string}'
						</#if>
						<#if (store_placeSetName_defaultText)?? &&(store_placeSetName_defaultText)?has_content>
							defaultText='${(store_placeSetName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">货位名称</store.placeSetName>
				<#assign isRef = false >
				<#assign product_productCode_defaultValue=''>
												<#assign product_productCode_defaultValue=''>
				<#if (product_productCode_defaultValue!)?string=="currentUser">
					<#assign product_productCode_defaultValue='${staffJson!}'>
				<#elseif (product_productCode_defaultValue!)?string=="currentPost">
					<#assign product_productCode_defaultValue='${postJson!}'>
				<#elseif (product_productCode_defaultValue!)?string=="currentDepart">
					<#assign product_productCode_defaultValue='${deptJson!}'>
				<#elseif (product_productCode_defaultValue!)?string=="currentComp">
					<#assign product_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign product_productCode_defaultText=''>
				<product.productCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ObjWareStore_dg1486955005699Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ObjWareStore_dg1486955005699Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1486955005699product.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,ObjWareStore_dg1486955005699Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ObjWareStore_dg1486955005699Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_factoryModel_ObjWareStore_product_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('product.productCode','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_product_Product_productCode')>
						<#if MESBasic_1_factoryModel_ObjWareStore_product_MESBasic_1_product_Product_productCode_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_factoryModel_ObjWareStore_product_MESBasic_1_product_Product_productCode_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (product_productCode_defaultValue)?? &&(product_productCode_defaultValue)?has_content>
							defaultValue='${(product_productCode_defaultValue!)?string}'
						</#if>
						<#if (product_productCode_defaultText)?? &&(product_productCode_defaultText)?has_content>
							defaultText='${(product_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物品编码</product.productCode>
				<#assign isRef = false >
				<#assign product_productName_defaultValue=''>
												<#assign product_productName_defaultValue=''>
				<#if (product_productName_defaultValue!)?string=="currentUser">
					<#assign product_productName_defaultValue='${staffJson!}'>
				<#elseif (product_productName_defaultValue!)?string=="currentPost">
					<#assign product_productName_defaultValue='${postJson!}'>
				<#elseif (product_productName_defaultValue!)?string=="currentDepart">
					<#assign product_productName_defaultValue='${deptJson!}'>
				<#elseif (product_productName_defaultValue!)?string=="currentComp">
					<#assign product_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign product_productName_defaultText=''>
				<product.productName
					sort="false"  onPropertyChange="ObjWareStore_dg1486955005699Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_factoryModel_ObjWareStore_product_MESBasic_1_product_Product_productName_permit = checkFieldPermission('product.productName','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_product_Product_productName')>
						<#if MESBasic_1_factoryModel_ObjWareStore_product_MESBasic_1_product_Product_productName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_factoryModel_ObjWareStore_product_MESBasic_1_product_Product_productName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (product_productName_defaultValue)?? &&(product_productName_defaultValue)?has_content>
							defaultValue='${(product_productName_defaultValue!)?string}'
						</#if>
						<#if (product_productName_defaultText)?? &&(product_productName_defaultText)?has_content>
							defaultText='${(product_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物品名称</product.productName>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ObjWareStore_dg1486955005699Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.ware.id)!}</c>
					<c>${(row.store.id)!}</c>
					<c>${(row.product.id)!}</c>
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
					<#if !MESBasic_1_factoryModel_ObjWareStore_ware_MESBasic_1_wareMan_Ware_wareCode_permit??>
					<#assign MESBasic_1_factoryModel_ObjWareStore_ware_MESBasic_1_wareMan_Ware_wareCode_permit = checkFieldPermission('ware.wareCode','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_wareMan_Ware_wareCode')>
					</#if>
							<c><#if MESBasic_1_factoryModel_ObjWareStore_ware_MESBasic_1_wareMan_Ware_wareCode_permit != 0><#if (row.ware.wareCode)?has_content>${(row.ware.wareCode)!}</#if></#if></c>
					<#if !MESBasic_1_factoryModel_ObjWareStore_ware_MESBasic_1_wareMan_Ware_wareName_permit??>
					<#assign MESBasic_1_factoryModel_ObjWareStore_ware_MESBasic_1_wareMan_Ware_wareName_permit = checkFieldPermission('ware.wareName','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_wareMan_Ware_wareName')>
					</#if>
							<c><#if MESBasic_1_factoryModel_ObjWareStore_ware_MESBasic_1_wareMan_Ware_wareName_permit != 0><#if (row.ware.wareName)?has_content>${(row.ware.wareName)!}</#if></#if></c>
					<#if !MESBasic_1_factoryModel_ObjWareStore_store_MESBasic_1_storeSet_StoreSet_placeSetCode_permit??>
					<#assign MESBasic_1_factoryModel_ObjWareStore_store_MESBasic_1_storeSet_StoreSet_placeSetCode_permit = checkFieldPermission('store.placeSetCode','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_storeSet_StoreSet_placeSetCode')>
					</#if>
							<c><#if MESBasic_1_factoryModel_ObjWareStore_store_MESBasic_1_storeSet_StoreSet_placeSetCode_permit != 0><#if (row.store.placeSetCode)?has_content>${(row.store.placeSetCode)!}</#if></#if></c>
					<#if !MESBasic_1_factoryModel_ObjWareStore_store_MESBasic_1_storeSet_StoreSet_placeSetName_permit??>
					<#assign MESBasic_1_factoryModel_ObjWareStore_store_MESBasic_1_storeSet_StoreSet_placeSetName_permit = checkFieldPermission('store.placeSetName','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_storeSet_StoreSet_placeSetName')>
					</#if>
							<c><#if MESBasic_1_factoryModel_ObjWareStore_store_MESBasic_1_storeSet_StoreSet_placeSetName_permit != 0><#if (row.store.placeSetName)?has_content>${(row.store.placeSetName)!}</#if></#if></c>
					<#if !MESBasic_1_factoryModel_ObjWareStore_product_MESBasic_1_product_Product_productCode_permit??>
					<#assign MESBasic_1_factoryModel_ObjWareStore_product_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('product.productCode','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if MESBasic_1_factoryModel_ObjWareStore_product_MESBasic_1_product_Product_productCode_permit != 0><#if (row.product.productCode)?has_content>${(row.product.productCode)!}</#if></#if></c>
					<#if !MESBasic_1_factoryModel_ObjWareStore_product_MESBasic_1_product_Product_productName_permit??>
					<#assign MESBasic_1_factoryModel_ObjWareStore_product_MESBasic_1_product_Product_productName_permit = checkFieldPermission('product.productName','MESBasic_1_factoryModel_ObjWareStore','MESBasic_1_product_Product_productName')>
					</#if>
							<c><#if MESBasic_1_factoryModel_ObjWareStore_product_MESBasic_1_product_Product_productName_permit != 0><#if (row.product.productName)?has_content>${(row.product.productName)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>