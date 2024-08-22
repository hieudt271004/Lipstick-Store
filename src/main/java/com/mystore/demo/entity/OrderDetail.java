package com.mystore.demo.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "order_detail")
public class OrderDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_detail_id")
    private Long id;

    @Column(name = "product_id")
    private Long productId;

    @Column(name = "product_name", nullable = false, unique = true)
    private String productName;

    @Column(name = "product_color", nullable = false)
    private String productColor;

    @Column(name = "product_image", nullable = false)
    private String productImage;

    @Column(name = "product_price", nullable = false)
    private double productPrice;

    @Column(name = "quantity", nullable = false)
    private int quantity;

    @Column(name = "amount", nullable = false)
    private double amount;

    @ManyToOne
    @JoinColumn(name = "order_id", referencedColumnName = "order_id")
    private Order order;
}
