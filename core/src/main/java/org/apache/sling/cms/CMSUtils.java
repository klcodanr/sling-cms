package org.apache.sling.cms;

import org.apache.jackrabbit.JcrConstants;
import org.apache.sling.api.resource.Resource;

public class CMSUtils {

	public static final Resource findParentResourceofType(Resource resource, String type) {
		if (resource != null) {
			if (type.equals(resource.getValueMap().get(JcrConstants.JCR_PRIMARYTYPE, String.class))) {
				return resource;
			} else {
				return findParentResourceofType(resource.getParent(), type);
			}
		}
		return null;
	}
}
