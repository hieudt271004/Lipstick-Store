package com.mystore.demo.repository;

import com.mystore.demo.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    List<Product> findByCategoryId(Long id);

    List<Product> findByBrandId(Long id);

    List<Product> findByProductNameContaining(String productName);

    List<Product> findAllByOrderByProductPriceAsc();

    List<Product> findAllByOrderByProductPriceDesc();
}
