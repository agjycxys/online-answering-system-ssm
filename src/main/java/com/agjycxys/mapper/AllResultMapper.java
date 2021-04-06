package com.agjycxys.mapper;

import com.agjycxys.domain.AllResult;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface AllResultMapper {
    void addResult(AllResult allResult) ;

    List<AllResult> queryResults(int kcid, int tkid);
}
