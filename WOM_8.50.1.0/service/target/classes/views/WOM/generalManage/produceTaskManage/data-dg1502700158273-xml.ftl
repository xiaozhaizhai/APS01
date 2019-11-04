<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1502700158273" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<putInMetarialPart.id IsHiddenField="true"></putInMetarialPart.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign putInMetarialPart_headId_tableNo_defaultValue=''>
												<#assign putInMetarialPart_headId_tableNo_defaultValue=''>
				<#if (putInMetarialPart_headId_tableNo_defaultValue!)?string=="currentUser">
					<#assign putInMetarialPart_headId_tableNo_defaultValue='${staffJson!}'>
				<#elseif (putInMetarialPart_headId_tableNo_defaultValue!)?string=="currentPost">
					<#assign putInMetarialPart_headId_tableNo_defaultValue='${postJson!}'>
				<#elseif (putInMetarialPart_headId_tableNo_defaultValue!)?string=="currentDepart">
					<#assign putInMetarialPart_headId_tableNo_defaultValue='${deptJson!}'>
				<#elseif (putInMetarialPart_headId_tableNo_defaultValue!)?string=="currentComp">
					<#assign putInMetarialPart_headId_tableNo_defaultValue='${compJson!}'>
				</#if>
				<#assign putInMetarialPart_headId_tableNo_defaultText=''>
				<putInMetarialPart.headId.tableNo
						showFormatFunc="putIn_showFormatFunc" 
					sort="false"  onPropertyChange="PutInManage_dg1502700158273Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (putInMetarialPart_headId_tableNo_defaultValue)?? &&(putInMetarialPart_headId_tableNo_defaultValue)?has_content>
							defaultValue='${(putInMetarialPart_headId_tableNo_defaultValue!)?string}'
						</#if>
						<#if (putInMetarialPart_headId_tableNo_defaultText)?? &&(putInMetarialPart_headId_tableNo_defaultText)?has_content>
							defaultText='${(putInMetarialPart_headId_tableNo_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="180">投料单</putInMetarialPart.headId.tableNo>
				<#assign isRef = false >
				<#assign putInUrl_defaultValue=''>
						 						<#assign putInUrl_defaultValue=''>
				<#assign putInUrl_defaultText=''>
				<putInUrl
					sort="false"  onPropertyChange="PutInManage_dg1502700158273Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						 IsHiddenField="true"					align="center" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">投料单Url</putInUrl>
				<#assign isRef = false >
				<#assign putInMetarialPart_productId_productCode_defaultValue=''>
												<#assign putInMetarialPart_productId_productCode_defaultValue=''>
				<#if (putInMetarialPart_productId_productCode_defaultValue!)?string=="currentUser">
					<#assign putInMetarialPart_productId_productCode_defaultValue='${staffJson!}'>
				<#elseif (putInMetarialPart_productId_productCode_defaultValue!)?string=="currentPost">
					<#assign putInMetarialPart_productId_productCode_defaultValue='${postJson!}'>
				<#elseif (putInMetarialPart_productId_productCode_defaultValue!)?string=="currentDepart">
					<#assign putInMetarialPart_productId_productCode_defaultValue='${deptJson!}'>
				<#elseif (putInMetarialPart_productId_productCode_defaultValue!)?string=="currentComp">
					<#assign putInMetarialPart_productId_productCode_defaultValue='${compJson!}'>
				</#if>
				<#assign putInMetarialPart_productId_productCode_defaultText=''>
				<putInMetarialPart.productId.productCode
					sort="false"  onPropertyChange="PutInManage_dg1502700158273Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (putInMetarialPart_productId_productCode_defaultValue)?? &&(putInMetarialPart_productId_productCode_defaultValue)?has_content>
							defaultValue='${(putInMetarialPart_productId_productCode_defaultValue!)?string}'
						</#if>
						<#if (putInMetarialPart_productId_productCode_defaultText)?? &&(putInMetarialPart_productId_productCode_defaultText)?has_content>
							defaultText='${(putInMetarialPart_productId_productCode_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物料编码</putInMetarialPart.productId.productCode>
				<#assign isRef = false >
				<#assign putInMetarialPart_productId_productName_defaultValue=''>
												<#assign putInMetarialPart_productId_productName_defaultValue=''>
				<#if (putInMetarialPart_productId_productName_defaultValue!)?string=="currentUser">
					<#assign putInMetarialPart_productId_productName_defaultValue='${staffJson!}'>
				<#elseif (putInMetarialPart_productId_productName_defaultValue!)?string=="currentPost">
					<#assign putInMetarialPart_productId_productName_defaultValue='${postJson!}'>
				<#elseif (putInMetarialPart_productId_productName_defaultValue!)?string=="currentDepart">
					<#assign putInMetarialPart_productId_productName_defaultValue='${deptJson!}'>
				<#elseif (putInMetarialPart_productId_productName_defaultValue!)?string=="currentComp">
					<#assign putInMetarialPart_productId_productName_defaultValue='${compJson!}'>
				</#if>
				<#assign putInMetarialPart_productId_productName_defaultText=''>
				<putInMetarialPart.productId.productName
					sort="false"  onPropertyChange="PutInManage_dg1502700158273Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (putInMetarialPart_productId_productName_defaultValue)?? &&(putInMetarialPart_productId_productName_defaultValue)?has_content>
							defaultValue='${(putInMetarialPart_productId_productName_defaultValue!)?string}'
						</#if>
						<#if (putInMetarialPart_productId_productName_defaultText)?? &&(putInMetarialPart_productId_productName_defaultText)?has_content>
							defaultText='${(putInMetarialPart_productId_productName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">物料名称</putInMetarialPart.productId.productName>
				<#assign isRef = false >
				<#assign putInMetarialPart_batchNum_defaultValue=''>
												<#assign putInMetarialPart_batchNum_defaultValue=''>
				<#if (putInMetarialPart_batchNum_defaultValue!)?string=="currentUser">
					<#assign putInMetarialPart_batchNum_defaultValue='${staffJson!}'>
				<#elseif (putInMetarialPart_batchNum_defaultValue!)?string=="currentPost">
					<#assign putInMetarialPart_batchNum_defaultValue='${postJson!}'>
				<#elseif (putInMetarialPart_batchNum_defaultValue!)?string=="currentDepart">
					<#assign putInMetarialPart_batchNum_defaultValue='${deptJson!}'>
				<#elseif (putInMetarialPart_batchNum_defaultValue!)?string=="currentComp">
					<#assign putInMetarialPart_batchNum_defaultValue='${compJson!}'>
				</#if>
				<#assign putInMetarialPart_batchNum_defaultText=''>
				<putInMetarialPart.batchNum
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(PutInManage_dg1502700158273Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(PutInManage_dg1502700158273Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/WOM/putInMaterial/putInMaterialPart/putinRef.action','dg1502700158273putInMetarialPart.batchNum','${getText("WOM.viewtitle.randon1494828456715")}',sPTGridID,nRow,sFieldName,PutInManage_dg1502700158273Widget,null,false,false,'','WOM_7.5.0.0_putInMaterial_putinRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="PutInManage_dg1502700158273Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (putInMetarialPart_batchNum_defaultValue)?? &&(putInMetarialPart_batchNum_defaultValue)?has_content>
							defaultValue='${(putInMetarialPart_batchNum_defaultValue!)?string}'
						</#if>
						<#if (putInMetarialPart_batchNum_defaultText)?? &&(putInMetarialPart_batchNum_defaultText)?has_content>
							defaultText='${(putInMetarialPart_batchNum_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="120">物料批号</putInMetarialPart.batchNum>
				<#assign isRef = false >
				<#assign putInMetarialPart_putinStaff_name_defaultValue=''>
												<#assign putInMetarialPart_putinStaff_name_defaultValue=''>
				<#if (putInMetarialPart_putinStaff_name_defaultValue!)?string=="currentUser">
					<#assign putInMetarialPart_putinStaff_name_defaultValue='${staffJson!}'>
				<#elseif (putInMetarialPart_putinStaff_name_defaultValue!)?string=="currentPost">
					<#assign putInMetarialPart_putinStaff_name_defaultValue='${postJson!}'>
				<#elseif (putInMetarialPart_putinStaff_name_defaultValue!)?string=="currentDepart">
					<#assign putInMetarialPart_putinStaff_name_defaultValue='${deptJson!}'>
				<#elseif (putInMetarialPart_putinStaff_name_defaultValue!)?string=="currentComp">
					<#assign putInMetarialPart_putinStaff_name_defaultValue='${compJson!}'>
				</#if>
				<#assign putInMetarialPart_putinStaff_name_defaultText=''>
				<putInMetarialPart.putinStaff.name
					sort="false"  onPropertyChange="PutInManage_dg1502700158273Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (putInMetarialPart_putinStaff_name_defaultValue)?? &&(putInMetarialPart_putinStaff_name_defaultValue)?has_content>
							defaultValue='${(putInMetarialPart_putinStaff_name_defaultValue!)?string}'
						</#if>
						<#if (putInMetarialPart_putinStaff_name_defaultText)?? &&(putInMetarialPart_putinStaff_name_defaultText)?has_content>
							defaultText='${(putInMetarialPart_putinStaff_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="80">投料人</putInMetarialPart.putinStaff.name>
				<#assign isRef = false >
				<#assign putInMetarialPart_useNum_defaultValue=''>
												<#assign putInMetarialPart_useNum_defaultValue=''>
				<#if (putInMetarialPart_useNum_defaultValue!)?string=="currentUser">
					<#assign putInMetarialPart_useNum_defaultValue='${staffJson!}'>
				<#elseif (putInMetarialPart_useNum_defaultValue!)?string=="currentPost">
					<#assign putInMetarialPart_useNum_defaultValue='${postJson!}'>
				<#elseif (putInMetarialPart_useNum_defaultValue!)?string=="currentDepart">
					<#assign putInMetarialPart_useNum_defaultValue='${deptJson!}'>
				<#elseif (putInMetarialPart_useNum_defaultValue!)?string=="currentComp">
					<#assign putInMetarialPart_useNum_defaultValue='${compJson!}'>
				</#if>
				<#assign putInMetarialPart_useNum_defaultText=''>
				<putInMetarialPart.useNum
					sort="false"  onPropertyChange="PutInManage_dg1502700158273Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="2"
						
						 dataType="float"
						
						<#if (putInMetarialPart_useNum_defaultValue)?? &&(putInMetarialPart_useNum_defaultValue)?has_content>
							defaultValue='${(putInMetarialPart_useNum_defaultValue!)?string}'
						</#if>
						<#if (putInMetarialPart_useNum_defaultText)?? &&(putInMetarialPart_useNum_defaultText)?has_content>
							defaultText='${(putInMetarialPart_useNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="80">投料数量</putInMetarialPart.useNum>
				<#assign isRef = false >
				<#assign putInMetarialPart_lossNum_defaultValue=''>
												<#assign putInMetarialPart_lossNum_defaultValue=''>
				<#if (putInMetarialPart_lossNum_defaultValue!)?string=="currentUser">
					<#assign putInMetarialPart_lossNum_defaultValue='${staffJson!}'>
				<#elseif (putInMetarialPart_lossNum_defaultValue!)?string=="currentPost">
					<#assign putInMetarialPart_lossNum_defaultValue='${postJson!}'>
				<#elseif (putInMetarialPart_lossNum_defaultValue!)?string=="currentDepart">
					<#assign putInMetarialPart_lossNum_defaultValue='${deptJson!}'>
				<#elseif (putInMetarialPart_lossNum_defaultValue!)?string=="currentComp">
					<#assign putInMetarialPart_lossNum_defaultValue='${compJson!}'>
				</#if>
				<#assign putInMetarialPart_lossNum_defaultText=''>
				<putInMetarialPart.lossNum
					sort="false"  onPropertyChange="PutInManage_dg1502700158273Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						 decLength="2"
						
						 dataType="float"
						
						<#if (putInMetarialPart_lossNum_defaultValue)?? &&(putInMetarialPart_lossNum_defaultValue)?has_content>
							defaultValue='${(putInMetarialPart_lossNum_defaultValue!)?string}'
						</#if>
						<#if (putInMetarialPart_lossNum_defaultText)?? &&(putInMetarialPart_lossNum_defaultText)?has_content>
							defaultText='${(putInMetarialPart_lossNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="80">损耗数量</putInMetarialPart.lossNum>
				<#assign isRef = false >
				<#assign putInMetarialPart_putinDate_defaultValue=''>
												<#assign putInMetarialPart_putinDate_defaultValue=''>
				<#if (putInMetarialPart_putinDate_defaultValue!)?string=="currentUser">
					<#assign putInMetarialPart_putinDate_defaultValue='${staffJson!}'>
				<#elseif (putInMetarialPart_putinDate_defaultValue!)?string=="currentPost">
					<#assign putInMetarialPart_putinDate_defaultValue='${postJson!}'>
				<#elseif (putInMetarialPart_putinDate_defaultValue!)?string=="currentDepart">
					<#assign putInMetarialPart_putinDate_defaultValue='${deptJson!}'>
				<#elseif (putInMetarialPart_putinDate_defaultValue!)?string=="currentComp">
					<#assign putInMetarialPart_putinDate_defaultValue='${compJson!}'>
				</#if>
				<#assign putInMetarialPart_putinDate_defaultText=''>
					<#if (putInMetarialPart_putinDate_defaultValue)?? &&(putInMetarialPart_putinDate_defaultValue)?has_content>
							<#assign putInMetarialPart_putinDate_defaultValue  = getDefaultDateTime(putInMetarialPart_putinDate_defaultValue!)?datetime>
					</#if>
				<putInMetarialPart.putinDate
					sort="false"  onPropertyChange="PutInManage_dg1502700158273Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (putInMetarialPart_putinDate_defaultValue)?? &&(putInMetarialPart_putinDate_defaultValue)?has_content>
							defaultValue='${(putInMetarialPart_putinDate_defaultValue!)?string}'
						</#if>
						<#if (putInMetarialPart_putinDate_defaultText)?? &&(putInMetarialPart_putinDate_defaultText)?has_content>
							defaultText='${(putInMetarialPart_putinDate_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">投料时间</putInMetarialPart.putinDate>
				<#assign isRef = false >
				<#assign putInMetarialPart_remark_defaultValue=''>
												<#assign putInMetarialPart_remark_defaultValue=''>
				<#if (putInMetarialPart_remark_defaultValue!)?string=="currentUser">
					<#assign putInMetarialPart_remark_defaultValue='${staffJson!}'>
				<#elseif (putInMetarialPart_remark_defaultValue!)?string=="currentPost">
					<#assign putInMetarialPart_remark_defaultValue='${postJson!}'>
				<#elseif (putInMetarialPart_remark_defaultValue!)?string=="currentDepart">
					<#assign putInMetarialPart_remark_defaultValue='${deptJson!}'>
				<#elseif (putInMetarialPart_remark_defaultValue!)?string=="currentComp">
					<#assign putInMetarialPart_remark_defaultValue='${compJson!}'>
				</#if>
				<#assign putInMetarialPart_remark_defaultText=''>
				<putInMetarialPart.remark
					sort="false"  onPropertyChange="PutInManage_dg1502700158273Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (putInMetarialPart_remark_defaultValue)?? &&(putInMetarialPart_remark_defaultValue)?has_content>
							defaultValue='${(putInMetarialPart_remark_defaultValue!)?string}'
						</#if>
						<#if (putInMetarialPart_remark_defaultText)?? &&(putInMetarialPart_remark_defaultText)?has_content>
							defaultText='${(putInMetarialPart_remark_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="200">备注</putInMetarialPart.remark>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="PutInManage_dg1502700158273Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.putInMetarialPart.id)!}</c>
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
