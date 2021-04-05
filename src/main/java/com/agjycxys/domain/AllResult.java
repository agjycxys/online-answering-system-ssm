package com.agjycxys.domain;

public class AllResult {
    private int kcid;
    private int tkid;
    private String results;
    private String openid;

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public int getKcid() {
        return kcid;
    }

    public void setKcid(int kcid) {
        this.kcid = kcid;
    }

    public int getTkid() {
        return tkid;
    }

    public void setTkid(int tkid) {
        this.tkid = tkid;
    }

    public String getResults() {
        return results;
    }

    public void setResults(String results) {
        this.results = results;
    }

}
