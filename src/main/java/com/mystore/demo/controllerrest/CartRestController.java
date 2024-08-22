package com.mystore.demo.controllerrest;

import jakarta.servlet.http.HttpSession;
import com.mystore.demo.constant.IConstant;
import com.mystore.demo.entity.Item;
import com.mystore.demo.entity.Product;
import com.mystore.demo.service.ItemService;
import com.mystore.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.mystore.demo.constant.IConstant.*;

@RestController
@RequestMapping("api/public/cart")
public class CartRestController {

    private final ProductService productService;
    private final ItemService itemService;

    @Autowired
    public CartRestController(ProductService productService, ItemService itemService) {
        this.productService = productService;
        this.itemService = itemService;
    }

    @GetMapping("/item/add")
    public ResponseEntity<Map<String, Object>> addToCart(
            @RequestParam Long productId,
            @RequestParam int quantity,
            HttpSession session
    ) {
        return addToCartProcess(productId, quantity, session);
    }

    @SuppressWarnings("unchecked")
    private ResponseEntity<Map<String, Object>> addToCartProcess(Long productId, int quantity, HttpSession session) {

        Product product = productService.findById(productId).orElse(null);
        if (product != null) {
            Item item = Item.builder()
                    .id(productId)
                    .name(product.getProductName())
                    .color(product.getProductColor())
                    .image(product.getProductImage())
                    .price(product.getProductPrice())
                    .quantity(quantity)
                    .amount(product.getProductPrice() * quantity)
                    .build();

            List<Item> cart = (List<Item>) session.getAttribute(CART);
            if (cart == null) {
                cart = new ArrayList<>();
                cart.add(item);
            } else {
                boolean isExist = false;
                for (Item i : cart) {
                    if (i.getId().equals(item.getId())) {
                        i.setQuantity(i.getQuantity() + quantity);
                        i.setAmount(i.getQuantity() * i.getPrice());
                        isExist = true;
                    }
                }
                if (!isExist) {
                    cart.add(item);
                }
            }
            session.setAttribute(IConstant.CART, cart);

            int totalProduct = itemService.countTotalProductQuantity(cart);
            double totalAmount = itemService.countTotalProductAmount(cart);
            session.setAttribute(TOTAL_PRODUCT_IN_CART, totalProduct);
            session.setAttribute(TOTAL_AMOUNT_OF_CART, totalAmount);

            Map<String, Object> response = new HashMap<>();
            response.put(CART, cart);
            response.put(TOTAL_PRODUCT_IN_CART, totalProduct);
            response.put(TOTAL_AMOUNT_OF_CART, totalAmount);
            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
    }
}
