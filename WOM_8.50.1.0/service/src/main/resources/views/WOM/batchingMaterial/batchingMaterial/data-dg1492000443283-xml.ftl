<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1492000443283" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<productId.id IsHiddenField="true"></productId.id>
				<wareID.id IsHiddenField="true"></wareID.id>
				<storeID.id IsHiddenField="true"></storeID.id>
				<exeStaff.id IsHiddenField="true"></exeStaff.id>
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
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialPart_dg1492000443283Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialPart_dg1492000443283Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1492000443283productId.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,BatchingMaterialPart_dg1492000443283Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="BatchingMaterialPart_dg1492000443283Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_product_Product_productCode')>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productCode_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productCode_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productCode_defaultValue)?? &&(productId_productCode_defaultValue)?has_content>
							defaultValue='${(productId_productCode_defaultValue!)?string}'
						</#if>
						<#if (productId_productCode_defaultText)?? &&(productId_productCode_defaultText)?has_content>
							defaultText='${(productId_productCode_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">物料编码</productId.productCode>
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
					sort="true"  onPropertyChange="BatchingMaterialPart_dg1492000443283Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_product_Product_productName')>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productName_permit == 1>
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
					width="100">物料名称</productId.productName>
				<#assign isRef = false >
				<#assign productId_id_defaultValue=''>
												<#assign productId_id_defaultValue=''>
				<#if (productId_id_defaultValue!)?string=="currentUser">
					<#assign productId_id_defaultValue='${staffJson!}'>
				<#elseif (productId_id_defaultValue!)?string=="currentPost">
					<#assign productId_id_defaultValue='${postJson!}'>
				<#elseif (productId_id_defaultValue!)?string=="currentDepart">
					<#assign productId_id_defaultValue='${deptJson!}'>
				<#elseif (productId_id_defaultValue!)?string=="currentComp">
					<#assign productId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_id_defaultText=''>
				<productId.id
					sort="true"  onPropertyChange="BatchingMaterialPart_dg1492000443283Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_id_permit = checkFieldPermission('productId.id','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_product_Product_id')>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_id_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_id_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</productId.id>
				<#assign isRef = false >
				<#assign batchNum_defaultValue=''>
						 						<#assign batchNum_defaultValue=''>
				<#assign batchNum_defaultText=''>
				<batchNum
					sort="true"  onPropertyChange="BatchingMaterialPart_dg1492000443283Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_batchNum_permit = checkFieldPermission('batchNum','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_batchNum')>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_batchNum_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_batchNum_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (batchNum_defaultValue)?? &&(batchNum_defaultValue)?has_content>
							defaultValue='${(batchNum_defaultValue!)?string}'
						</#if>
						<#if (batchNum_defaultText)?? &&(batchNum_defaultText)?has_content>
							defaultText='${(batchNum_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物料批号</batchNum>
				<#assign isRef = false >
				<#assign doneNum_defaultValue=''>
						 						<#assign doneNum_defaultValue=''>
				<#assign doneNum_defaultText=''>
				<doneNum
					sort="true"  onPropertyChange="BatchingMaterialPart_dg1492000443283Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_doneNum_permit = checkFieldPermission('doneNum','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_doneNum')>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_doneNum_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_doneNum_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						 decLength="6"
						
						 dataType="float"
						
						<#if (doneNum_defaultValue)?? &&(doneNum_defaultValue)?has_content>
							defaultValue='${(doneNum_defaultValue!)?string}'
						</#if>
						<#if (doneNum_defaultText)?? &&(doneNum_defaultText)?has_content>
							defaultText='${(doneNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">配料数量</doneNum>
				<#assign isRef = false >
				<#assign wareID_wareCode_defaultValue=''>
												<#assign wareID_wareCode_defaultValue=''>
				<#if (wareID_wareCode_defaultValue!)?string=="currentUser">
					<#assign wareID_wareCode_defaultValue='${staffJson!}'>
				<#elseif (wareID_wareCode_defaultValue!)?string=="currentPost">
					<#assign wareID_wareCode_defaultValue='${postJson!}'>
				<#elseif (wareID_wareCode_defaultValue!)?string=="currentDepart">
					<#assign wareID_wareCode_defaultValue='${deptJson!}'>
				<#elseif (wareID_wareCode_defaultValue!)?string=="currentComp">
					<#assign wareID_wareCode_defaultValue='${compJson!}'>
				</#if>
				<#assign wareID_wareCode_defaultText=''>
				<wareID.wareCode
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialPart_dg1492000443283Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialPart_dg1492000443283Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/wareMan/ware/wareRef.action','dg1492000443283wareID.wareCode','${getText("MESBasic.viewtitle.randon1484031981880")}',sPTGridID,nRow,sFieldName,BatchingMaterialPart_dg1492000443283Widget,null,false,false,'','MESBasic_1_wareMan_wareRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="BatchingMaterialPart_dg1492000443283Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareCode_permit = checkFieldPermission('wareID.wareCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_wareMan_Ware_wareCode')>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareCode_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareCode_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (wareID_wareCode_defaultValue)?? &&(wareID_wareCode_defaultValue)?has_content>
							defaultValue='${(wareID_wareCode_defaultValue!)?string}'
						</#if>
						<#if (wareID_wareCode_defaultText)?? &&(wareID_wareCode_defaultText)?has_content>
							defaultText='${(wareID_wareCode_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">仓库编码</wareID.wareCode>
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
					sort="true"  onPropertyChange="BatchingMaterialPart_dg1492000443283Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareName_permit = checkFieldPermission('wareID.wareName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_wareMan_Ware_wareName')>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (wareID_wareName_defaultValue)?? &&(wareID_wareName_defaultValue)?has_content>
							defaultValue='${(wareID_wareName_defaultValue!)?string}'
						</#if>
						<#if (wareID_wareName_defaultText)?? &&(wareID_wareName_defaultText)?has_content>
							defaultText='${(wareID_wareName_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">仓库名称</wareID.wareName>
				<#assign isRef = false >
				<#assign wareID_id_defaultValue=''>
												<#assign wareID_id_defaultValue=''>
				<#if (wareID_id_defaultValue!)?string=="currentUser">
					<#assign wareID_id_defaultValue='${staffJson!}'>
				<#elseif (wareID_id_defaultValue!)?string=="currentPost">
					<#assign wareID_id_defaultValue='${postJson!}'>
				<#elseif (wareID_id_defaultValue!)?string=="currentDepart">
					<#assign wareID_id_defaultValue='${deptJson!}'>
				<#elseif (wareID_id_defaultValue!)?string=="currentComp">
					<#assign wareID_id_defaultValue='${compJson!}'>
				</#if>
				<#assign wareID_id_defaultText=''>
				<wareID.id
					sort="true"  onPropertyChange="BatchingMaterialPart_dg1492000443283Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_id_permit = checkFieldPermission('wareID.id','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_wareMan_Ware_id')>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_id_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_id_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">ID</wareID.id>
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
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialPart_dg1492000443283Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialPart_dg1492000443283Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/storeSet/storeSet/storeRef.action','dg1492000443283storeID.placeSetCode','${getText("MESBasic.viewtitle.randon1489735291062")}',sPTGridID,nRow,sFieldName,BatchingMaterialPart_dg1492000443283Widget,null,false,false,'','MESBasic_1_storeSet_storeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="BatchingMaterialPart_dg1492000443283Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetCode_permit = checkFieldPermission('storeID.placeSetCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_storeSet_StoreSet_placeSetCode')>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetCode_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetCode_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (storeID_placeSetCode_defaultValue)?? &&(storeID_placeSetCode_defaultValue)?has_content>
							defaultValue='${(storeID_placeSetCode_defaultValue!)?string}'
						</#if>
						<#if (storeID_placeSetCode_defaultText)?? &&(storeID_placeSetCode_defaultText)?has_content>
							defaultText='${(storeID_placeSetCode_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">货位编码</storeID.placeSetCode>
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
					sort="true"  onPropertyChange="BatchingMaterialPart_dg1492000443283Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetName_permit = checkFieldPermission('storeID.placeSetName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_storeSet_StoreSet_placeSetName')>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetName_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (storeID_placeSetName_defaultValue)?? &&(storeID_placeSetName_defaultValue)?has_content>
							defaultValue='${(storeID_placeSetName_defaultValue!)?string}'
						</#if>
						<#if (storeID_placeSetName_defaultText)?? &&(storeID_placeSetName_defaultText)?has_content>
							defaultText='${(storeID_placeSetName_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">货位名称</storeID.placeSetName>
				<#assign isRef = false >
				<#assign exeStaff_name_defaultValue='currentUser'>
										<#if (exeStaff_name_defaultValue!)?string=="currentUser">
					<#assign exeStaff_name_defaultValue='${staffJson!}'>
				<#elseif (exeStaff_name_defaultValue!)?string=="currentPost">
					<#assign exeStaff_name_defaultValue='${postJson!}'>
				<#elseif (exeStaff_name_defaultValue!)?string=="currentDepart">
					<#assign exeStaff_name_defaultValue='${deptJson!}'>
				<#elseif (exeStaff_name_defaultValue!)?string=="currentComp">
					<#assign exeStaff_name_defaultValue='${compJson!}'>
				</#if>
				<#assign exeStaff_name_defaultText=''>
				<exeStaff.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(BatchingMaterialPart_dg1492000443283Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(BatchingMaterialPart_dg1492000443283Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/foundation/staff/common/staffListFrameset.action','dg1492000443283exeStaff.name','${getText("foundation.ec.entity.view.reference")}',sPTGridID,nRow,sFieldName,BatchingMaterialPart_dg1492000443283Widget,null,false,false,'','sysbase_1.0_staff_ref')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="true"  onPropertyChange="BatchingMaterialPart_dg1492000443283Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeStaff_base_staff_name_permit = checkFieldPermission('exeStaff.name','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','base_staff_name')>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeStaff_base_staff_name_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeStaff_base_staff_name_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (exeStaff_name_defaultValue)?? &&(exeStaff_name_defaultValue)?has_content>
							defaultValue='${(exeStaff_name_defaultValue!)?string}'
						</#if>
						<#if (exeStaff_name_defaultText)?? &&(exeStaff_name_defaultText)?has_content>
							defaultText='${(exeStaff_name_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">配料操作人</exeStaff.name>
				<#assign isRef = false >
				<#assign exeDate_defaultValue='currentTime'>
						 				<#assign exeDate_defaultText=''>
					<#if (exeDate_defaultValue)?? &&(exeDate_defaultValue)?has_content>
							<#assign exeDate_defaultValue  = getDefaultDateTime(exeDate_defaultValue!)?datetime>
					</#if>
				<exeDate
					sort="true"  onPropertyChange="BatchingMaterialPart_dg1492000443283Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_permit = checkFieldPermission('exeDate','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_exeDate')>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(BatchingMaterialPart_dg1492000443283Widget,'BatchingMaterialPart_dg1492000443283Widget',nRow,sFieldName,'dateTimeMin')" 
									   onBtnClick="showCalender(BatchingMaterialPart_dg1492000443283Widget,'BatchingMaterialPart_dg1492000443283Widget',nRow,sFieldName,'dateTimeMin')" 
						
						
						
						
						<#if (exeDate_defaultValue)?? &&(exeDate_defaultValue)?has_content>
							defaultValue='${(exeDate_defaultValue!)?string}'
						</#if>
						<#if (exeDate_defaultText)?? &&(exeDate_defaultText)?has_content>
							defaultText='${(exeDate_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HM" 
							type="dateTimeMin" 
					width="100">配料操作时间</exeDate>
				<#assign isRef = false >
				<#assign state_defaultValue='womBatPartState/01'>
						 				<#assign state_defaultText=''>
				<state.id
					sort="true"  onPropertyChange="BatchingMaterialPart_dg1492000443283Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_state_permit = checkFieldPermission('state','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_state')>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_state_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_state_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
								<#assign optionMap = getSystemCodeList('womBatPartState')>
								<#assign itemList = '' >
								<#assign valueList = '' >
								<#if optionMap??>
									<#list optionMap?keys as mapKey>
									<#assign itemList = itemList + ',' + optionMap[mapKey] >
										<#assign valueList = valueList + ',' + mapKey >
									</#list>
								</#if>
								control="ComboBox" items="${itemList!}" values="${valueList!}"
						
						
						
						
						<#if (state_defaultValue)?? &&(state_defaultValue)?has_content>
							defaultValue='${(state_defaultValue!)?string}'
						</#if>
						<#if (state_defaultText)?? &&(state_defaultText)?has_content>
							defaultText='${(state_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">状态</state.id>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="true"  onPropertyChange="BatchingMaterialPart_dg1492000443283Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_remark_permit = checkFieldPermission('remark','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_remark')>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_remark_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_remark_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
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
		<row  >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.productId.id)!}</c>
					<c>${(row.wareID.id)!}</c>
					<c>${(row.storeID.id)!}</c>
					<c>${(row.exeStaff.id)!}</c>
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
					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productCode_permit != 0><#if (row.productId.productCode)?has_content>${(row.productId.productCode)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_product_Product_productName')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_productName_permit != 0><#if (row.productId.productName)?has_content>${(row.productId.productName)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_id_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_id_permit = checkFieldPermission('productId.id','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_product_Product_id')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_productId_MESBasic_1_product_Product_id_permit != 0><#if (row.productId.id)?has_content>${(row.productId.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_batchNum_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_batchNum_permit = checkFieldPermission('batchNum','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_batchNum')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_batchNum_permit != 0><#if (row.batchNum)?has_content>${(row.batchNum)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_doneNum_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_doneNum_permit = checkFieldPermission('doneNum','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_doneNum')>
					</#if>
						<c><#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_doneNum_permit != 0><#if (row.doneNum)?has_content>#{(row.doneNum)!; m6M6}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareCode_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareCode_permit = checkFieldPermission('wareID.wareCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_wareMan_Ware_wareCode')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareCode_permit != 0><#if (row.wareID.wareCode)?has_content>${(row.wareID.wareCode)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareName_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareName_permit = checkFieldPermission('wareID.wareName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_wareMan_Ware_wareName')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_wareName_permit != 0><#if (row.wareID.wareName)?has_content>${(row.wareID.wareName)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_id_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_id_permit = checkFieldPermission('wareID.id','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_wareMan_Ware_id')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_wareID_MESBasic_1_wareMan_Ware_id_permit != 0><#if (row.wareID.id)?has_content>${(row.wareID.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetCode_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetCode_permit = checkFieldPermission('storeID.placeSetCode','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_storeSet_StoreSet_placeSetCode')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetCode_permit != 0><#if (row.storeID.placeSetCode)?has_content>${(row.storeID.placeSetCode)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetName_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetName_permit = checkFieldPermission('storeID.placeSetName','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','MESBasic_1_storeSet_StoreSet_placeSetName')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_storeID_MESBasic_1_storeSet_StoreSet_placeSetName_permit != 0><#if (row.storeID.placeSetName)?has_content>${(row.storeID.placeSetName)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeStaff_base_staff_name_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeStaff_base_staff_name_permit = checkFieldPermission('exeStaff.name','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','base_staff_name')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeStaff_base_staff_name_permit != 0><#if (row.exeStaff.name)?has_content>${(row.exeStaff.name)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_permit = checkFieldPermission('exeDate','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_exeDate')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_exeDate_permit != 0><#if (row.exeDate)?has_content>${(row.exeDate?string('yyyy-MM-dd HH:mm:ss'))!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_state_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_state_permit = checkFieldPermission('state','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_state')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_state_permit != 0><#if (row.state.id)?has_content>${(row.state.id)!}</#if></#if></c>
					<#if !WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_remark_permit??>
					<#assign WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_remark_permit = checkFieldPermission('remark','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart','WOM_7.5.0.0_batchingMaterial_BatchingMaterialPart_remark')>
					</#if>
							<c><#if WOM_7_5_0_0_batchingMaterial_BatchingMaterialPart_remark_permit != 0><#if (row.remark)?has_content>${(row.remark)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>