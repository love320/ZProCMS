package app.bean;

import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;


/**
 * 定义树的bean成员
 * @author Administrator
 *
 */

@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL) 
public class ItemTree {

	private Long id;
	private String text;
	private Object attributes;
	private List<ItemTree> children;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Object getAttributes() {
		return attributes;
	}

	public void setAttributes(Object attributes) {
		this.attributes = attributes;
	}

	public List<ItemTree> getChildren() {
		return children;
	}

	public void setChildren(List<ItemTree> children) {
		this.children = children;
	}


}
