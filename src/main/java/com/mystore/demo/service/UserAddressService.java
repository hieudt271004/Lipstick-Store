package com.mystore.demo.service;

import com.mystore.demo.entity.UserAddress;

import java.util.List;

public interface UserAddressService {

    UserAddress getUserDefaultAddress(List<UserAddress> userAddressList);

    UserAddress getUserShippingAddress(List<UserAddress> userAddressList, Long userShippingAddressId);
}
