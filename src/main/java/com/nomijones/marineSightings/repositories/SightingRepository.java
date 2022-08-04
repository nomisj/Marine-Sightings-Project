package com.nomijones.marineSightings.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nomijones.marineSightings.models.Sighting;

@Repository
public interface SightingRepository extends CrudRepository<Sighting, Long> {

	List<Sighting> findAll();
	
}
