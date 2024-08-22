package com.mystore.demo.controller;

import jakarta.servlet.http.HttpSession;
import com.mystore.demo.entity.Item;
import com.mystore.demo.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static com.mystore.demo.constant.IConstant.*;

@Controller
@RequestMapping("cart")
public class CartController {

    private final ItemService itemService;

    @Autowired
    public CartController(ItemService itemService) {
        this.itemService = itemService;
    }

    @GetMapping("")
    public String goToCart(Model model) {
        return "pages/product/cart";
    }

    @GetMapping("/delete")
    public String deleteCart(HttpSession session) {
        clearCart(session);
        return "pages/product/cart";
    }

    @GetMapping("/item/delete/{itemId}")
    public String deleteItemInCart(@PathVariable Long itemId, HttpSession session) {
        List<Item> items = (List<Item>) session.getAttribute(CART);
        items.removeIf(item -> item.getId().equals(itemId));
        if (items.isEmpty()) {
            clearCart(session);
        } else {
            session.setAttribute(CART, items);
            session.setAttribute(TOTAL_PRODUCT_IN_CART, itemService.countTotalProductQuantity(items));
            session.setAttribute(TOTAL_AMOUNT_OF_CART, itemService.countTotalProductAmount(items));
        }
        return "pages/product/cart";
    }

    private void clearCart(HttpSession session) {
        session.removeAttribute(CART);
        session.removeAttribute(TOTAL_PRODUCT_IN_CART);
        session.removeAttribute(TOTAL_AMOUNT_OF_CART);
    }
}
