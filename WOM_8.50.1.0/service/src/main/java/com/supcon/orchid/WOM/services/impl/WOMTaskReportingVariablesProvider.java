package com.supcon.orchid.WOM.services.impl;

import java.beans.PropertyDescriptor;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.supcon.orchid.WOM.entities.WOMTaskReporting;
import com.supcon.orchid.WOM.services.WOMTaskReportingService;
import com.supcon.orchid.workflow.engine.services.VariablesProvider;

@Service
public class WOMTaskReportingVariablesProvider implements VariablesProvider {

	@Autowired
	private WOMTaskReportingService taskReportingService;

	@Override
	public Map<String, Object> provide(Long id) {
		Assert.notNull(id);
		WOMTaskReporting taskReporting = taskReportingService.getTaskReporting(id);
		if (null != taskReporting) {
			Map<String, Object> map = new HashMap<String, Object>();
			PropertyDescriptor[] origDescriptors = BeanUtilsBean.getInstance().getPropertyUtils().getPropertyDescriptors(taskReporting);
			for (int i = 0; i < origDescriptors.length; i++) {
				String name = origDescriptors[i].getName();
				if ("class".equals(name)) {
					continue; // No point in trying to set an object's class
				}
				if (BeanUtilsBean.getInstance().getPropertyUtils().isReadable(taskReporting, name)) {
					Object value;
					try {
						value = BeanUtilsBean.getInstance().getPropertyUtils().getSimpleProperty(taskReporting, name);
						//if (null != value)
						map.put(name, value);
					} catch (Exception e) {
					}
				}
			}
			return map;
		}
		return Collections.emptyMap();
	}
}