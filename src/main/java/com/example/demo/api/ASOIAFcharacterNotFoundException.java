package com.example.demo.api;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class ASOIAFcharacterNotFoundException extends RuntimeException {
    public ASOIAFcharacterNotFoundException(Long id) {
        super("Character " + id + " not found");
    }
}
