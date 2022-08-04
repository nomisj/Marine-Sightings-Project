package com.nomijones.marineSightings.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nomijones.marineSightings.models.Sighting;
import com.nomijones.marineSightings.repositories.SightingRepository;

@Service
public class SightingService {
	
	@Autowired
	private SightingRepository repo;
	
	public Sighting findById(Long id) {
		
		Optional<Sighting> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<Sighting> all() {
		return repo.findAll();
	}
	
	public Sighting update(Sighting sighting) {
		return repo.save(sighting);
	}
	
	public Sighting create(Sighting sighting) {
		return repo.save(sighting);
	}
	
	public void delete(Sighting sighting) {
		repo.delete(sighting);
	}
}
