package org.apache.sling.cms.core.models;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.jcr.query.Query;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Model;

@Model(adaptables = Resource.class)
public class PostList extends AbstractContentModel {

	public PostList(Resource resource) {
		this.resource = resource;
	}

	public List<Page> getPosts() {
		List<Page> posts = new ArrayList<Page>();
		SiteManager siteMgr = resource.adaptTo(SiteManager.class);
		BlogConfig config = BlogConfig.getBlogConfig(siteMgr.getSite());
		if (config != null) {
			Iterator<Resource> resources = resource.getResourceResolver().findResources("SELECT * FROM [cms:page] WHERE [sling:resourceType]='"
					+ config.getResourceType() + "' AND ISDECENDANTNODE([" + resource.getPath() + "]", Query.JCR_SQL2);
			while(resources.hasNext()){
				Page pg = Page.getContainingPage(resources.next());
				if(pg != null){
					posts.add(pg);
				}
			}
		}
		return posts;
	}

	@Override
	public Boolean getPublished() {
		return true;
	}

}
