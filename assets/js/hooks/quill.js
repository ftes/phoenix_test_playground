import Quill from "quill";

export default {
  async mounted() {
    this.el.type = "hidden";
    this.el.parentNode.setAttribute("phx-update", "ignore");

    const quillEl = document.createElement("div");
    this.el.parentNode.insertBefore(quillEl, this.el);

    const quill = new Quill(quillEl);
    quill.setContents(JSON.parse(this.el.value || "{}"));

    quill.on("text-change", () => {
      this.el.value = JSON.stringify(quill.getContents());
    });
  },
};
