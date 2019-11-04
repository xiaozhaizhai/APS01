<#assign staffJson= Session.staff.toJSON()>
<#assign deptJson= Session.staff.mainPosition.department.toJSON()>
<#assign postJson= Session.staff.mainPosition.toJSON()>
<#assign compJson= Session.staff.mainPosition.company.toJSON()>
<GridData DefaultNodeExpanded="false"   dgName="dg1441882407865" pageSize="${dg1441882407865Page.pageSize}" totalCount="${dg1441882407865Page.totalCount}" totalPages="${dg1441882407865Page.totalPages}" pageNo="${dg1441882407865Page.pageNo}" hasPre="${dg1441882407865Page.hasPre?string}" hasNext="${dg1441882407865Page.hasNext?string}" prePage="${dg1441882407865Page.prePage}" nextPage="${dg1441882407865Page.nextPage}">
	<thead>
				<id IsHiddenField="true"></id>
				<version IsHiddenField="true"></version>
				<#assign isRef = false >
				<#assign name_defaultValue=''>
						 						<#assign name_defaultValue=''>
				<#assign name_defaultText=''>
				<name
					sort="false"  onPropertyChange="TimeRegionPar_dg1441882407865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign X6Basic_1_0_timeRegion_TimeRegionPar_name_permit = checkFieldPermission('name','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_name')>
						<#if X6Basic_1_0_timeRegion_TimeRegionPar_name_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if X6Basic_1_0_timeRegion_TimeRegionPar_name_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
											 control="Text" 
						
						
						
						
						<#if (name_defaultValue)?? &&(name_defaultValue)?has_content>
							defaultValue='${(name_defaultValue!)?string}'
						</#if>
						<#if (name_defaultText)?? &&(name_defaultText)?has_content>
							defaultText='${(name_defaultText!)?string}'
						</#if>
						
					align="center" 
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
					sort="false"  onPropertyChange="TimeRegionPar_dg1441882407865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    onChange="TimeRegionPar_dg1441882407865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);TimeRegionPar_dg1441882407865Widget.evalCustomFunction(nRow,sFieldName,'aa()');"
				    
						<#assign X6Basic_1_0_timeRegion_TimeRegionPar_startDate_permit = checkFieldPermission('startDate','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_startDate')>
						<#if X6Basic_1_0_timeRegion_TimeRegionPar_startDate_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if X6Basic_1_0_timeRegion_TimeRegionPar_startDate_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(TimeRegionPar_dg1441882407865Widget,'TimeRegionPar_dg1441882407865Widget',nRow,sFieldName)" 
									   onBtnClick="showCalender(TimeRegionPar_dg1441882407865Widget,'TimeRegionPar_dg1441882407865Widget',nRow,sFieldName)" 
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
					sort="false"  onPropertyChange="TimeRegionPar_dg1441882407865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign X6Basic_1_0_timeRegion_TimeRegionPar_endDate_permit = checkFieldPermission('endDate','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_endDate')>
						<#if X6Basic_1_0_timeRegion_TimeRegionPar_endDate_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if X6Basic_1_0_timeRegion_TimeRegionPar_endDate_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
									  onBlur="document.body.click()" 
									   buttonImg="Calendar" onClick="initCalender(TimeRegionPar_dg1441882407865Widget,'TimeRegionPar_dg1441882407865Widget',nRow,sFieldName)" 
									   onBtnClick="showCalender(TimeRegionPar_dg1441882407865Widget,'TimeRegionPar_dg1441882407865Widget',nRow,sFieldName)" 
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
					sort="false"  onPropertyChange="TimeRegionPar_dg1441882407865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign X6Basic_1_0_timeRegion_TimeRegionPar_year_permit = checkFieldPermission('year','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_year')>
						<#if X6Basic_1_0_timeRegion_TimeRegionPar_year_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if X6Basic_1_0_timeRegion_TimeRegionPar_year_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
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
					sort="false"  onPropertyChange="TimeRegionPar_dg1441882407865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign X6Basic_1_0_timeRegion_TimeRegionPar_quarter_permit = checkFieldPermission('quarter','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_quarter')>
						<#if X6Basic_1_0_timeRegion_TimeRegionPar_quarter_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if X6Basic_1_0_timeRegion_TimeRegionPar_quarter_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
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
					sort="false"  onPropertyChange="TimeRegionPar_dg1441882407865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign X6Basic_1_0_timeRegion_TimeRegionPar_month_permit = checkFieldPermission('month','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_month')>
						<#if X6Basic_1_0_timeRegion_TimeRegionPar_month_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if X6Basic_1_0_timeRegion_TimeRegionPar_month_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
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
					sort="false"  onPropertyChange="TimeRegionPar_dg1441882407865Widget._DT.activeEditRow(sPTGridID,nRow,sFieldName);"
				    
				    
						<#assign X6Basic_1_0_timeRegion_TimeRegionPar_week_permit = checkFieldPermission('week','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_week')>
						<#if X6Basic_1_0_timeRegion_TimeRegionPar_week_permit == 0>
						fieldPermit="0" hideButtonsOnReadOnly="true" title="${getText('ec.view.nopermittitle')}"
						</#if>
						<#if X6Basic_1_0_timeRegion_TimeRegionPar_week_permit == 1>
						fieldPermit="1" hideButtonsOnReadOnly="true" title="${getText('ec.view.readonlytitle')}"
						</#if>
						
						
						
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
		<#list dg1441882407865Page.result as row>
		<row  onClick="TimeRegionPar_dg1441882407865Widget._DT._autoAddNewRow(nRow)" >
					<c>${(row.id)!}</c>
					<c>${(row.version)!}</c>
					<#if !X6Basic_1_0_timeRegion_TimeRegionPar_name_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegionPar_name_permit = checkFieldPermission('name','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_name')>
					</#if>
							<c><#if X6Basic_1_0_timeRegion_TimeRegionPar_name_permit != 0><#if (row.name)?has_content>${(row.name)!}</#if></#if></c>
					<#if !X6Basic_1_0_timeRegion_TimeRegionPar_startDate_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegionPar_startDate_permit = checkFieldPermission('startDate','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_startDate')>
					</#if>
							<c><#if X6Basic_1_0_timeRegion_TimeRegionPar_startDate_permit != 0><#if (row.startDate)?has_content>${(row.startDate?string('yyyy-MM-dd'))!}</#if></#if></c>
					<#if !X6Basic_1_0_timeRegion_TimeRegionPar_endDate_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegionPar_endDate_permit = checkFieldPermission('endDate','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_endDate')>
					</#if>
							<c><#if X6Basic_1_0_timeRegion_TimeRegionPar_endDate_permit != 0><#if (row.endDate)?has_content>${(row.endDate?string('yyyy-MM-dd'))!}</#if></#if></c>
					<#if !X6Basic_1_0_timeRegion_TimeRegionPar_year_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegionPar_year_permit = checkFieldPermission('year','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_year')>
					</#if>
							<c><#if X6Basic_1_0_timeRegion_TimeRegionPar_year_permit != 0><#if (row.year)?has_content>${(row.year)!}</#if></#if></c>
					<#if !X6Basic_1_0_timeRegion_TimeRegionPar_quarter_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegionPar_quarter_permit = checkFieldPermission('quarter','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_quarter')>
					</#if>
							<c><#if X6Basic_1_0_timeRegion_TimeRegionPar_quarter_permit != 0><#if (row.quarter)?has_content>${(row.quarter)!}</#if></#if></c>
					<#if !X6Basic_1_0_timeRegion_TimeRegionPar_month_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegionPar_month_permit = checkFieldPermission('month','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_month')>
					</#if>
							<c><#if X6Basic_1_0_timeRegion_TimeRegionPar_month_permit != 0><#if (row.month)?has_content>${(row.month)!}</#if></#if></c>
					<#if !X6Basic_1_0_timeRegion_TimeRegionPar_week_permit??>
					<#assign X6Basic_1_0_timeRegion_TimeRegionPar_week_permit = checkFieldPermission('week','X6Basic_1.0_timeRegion_TimeRegionPar','X6Basic_1.0_timeRegion_TimeRegionPar_week')>
					</#if>
							<c><#if X6Basic_1_0_timeRegion_TimeRegionPar_week_permit != 0><#if (row.week)?has_content>${(row.week)!}</#if></#if></c>
		</row>
		</#list>
	</tbody>
	<tfoot>
	</tfoot>
</GridData>