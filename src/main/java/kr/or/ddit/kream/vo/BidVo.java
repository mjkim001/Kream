package kr.or.ddit.kream.vo;

import java.util.Date;

public class BidVo {

	private String bid_id;        //���� �ڵ�
	private Date bid_date;        //���� ��¥
	private int bid_price;        //���� ����
	private String bid_position;  //���� ������
	private String mem_email;     //������
	private String size_id;       //������ �ڵ�

	private String prod_id;       //prod_size ���̺��� ��ǰ�ڵ�
	private String size_name;     //prod_size ���̺��� ġ��
	
	// ���� �߰� 
	private String Temp_price;  // ���� ���� 
	private String Temp_date;   // ���� ���� 
	private String Bid_state;   // ���� ���� 
	private String Point_yn;    // ����Ʈ ��� ���� 
	private int point;          // ����� ����Ʈ �ݾ�
	
	private int order_price; // ������������ 

	public String getSize_name() {
		return size_name;
	}
	public void setSize_name(String size_name) {
		this.size_name = size_name;
	}
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public String getBid_id() {
		return bid_id;
	}
	public void setBid_id(String bid_id) {
		this.bid_id = bid_id;
	}
	public Date getBid_date() {
		return bid_date;
	}
	public void setBid_date(Date bid_date) {
		this.bid_date = bid_date;
	}
	public int getBid_price() {
		return bid_price;
	}
	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}
	public String getBid_position() {
		return bid_position;
	}
	public void setBid_position(String bid_position) {
		this.bid_position = bid_position;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getSize_id() {
		return size_id;
	}
	public void setSize_id(String size_id) {
		this.size_id = size_id;
	}
	public String getTemp_price() {
		return Temp_price;
	}
	public void setTemp_price(String temp_price) {
		Temp_price = temp_price;
	}
	public String getTemp_date() {
		return Temp_date;
	}
	public void setTemp_date(String temp_date) {
		Temp_date = temp_date;
	}
	public String getBid_state() {
		return Bid_state;
	}
	public void setBid_state(String bid_state) {
		Bid_state = bid_state;
	}
	public String getPoint_yn() {
		return Point_yn;
	}
	public void setPoint_yn(String point_yn) {
		Point_yn = point_yn;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	
	
	
	
	
	
	
	
}                            
                             