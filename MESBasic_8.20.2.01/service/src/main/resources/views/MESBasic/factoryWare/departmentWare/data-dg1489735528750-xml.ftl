<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1489735528750" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
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
					onFocus="CUI.toggleClearBtn_DG_IE(FacWareMaterial_dg1489735528750Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(FacWareMaterial_dg1489735528750Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1489735528750productId.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,FacWareMaterial_dg1489735528750Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="FacWareMaterial_dg1489735528750Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','MESBasic_1_factoryWare_FacWareMaterial','MESBasic_1_product_Product_productCode')>
						<#if MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productCode_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productCode_permit == 1>
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
					sort="false"  onPropertyChange="FacWareMaterial_dg1489735528750Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','MESBasic_1_factoryWare_FacWareMaterial','MESBasic_1_product_Product_productName')>
						<#if MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productName_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productName_permit == 1>
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
				<#assign productId_productModel_defaultValue=''>
												<#assign productId_productModel_defaultValue=''>
				<#if (productId_productModel_defaultValue!)?string=="currentUser">
					<#assign productId_productModel_defaultValue='${staffJson!}'>
				<#elseif (productId_productModel_defaultValue!)?string=="currentPost">
					<#assign productId_productModel_defaultValue='${postJson!}'>
				<#elseif (productId_productModel_defaultValue!)?string=="currentDepart">
					<#assign productId_productModel_defaultValue='${deptJson!}'>
				<#elseif (productId_productModel_defaultValue!)?string=="currentComp">
					<#assign productId_productModel_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_productModel_defaultText=''>
				<productId.productModel
					sort="false"  onPropertyChange="FacWareMaterial_dg1489735528750Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productModel_permit = checkFieldPermission('productId.productModel','MESBasic_1_factoryWare_FacWareMaterial','MESBasic_1_product_Product_productModel')>
						<#if MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productModel_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productModel_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productModel_defaultValue)?? &&(productId_productModel_defaultValue)?has_content>
							defaultValue='${(productId_productModel_defaultValue!)?string}'
						</#if>
						<#if (productId_productModel_defaultText)?? &&(productId_productModel_defaultText)?has_content>
							defaultText='${(productId_productModel_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">型号</productId.productModel>
				<#assign isRef = false >
				<#assign productId_productSpecif_defaultValue=''>
												<#assign productId_productSpecif_defaultValue=''>
				<#if (productId_productSpecif_defaultValue!)?string=="currentUser">
					<#assign productId_productSpecif_defaultValue='${staffJson!}'>
				<#elseif (productId_productSpecif_defaultValue!)?string=="currentPost">
					<#assign productId_productSpecif_defaultValue='${postJson!}'>
				<#elseif (productId_productSpecif_defaultValue!)?string=="currentDepart">
					<#assign productId_productSpecif_defaultValue='${deptJson!}'>
				<#elseif (productId_productSpecif_defaultValue!)?string=="currentComp">
					<#assign productId_productSpecif_defaultValue='${compJson!}'>
				</#if>
				<#assign productId_productSpecif_defaultText=''>
				<productId.productSpecif
					sort="false"  onPropertyChange="FacWareMaterial_dg1489735528750Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productSpecif_permit = checkFieldPermission('productId.productSpecif','MESBasic_1_factoryWare_FacWareMaterial','MESBasic_1_product_Product_productSpecif')>
						<#if MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productSpecif_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productSpecif_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (productId_productSpecif_defaultValue)?? &&(productId_productSpecif_defaultValue)?has_content>
							defaultValue='${(productId_productSpecif_defaultValue!)?string}'
						</#if>
						<#if (productId_productSpecif_defaultText)?? &&(productId_productSpecif_defaultText)?has_content>
							defaultText='${(productId_productSpecif_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">规格</productId.productSpecif>
				<#assign isRef = false >
				<#assign meno_defaultValue=''>
						 						<#assign meno_defaultValue=''>
				<#assign meno_defaultText=''>
				<meno
					sort="false"  onPropertyChange="FacWareMaterial_dg1489735528750Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						<#assign MESBasic_1_factoryWare_FacWareMaterial_meno_permit = checkFieldPermission('meno','MESBasic_1_factoryWare_FacWareMaterial','MESBasic_1_factoryWare_FacWareMaterial_meno')>
						<#if MESBasic_1_factoryWare_FacWareMaterial_meno_permit == 0>
						fieldPermit="0" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if MESBasic_1_factoryWare_FacWareMaterial_meno_permit == 1>
						fieldPermit="1" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
						
						<#if (meno_defaultValue)?? &&(meno_defaultValue)?has_content>
							defaultValue='${(meno_defaultValue!)?string}'
						</#if>
						<#if (meno_defaultText)?? &&(meno_defaultText)?has_content>
							defaultText='${(meno_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">备注</meno>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="FacWareMaterial_dg1489735528750Widget._DT._autoAddNewRow(nRow)" >
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
					<#if !MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productCode_permit??>
					<#assign MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productCode_permit = checkFieldPermission('productId.productCode','MESBasic_1_factoryWare_FacWareMaterial','MESBasic_1_product_Product_productCode')>
					</#if>
							<c><#if MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productCode_permit != 0><#if (row.productId.productCode)?has_content>${(row.productId.productCode)!}</#if></#if></c>
					<#if !MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productName_permit??>
					<#assign MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productName_permit = checkFieldPermission('productId.productName','MESBasic_1_factoryWare_FacWareMaterial','MESBasic_1_product_Product_productName')>
					</#if>
							<c><#if MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productName_permit != 0><#if (row.productId.productName)?has_content>${(row.productId.productName)!}</#if></#if></c>
					<#if !MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productModel_permit??>
					<#assign MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productModel_permit = checkFieldPermission('productId.productModel','MESBasic_1_factoryWare_FacWareMaterial','MESBasic_1_product_Product_productModel')>
					</#if>
							<c><#if MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productModel_permit != 0><#if (row.productId.productModel)?has_content>${(row.productId.productModel)!}</#if></#if></c>
					<#if !MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productSpecif_permit??>
					<#assign MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productSpecif_permit = checkFieldPermission('productId.productSpecif','MESBasic_1_factoryWare_FacWareMaterial','MESBasic_1_product_Product_productSpecif')>
					</#if>
							<c><#if MESBasic_1_factoryWare_FacWareMaterial_productId_MESBasic_1_product_Product_productSpecif_permit != 0><#if (row.productId.productSpecif)?has_content>${(row.productId.productSpecif)!}</#if></#if></c>
					<#if !MESBasic_1_factoryWare_FacWareMaterial_meno_permit??>
					<#assign MESBasic_1_factoryWare_FacWareMaterial_meno_permit = checkFieldPermission('meno','MESBasic_1_factoryWare_FacWareMaterial','MESBasic_1_factoryWare_FacWareMaterial_meno')>
					</#if>
							<c><#if MESBasic_1_factoryWare_FacWareMaterial_meno_permit != 0><#if (row.meno)?has_content>${(row.meno)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>