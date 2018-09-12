package food.reservation.dto;

public class ReservationDTO {
	private String reservationId;
	private String userId;
	private String storeId;
	private String storeName;
	private String storeAddr;
	private String storeTel;
	private String reserveName;
	private String reserveDate;
	private String reserveTime;
	private String reserveSeat;
	private String regDate;
	private String reserveTel;
	private String reserveEmail;
	private String reserveComment;
	private String reservePermitSeat;
	
	
	public ReservationDTO() {
		super();
	}


	public ReservationDTO(String reservationId, String userId, String storeId, String storeName, String storeAddr,
			String storeTel, String reserveName, String reserveDate, String reserveTime, String reserveSeat,
			String regDate, String reserveTel, String reserveEmail, String reserveComment, String reservePermitSeat) {
		super();
		this.reservationId = reservationId;
		this.userId = userId;
		this.storeId = storeId;
		this.storeName = storeName;
		this.storeAddr = storeAddr;
		this.storeTel = storeTel;
		this.reserveName = reserveName;
		this.reserveDate = reserveDate;
		this.reserveTime = reserveTime;
		this.reserveSeat = reserveSeat;
		this.regDate = regDate;
		this.reserveTel = reserveTel;
		this.reserveEmail = reserveEmail;
		this.reserveComment = reserveComment;
		this.reservePermitSeat = reservePermitSeat;
	}


	public String getReservationId() {
		return reservationId;
	}


	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getStoreId() {
		return storeId;
	}


	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}


	public String getStoreName() {
		return storeName;
	}


	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}


	public String getStoreAddr() {
		return storeAddr;
	}


	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}


	public String getStoreTel() {
		return storeTel;
	}


	public void setStoreTel(String storeTel) {
		this.storeTel = storeTel;
	}


	public String getReserveName() {
		return reserveName;
	}


	public void setReserveName(String reserveName) {
		this.reserveName = reserveName;
	}


	public String getReserveDate() {
		return reserveDate;
	}


	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}


	public String getReserveTime() {
		return reserveTime;
	}


	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}


	public String getReserveSeat() {
		return reserveSeat;
	}


	public void setReserveSeat(String reserveSeat) {
		this.reserveSeat = reserveSeat;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public String getReserveTel() {
		return reserveTel;
	}


	public void setReserveTel(String reserveTel) {
		this.reserveTel = reserveTel;
	}


	public String getReserveEmail() {
		return reserveEmail;
	}


	public void setReserveEmail(String reserveEmail) {
		this.reserveEmail = reserveEmail;
	}


	public String getReserveComment() {
		return reserveComment;
	}


	public void setReserveComment(String reserveComment) {
		this.reserveComment = reserveComment;
	}


	public String getReservePermitSeat() {
		return reservePermitSeat;
	}


	public void setReservePermitSeat(String reservePermitSeat) {
		this.reservePermitSeat = reservePermitSeat;
	}
	
}
