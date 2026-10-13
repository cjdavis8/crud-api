package com.example.demo.api;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ASOIAFcharacterService {
    
    private final ASOIAFrepository repository;

    public ASOIAFcharacterService(ASOIAFrepository repository) {
        this.repository = repository;
    }

    public List<ASOIAFcharacter> findAll() {
        return repository.findAll();
    }

    public List<ASOIAFcharacter> search(String name, Loyalty loyalty) {
        boolean hasName = name != null && !name.isBlank();

        if (hasName && loyalty != null) {
            return repository.findByNameContainingIgnoreCaseAndLoyalty(name.trim(), loyalty);
        }
        if (hasName) {
            return repository.findByNameContainingIgnoreCase(name.trim());
        }
        if (loyalty != null) {
            return repository.findByLoyalty(loyalty);
        }
        return repository.findAll();
    }
    
    public ASOIAFcharacter findById(Long id) {
        return repository.findById(id).orElseThrow(() -> new ASOIAFcharacterNotFoundException(id));

    }

    public ASOIAFcharacter create(ASOIAFcharacter newChar) {
        return repository.save(newChar);
    }

    public ASOIAFcharacter update(Long id, ASOIAFcharacter updated) {
        ASOIAFcharacter existing = findById(id);
        existing.setName(updated.getName());
        existing.setLoyalty(updated.getLoyalty());
        existing.setKnight(updated.isKnight());
        existing.setDescription(updated.getDescription());
        return repository.save(existing);
    }

    public void delete(Long id) {
        findById(id);
        repository.deleteById(id);
    }
}