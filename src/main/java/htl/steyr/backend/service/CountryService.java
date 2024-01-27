package htl.steyr.backend.service;

import htl.steyr.backend.dto.response.CountryResponseDto;
import htl.steyr.backend.model.Country;
import htl.steyr.backend.repository.CountryRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CountryService {

    private CountryRepository countryRepository;

    public CountryService(CountryRepository countryRepository) {
        this.countryRepository = countryRepository;
    }

    private static CountryResponseDto map(Country in) {
        CountryResponseDto result = null;

        if (in != null) {
            result = new CountryResponseDto(
                    in.getId(),
                    in.getName()
            );
        }
        return result;
    }

    public List<CountryResponseDto> getCountry() {
        return countryRepository.findAll().stream()
                .map(CountryService::map)
                .toList();
    }
}
