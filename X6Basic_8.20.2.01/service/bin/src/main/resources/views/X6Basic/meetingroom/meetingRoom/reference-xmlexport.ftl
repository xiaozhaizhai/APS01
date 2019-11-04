<#assign exportFields = page.exportFields />
<#assign result = page.result />
<#assign exportFieldList = exportFields?split(',')>
<#assign xmlState = xmlState>

<#if xmlState=='START'>
	<?xml version="1.0"?>
	<?mso-application progid="Excel.Sheet"?>
	<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40">
	<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
		<Created>1899-12-30T00:00:00</Created>
	</DocumentProperties>
	<ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
		<WindowWidth>18800</WindowWidth>
 		<WindowHeight>10540</WindowHeight>
 		<ProtectStructure>False</ProtectStructure>
 		<ProtectWindows>False</ProtectWindows>
	</ExcelWorkbook>
	<Styles>
 		<Style ss:ID="Default" ss:Name="Normal">
  			<Alignment/>
  			<Borders/>
  			<Font ss:FontName="Arial" x:CharSet="134" ss:Size="12"/>
  			<Interior/>
 			<NumberFormat/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s4" ss:Name="千位分隔">
  			<NumberFormat ss:Format="_ * #,##0.00_ ;_ * -#,##0.00_ ;_ * &quot;-&quot;??_ ;_ @_ "/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s5" ss:Name="货币">
  			<NumberFormat ss:Format="_ &quot;￥&quot;* #,##0.00_ ;_ &quot;￥&quot;* -#,##0.00_ ;_ &quot;￥&quot;* &quot;-&quot;??_ ;_ @_ "/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s2" ss:Name="百分比">
  			<NumberFormat ss:Format="0%"/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s1" ss:Name="千位分隔[0]">
  			<NumberFormat ss:Format="_ * #,##0_ ;_ * -#,##0_ ;_ * &quot;-&quot;_ ;_ @_ "/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s3" ss:Name="货币[0]">
  			<NumberFormat ss:Format="_ &quot;￥&quot;* #,##0_ ;_ &quot;￥&quot;* -#,##0_ ;_ &quot;￥&quot;* &quot;-&quot;_ ;_ @_ "/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s6"/>
 		<Style ss:ID="s7">
  			<NumberFormat ss:Format="yyyy-m-d;-;-;@"/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s8">
  			<NumberFormat ss:Format="yyyy-m-d\ H:mm;-;-;@"/>
  			<Protection/>
  		</Style>
 	</Styles>
	<Worksheet ss:Name="${sheetName!}">
		<Table ss:ExpandedColumnCount="256" ss:ExpandedRowCount="3" x:FullColumns="1" x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="16.5">
 			<Row ss:AutoFitHeight="0">
 				<#if !exportFields?contains(',*,')>
					<#list exportFieldList as item>
						<#if item?length gt 0>
 			
								<#if item == 'name' || item == '*'>
										<Cell><Data ss:Type="String">${getText('名称')}</Data></Cell>
								</#if>
								<#if item == 'roomSize.value' || item == '*'>
										<Cell><Data ss:Type="String">${getText('会议室规模')}</Data></Cell>
								</#if>
								<#if item == 'hasNetWork' || item == '*'>
										<Cell><Data ss:Type="String">${getText('网络情况')}</Data></Cell>
								</#if>
								<#if item == 'hasWhiteBoard' || item == '*'>
										<Cell><Data ss:Type="String">${getText('是否有白板')}</Data></Cell>
								</#if>
								<#if item == 'hasMike' || item == '*'>
										<Cell><Data ss:Type="String">${getText('是否有音箱设备')}</Data></Cell>
								</#if>
								<#if item == 'hasCinema' || item == '*'>
										<Cell><Data ss:Type="String">${getText('是否有投影仪')}</Data></Cell>
								</#if>
 			
							
						</#if>
					</#list>
				</#if>
			</Row>
			<!-- -->
				<#elseif xmlState == 'BODY'>
			<#list result as data>
			<Row ss:AutoFitHeight="0">
				<#list exportFieldList as item>
					<#if item?length gt 0>
			
								<#if item == 'name' || item == '*'>
									<Cell>
									<#if checkFieldPermission('name','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_name') != 0>
										<#if data.name??><Data ss:Type="String">${(data.name)!}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'roomSize.value' || item == '*'>
									<Cell>
									<#if checkFieldPermission('roomSize','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_roomSize') != 0>
										<Data ss:Type="String">${(data.roomSize.value)!}</Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'hasNetWork' || item == '*'>
									<Cell>
									<#if checkFieldPermission('hasNetWork','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_hasNetWork') != 0>
										<Data ss:Type="String"><#if data.hasNetWork?? && data.hasNetWork>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'hasWhiteBoard' || item == '*'>
									<Cell>
									<#if checkFieldPermission('hasWhiteBoard','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_hasWhiteBoard') != 0>
										<Data ss:Type="String"><#if data.hasWhiteBoard?? && data.hasWhiteBoard>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'hasMike' || item == '*'>
									<Cell>
									<#if checkFieldPermission('hasMike','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_hasMike') != 0>
										<Data ss:Type="String"><#if data.hasMike?? && data.hasMike>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'hasCinema' || item == '*'>
									<Cell>
									<#if checkFieldPermission('hasCinema','X6Basic_1.0_meetingroom_MeetingRoom','X6Basic_1.0_meetingroom_MeetingRoom_hasCinema') != 0>
										<Data ss:Type="String"><#if data.hasCinema?? && data.hasCinema>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									</#if>
									</Cell>
								</#if>
			
					</#if>
				</#list>
			</Row>
			</#list>
				<#elseif xmlState == 'END'>
		</Table>
		<WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
  			<PageSetup>
				<Header x:Margin="0.511805555555556"/>
				<Footer x:Margin="0.511805555555556"/>
			</PageSetup>
			<Print>
				<HorizontalResolution>1200</HorizontalResolution>
				<VerticalResolution>1200</VerticalResolution>
			</Print>
				<Selected/>
				<PageBreakZoom>100</PageBreakZoom>
			<Panes>
				<Pane>
					<Number>3</Number>
					<ActiveRow>0</ActiveRow>
					<ActiveCol>2</ActiveCol>
					<RangeSelection>R1C3</RangeSelection>
				</Pane>
			</Panes>
			<ProtectObjects>False</ProtectObjects>
			<ProtectScenarios>False</ProtectScenarios>
		</WorksheetOptions>
		
	</Worksheet>
	</Workbook>
