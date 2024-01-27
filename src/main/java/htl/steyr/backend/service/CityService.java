package htl.steyr.backend.service;

import htl.steyr.backend.dto.response.CityResponseDto;
import htl.steyr.backend.model.City;
import htl.steyr.backend.repository.CityRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityService {

    private CityRepository cityRepository;

    public CityService(CityRepository cityRepository) {
        this.cityRepository = cityRepository;
    }


    private static CityResponseDto map(City in) {
        CityResponseDto result = null;

        if (in != null) {
            result = new CityResponseDto(
                    in.getId(),
                    in.getName()
            );
        }
        return result;
    }

    public List<CityResponseDto> getCity(Long stateId) {
        return cityRepository.findCityByState_Id(stateId).stream()
                .map(CityService::map)
                .toList();
    }
}
