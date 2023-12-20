import { createRouter, createWebHistory } from "vue-router";
import HelloWorld from "../views/HelloWorld.vue";
import MenuBook from "../views/MenuBook.vue";
import ChatGPT from "../views/ChatGPT.vue";
import Post from "../views/Post.vue";

const routes = [
  { path: "/", component: HelloWorld },
  { path: "/menu", component: MenuBook },
  { path: "/test", component: HelloWorld },
  { path: "/gpt", component: ChatGPT },
  { path: "/posts/:title", component: Post },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
