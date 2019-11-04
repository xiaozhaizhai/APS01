<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1555312985524" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
		<#if cpObjHideKey?? && cpObjHideKey?has_content>
			<#assign cpObjHideKey = cpObjHideKey?substring(1)>
			<#list cpObjHideKey?split(',') as k>
				<${k} IsHiddenField="true"></${k}>
			</#list>
		</#if>
				<#assign isRef = false >
				<#assign logType_defaultValue=''>
						 						<#assign logType_defaultValue=''>
				<#assign logType_defaultText=''>
				<logType
					sort="false"  onPropertyChange="MaintainLog_dg1555312985524Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (logType_defaultValue)?? &&(logType_defaultValue)?has_content>
							defaultValue='${(logType_defaultValue!)?string}'
						</#if>
						<#if (logType_defaultText)?? &&(logType_defaultText)?has_content>
							defaultText='${(logType_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">日志类型</logType>
				<#assign isRef = false >
				<#assign jsonData_defaultValue=''>
						 						<#assign jsonData_defaultValue=''>
				<#assign jsonData_defaultText=''>
				<jsonData
					sort="false"  onPropertyChange="MaintainLog_dg1555312985524Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (jsonData_defaultValue)?? &&(jsonData_defaultValue)?has_content>
							defaultValue='${(jsonData_defaultValue!)?string}'
						</#if>
						<#if (jsonData_defaultText)?? &&(jsonData_defaultText)?has_content>
							defaultText='${(jsonData_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">数据</jsonData>
				<#assign isRef = false >
				<#assign operation_defaultValue=''>
						 						<#assign operation_defaultValue=''>
				<#assign operation_defaultText=''>
				<operation
					sort="false"  onPropertyChange="MaintainLog_dg1555312985524Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (operation_defaultValue)?? &&(operation_defaultValue)?has_content>
							defaultValue='${(operation_defaultValue!)?string}'
						</#if>
						<#if (operation_defaultText)?? &&(operation_defaultText)?has_content>
							defaultText='${(operation_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">操作</operation>
				<#assign isRef = false >
				<#assign maintainStaff_defaultValue=''>
						 						<#assign maintainStaff_defaultValue=''>
				<#assign maintainStaff_defaultText=''>
				<maintainStaff
					sort="false"  onPropertyChange="MaintainLog_dg1555312985524Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (maintainStaff_defaultValue)?? &&(maintainStaff_defaultValue)?has_content>
							defaultValue='${(maintainStaff_defaultValue!)?string}'
						</#if>
						<#if (maintainStaff_defaultText)?? &&(maintainStaff_defaultText)?has_content>
							defaultText='${(maintainStaff_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">维护人</maintainStaff>
				<#assign isRef = false >
				<#assign maintainDept_defaultValue=''>
						 						<#assign maintainDept_defaultValue=''>
				<#assign maintainDept_defaultText=''>
				<maintainDept
					sort="false"  onPropertyChange="MaintainLog_dg1555312985524Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (maintainDept_defaultValue)?? &&(maintainDept_defaultValue)?has_content>
							defaultValue='${(maintainDept_defaultValue!)?string}'
						</#if>
						<#if (maintainDept_defaultText)?? &&(maintainDept_defaultText)?has_content>
							defaultText='${(maintainDept_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">维护部门</maintainDept>
				<#assign isRef = false >
				<#assign maintainTime_defaultValue=''>
						 						<#assign maintainTime_defaultValue=''>
				<#assign maintainTime_defaultText=''>
					<#if (maintainTime_defaultValue)?? &&(maintainTime_defaultValue)?has_content>
							<#assign maintainTime_defaultValue  = getDefaultDateTime(maintainTime_defaultValue!)?datetime>
					</#if>
				<maintainTime
					sort="false"  onPropertyChange="MaintainLog_dg1555312985524Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(MaintainLog_dg1555312985524Widget,'MaintainLog_dg1555312985524Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(MaintainLog_dg1555312985524Widget,'MaintainLog_dg1555312985524Widget',nRow,sFieldName,'datetime')" 
									  			 control="Text" 
						
						
						
						
						<#if (maintainTime_defaultValue)?? &&(maintainTime_defaultValue)?has_content>
							defaultValue='${(maintainTime_defaultValue!)?string}'
						</#if>
						<#if (maintainTime_defaultText)?? &&(maintainTime_defaultText)?has_content>
							defaultText='${(maintainTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="142">创建时间</maintainTime>
				<#assign isRef = false >
				<#assign remark_defaultValue=''>
						 						<#assign remark_defaultValue=''>
				<#assign remark_defaultText=''>
				<remark
					sort="false"  onPropertyChange="MaintainLog_dg1555312985524Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
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
					width="100">备注</remark>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="MaintainLog_dg1555312985524Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
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
