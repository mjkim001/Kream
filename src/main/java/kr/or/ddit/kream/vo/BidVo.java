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
	private String TEMP_PRICE;  // ���� ���� 
	private String TEMP_DATE;   // ���� ���� 
	private String BID_STATE;   // ���� ���� 
	private String POINT_YN;    // ����Ʈ ��� ���� 
	private int POINT;          // ����� ����Ʈ �ݾ�
	
	
	
	
	public String getTEMP_PRICE() {
		return TEMP_PRICE;
	}
	public void setTEMP_PRICE(String tEMP_PRICE) {
		TEMP_PRICE = tEMP_PRICE;
	}
	public String getTEMP_DATE() {
		return TEMP_DATE;
	}
	public void setTEMP_DATE(String tEMP_DATE) {
		TEMP_DATE = tEMP_DATE;
	}
	public String getBID_STATE() {
		return BID_STATE;
	}
	public void setBID_STATE(String bID_STATE) {
		BID_STATE = bID_STATE;
	}
	public String getPOINT_YN() {
		return POINT_YN;
	}
	public void setPOINT_YN(String pOINT_YN) {
		POINT_YN = pOINT_YN;
	}
	public int getPOINT() {
		return POINT;
	}
	public void setPOINT(int pOINT) {
		POINT = pOINT;
	}
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
	
	
	
	
	
	
	
	
}                            
                             