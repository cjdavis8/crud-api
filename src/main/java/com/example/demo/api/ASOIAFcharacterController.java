package com.example.demo.api;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/characters")
public class ASOIAFcharacterController {
    
    private final ASOIAFcharacterService service;

    public ASOIAFcharacterController(ASOIAFcharacterService service){
        this.service = service;
    }

    @GetMapping
    public List<ASOIAFcharacter> list(@RequestParam(required = false) String name,
        @RequestParam(required = false) Loyalty loyalty) {
        
            return service.search(name, loyalty);
        }

    @GetMapping("/{id}")
    public ASOIAFcharacter get(@PathVariable Long id) {
        return service.findById(id);
    }

    @GetMapping("/{loyalty}")
    public List<ASOIAFcharacter> get(@PathVariable Loyalty loyalty) {
        return service.search(null, loyalty);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ASOIAFcharacter create(@Valid @RequestBody ASOIAFcharacter newChar) {
        return service.create(newChar);
    }

    @PutMapping("/{id}")
    public ASOIAFcharacter update(@PathVariable Long id, @Valid @RequestBody ASOIAFcharacter updated) {
        return service.update(id, updated);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) {
        service.delete(id);
    }

    @GetMapping("/pulse")
    public ResponseEntity<String> checkPulse() {
        return ResponseEntity.ok("Pulse check successful");
    }

}
