package org.apache.sling.cms.core.models;

import java.util.Comparator;

import javax.inject.Inject;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Model;

@Model(adaptables = Resource.class)
public interface Module {

	public static final Comparator<Module> MODULE_COMPARATOR = new Comparator<Module>() {
		@Override
		public int compare(Module o1, Module o2) {
			return o1.getOrder().compareTo(o2.getOrder()) * -1;
		}
	};

	@Inject
	String getBasePath();

	@Inject
	String getConfigurationResourceType();

	@Inject
	String getConsole();

	@Inject
	String getContext();

	@Inject
	String getIcon();

	@Inject
	String getModuleName();

	@Inject
	String getTitle();

	@Inject
	Long getOrder();
}
