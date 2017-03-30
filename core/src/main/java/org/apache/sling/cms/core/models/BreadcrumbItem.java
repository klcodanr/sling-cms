package org.apache.sling.cms.core.models;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang.StringUtils;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Model;
import org.apache.sling.models.annotations.Optional;

@Model(adaptables=Resource.class)
public class BreadcrumbItem {
	
	@Inject
	@Named("jcr:content/jcr:title")
	@Optional
	private String title;
	
	private Resource resource;
	
	public BreadcrumbItem(Resource resource){
		this.resource = resource;
	}
	
	public String getTitle(){
		if(StringUtils.isNotEmpty(title)){
			return title;
		} else {
			return resource.getName();
		}
	}
	
	public String getPath(){
		return resource.getPath();
	}

	public static List<BreadcrumbItem> getBreadcrumbItems(Resource resource, int depth) {
		List<BreadcrumbItem> items = new ArrayList<BreadcrumbItem>();
		while(StringUtils.countMatches(resource.getPath(), "/") > depth){
			items.add(resource.adaptTo(BreadcrumbItem.class));
			resource = resource.getParent();
		}
		Collections.reverse(items);
		return items;
	}

}
