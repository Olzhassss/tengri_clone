try {
  btn;
} catch (e) {
  const btn = document.getElementById("search-button");
  if (!btn.dataset.listener) {
    btn.dataset.listener = true;
    btn.addEventListener("click", function listener(ev) {
      div = document.getElementById("search-container");
      if (ev.target.classList.contains("active")) {
        ev.target.classList.remove("active");
        div.classList.remove("active");
      } else {
        ev.target.classList.add("active");
        div.classList.add("active");
      }
    });
  }
}
