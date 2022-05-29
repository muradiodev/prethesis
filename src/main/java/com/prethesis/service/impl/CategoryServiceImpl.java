package com.prethesis.service.impl;

import com.prethesis.entity.Categories;
import com.prethesis.entity.Tickets;
import com.prethesis.mapper.CategoryMapper;
import com.prethesis.mapper.TicketMapper;
import com.prethesis.model.ResponseData;
import com.prethesis.model.dtos.CategoryView;
import com.prethesis.model.dtos.TicketView;
import com.prethesis.repo.RepoCategory;
import com.prethesis.repo.RepoTicket;
import com.prethesis.service.CategoryService;
import com.prethesis.util.generateresponse.GenerateResponseUtility;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static com.prethesis.util.generateresponse.Constants.*;
import static com.prethesis.util.generateresponse.Constants.SUCCESS_MESSAGE;

@Slf4j
@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {


    private final RepoCategory repoCategory;
    private CategoryMapper categoryMapper = CategoryMapper.INSTANCE;

    private CategoryView getCategoryView(Categories categories) {
        return categoryMapper.toCategoryView(categories);
    }

    @Override
    public ResponseData<List<CategoryView>> getAll() {
        List<Categories> categories = repoCategory.findAll();

        List<CategoryView> tv = categories.stream()
                .map(this::getCategoryView)
                .collect(Collectors.toList());

        if (categories.size() == 0) {
            log.info("category detail not found : ");
            return GenerateResponseUtility.categories.generate(NOT_FOUND_CODE, NOT_FOUND_MESSAGE, null);
        }
        log.info("category detail found : ");
        return GenerateResponseUtility.categories.generate(SUCCESS_CODE, SUCCESS_MESSAGE, tv);
    }

    @Override
    public ResponseData<CategoryView> create(CategoryView categoryView) {
        Categories categories = Categories.builder()
                .name(categoryView.getName())
                .build();
        repoCategory.save(categories);
        return GenerateResponseUtility.categoryDetail.generate(SUCCESS_CODE, SUCCESS_MESSAGE, null);
    }

    @Override
    public ResponseData<CategoryView> update(CategoryView categoryView) {
        log.info("categoryView : {}", categoryView);

        repoCategory.findById(categoryView.getId()).ifPresent(categories -> {
            categories.setName(categoryView.getName());
            repoCategory.save(categories);
        });

        return GenerateResponseUtility.categoryDetail.generate(SUCCESS_CODE, SUCCESS_MESSAGE, categoryView);
    }

    @Override
    public ResponseData<CategoryView> delete(CategoryView categoryView) {
        log.info("categoryView : {}", categoryView);

        repoCategory.findById(categoryView.getId()).ifPresent(categories -> {
            repoCategory.delete(categories);
        });

        return GenerateResponseUtility.categoryDetail.generate(SUCCESS_CODE, SUCCESS_MESSAGE, null);
    }
}
