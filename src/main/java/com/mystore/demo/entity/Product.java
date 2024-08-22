package com.mystore.demo.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private Long id;

    @Column(name = "product_name", nullable = false, unique = true)
    private String productName;

    @Column(name = "product_color", nullable = false)
    private String productColor;

    @Column(name = "product_image", nullable = false)
    private String productImage;

    @Column(name = "product_price", nullable = false)
    private double productPrice;

    @Column(name = "product_quantity", nullable = false)
    private int productQuantity;

    @Column(name = "product_short_description")
    private String productShortDescription;

    @Column(name = "product_description")
    private String productDescription;

    @ManyToOne
    @JoinColumn(name = "category_id", referencedColumnName = "category_id")
    private Category category;

    @ManyToOne
    @JoinColumn(name = "brand_id", referencedColumnName = "brand_id")
    private Brand brand;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
    private List<ProductImage> productImageList;
}
