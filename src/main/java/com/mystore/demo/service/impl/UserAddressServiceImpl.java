package com.mystore.demo.service.impl;

import com.mystore.demo.entity.UserAddress;
import com.mystore.demo.service.UserAddressService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class UserAddressServiceImpl implements UserAddressService {

    @Override
    public UserAddress getUserDefaultAddress(List<UserAddress> userAddressList) {
        for (UserAddress userAddress : userAddressList) {
            if (userAddress.isDefaultAddress()) {
                return userAddress;
            }
        }
        return null;
    }

    @Override
    public UserAddress getUserShippingAddress(List<UserAddress> userAddressList, Long userShippingAddressId) {
        for (UserAddress userAddress : userAddressList) {
            if (Objects.equals(userAddress.getId(), userShippingAddressId)) {
                return userAddress;
            }
        }
        return null;
    }
}
