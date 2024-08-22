package com.mystore.demo.exception;

public class BrandNotFoundException extends RuntimeException {

    public BrandNotFoundException(String message) {
        super(message);
    }
}
