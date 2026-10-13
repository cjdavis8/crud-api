package com.example.demo.api;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ASOIAFrepository extends JpaRepository<ASOIAFcharacter, Long> {

    // 
    List<ASOIAFcharacter> findByLoyalty(Loyalty loyalty);

    List<ASOIAFcharacter> findByKnight(boolean knight);

    //partial case-insensitive matching
    List<ASOIAFcharacter> findByNameContainingIgnoreCase(String name);

    List<ASOIAFcharacter> findByNameContainingIgnoreCaseAndLoyalty(String name, Loyalty loyalty);

    
}