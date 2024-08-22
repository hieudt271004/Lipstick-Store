package com.mystore.demo.controller;

import com.mystore.demo.exception.BrandNotFoundException;
import com.mystore.demo.exception.ProductNotFoundException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

//@ControllerAdvice
public class GlobalExceptionHandlerController {

    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public String handleException(Exception e) {
        return "error400";
    }

    @ExceptionHandler({ProductNotFoundException.class, BrandNotFoundException.class})
    public String handleNotFoundException(Exception e) {
        return "error404";
    }

    @ExceptionHandler(Exception.class)
    public String defaultErrorHandler(Exception e) {
        return "error500";
    }
}
