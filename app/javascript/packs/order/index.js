import { createApp } from "vue";
import Index from "../../components/order/Index.vue";

document.addEventListener("DOMContentLoaded", () => {
  const node = document.getElementById("orderIndex");
  const initialData = JSON.parse(node.getAttribute("data"));
  const app = createApp(Index, { initialData: initialData })
  app.mount("#orderIndex");
});