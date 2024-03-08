package htl.steyr.backend.controller;

import htl.steyr.backend.dto.response.CategoryResponseDto;
import htl.steyr.backend.service.CategoryService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/category")
public class CategoryController {

    private CategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/get")
    public ResponseEntity<List<CategoryResponseDto>> getCategory() {
        return new ResponseEntity<>(categoryService.getCategories(), HttpStatus.OK);
    }
}
