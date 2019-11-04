package com.supcon.orchid.WOM.services.impl;

import java.beans.PropertyDescriptor;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtilsBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.supcon.orchid.WOM.entities.WOMActiveExelog;
import com.supcon.orchid.WOM.services.WOMActiveExelogService;
import com.supcon.orchid.workflow.engine.services.VariablesProvider;

@Service
public class WOMActiveExelogVariablesProvider implements VariablesProvider {

	@Autowired
	private WOMActiveExelogService activeExelogService;

	@Override
	public Map<String, Object> provide(Long id) {
		Assert.notNull(id);
		WOMActiveExelog activeExelog = activeExelogService.getActiveExelog(id);
		if (null != activeExelog) {
			Map<String, Object> map = new HashMap<String, Object>();
			PropertyDescriptor[] origDescriptors = BeanUtilsBean.getInstance().getPropertyUtils().getPropertyDescriptors(activeExelog);
			for (int i = 0; i < origDescriptors.length; i++) {
				String name = origDescriptors[i].getName();
				if ("class".equals(name)) {
					continue; // No point in trying to set an object's class
				}
				if (BeanUtilsBean.getInstance().getPropertyUtils().isReadable(activeExelog, name)) {
					Object value;
					try {
						value = BeanUtilsBean.getInstance().getPropertyUtils().getSimpleProperty(activeExelog, name);
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