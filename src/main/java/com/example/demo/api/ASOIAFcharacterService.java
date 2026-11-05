package com.example.demo.api;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.List;


@Service
public class ASOIAFcharacterService {
    
    private final ASOIAFrepository repository;

    private static final String UPLOAD_DIR = "src/main/resources/static/thumbnails/";

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

    public void saveThumbnail(ASOIAFcharacter character, MultipartFile file) {
        String originalFileName = file.getOriginalFilename();
        try {
            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
            String newFileName = "character_" + character.getId() + "." + fileExtension;
            Path path = Paths.get(UPLOAD_DIR + newFileName);
            InputStream inputStream = file.getInputStream();
            Files.createDirectories(Paths.get(UPLOAD_DIR)); // Ensure the directory exists
            Files.copy(inputStream, path, StandardCopyOption.REPLACE_EXISTING);
            character.setThumbnailUrl( newFileName);
            repository.save(character);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}