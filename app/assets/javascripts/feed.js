try {
  els;
} catch (e) {
  els = document.getElementsByClassName("feed-link");
  for (let el of els) {
    console.log("asdasd");
    el.addEventListener("click", (e) => {
      for (let element of els) {
        element.classList.remove("active");
      }
      e.target.classList.add("active");
    });
  }
}
