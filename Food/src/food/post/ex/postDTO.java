package food.post.ex;

public class postDTO {
	
	public postDTO() {
		
	}
	
	private String post_id;
	private String write_id;
	private String write_name;
	private String post_date;
	private String post_title;
	private String post_sub;
	private String post_content;
	private String post_tag;
	private int post_like;
	private int post_commend;
	private String main_img;
	private String img_path;
	
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getWrite_id() {
		return write_id;
	}
	public void setWrite_id(String write_id) {
		this.write_id = write_id;
	}
	public String getWrite_name() {
		return write_name;
	}
	public void setWrite_name(String write_name) {
		this.write_name = write_name;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_sub() {
		return post_sub;
	}
	public void setPost_sub(String post_sub) {
		this.post_sub = post_sub;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getPost_tag() {
		return post_tag;
	}
	public void setPost_tag(String post_tag) {
		this.post_tag = post_tag;
	}
	public int getPost_like() {
		return post_like;
	}
	public void setPost_like(int post_like) {
		this.post_like = post_like;
	}
	public int getPost_commend() {
		return post_commend;
	}
	public void setPost_commend(int post_commend) {
		this.post_commend = post_commend;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
}
