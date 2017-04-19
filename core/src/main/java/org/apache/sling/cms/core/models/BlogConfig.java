package org.apache.sling.cms.core.models;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.sling.cms.CMSConstants;
import org.apache.sling.models.annotations.Default;
import org.apache.sling.models.annotations.Model;
import org.apache.sling.models.annotations.Optional;

/**
 * Sling Model for accessing the default blog configuration
 */
@Model(adaptables = Resource.class)
public interface BlogConfig {

	static BlogConfig getBlogConfig(Site site) {
		return site.getConfig().getChild(CMSConstants.BLOG_CONFIG_SUBPATH).adaptTo(BlogConfig.class);
	}

	@Inject
	String getResourceType();

	@Inject
	String getPostPrefix();

	@Inject
	@Default(booleanValues = false)
	boolean isGenerateTags();

	@Inject
	@Optional
	String getTagResourceType();
}
