package com.prethesis.mapper;

import com.prethesis.entity.Categories;
import com.prethesis.model.dtos.CategoryView;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueMappingStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(nullValueMappingStrategy = NullValueMappingStrategy.RETURN_DEFAULT)
public interface CategoryMapper {
    CategoryMapper INSTANCE = Mappers.getMapper(CategoryMapper.class);

    CategoryView toCategoryView(Categories categories);


}
