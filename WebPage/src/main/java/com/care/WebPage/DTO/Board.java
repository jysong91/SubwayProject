package com.care.WebPage.DTO;

public class Board {
	// �۹�ȣ 
    private Integer no;
    // �ۼ��� 
    private String id;
    // ���� 
    private String title;
    // ���� 
    private String contents;
    // �ۼ��� 
    private String writedate;
    private int hit;
    public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Integer getNo() {
        return no;
    }

    public void setNo(Integer no) {
        this.no = no;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getWritedate() {
        return writedate;
    }

    public void setWritedate(String writedate) {
        this.writedate = writedate;
    }
}
