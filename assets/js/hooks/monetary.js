export default {
  mounted() {
    this.el.parentNode.setAttribute("phx-update", "ignore");
    this.el.type = "hidden";
    const hiddenInput = this.el;

    const presentationInput = document.createElement("input");
    presentationInput.classList = hiddenInput.classList;
    this.el.parentNode.insertBefore(presentationInput, this.el);

    if (hiddenInput.value && presentationInput.value !== "n/a") {
      const formatted = parseFloat(hiddenInput.value / 100);
      presentationInput.value = formatVal(formatted);
    }

    presentationInput.addEventListener("change", () => {
      const string = presentationInput.value.replace(/[^0-9.-]+/g, "");
      const cents = Math.round(parseFloat(string) * 100);

      if (isNaN(cents)) {
        presentationInput.value = "";
        hiddenInput.value = "";
      } else {
        presentationInput.value = formatVal(cents / 100);
        hiddenInput.value = cents;
      }

      hiddenInput.dispatchEvent(new Event("input", { bubbles: true }));
    });
  },
};

function formatVal(formatted) {
  return formatted.toLocaleString("en", {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  });
}
