function orderProcess() {
  const note = document.getElementById("order-note").value;
  window.location.href = window.location.origin + "/checkout/process?userShippingAddressId=1&orderNote=" + note;
}