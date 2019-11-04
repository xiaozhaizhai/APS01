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
 		<Style ss:ID="s4">
  			<NumberFormat ss:Format="_ * #,##0.00_ ;_ * -#,##0.00_ ;_ * &quot;-&quot;??_ ;_ @_ "/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s5">
  			<NumberFormat ss:Format="_ &quot;￥&quot;* #,##0.00_ ;_ &quot;￥&quot;* -#,##0.00_ ;_ &quot;￥&quot;* &quot;-&quot;??_ ;_ @_ "/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s2">
  			<NumberFormat ss:Format="0%"/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s1">
  			<NumberFormat ss:Format="_ * #,##0_ ;_ * -#,##0_ ;_ * &quot;-&quot;_ ;_ @_ "/>
  			<Protection/>
  		</Style>
 		<Style ss:ID="s3">
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
  		<Style ss:ID="active">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="code">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="createTime">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="crtValue">
  			<NumberFormat ss:Format="0.0000"/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="name">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="tag">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="tagType">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="tattribute">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="updateTime">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
  		<Style ss:ID="virtualTag">
  			<NumberFormat/>
  			<Protection/>
  		</Style>
 	</Styles>
	<Worksheet ss:Name="${sheetName!}">
		<Table ss:ExpandedColumnCount="256" x:FullColumns="1" x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="16.5">
 				<#assign count = 1>
 				<#if !exportFields?contains(',*,')>
					<#list exportFieldList as item>
						<#if item?length gt 0 && item != "checkbox">
									<#if item == 'createTime' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'code' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'name' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'tag' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'tagType.value' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'tattribute.value' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item?split('.')[0]}"/>
									</#if>
									<#if item == 'active' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'crtValue' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'updateTime' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
									<#if item == 'virtualTag' || item == '*'>
												<Column ss:Index="${count}" ss:StyleID="${item}"/>
									</#if>
 						<#assign count = count + 1>
						</#if>
					</#list>
				</#if>
 			
 			
 			
 			<Row ss:AutoFitHeight="0">
 				<#if !exportFields?contains(',*,')>
					<#list exportFieldList as item>
						<#if item?length gt 0>
 			
								<#if item == 'createTime' || item == '*'>
										<Cell><Data ss:Type="String">${getText('ec.common.createTime')}</Data></Cell>
								</#if>
								<#if item == 'code' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1414982530204')}</Data></Cell>
								</#if>
								<#if item == 'name' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1414982612133')}</Data></Cell>
								</#if>
								<#if item == 'tag' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1414982298834')}</Data></Cell>
								</#if>
								<#if item == 'tagType.value' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1414983335664')}</Data></Cell>
								</#if>
								<#if item == 'tattribute.value' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1414983155412')}</Data></Cell>
								</#if>
								<#if item == 'active' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1414984279070')}</Data></Cell>
								</#if>
								<#if item == 'crtValue' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1414983438506')}</Data></Cell>
								</#if>
								<#if item == 'updateTime' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1414983576366')}</Data></Cell>
								</#if>
								<#if item == 'virtualTag' || item == '*'>
										<Cell><Data ss:Type="String">${getText('MESBasic.propertydisplayName.radion1414984111107')}</Data></Cell>
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
			
								<#if item == 'createTime' || item == '*'>
									<Cell ss:StyleID="s8">
									<#if checkFieldPermission('createTime','MESBasic_1_tagProperty_TagProperty','MESBasic_1_tagProperty_TagProperty_createTime') != 0>
										<#if data.createTime??><Data ss:Type="DateTime">${(data.createTime)!?string("yyyy-MM-dd'T'HH:mm:ss.SSS")}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'code' || item == '*'>
									<Cell>
									<#if checkFieldPermission('code','MESBasic_1_tagProperty_TagProperty','MESBasic_1_tagProperty_TagProperty_code') != 0>
										<#if data.code??><Data ss:Type="String">${(data.code)!}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'name' || item == '*'>
									<Cell>
									<#if checkFieldPermission('name','MESBasic_1_tagProperty_TagProperty','MESBasic_1_tagProperty_TagProperty_name') != 0>
										<#if data.name??><Data ss:Type="String">${(data.name)!}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'tag' || item == '*'>
									<Cell>
									<#if checkFieldPermission('tag','MESBasic_1_tagProperty_TagProperty','MESBasic_1_tagProperty_TagProperty_tag') != 0>
										<#if data.tag??><Data ss:Type="String">${(data.tag)!}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'tagType.value' || item == '*'>
									<Cell>
									<#if checkFieldPermission('tagType','MESBasic_1_tagProperty_TagProperty','MESBasic_1_tagProperty_TagProperty_tagType') != 0>
										<Data ss:Type="String">${getText('${(data.tagType.value)!}')}</Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'tattribute.value' || item == '*'>
									<Cell>
									<#if checkFieldPermission('tattribute','MESBasic_1_tagProperty_TagProperty','MESBasic_1_tagProperty_TagProperty_tattribute') != 0>
										<Data ss:Type="String">${getText('${(data.tattribute.value)!}')}</Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'active' || item == '*'>
									<Cell>
									<#if checkFieldPermission('active','MESBasic_1_tagProperty_TagProperty','MESBasic_1_tagProperty_TagProperty_active') != 0>
										<Data ss:Type="String"><#if data.active?? && data.active>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
									</#if>
									</Cell>
								</#if>
								<#if item == 'crtValue' || item == '*'>
									<Cell>
									<#if checkFieldPermission('crtValue','MESBasic_1_tagProperty_TagProperty','MESBasic_1_tagProperty_TagProperty_crtValue') != 0>
										<#if (data.crtValue)?has_content><Data ss:Type="Number">#{(data.crtValue)!; m4M4}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'updateTime' || item == '*'>
									<Cell ss:StyleID="s8">
									<#if checkFieldPermission('updateTime','MESBasic_1_tagProperty_TagProperty','MESBasic_1_tagProperty_TagProperty_updateTime') != 0>
										<#if data.updateTime??><Data ss:Type="DateTime">${(data.updateTime)!?string("yyyy-MM-dd'T'HH:mm:ss.SSS")}</Data></#if>
									</#if>
									</Cell>
								</#if>
								<#if item == 'virtualTag' || item == '*'>
									<Cell>
									<#if checkFieldPermission('virtualTag','MESBasic_1_tagProperty_TagProperty','MESBasic_1_tagProperty_TagProperty_virtualTag') != 0>
										<Data ss:Type="String"><#if data.virtualTag?? && data.virtualTag>${getText('common.radio.true')}<#else>${getText('common.radio.false')}</#if></Data>
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
		<#assign times = date[1]?split(':')>
		<#setting number_format="0.000000000000#">
		<#assign totaltime = ((times[0]?number*60) + times[1]?number)/1440>
	</#if>${totalday + totaltime}</#macro>
						
								
								
								