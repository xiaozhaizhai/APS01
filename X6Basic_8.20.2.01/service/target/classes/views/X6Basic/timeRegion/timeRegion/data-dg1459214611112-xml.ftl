<#assign cpObjHideKey = '' >
<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1459214611112" pageSize="${dgPage.pageSize}" totalCount="${dgPage.totalCount}" totalPages="${dgPage.totalPages}" pageNo="${dgPage.pageNo}" hasPre="${dgPage.hasPre?string}" hasNext="${dgPage.hasNext?string}" prePage="${dgPage.prePage}" nextPage="${dgPage.nextPage}">
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
				<#assign name_defaultValue=''>
						 						<#assign name_defaultValue=''>
				<#assign name_defaultText=''>
				<name
					sort="false"  onPropertyChange="TimeRegionPar_dg1459214611112Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
											 control="Text" 
						
						
						
						
						<#if (name_defaultValue)?? &&(name_defaultValue)?has_content>
							defaultValue='${(name_defaultValue!)?string}'
						</#if>
						<#if (name_defaultText)?? &&(name_defaultText)?has_content>
							defaultText='${(name_defaultText!)?string}'
						</#if>
						
					align="left" 
					showFormat="TEXT" 
						type="TEXTFIELD" 
					width="100">区间名称</name>
				<#assign isRef = false >
				<#assign startDate_defaultValue=''>
						 						<#assign startDate_defaultValue=''>
				<#assign startDate_defaultText=''>
					<#if (startDate_defaultValue)?? &&(startDate_defaultValue)?has_content>
							<#assign startDate_defaultValue  = getDefaultDateTime(startDate_defaultValue!)?date>
					</#if>
				<startDate
					sort="false"  onPropertyChange="TimeRegionPar_dg1459214611112Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(TimeRegionPar_dg1459214611112Widget,'TimeRegionPar_dg1459214611112Widget',nRow,sFieldName)" 
									   onBtnClick="showCalender(TimeRegionPar_dg1459214611112Widget,'TimeRegionPar_dg1459214611112Widget',nRow,sFieldName)" 
									  			 control="Text" 
						
						
						
						
						<#if (startDate_defaultValue)?? &&(startDate_defaultValue)?has_content>
							defaultValue='${(startDate_defaultValue!)?string}'
						</#if>
						<#if (startDate_defaultText)?? &&(startDate_defaultText)?has_content>
							defaultText='${(startDate_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD" 
							type="date" 
					width="100">开始时间</startDate>
				<#assign isRef = false >
				<#assign endDate_defaultValue=''>
						 						<#assign endDate_defaultValue=''>
				<#assign endDate_defaultText=''>
					<#if (endDate_defaultValue)?? &&(endDate_defaultValue)?has_content>
							<#assign endDate_defaultValue  = getDefaultDateTime(endDate_defaultValue!)?date>
					</#if>
				<endDate
					sort="false"  onPropertyChange="TimeRegionPar_dg1459214611112Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(TimeRegionPar_dg1459214611112Widget,'TimeRegionPar_dg1459214611112Widget',nRow,sFieldName)" 
									   onBtnClick="showCalender(TimeRegionPar_dg1459214611112Widget,'TimeRegionPar_dg1459214611112Widget',nRow,sFieldName)" 
									  			 control="Text" 
						
						
						
						
						<#if (endDate_defaultValue)?? &&(endDate_defaultValue)?has_content>
							defaultValue='${(endDate_defaultValue!)?string}'
						</#if>
						<#if (endDate_defaultText)?? &&(endDate_defaultText)?has_content>
							defaultText='${(endDate_defaultText!)?string}'
						</#if>
						
					align="center" 
					showFormat="YMD" 
							type="date" 
					width="100">结束时间</endDate>
				<#assign isRef = false >
				<#assign year_defaultValue=''>
						 						<#assign year_defaultValue=''>
				<#assign year_defaultText=''>
				<year
					sort="false"  onPropertyChange="TimeRegionPar_dg1459214611112Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						
						
						 dataType="float" decLength="0"
						<#if (year_defaultValue)?? &&(year_defaultValue)?has_content>
							defaultValue='${(year_defaultValue!)?string}'
						</#if>
						<#if (year_defaultText)?? &&(year_defaultText)?has_content>
							defaultText='${(year_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">年</year>
				<#assign isRef = false >
				<#assign quarter_defaultValue=''>
						 						<#assign quarter_defaultValue=''>
				<#assign quarter_defaultText=''>
				<quarter
					sort="false"  onPropertyChange="TimeRegionPar_dg1459214611112Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						
						
						 dataType="float" decLength="0"
						<#if (quarter_defaultValue)?? &&(quarter_defaultValue)?has_content>
							defaultValue='${(quarter_defaultValue!)?string}'
						</#if>
						<#if (quarter_defaultText)?? &&(quarter_defaultText)?has_content>
							defaultText='${(quarter_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">季度</quarter>
				<#assign isRef = false >
				<#assign month_defaultValue=''>
						 						<#assign month_defaultValue=''>
				<#assign month_defaultText=''>
				<month
					sort="false"  onPropertyChange="TimeRegionPar_dg1459214611112Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						
						
						 dataType="float" decLength="0"
						<#if (month_defaultValue)?? &&(month_defaultValue)?has_content>
							defaultValue='${(month_defaultValue!)?string}'
						</#if>
						<#if (month_defaultText)?? &&(month_defaultText)?has_content>
							defaultText='${(month_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">月</month>
				<#assign isRef = false >
				<#assign week_defaultValue=''>
						 						<#assign week_defaultValue=''>
				<#assign week_defaultText=''>
				<week
					sort="false"  onPropertyChange="TimeRegionPar_dg1459214611112Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						
						
						
						 dataType="float" decLength="0"
						<#if (week_defaultValue)?? &&(week_defaultValue)?has_content>
							defaultValue='${(week_defaultValue!)?string}'
						</#if>
						<#if (week_defaultText)?? &&(week_defaultText)?has_content>
							defaultText='${(week_defaultText!)?string}'
						</#if>
						
					align="right" 
						control="NumericEdit"
					showFormat="TEXT" 
						type="INTEGER" 
					width="100">周</week>
	</thead>
	<tbody>
		<#list dgPage.result as row>
		<row  onClick="TimeRegionPar_dg1459214611112Widget._DT._autoAddNewRow(nRow)" >
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
