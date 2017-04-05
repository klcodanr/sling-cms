package org.apache.sling.cms.core.models;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ValueMap;
import org.apache.sling.models.annotations.Model;
import org.apache.sling.models.annotations.Optional;

@Model(adaptables = Resource.class)
public class Site {

	public static final String PN_DESCRIPTION = "description";
	public static final String PN_NAME = "name";

	@Inject
	@Optional
	private String description;

	@Inject
	private String name;

	private Resource resource;

	public Site(Resource resource) {
		this.resource = resource;
	}

	public Resource getConfig() {
		return resource.getResourceResolver().getResource("/etc/config/" + resource.getName());
	}

	public ValueMap getConfigProperties() {
		return resource.getResourceResolver().getResource("/etc/config/" + resource.getName()).getValueMap();
	}

	public String getDescription() {
		return description;
	}

	public List<Module> getEnabledModules() {
		String[] enabledModulePaths = getConfigProperties().get("enabledModules", String[].class);
		List<Module> enabledModules = new ArrayList<Module>();
		if (enabledModulePaths != null) {
			for (String path : enabledModulePaths) {
				Resource mod = resource.getResourceResolver().getResource(path);
				if (mod != null) {
					Module module = mod.adaptTo(Module.class);
					if (module != null && "site".equals(module.getContext())) {
						enabledModules.add(mod.adaptTo(Module.class));
					}
				}
			}
		}
		Collections.sort(enabledModules, Module.MODULE_COMPARATOR);
		return enabledModules;
	}

	public String getId() {
		return resource.getName();
	}

	public String getName() {
		return name;
	}

	public String getPath() {
		return resource.getPath();
	}

	public Resource getResource() {
		return resource;
	}

}
