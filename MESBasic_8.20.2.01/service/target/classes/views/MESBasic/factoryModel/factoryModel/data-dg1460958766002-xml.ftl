<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1460958766002" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<objProduct.id IsHiddenField="true"></objProduct.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign objProduct_productName_defaultValue=''>
												<#assign objProduct_productName_defaultValue=''>
				<#if (objProduct_productName_defaultValue!)?string=="currentUser">
					<#assign objProduct_productName_defaultValue='${staffJson!}'>
				<#elseif (objProduct_productName_defaultValue!)?string=="currentPost">
					<#assign objProduct_productName_defaultValue='${postJson!}'>
				<#elseif (objProduct_productName_defaultValue!)?string=="currentDepart">
					<#assign objProduct_productName_defaultValue='${deptJson!}'>
				<#elseif (objProduct_productName_defaultValue!)?string=="currentComp">
					<#assign objProduct_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign objProduct_productName_defaultText=''>
				<objProduct.productName
						style="font-color:0303B3"
							onBlur="document.body.click()"
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ObjProduct_dg1460958766002Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ObjProduct_dg1460958766002Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRef.action','dg1460958766002objProduct.productName','${getText("MESBasic.viewtitle.radion1415773613713")}',sPTGridID,nRow,sFieldName,ObjProduct_dg1460958766002Widget,null,false,false,'','MESBasic_1_product_productRef')"
								onKeyUp="MESBasic.factoryModel.factoryModel.factoryEdit.initMnemonic_DG_IE({
										'keyCode':Key,
										'oGrid':ObjProduct_dg1460958766002Widget,
										'sGridName':'ObjProduct_dg1460958766002Widget',
										'value':sParam,
										'nRow':nRow,
										'sFieldName':sFieldName,
										'Key':Key,
										'url':'/MESBasic/product/product/productRef.action',
										'displayfieldname':'productName',
										'type':'other',
										'multiple':'false',
										'mnewidth':260,
										'isCrossCompany':'false',
										'funcname':'MESBasic.factoryModel.factoryModel.factoryEdit.getcallBackInfo_DG_IE(obj)',
										'conditionfunc':'MESBasic.factoryModel.factoryModel.factoryEdit._querycustomFunc(\'dg1460958766002objProduct.productName\'.replace(/\./g, \'_\'))'
										
									})"
					sort="false"  onPropertyChange="ObjProduct_dg1460958766002Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (objProduct_productName_defaultValue)?? &&(objProduct_productName_defaultValue)?has_content>
							defaultValue='${(objProduct_productName_defaultValue!)?string}'
						</#if>
						<#if (objProduct_productName_defaultText)?? &&(objProduct_productName_defaultText)?has_content>
							defaultText='${(objProduct_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="140">物品名称</objProduct.productName>
				<#assign isRef = false >
				<#assign objProduct_productCode_defaultValue=''>
												<#assign objProduct_productCode_defaultValue=''>
				<#if (objProduct_productCode_defaultValue!)?string=="currentUser">
					<#assign objProduct_productCode_defaultValue='${staffJson!}'>
				<#elseif (objProduct_productCode_defaultValue!)?string=="currentPost">
					<#assign objProduct_productCode_defaultValue='${postJson!}'>
				<#elseif (objProduct_productCode_defaultValue!)?string=="currentDepart">
					<#assign objProduct_productCode_defaultValue='${deptJson!}'>
				<#elseif (objProduct_productCode_defaultValue!)?string=="currentComp">
					<#assign objProduct_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign objProduct_productCode_defaultText=''>
				<objProduct.productCode
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ObjProduct_dg1460958766002Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (objProduct_productCode_defaultValue)?? &&(objProduct_productCode_defaultValue)?has_content>
							defaultValue='${(objProduct_productCode_defaultValue!)?string}'
						</#if>
						<#if (objProduct_productCode_defaultText)?? &&(objProduct_productCode_defaultText)?has_content>
							defaultText='${(objProduct_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="140">物品编码</objProduct.productCode>
				<#assign isRef = false >
				<#assign objProduct_productSpecif_defaultValue=''>
												<#assign objProduct_productSpecif_defaultValue=''>
				<#if (objProduct_productSpecif_defaultValue!)?string=="currentUser">
					<#assign objProduct_productSpecif_defaultValue='${staffJson!}'>
				<#elseif (objProduct_productSpecif_defaultValue!)?string=="currentPost">
					<#assign objProduct_productSpecif_defaultValue='${postJson!}'>
				<#elseif (objProduct_productSpecif_defaultValue!)?string=="currentDepart">
					<#assign objProduct_productSpecif_defaultValue='${deptJson!}'>
				<#elseif (objProduct_productSpecif_defaultValue!)?string=="currentComp">
					<#assign objProduct_productSpecif_defaultValue='${compJson!}'>
				</#if>
				<#assign objProduct_productSpecif_defaultText=''>
				<objProduct.productSpecif
					sort="false"  onPropertyChange="ObjProduct_dg1460958766002Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (objProduct_productSpecif_defaultValue)?? &&(objProduct_productSpecif_defaultValue)?has_content>
							defaultValue='${(objProduct_productSpecif_defaultValue!)?string}'
						</#if>
						<#if (objProduct_productSpecif_defaultText)?? &&(objProduct_productSpecif_defaultText)?has_content>
							defaultText='${(objProduct_productSpecif_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">规格</objProduct.productSpecif>
				<#assign isRef = false >
				<#assign emsFlag_defaultValue=''>
						 						<#assign emsFlag_defaultValue=''>
				<#assign emsFlag_defaultText=''>
				<emsFlag
					sort="false"  onPropertyChange="ObjProduct_dg1460958766002Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									control="CheckBox" dataType="boolean"
						
						
						
						
						<#if (emsFlag_defaultValue)?? &&(emsFlag_defaultValue)?has_content>
							defaultValue='${(emsFlag_defaultValue!)?string}'
						</#if>
						<#if (emsFlag_defaultText)?? &&(emsFlag_defaultText)?has_content>
							defaultText='${(emsFlag_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="CHECKBOX" 
						type="CHECKBOX" 
					width="100">参与能耗</emsFlag>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ObjProduct_dg1460958766002Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.objProduct.id)!}</c>
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
