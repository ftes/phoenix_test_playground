import TomSelect from "tom-select";

export default {
  mounted() {
    this.el.parentNode.setAttribute("phx-update", "ignore");
    new TomSelect(this.el, {});
  },
};
