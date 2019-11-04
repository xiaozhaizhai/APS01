<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1502700453811" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<product.id IsHiddenField="true"></product.id>
				<inspectDept.id IsHiddenField="true"></inspectDept.id>
				<checkDept.id IsHiddenField="true"></checkDept.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign inspectName_defaultValue=''>
						 						<#assign inspectName_defaultValue=''>
				<#assign inspectName_defaultText=''>
				<inspectName
						showFormatFunc="inspect_showFormatFunc" 
					sort="false"  onPropertyChange="CheckManage_dg1502700453811Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (inspectName_defaultValue)?? &&(inspectName_defaultValue)?has_content>
							defaultValue='${(inspectName_defaultValue!)?string}'
						</#if>
						<#if (inspectName_defaultText)?? &&(inspectName_defaultText)?has_content>
							defaultText='${(inspectName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="180">请检单</inspectName>
				<#assign isRef = false >
				<#assign inspectUrl_defaultValue=''>
						 						<#assign inspectUrl_defaultValue=''>
				<#assign inspectUrl_defaultText=''>
				<inspectUrl
					sort="false"  onPropertyChange="CheckManage_dg1502700453811Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">请检单url</inspectUrl>
				<#assign isRef = false >
				<#assign chenkReportName_defaultValue=''>
						 						<#assign chenkReportName_defaultValue=''>
				<#assign chenkReportName_defaultText=''>
				<chenkReportName
						showFormatFunc="check_showFormatFunc" 
					sort="false"  onPropertyChange="CheckManage_dg1502700453811Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (chenkReportName_defaultValue)?? &&(chenkReportName_defaultValue)?has_content>
							defaultValue='${(chenkReportName_defaultValue!)?string}'
						</#if>
						<#if (chenkReportName_defaultText)?? &&(chenkReportName_defaultText)?has_content>
							defaultText='${(chenkReportName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="180">检验报告单</chenkReportName>
				<#assign isRef = false >
				<#assign chenkReportUrl_defaultValue=''>
						 						<#assign chenkReportUrl_defaultValue=''>
				<#assign chenkReportUrl_defaultText=''>
				<chenkReportUrl
					sort="false"  onPropertyChange="CheckManage_dg1502700453811Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						 IsHiddenField="true"					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">检验报告单url</chenkReportUrl>
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
					onFocus="CUI.toggleClearBtn_DG_IE(CheckManage_dg1502700453811Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(CheckManage_dg1502700453811Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/product/product/productRefNew.action','dg1502700453811product.productCode','${getText("MESBasic.viewtitle.randon1475137145215")}',sPTGridID,nRow,sFieldName,CheckManage_dg1502700453811Widget,null,false,false,'','MESBasic_1_product_productRefNew')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="CheckManage_dg1502700453811Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
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
					sort="false"  onPropertyChange="CheckManage_dg1502700453811Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
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
				<#assign isRef = false >
				<#assign batchNum_defaultValue=''>
						 						<#assign batchNum_defaultValue=''>
				<#assign batchNum_defaultText=''>
				<batchNum
					sort="false"  onPropertyChange="CheckManage_dg1502700453811Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (batchNum_defaultValue)?? &&(batchNum_defaultValue)?has_content>
							defaultValue='${(batchNum_defaultValue!)?string}'
						</#if>
						<#if (batchNum_defaultText)?? &&(batchNum_defaultText)?has_content>
							defaultText='${(batchNum_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">批号</batchNum>
				<#assign isRef = false >
				<#assign standard_defaultValue=''>
						 						<#assign standard_defaultValue=''>
				<#assign standard_defaultText=''>
				<standard
					sort="false"  onPropertyChange="CheckManage_dg1502700453811Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (standard_defaultValue)?? &&(standard_defaultValue)?has_content>
							defaultValue='${(standard_defaultValue!)?string}'
						</#if>
						<#if (standard_defaultText)?? &&(standard_defaultText)?has_content>
							defaultText='${(standard_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">质量标准</standard>
				<#assign isRef = false >
				<#assign result_defaultValue=''>
						 						<#assign result_defaultValue=''>
				<#assign result_defaultText=''>
				<result
					sort="false"  onPropertyChange="CheckManage_dg1502700453811Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (result_defaultValue)?? &&(result_defaultValue)?has_content>
							defaultValue='${(result_defaultValue!)?string}'
						</#if>
						<#if (result_defaultText)?? &&(result_defaultText)?has_content>
							defaultText='${(result_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">检验结论</result>
				<#assign isRef = false >
				<#assign inspectDept_name_defaultValue=''>
												<#assign inspectDept_name_defaultValue=''>
				<#if (inspectDept_name_defaultValue!)?string=="currentUser">
					<#assign inspectDept_name_defaultValue='${staffJson!}'>
				<#elseif (inspectDept_name_defaultValue!)?string=="currentPost">
					<#assign inspectDept_name_defaultValue='${postJson!}'>
				<#elseif (inspectDept_name_defaultValue!)?string=="currentDepart">
					<#assign inspectDept_name_defaultValue='${deptJson!}'>
				<#elseif (inspectDept_name_defaultValue!)?string=="currentComp">
					<#assign inspectDept_name_defaultValue='${compJson!}'>
				</#if>
				<#assign inspectDept_name_defaultText=''>
				<inspectDept.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(CheckManage_dg1502700453811Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(CheckManage_dg1502700453811Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self','dg1502700453811inspectDept.name','${getText("foundation.ec.entity.department.reference")}',sPTGridID,nRow,sFieldName,CheckManage_dg1502700453811Widget,null,false,false,'','sysbase_1.0_department_departmentRefCustom')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="CheckManage_dg1502700453811Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (inspectDept_name_defaultValue)?? &&(inspectDept_name_defaultValue)?has_content>
							defaultValue='${(inspectDept_name_defaultValue!)?string}'
						</#if>
						<#if (inspectDept_name_defaultText)?? &&(inspectDept_name_defaultText)?has_content>
							defaultText='${(inspectDept_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">请检部门</inspectDept.name>
				<#assign isRef = false >
				<#assign checkDept_name_defaultValue=''>
												<#assign checkDept_name_defaultValue=''>
				<#if (checkDept_name_defaultValue!)?string=="currentUser">
					<#assign checkDept_name_defaultValue='${staffJson!}'>
				<#elseif (checkDept_name_defaultValue!)?string=="currentPost">
					<#assign checkDept_name_defaultValue='${postJson!}'>
				<#elseif (checkDept_name_defaultValue!)?string=="currentDepart">
					<#assign checkDept_name_defaultValue='${deptJson!}'>
				<#elseif (checkDept_name_defaultValue!)?string=="currentComp">
					<#assign checkDept_name_defaultValue='${compJson!}'>
				</#if>
				<#assign checkDept_name_defaultText=''>
				<checkDept.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(CheckManage_dg1502700453811Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(CheckManage_dg1502700453811Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/foundation/department/common/departmentListFrameCustom.action?operateCode=attendence_1.0_gatherDeal_list_self','dg1502700453811checkDept.name','${getText("foundation.ec.entity.department.reference")}',sPTGridID,nRow,sFieldName,CheckManage_dg1502700453811Widget,null,false,false,'','sysbase_1.0_department_departmentRefCustom')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="CheckManage_dg1502700453811Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (checkDept_name_defaultValue)?? &&(checkDept_name_defaultValue)?has_content>
							defaultValue='${(checkDept_name_defaultValue!)?string}'
						</#if>
						<#if (checkDept_name_defaultText)?? &&(checkDept_name_defaultText)?has_content>
							defaultText='${(checkDept_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="80">检验部门</checkDept.name>
				<#assign isRef = false >
				<#assign inspectTime_defaultValue=''>
						 						<#assign inspectTime_defaultValue=''>
				<#assign inspectTime_defaultText=''>
					<#if (inspectTime_defaultValue)?? &&(inspectTime_defaultValue)?has_content>
							<#assign inspectTime_defaultValue  = getDefaultDateTime(inspectTime_defaultValue!)?datetime>
					</#if>
				<inspectTime
					sort="false"  onPropertyChange="CheckManage_dg1502700453811Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(CheckManage_dg1502700453811Widget,'CheckManage_dg1502700453811Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(CheckManage_dg1502700453811Widget,'CheckManage_dg1502700453811Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (inspectTime_defaultValue)?? &&(inspectTime_defaultValue)?has_content>
							defaultValue='${(inspectTime_defaultValue!)?string}'
						</#if>
						<#if (inspectTime_defaultText)?? &&(inspectTime_defaultText)?has_content>
							defaultText='${(inspectTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">请检时间</inspectTime>
				<#assign isRef = false >
				<#assign checkTime_defaultValue=''>
						 						<#assign checkTime_defaultValue=''>
				<#assign checkTime_defaultText=''>
					<#if (checkTime_defaultValue)?? &&(checkTime_defaultValue)?has_content>
							<#assign checkTime_defaultValue  = getDefaultDateTime(checkTime_defaultValue!)?datetime>
					</#if>
				<checkTime
					sort="false"  onPropertyChange="CheckManage_dg1502700453811Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(CheckManage_dg1502700453811Widget,'CheckManage_dg1502700453811Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(CheckManage_dg1502700453811Widget,'CheckManage_dg1502700453811Widget',nRow,sFieldName,'datetime')" 
						
						
						
						
						<#if (checkTime_defaultValue)?? &&(checkTime_defaultValue)?has_content>
							defaultValue='${(checkTime_defaultValue!)?string}'
						</#if>
						<#if (checkTime_defaultText)?? &&(checkTime_defaultText)?has_content>
							defaultText='${(checkTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">检验时间</checkTime>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="CheckManage_dg1502700453811Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.product.id)!}</c>
					<c>${(row.inspectDept.id)!}</c>
					<c>${(row.checkDept.id)!}</c>
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
