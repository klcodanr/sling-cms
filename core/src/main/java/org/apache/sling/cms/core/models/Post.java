package org.apache.sling.cms.core.models;

import java.util.Date;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.cms.CMSConstants;
import org.apache.sling.cms.CMSUtils;
import org.apache.sling.models.annotations.Model;

@Model(adaptables = Resource.class)
public class Post extends Page {
	public static final Post getContainingPost(Resource resource) {
		Resource pageRsrc = CMSUtils.findParentResourceofType(resource, CMSConstants.NODE_TYPE_PAGE);
		Post post = null;
		if (pageRsrc != null) {
			post = pageRsrc.adaptTo(Post.class);
		}
		return post;
	}

	@Inject
	@Named("jcr:content/publicationDate")
	private Date publicationDate;

	public Post(Resource resource) {
		super(resource);
	}

	public Date getPublicationDate() {
		return publicationDate;
	}
}
