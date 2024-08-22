function confirmDeleteItemInCart(itemId) {
  document.getElementById("confirm-modal-content").innerText = "Xác nhận xoá sản phẩm này khỏi giỏ hàng?";
  document.getElementById("btn-confirm-modal").href = window.location.origin + "/cart/item/delete/" + itemId;
  openModal("confirmModal");
}

function confirmDeleteCart() {
  document.getElementById("confirm-modal-content").innerText = "Xác nhận xoá giỏ hàng?";
  document.getElementById("btn-confirm-modal").href = window.location.origin + "/cart/delete";
  openModal("confirmModal");
}
