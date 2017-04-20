package org.apache.sling.cms.core.models;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.jcr.query.Query;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Model(adaptables = Resource.class)
public class PostList extends AbstractContentModel {

	private static final Logger log = LoggerFactory.getLogger(PostList.class);

	public PostList(Resource resource) {
		this.resource = resource;
	}

	public List<Post> getPosts() {
		List<Post> posts = new ArrayList<Post>();
		SiteManager siteMgr = resource.adaptTo(SiteManager.class);
		BlogConfig config = BlogConfig.getBlogConfig(siteMgr.getSite());
		if (config != null) {
			Iterator<Resource> resources = resource.getResourceResolver()
					.findResources(
							"SELECT * FROM [cms:page] WHERE [jcr:content/sling:resourceType]='"
									+ config.getResourceType() + "' AND ISDESCENDANTNODE([" + resource.getPath() + "])",
							Query.JCR_SQL2);
			while (resources.hasNext()) {
				Post post = Post.getContainingPost(resources.next());
				if (post != null) {
					posts.add(post);
				}
			}
		} else {
			log.warn("Blog not configured for {}" + siteMgr.getSite().getPath());
		}
		return posts;
	}

	@Override
	public Boolean getPublished() {
		return true;
	}

}
