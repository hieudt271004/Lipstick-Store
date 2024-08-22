package com.mystore.demo.controller;

import jakarta.servlet.http.HttpSession;
import com.mystore.demo.entity.*;
import com.mystore.demo.service.OrderService;
import com.mystore.demo.service.UserAddressService;
import com.mystore.demo.service.UserService;
import com.mystore.demo.util.DateTimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

import static com.mystore.demo.constant.IConstant.*;

@Controller
@RequestMapping("checkout")
public class CheckoutController {

    private final UserService userService;
    private final UserAddressService userAddressService;
    private final OrderService orderService;

    @Autowired
    public CheckoutController(UserService userService, UserAddressService userAddressService, OrderService orderService) {
        this.userService = userService;
        this.userAddressService = userAddressService;
        this.orderService = orderService;
    }

    @GetMapping("")
    public String checkout(Authentication auth, Model model) {
        AuthUser authUser = (AuthUser) auth.getPrincipal();
        User user = userService.findByUsername(authUser.getUsername());
        UserAddress defaultAddress = userAddressService.getUserDefaultAddress(user.getUserAddressList());

        model.addAttribute("user", user);
        model.addAttribute("defaultAddress", defaultAddress);
        return "pages/product/checkout";
    }

    @GetMapping("/process")
    public String orderProcess(
            @RequestParam String orderNote,
            @RequestParam Long userShippingAddressId,
            Authentication auth,
            HttpSession session
    ) {
        AuthUser authUser = (AuthUser) auth.getPrincipal();
        User user = userService.findByUsername(authUser.getUsername());

        Order order = new Order();
        order.setUser(user);
        order.setOrderCreatedAt(DateTimeUtil.getCurrentDateTime());
        order.setOrderStatus(new OrderStatus(1L, null, null));
        order.setOrderDiscount(0);
        order.setOrderTotalAmount(Double.parseDouble(session.getAttribute(TOTAL_AMOUNT_OF_CART).toString()));
        order.setOrderNote(orderNote);

        UserAddress userAddress = userAddressService.getUserShippingAddress(user.getUserAddressList(), userShippingAddressId);
        order.setReceiverName(userAddress.getReceiverName());
        order.setReceiverMobile(userAddress.getReceiverMobile());
        order.setShippingAddress(userAddress.getFullAddress());

        order.setOrderDetailList(getOrderDetailList((List<Item>) session.getAttribute(CART), order));

        Order savedOrder = orderService.save(order);
        if (savedOrder != null) {
            session.removeAttribute(CART);
            session.removeAttribute(TOTAL_PRODUCT_IN_CART);
            session.removeAttribute(TOTAL_AMOUNT_OF_CART);
        }
        return "thanks";
    }

    private List<OrderDetail> getOrderDetailList(List<Item> items, Order order) {

        List<OrderDetail> orderDetailList = new ArrayList<>();
        for (Item item : items) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setProductId(item.getId());
            orderDetail.setProductName(item.getName());
            orderDetail.setProductColor(item.getColor());
            orderDetail.setProductImage(item.getImage());
            orderDetail.setProductPrice(item.getPrice());
            orderDetail.setQuantity(item.getQuantity());
            orderDetail.setAmount(item.getAmount());
            orderDetail.setOrder(order);

            orderDetailList.add(orderDetail);
        }
        return orderDetailList;
    }

}
