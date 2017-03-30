package org.apache.sling.cms.core.models;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Model;

@Model(adaptables = Resource.class)
public class EditableResource {

	private final Resource resource;

	public EditableResource(Resource resource) {
		this.resource = resource;
	}

	private Resource getComponentEditPath(Resource component) {
		if (component != null) {
			if (component.getChild("edit") != null) {
				return component.getChild("edit");
			} else {
				component = component.getResourceResolver()
						.getResource(component.getResourceResolver().getParentResourceType(component));
				if (component != null) {
					return getComponentEditPath(component);
				}
			}
		}
		return null;
	}

	public String getEditPath() {
		Resource editResource = getEditResource();
		return editResource != null ? editResource.getPath() : null;
	}

	public Resource getEditResource() {
		Resource component = resource.getResourceResolver().getResource(resource.getResourceType());
		return getComponentEditPath(component);
	}

	public Resource getResource() {
		return resource;
	}
}
