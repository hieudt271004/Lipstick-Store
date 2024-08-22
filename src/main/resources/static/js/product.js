window.onscroll = function () {
  if (document.body.scrollTop > 30 || document.documentElement.scrollTop > 30) {
    document.getElementById("navbar").classList.add("border-bot-shadow");
  } else {
    document.getElementById("navbar").classList.remove("border-bot-shadow");
    document.getElementById("navbar").classList.remove("border-bot-solid");
  }

  const b = document.body;
  let d = document.documentElement;
  d = (d.clientHeight) ? d : b;

  if (d.scrollTop >= 276) {
    document.getElementById("navbar").classList.add("border-bot-solid");
    document.getElementById("navbar").classList.remove("border-bot-shadow");

    document.getElementById("sub-nav").classList.add("fixed-top-sub-nav");
    document.getElementById("products").classList.add("fix-sub-nav");
  }
  if (d.scrollTop < 276) {
    document.getElementById("sub-nav").classList.remove("fixed-top-sub-nav");
    document.getElementById("products").classList.remove("fix-sub-nav");
  }
};