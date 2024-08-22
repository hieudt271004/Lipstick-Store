package com.mystore.demo.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "user_address")
public class UserAddress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_address_id")
    private Long id;

    @Column(name = "receiver_name", length = 120)
    private String receiverName;

    @Column(name = "receiver_mobile", length = 15)
    private String receiverMobile;

    @Column(name = "user_address_detail")
    private String userAddressDetail;

    @Column(name = "user_address_wards")
    private String userAddressWards;

    @Column(name = "user_address_districts")
    private String userAddressDistricts;

    @Column(name = "user_address_provinces")
    private String userAddressProvinces;

    @Column(name = "default_address", length = 2)
    private boolean defaultAddress;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private User user;

    public String getFullAddress() {
        return userAddressDetail + ", " + userAddressWards + ", " + userAddressDistricts + ", " + userAddressProvinces;
    }
}