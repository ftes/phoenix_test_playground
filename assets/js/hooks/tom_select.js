import TomSelect from "tom-select";

export default {
  mounted() {
    const config = JSON.parse(this.el.dataset.config || "{}");
    this.el.parentNode.setAttribute("phx-update", "ignore");
    new TomSelect(this.el, config);
  },
};
