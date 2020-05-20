package com.bird.service.common.service.query;

import com.bird.service.common.service.dto.AbstractBO;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author liuxx
 * @date 2017/6/23
 */
@Getter
@Setter
public class ListQuery extends AbstractBO {
    private String sortField;
    private int sortDirection;
    private List<FilterRule> filters;
    private List<String> sumFields;

    public ListQuery() {
        filters = new ArrayList<>();
        sumFields = new ArrayList<>();
    }
}
