package com.prethesis.controller;

import com.prethesis.model.ResponseData;
import com.prethesis.model.dtos.CategoryView;
import com.prethesis.service.CategoryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;
@RestController
@RequiredArgsConstructor
@Slf4j
@CrossOrigin
@RequestMapping("api/v1/")
public class ControllerCategory {
    private final CategoryService categoryService;


    @GetMapping("/categories")
    public ResponseEntity<ResponseData<List<CategoryView>>> getAll() {
        log.info("starting getAll:");
        return ResponseEntity.ok(categoryService.getAll());
    }

    @PostMapping("/category")
    public ResponseEntity<ResponseData<CategoryView>> create(@RequestBody CategoryView categoryView) throws IOException {
        log.info("starting create {}", categoryView);
        return ResponseEntity.ok(categoryService.create(categoryView));
    }



}
