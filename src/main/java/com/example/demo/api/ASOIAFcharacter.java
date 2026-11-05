package com.example.demo.api;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity 
@Table(name = "characters")
public class ASOIAFcharacter {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long characterId;

    @NotBlank 
    private String name;

    @NotNull 
    private String title;

    @NotNull 
    private String summary;

    @NotNull 
    private String description;

    @NotNull 
    private Loyalty loyalty;

    @NotNull 
    private boolean knight;

    private String thumbnailUrl;

    public Long getId() {
        return characterId;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Loyalty getLoyalty() {
        return loyalty;
    }

    public void setLoyalty(Loyalty loyalty){
        this.loyalty = loyalty;
    }

    public boolean isKnight() {
        return knight;
    }

    public void setKnight(boolean knight) {
        this.knight = knight;
    }

    
    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl) {
        this.thumbnailUrl = thumbnailUrl;

    }

}
