function updateProductQuantity(btnType) {
  const quantityStr = document.getElementById("quantity-number").value;
  const quantityStockStr = document.getElementById("quantity-stock").innerText;

  let quantity = parseInt(quantityStr);
  let quantityStock = parseInt(quantityStockStr);
  if (btnType === 0) {
    if (quantity > 1) {
      quantity--;
    } else {
      document.getElementById("toast-error-content").innerText = "Số lượng sản phẩm không thể ít hơn 1";
      showToast("toast-error");
    }
  } else {
    if (quantity < quantityStock) {
      quantity++;
    } else {
      document.getElementById("toast-error-content").innerText = "Số lượng sản phẩm không thể nhiều hơn " + quantityStock;
      showToast("toast-error");
    }
  }
  document.getElementById("quantity-number").value = quantity;
}

function addToCart(productId) {
  const quantityStr = document.getElementById("quantity-number").value;
  const quantityStockStr = document.getElementById("quantity-stock").innerText;

  const apiUrl = window.location.origin + "/api/public/cart/item/add?productId=" + productId + "&quantity=" + quantityStr;
  fetch(apiUrl)
    .then(response => {
      if (!response.ok) {
        throw new Error("Network response was not ok " + response.statusText);
      }
      return response.json();
    })
    .then(data => {
      document.getElementById("quantity-stock").innerText = "" + (parseInt(quantityStockStr) - parseInt(quantityStr));
      document.getElementById("quantity-item-in-cart").innerText = data.totalProductInCart;
      document.getElementById("toast-success-content").innerText = "Thêm sản phẩm vào giỏ hàng thành công.";
      showToast("toast-success");
      console.log(data);
      showListItemInCart(data.cart);
    })
    .catch(error => {
      handlerCommonError(error);
    });
}

function showListItemInCart(items) {
  let content = `<li>
                          <h6 class="dropdown-header">Sản phẩm mới thêm</h6>
                        </li>
                        <li class="px-3 item">`;
  items.forEach(item => {
    content += `<div class="d-flex justify-content-between align-items-center py-2">
                  <div class="d-flex align-items-center">
                    <img class="rounded-2" src="/images/products/${item.image}" width="50" alt="" />
                    <div>
                      <p class="ms-2 my-0 text-secondary-emphasis" data-bs-toggle="tooltip" title="${item.name}">
                        <span>${item.name.substring(0, 35) + '...'}</span>
                      </p>
                      <p class="ms-2 my-0 text-secondary-emphasis" style="font-size: 14px;">
                        Số lượng: <span>${item.quantity}</span>
                      </p>
                    </div>
                  </div>
                  <div>
                    <p class="ms-2 my-0 text-secondary-emphasis" style="font-size: 14px;">
                      <span>${formatCurrency(item.amount)}</span><sup>đ</sup>
                    </p>
                  </div>
                </div>`;
  });
  content = content + `
                <li>
                  <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item text-end" href="/cart">Xem giỏ hàng</a></li>`;
  document.querySelector(".items").style.width = "350px";
  document.querySelector(".items").innerHTML = content;
}

function formatCurrency(number) {
  let reversedNumber = number.toString().split('').reverse().join('');
  let reversedFormattedNumber = reversedNumber.replace(/(\d{3})(?=\d)/g, '$1.');
  return reversedFormattedNumber.split('').reverse().join('');
}

/*
 * Slide images
 */
let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("slides");
  let dots = document.getElementsByClassName("demo");
  if (n > slides.length) {
    slideIndex = 1
  }
  if (n < 1) {
    slideIndex = slides.length
  }
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}
