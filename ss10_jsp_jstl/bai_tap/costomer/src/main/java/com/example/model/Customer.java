package com.example.model;

public class Customer {
    private String name;
    private String dayofbirth;
    private String address;
    private String image;

    public Customer() {
    }

    public Customer(String name, String dayofbirth, String address, String image) {
        this.name = name;
        this.dayofbirth = dayofbirth;
        this.address = address;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDayofbirth() {
        return dayofbirth;
    }

    public void setDayofbirth(String dayofbirth) {
        this.dayofbirth = dayofbirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
