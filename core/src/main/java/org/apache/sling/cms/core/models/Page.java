package org.apache.sling.cms.core.models;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang.StringUtils;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Model;

@Model(adaptables = Resource.class)
public class Page extends AbstractContentModel {
	
	public static final Page getContainingPage(Resource resource){
		return resource.adaptTo(PageManager.class).getPage();
	}

	@Inject
	@Named("jcr:content/published")
	private Boolean published;

	public Page(Resource resource) {
		this.resource = resource;
	}

	public String getAvailableComponents() {
		Resource config = resource.adaptTo(SiteManager.class).getSite().getConfig();
		List<String> types = new ArrayList<String>();
		if (config != null && config.getChild("content/pagetypes") != null) {
			for (Resource pageType : config.getChild("content/pagetypes").getChildren()) {
				if (getContentResource().getResourceType()
						.equals(pageType.getValueMap().get("resourceType", String.class))) {
					for (Resource type : pageType.getChild("availabletypes").getChildren()) {
						types.add(type.getValueMap().get("resourceType", String.class));
					}
				}
			}
		}
		return StringUtils.join(types, ",");
	}

	public Boolean getPublished() {
		return published;
	}
}
