package com.example.demo.api;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

@Controller
public class ASOIAFUiController {
  private final ASOIAFcharacterService service;

  public ASOIAFUiController(ASOIAFcharacterService service) {
    this.service = service;
  }

  // ----- Gallery with search -----
  @GetMapping({ "/", "/characters" })
  public String gallery(@RequestParam(required = false) String name,
      @RequestParam(required = false) Loyalty loyalty,
      Model model) {
    model.addAttribute("characters", service.search(name, loyalty));
    model.addAttribute("name", name == null ? "" : name);
    model.addAttribute("selectedLoyalty", loyalty == null ? "" : loyalty.name());
    return "index"; // templates/index.ftlh
  }

  // ----- Details -----
  @GetMapping("/characters/{id}")
  public String details(@PathVariable Long id, Model model) {
    try {
      ASOIAFcharacter character = service.findById(id);
      model.addAttribute("character", character);
      return "details"; // templates/details.ftlh
    } catch (RuntimeException exception) {
      model.addAttribute("errorMessage",
          exception.getMessage() == null ? "Character not found" : exception.getMessage());
      return "error"; // templates/error.ftlh
    }
  }

  // ----- Add -----
  @GetMapping("/characters/new")
  public String newForm(Model model) {
    ASOIAFcharacter character = new ASOIAFcharacter();
    model.addAttribute("character", character);
    model.addAttribute("formTitle", "Add a character");
    model.addAttribute("formAction", "/characters");
    return "new-character-form";
  }

  @PostMapping("/characters")
  public String createcharacter(@Valid @ModelAttribute ASOIAFcharacter character, MultipartFile imageFile) {
    ASOIAFcharacter createdCharacter = service.create(character);
    if (imageFile != null && !imageFile.isEmpty()) {
      service.saveThumbnail(createdCharacter, imageFile);
    }
    return "redirect:/characters/" + createdCharacter.getId();
  }

  // ----- Edit -----
  @GetMapping("/characters/{id}/edit")
  public String editForm(@PathVariable Long id, Model model) {
    ASOIAFcharacter character = service.findById(id);
    model.addAttribute("character", character);
    model.addAttribute("formTitle", "Edit character");
    model.addAttribute("formAction", "/characters/" + id);
    return "character-form";
  }

  @PostMapping("/characters/{id}")
  public String updatecharacter(@PathVariable Long id, @Valid @ModelAttribute ASOIAFcharacter character, MultipartFile imageFile) {
    ASOIAFcharacter updatedcharacter = service.update(id, character);
    if (imageFile != null && !imageFile.isEmpty()) {
      service.saveThumbnail(updatedcharacter, imageFile);
    }
    return "redirect:/characters/" + updatedcharacter.getId();
  }

  // ----- Delete -----
  @PostMapping("/characters/{id}/delete")
  public String deletecharacter(@PathVariable Long id) {
    service.delete(id);
    return "redirect:/";
  }

  @GetMapping("/about")
  public String about() {
    return "about";
  }
}