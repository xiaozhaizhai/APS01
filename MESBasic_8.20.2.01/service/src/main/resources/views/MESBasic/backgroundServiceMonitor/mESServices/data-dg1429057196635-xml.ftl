<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1429057196635" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
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
				<#assign logTime_defaultValue=''>
						 						<#assign logTime_defaultValue=''>
				<#assign logTime_defaultText=''>
					<#if (logTime_defaultValue)?? &&(logTime_defaultValue)?has_content>
							<#assign logTime_defaultValue  = getDefaultDateTime(logTime_defaultValue!)?datetime>
					</#if>
				<logTime
					sort="false"  onPropertyChange="ServiceLogger_dg1429057196635Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(ServiceLogger_dg1429057196635Widget,'ServiceLogger_dg1429057196635Widget',nRow,sFieldName,'datetime')" 
									   onBtnClick="showCalender(ServiceLogger_dg1429057196635Widget,'ServiceLogger_dg1429057196635Widget',nRow,sFieldName,'datetime')" 
									  			 control="Text" 
						
						
						
						
						<#if (logTime_defaultValue)?? &&(logTime_defaultValue)?has_content>
							defaultValue='${(logTime_defaultValue!)?string}'
						</#if>
						<#if (logTime_defaultText)?? &&(logTime_defaultText)?has_content>
							defaultText='${(logTime_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD_HMS" 
							type="datetime" 
					width="150">记录时间</logTime>
				<#assign isRef = false >
				<#assign logContent_defaultValue=''>
						 						<#assign logContent_defaultValue=''>
				<#assign logContent_defaultText=''>
				<logContent
					sort="false"  onPropertyChange="ServiceLogger_dg1429057196635Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (logContent_defaultValue)?? &&(logContent_defaultValue)?has_content>
							defaultValue='${(logContent_defaultValue!)?string}'
						</#if>
						<#if (logContent_defaultText)?? &&(logContent_defaultText)?has_content>
							defaultText='${(logContent_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="300">日志内容</logContent>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="ServiceLogger_dg1429057196635Widget._DT._autoAddNewRow(nRow)" >
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
