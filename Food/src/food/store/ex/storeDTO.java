package food.store.ex;

public class storeDTO {
	String count;
	String storeid;
	String id;
	String name;
	String storename;
	String category;
	String storeaddrnum;
	String storeaddr;
	String storeaddrdetail;
	String storetel;
	String storetel1;
	String storetel2;
	String storetel3;
	String permit;
	String thumbnailimg;
	String tn_img_path;
	
	String like_count;
	String eval_count;
	
	
	public storeDTO() {

	}
	
	public storeDTO(String count, String storeid, String id, String name, String storename, String category, String storeaddrnum, String storeaddr, String storeaddrdetail, String storetel) {
		this.count = count;
		this.storeid = storeid;
		this.id = id;
		this.name = name;
		this.storename = storename;
		this.category = category;
		this.storeaddrnum = storeaddrnum;
		this.storeaddr = storeaddr;
		this.storeaddrdetail = storeaddrdetail;
		this.storetel = storetel;
	} 

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStoreaddrnum() {
		return storeaddrnum;
	}

	public void setStoreaddrnum(String storeaddrnum) {
		this.storeaddrnum = storeaddrnum;
	}

	public String getStoreaddr() {
		return storeaddr;
	}

	public void setStoreaddr(String storeaddr) {
		this.storeaddr = storeaddr;
	}

	public String getStoreaddrdetail() {
		return storeaddrdetail;
	}

	public void setStoreaddrdetail(String storeaddrdetail) {
		this.storeaddrdetail = storeaddrdetail;
	}

	public String getStoretel() {
		return storetel;
	}

	public void setStoretel(String storetel) {
		this.storetel = storetel;
	}

	public String getStoretel1() {
		return storetel1;
	}

	public void setStoretel1(String storetel1) {
		this.storetel1 = storetel1;
	}

	public String getStoretel2() {
		return storetel2;
	}

	public void setStoretel2(String storetel2) {
		this.storetel2 = storetel2;
	}

	public String getStoretel3() {
		return storetel3;
	}

	public void setStoretel3(String storetel3) {
		this.storetel3 = storetel3;
	}
	
	public String getPermit() {
		return permit;
	}

	public void setPermit(String permit) {
		this.permit = permit;
	}

	public String getStoreid() {
		return storeid;
	}

	public void setStoreid(String storeid) {
		this.storeid = storeid;
	}

	public String getThumbnailimg() {
		return thumbnailimg;
	}

	public void setThumbnailimg(String thumbnailimg) {
		this.thumbnailimg = thumbnailimg;
	}

	public String getTn_img_path() {
		return tn_img_path;
	}

	public void setTn_img_path(String tn_img_path) {
		this.tn_img_path = tn_img_path;
	}
	
}
