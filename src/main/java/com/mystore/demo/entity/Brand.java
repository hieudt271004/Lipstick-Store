package com.mystore.demo.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "brand")
public class Brand {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "brand_id")
    private Long id;

    @Column(name = "brand_name", nullable = false)
    private String brandName;

    @Column(name = "brand_description")
    private String brandDescription;

    @OneToMany(mappedBy = "brand", cascade = CascadeType.ALL)
    private List<Product> products;
}
