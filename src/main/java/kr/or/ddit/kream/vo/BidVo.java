package kr.or.ddit.kream.vo;

import java.util.Date;

public class BidVo {

	private String bid_id;        //���� �ڵ�
	private Date bid_date;        //���� ��¥
	private int bid_price;        //���� ����
	private String bid_position;  //���� ������
	private String mem_email;     //������
	private String size_id;       //������ �ڵ�
	
	
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
	
	
	
	
	
	
	
	
}                            
                             