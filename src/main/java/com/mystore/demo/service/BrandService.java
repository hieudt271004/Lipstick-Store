package com.mystore.demo.service;

import com.mystore.demo.entity.Brand;

import java.util.List;
import java.util.Optional;

public interface BrandService {

    List<Brand> findAll();

    Optional<Brand> findById(Long brandId);
}