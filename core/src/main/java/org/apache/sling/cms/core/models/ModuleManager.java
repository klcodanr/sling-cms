package org.apache.sling.cms.core.models;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.models.annotations.Model;

@Model(adaptables = { Resource.class, ResourceResolver.class })
public class ModuleManager {

	public static final String MODULE_ROOT_PATH = "/etc/modules";

	@Inject
	@Named(MODULE_ROOT_PATH)
	private List<Module> modules;

	public List<Module> getModules() {
		return modules;
	}
}
