package com.agjycxys.domain;

public class TiKu {
	
	private int tkid;
	private String tkname;
	private String tkscore;
	private String kcnames;
	
	public String getKcnames() {
		return kcnames;
	}
	public void setKcnames(String kcnames) {
		this.kcnames = kcnames;
	}
	public int getTkid() {
		return tkid;
	}
	public void setTkid(int tkid) {
		this.tkid = tkid;
	}
	public String getTkname() {
		return tkname;
	}
	public void setTkname(String tkname) {
		this.tkname = tkname;
	}
	public String getTkscore() {
		return tkscore;
	}
	public void setTkscore(String tkscore) {
		this.tkscore = tkscore;
	}
	@Override
	public String toString() {
		return "TiKu [tkid=" + tkid + ", tkname=" + tkname + ", tkscore="
				+ tkscore + "]";
	}
	
	
}
