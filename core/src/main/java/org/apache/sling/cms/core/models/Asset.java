package org.apache.sling.cms.core.models;

import java.io.InputStream;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Model;

@Model(adaptables = Resource.class)
public class Asset extends AbstractContentModel {

	@Inject
	@Named("jcr:content/jcr:data")
	private InputStream contents;

	@Inject
	@Named("jcr:content/jcr:mimeType")
	private String mimeType;

	public Asset(Resource resource) {
		this.resource = resource;
	}

	public InputStream getContents() {
		return contents;
	}

	public String getMimeType() {
		return mimeType;
	}

	@Override
	public Boolean getPublished() {
		return true;
	}
}
