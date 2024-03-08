package htl.steyr.backend.service;

import htl.steyr.backend.dto.response.CategoryResponseDto;
import htl.steyr.backend.model.Category;
import htl.steyr.backend.repository.CategoryRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {

    private CategoryRepository categoryRepository;
    private static InterestService interestService;

    public CategoryService(CategoryRepository categoryRepository, InterestService interestService) {
        this.categoryRepository = categoryRepository;
        this.interestService = interestService;
    }

    public Category mapToCategory(CategoryResponseDto category) {
        return categoryRepository.findById(category.id()).get();
    }

    private static CategoryResponseDto map(Category in) {
        CategoryResponseDto result = null;

        if (in != null) {
            result = new CategoryResponseDto(
                    in.getId(),
                    in.getName(),
                    interestService.mapInterestsToCategory(in.getInterests())
            );
        }
        return result;
    }

    public List<CategoryResponseDto> getCategories() {
        return categoryRepository.findAll().stream().
                map(CategoryService::map).
                toList();
    }
}
