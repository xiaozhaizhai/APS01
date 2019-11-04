package com.supcon.orchid.RM.services.impl;

import java.beans.PropertyDescriptor;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.supcon.orchid.RM.entities.RMFormulaChange;
import com.supcon.orchid.RM.services.RMFormulaChangeService;
import com.supcon.orchid.workflow.engine.services.VariablesProvider;

@Service
public class RMFormulaChangeVariablesProvider implements VariablesProvider {

	@Autowired
	private RMFormulaChangeService formulaChangeService;

	@Override
	public Map<String, Object> provide(Long id) {
		Assert.notNull(id);
		RMFormulaChange formulaChange = formulaChangeService.getFormulaChange(id);
		if (null != formulaChange) {
			Map<String, Object> map = new HashMap<String, Object>();
			PropertyDescriptor[] origDescriptors = BeanUtilsBean.getInstance().getPropertyUtils().getPropertyDescriptors(formulaChange);
			for (int i = 0; i < origDescriptors.length; i++) {
				String name = origDescriptors[i].getName();
				if ("class".equals(name)) {
					continue; // No point in trying to set an object's class
				}
				if (BeanUtilsBean.getInstance().getPropertyUtils().isReadable(formulaChange, name)) {
					Object value;
					try {
						value = BeanUtilsBean.getInstance().getPropertyUtils().getSimpleProperty(formulaChange, name);
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