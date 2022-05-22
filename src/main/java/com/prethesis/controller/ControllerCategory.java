package com.prethesis.controller;

import com.prethesis.model.ResponseData;
import com.prethesis.model.dtos.CategoryView;
import com.prethesis.model.dtos.TicketView;
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
@RequestMapping("api/v1/")
public class ControllerCategory {
    private final CategoryService categoryService;


    @GetMapping("/categories")
    public ResponseEntity<ResponseData<List<CategoryView>>> getAll() {
        log.info("starting getAll:");
        return ResponseEntity.ok(categoryService.getAll());
    }

//    @GetMapping("/category/{id}")
//    public ResponseEntity<ResponseData<CategoryView>> getCategory(@PathVariable String id) {
//        log.info("starting getCategory:");
//        return ResponseEntity.ok(categoryService.getTicketDetails(id));
//    }

}
