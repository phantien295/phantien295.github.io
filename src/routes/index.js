import { createRouter, createWebHistory } from "vue-router";
import HelloWorld from "../views/HelloWorld.vue";
import MenuBook from "../views/MenuBook.vue";
import ChatGPT from "../views/ChatGPT.vue";

const routes = [
  { path: "/", component: HelloWorld },
  { path: "/menu", component: MenuBook },
  { path: "/test", component: HelloWorld },
  { path: "/gpt", component: ChatGPT },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
