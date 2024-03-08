package htl.steyr.backend.service;

import htl.steyr.backend.dto.request.LocationRequestDto;
import htl.steyr.backend.model.Location;
import htl.steyr.backend.repository.LocationRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class LocationService {

    private static LocationRepository locationRepository;

    public LocationService(LocationRepository locationRepository, CityService cityService) {
        this.locationRepository = locationRepository;
    }


    public static Location map(LocationRequestDto location) {
        Optional<Location> locationOptional = locationRepository.findByCityId(location.city().id());
        if(locationOptional.isPresent()) {
            return locationOptional.get();
        }else {
            Location result = new Location();
            result.setCity(CityService.map(location.city()));
            result.setState(StateService.map(location.state()));
            result.setCountry(CountryService.map(location.country()));
            return result;
        }
    }
}
