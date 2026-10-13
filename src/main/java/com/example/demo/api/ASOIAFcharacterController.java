package com.example.demo.api;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;

import java.util.List;

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
