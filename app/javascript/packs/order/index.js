import { createApp } from "vue";
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import Index from "../../components/order/Index.vue";

document.addEventListener("DOMContentLoaded", () => {
  const node = document.getElementById("orderIndex");
  const initialData = JSON.parse(node.getAttribute("data"));
  const app = createApp(Index, { initialData: initialData })
  app.use(ElementPlus);
  app.mount("#orderIndex");
});