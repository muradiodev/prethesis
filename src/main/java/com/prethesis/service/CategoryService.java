package com.prethesis.service;

import com.prethesis.entity.Categories;
import com.prethesis.model.ResponseData;
import com.prethesis.model.dtos.CategoryView;
import com.prethesis.model.dtos.TicketView;

import java.util.List;

public interface CategoryService {

    ResponseData<List<CategoryView>> getAll();

    ResponseData<CategoryView> create(CategoryView categoryView);

    ResponseData<CategoryView> update(CategoryView categoryView);

    ResponseData<CategoryView> delete(CategoryView categoryView);
}
