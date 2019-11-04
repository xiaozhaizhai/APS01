<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1540451909387" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<puprocessId.id IsHiddenField="true"></puprocessId.id>
				<headId.id IsHiddenField="true"></headId.id>
				<lineId.id IsHiddenField="true"></lineId.id>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign puprocessId_name_defaultValue=''>
												<#assign puprocessId_name_defaultValue=''>
				<#if (puprocessId_name_defaultValue!)?string=="currentUser">
					<#assign puprocessId_name_defaultValue='${staffJson!}'>
				<#elseif (puprocessId_name_defaultValue!)?string=="currentPost">
					<#assign puprocessId_name_defaultValue='${postJson!}'>
				<#elseif (puprocessId_name_defaultValue!)?string=="currentDepart">
					<#assign puprocessId_name_defaultValue='${deptJson!}'>
				<#elseif (puprocessId_name_defaultValue!)?string=="currentComp">
					<#assign puprocessId_name_defaultValue='${compJson!}'>
				</#if>
				<#assign puprocessId_name_defaultText=''>
				<puprocessId.name
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ForProcessUnit_dg1540451909387Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ForProcessUnit_dg1540451909387Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/RM/formula/formulaProcess/processLineReference.action','dg1540451909387puprocessId.name','${getText("RM.viewtitle.randon1488977430659")}',sPTGridID,nRow,sFieldName,ForProcessUnit_dg1540451909387Widget,null,false,false,'','RM_7.5.0.0_formula_processLineReference')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ForProcessUnit_dg1540451909387Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						
						
						
						<#if (puprocessId_name_defaultValue)?? &&(puprocessId_name_defaultValue)?has_content>
							defaultValue='${(puprocessId_name_defaultValue!)?string}'
						</#if>
						<#if (puprocessId_name_defaultText)?? &&(puprocessId_name_defaultText)?has_content>
							defaultText='${(puprocessId_name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="SELECTCOMP" 
						type="SELECTCOMP" 
					width="100">工序</puprocessId.name>
				<#assign isRef = false >
				<#assign processUnitIDUnitId_defaultValue=''>
				<#if (processUnitIDUnitId_defaultValue!)?string=="currentUser">
					<#assign processUnitIDUnitId_defaultValue='${staffJson!}'>
				<#elseif (processUnitIDUnitId_defaultValue!)?string=="currentPost">
					<#assign processUnitIDUnitId_defaultValue='${postJson!}'>
				<#elseif (processUnitIDUnitId_defaultValue!)?string=="currentDepart">
					<#assign processUnitIDUnitId_defaultValue='${deptJson!}'>
				<#elseif (processUnitIDUnitId_defaultValue!)?string=="currentComp">
					<#assign processUnitIDUnitId_defaultValue='${compJson!}'>
				</#if>
				<#assign processUnitIDUnitId_defaultText=''>
				<processUnitIDUnitId
						style="font-color:0303B3"
					sort="false"  onPropertyChange="ForProcessUnit_dg1540451909387Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (processUnitIDUnitId_defaultValue)?? &&(processUnitIDUnitId_defaultValue)?has_content>
							defaultValue='${(processUnitIDUnitId_defaultValue!)?string}'
						</#if>
						<#if (processUnitIDUnitId_defaultText)?? &&(processUnitIDUnitId_defaultText)?has_content>
							defaultText='${(processUnitIDUnitId_defaultText!)?string}'
						</#if>
						
					align="right" 
					showFormat="" 
						type="MULTSELECT" 
					width="200">工作单元</processUnitIDUnitId>
				<#assign isRef = false >
				<#assign pmemo_defaultValue=''>
						 						<#assign pmemo_defaultValue=''>
				<#assign pmemo_defaultText=''>
				<pmemo
					sort="false"  onPropertyChange="ForProcessUnit_dg1540451909387Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (pmemo_defaultValue)?? &&(pmemo_defaultValue)?has_content>
							defaultValue='${(pmemo_defaultValue!)?string}'
						</#if>
						<#if (pmemo_defaultText)?? &&(pmemo_defaultText)?has_content>
							defaultText='${(pmemo_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTAREA" 
					width="100">备注</pmemo>
				<#assign isRef = false >
				<#assign headId_id_defaultValue=''>
												<#assign headId_id_defaultValue=''>
				<#if (headId_id_defaultValue!)?string=="currentUser">
					<#assign headId_id_defaultValue='${staffJson!}'>
				<#elseif (headId_id_defaultValue!)?string=="currentPost">
					<#assign headId_id_defaultValue='${postJson!}'>
				<#elseif (headId_id_defaultValue!)?string=="currentDepart">
					<#assign headId_id_defaultValue='${deptJson!}'>
				<#elseif (headId_id_defaultValue!)?string=="currentComp">
					<#assign headId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign headId_id_defaultText=''>
				<headId.id
					sort="false"  onPropertyChange="ForProcessUnit_dg1540451909387Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">配方生产线表Id</headId.id>
				<#assign isRef = false >
				<#assign headTempId_defaultValue=''>
						 						<#assign headTempId_defaultValue=''>
				<#assign headTempId_defaultText=''>
				<headTempId
					sort="false"  onPropertyChange="ForProcessUnit_dg1540451909387Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						readOnly="true" hideEditOnReadOnly="true" 
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="LONG" 
					width="100">产线配方临时Id</headTempId>
				<#assign isRef = false >
				<#assign lineId_id_defaultValue=''>
												<#assign lineId_id_defaultValue=''>
				<#if (lineId_id_defaultValue!)?string=="currentUser">
					<#assign lineId_id_defaultValue='${staffJson!}'>
				<#elseif (lineId_id_defaultValue!)?string=="currentPost">
					<#assign lineId_id_defaultValue='${postJson!}'>
				<#elseif (lineId_id_defaultValue!)?string=="currentDepart">
					<#assign lineId_id_defaultValue='${deptJson!}'>
				<#elseif (lineId_id_defaultValue!)?string=="currentComp">
					<#assign lineId_id_defaultValue='${compJson!}'>
				</#if>
				<#assign lineId_id_defaultText=''>
				<lineId.id
								<#assign isRef = true >
					onFocus="CUI.toggleClearBtn_DG_IE(ForProcessUnit_dg1540451909387Widget,nRow,sFieldName)" onBtnClick="CUI.clearCellValue_DG_IE(ForProcessUnit_dg1540451909387Widget,nRow,sFieldName)"  subBtnImg="Find" onSubBtnClick="dataGridBtnImgClick('/MESBasic/factoryModel/factoryModel/factoryProductRef.action','dg1540451909387lineId.id','${getText("MESBasic.viewtitle.randon1490322427886")}',sPTGridID,nRow,sFieldName,ForProcessUnit_dg1540451909387Widget,null,false,false,'','MESBasic_1_factoryModel_factoryProductRef')"
									readOnly="true" hideEditOnReadOnly="true"
					sort="false"  onPropertyChange="ForProcessUnit_dg1540451909387Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						hideButtonsOnReadOnly="true"
						
						 IsHiddenField="true"					align="center" 
						control="NumericEdit"
					showFormat="SELECTCOMP" 
						type="LONG" 
					width="100">生产线id</lineId.id>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ForProcessUnit_dg1540451909387Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<c>${(row.puprocessId.id)!}</c>
					<c>${(row.headId.id)!}</c>
					<c>${(row.lineId.id)!}</c>
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
