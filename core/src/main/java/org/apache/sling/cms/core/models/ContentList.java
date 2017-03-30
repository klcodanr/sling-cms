package org.apache.sling.cms.core.models;

import java.util.ArrayList;
import java.util.List;

import org.apache.jackrabbit.JcrConstants;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.cms.CMSConstants;
import org.apache.sling.jcr.resource.JcrResourceConstants;
import org.apache.sling.models.annotations.Model;

@Model(adaptables = Resource.class)
public class ContentList extends AbstractContentModel {

	public ContentList(Resource resource) {
		this.resource = resource;
	}

	public List<Asset> getAssets() {
		List<Asset> assets = new ArrayList<Asset>();
		for (Resource asset : resource.getChildren()) {
			if (JcrConstants.NT_FILE.equals(asset.getValueMap().get(JcrConstants.JCR_PRIMARYTYPE, String.class))) {
				assets.add(asset.adaptTo(Asset.class));
			}
		}
		return assets;
	}

	public List<AbstractContentModel> getContent() {
		List<AbstractContentModel> content = new ArrayList<AbstractContentModel>();
		content.addAll(getFolders());
		content.addAll(getPages());
		content.addAll(getAssets());
		return content;
	}

	public List<BreadcrumbItem> getBreadcrumb() {
		return BreadcrumbItem.getBreadcrumbItems(resource, 2);
	}

	public List<ContentList> getFolders() {
		List<ContentList> folders = new ArrayList<ContentList>();
		for (Resource folder : resource.getChildren()) {
			if (JcrResourceConstants.NT_SLING_ORDERED_FOLDER
					.equals(folder.getValueMap().get(JcrConstants.JCR_PRIMARYTYPE, String.class))
					&& !"assets".equals(folder.getName())) {
				folders.add(folder.adaptTo(ContentList.class));
			}
		}
		return folders;
	}

	public List<Page> getPages() {
		List<Page> pages = new ArrayList<Page>();
		for (Resource asset : resource.getChildren()) {
			if (CMSConstants.NODE_TYPE_PAGE
					.equals(asset.getValueMap().get(JcrConstants.JCR_PRIMARYTYPE, String.class))) {
				pages.add(asset.adaptTo(Page.class));
			}
		}
		return pages;
	}

	@Override
	public Boolean getPublished() {
		return true;
	}

}
