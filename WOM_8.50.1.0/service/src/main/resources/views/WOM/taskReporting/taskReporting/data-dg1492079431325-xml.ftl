<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1492079431325" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<wareId.id IsHiddenField="true"></wareId.id>
				<storeID.id IsHiddenField="true"></storeID.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign batchNum_defaultValue=''>
						 						<#assign batchNum_defaultValue=''>
				<#assign batchNum_defaultText=''>
				<batchNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="TaskReportingPart_dg1492079431325Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="200">入库批号</batchNum>
				<#assign isRef = false >
				<#assign wareId_wareName_defaultValue=''>
												<#assign wareId_wareName_defaultValue=''>
				<#if (wareId_wareName_defaultValue!)?string=="currentUser">
					<#assign wareId_wareName_defaultValue='${staffJson!}'>
				<#elseif (wareId_wareName_defaultValue!)?string=="currentPost">
					<#assign wareId_wareName_defaultValue='${postJson!}'>
				<#elseif (wareId_wareName_defaultValue!)?string=="currentDepart">
					<#assign wareId_wareName_defaultValue='${deptJson!}'>
				<#elseif (wareId_wareName_defaultValue!)?string=="currentComp">
					<#assign wareId_wareName_defaultValue='${compJson!}'>
				</#if>
				<#assign wareId_wareName_defaultText=''>
				<wareId.wareName
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(TaskReportingPart_dg1492079431325Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(TaskReportingPart_dg1492079431325Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/wareMan/ware/wareRef.action','dg1492079431325wareId.wareName','${getText("MESBasic.viewtitle.randon1484031981880")}',sPTGridID,nRow,sFieldName,TaskReportingPart_dg1492079431325Widget,null,false,false,'','MESBasic_1_wareMan_wareRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="TaskReportingPart_dg1492079431325Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (wareId_wareName_defaultValue)?? &&(wareId_wareName_defaultValue)?has_content>
							defaultValue='${(wareId_wareName_defaultValue!)?string}'
						</#if>
						<#if (wareId_wareName_defaultText)?? &&(wareId_wareName_defaultText)?has_content>
							defaultText='${(wareId_wareName_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">库存地点</wareId.wareName>
				<#assign isRef = false >
				<#assign reportNum_defaultValue=''>
						 						<#assign reportNum_defaultValue=''>
				<#assign reportNum_defaultText=''>
				<reportNum
						style="font-color:0303B3"
					sort="false"  onPropertyChange="TaskReportingPart_dg1492079431325Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="2"
						
						 dataType="float"
						
						<#if (reportNum_defaultValue)?? &&(reportNum_defaultValue)?has_content>
							defaultValue='${(reportNum_defaultValue!)?string}'
						</#if>
						<#if (reportNum_defaultText)?? &&(reportNum_defaultText)?has_content>
							defaultText='${(reportNum_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="200">数量</reportNum>
				<#assign isRef = false >
				<#assign content_defaultValue=''>
						 						<#assign content_defaultValue=''>
				<#assign content_defaultText=''>
				<content
						style="font-color:0303B3"
					sort="false"  onPropertyChange="TaskReportingPart_dg1492079431325Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						 decLength="6"
						
						 dataType="float"
						
						<#if (content_defaultValue)?? &&(content_defaultValue)?has_content>
							defaultValue='${(content_defaultValue!)?string}'
						</#if>
						<#if (content_defaultText)?? &&(content_defaultText)?has_content>
							defaultText='${(content_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="DECIMAL" 
					width="100">含量</content>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="false"  onPropertyChange="TaskReportingPart_dg1492079431325Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="200">备注</remark>
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
					sort="false"  onPropertyChange="TaskReportingPart_dg1492079431325Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="200">货位名称</storeID.placeSetName>
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
					onFocus="CUI.toggleClearBtn_DG_IE(TaskReportingPart_dg1492079431325Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(TaskReportingPart_dg1492079431325Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/storeSet/storeSet/storeRef.action','dg1492079431325storeID.placeSetCode','${getText("MESBasic.viewtitle.randon1489735291062")}',sPTGridID,nRow,sFieldName,TaskReportingPart_dg1492079431325Widget,null,false,false,'','MESBasic_1_storeSet_storeRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="TaskReportingPart_dg1492079431325Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						 IsHiddenField="true"					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="200">货位编码</storeID.placeSetCode>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="TaskReportingPart_dg1492079431325Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.wareId.id)!}</c>
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