</#if>


<#macro workerdate datetime>
	<#assign totalday = 1>
	<#assign date = datetime?split(' ')>
	<#assign dates = date[0]?split('-')>
	<#list 1900..(dates[0]?number-1) as year>
		<#if (year%4==0&&year%100!=0) || (year%100==0&&year%400==0)>
			<#assign totalday = totalday + 366>
		<#else>
			<#assign totalday = totalday + 365>
		</#if>
	</#list>
	<#if dates[1]?number != 1>
	<#list 1..(dates[1]?number-1) as month>
		<#assign year = dates[0]?number>
		<#if month == 2>
				<#if (year%4==0&&year%100!=0) || (year%100==0&&year%400==0)>
					<#assign totalday = totalday + 29>
				<#else>
					<#assign totalday = totalday + 28>
				</#if>
		<#elseif "1,3,5,7,8,10,12"?contains('${month}') >
			<#assign totalday = totalday + 31>
		<#else>
			<#assign totalday = totalday + 30>
		</#if>
	</#list>
	</#if>
	<#assign totalday = totalday + dates[2]?number>
	<#assign totaltime = 0>
	<#if (date?size>1)>
		<#setting number_format="0.############">
		<#assign times = date[1]?split(':')>
		<#assign totaltime = ((times[0]?number*60) + times[1]?number)/1440>
	</#if>${totalday + totaltime}</#macro>
						
								
								
								
