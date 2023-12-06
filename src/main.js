import { createApp } from "vue";
import App from "./App.vue";
import routes from "./routes";
import "./style.css";
// Config tailwind
import "./index.css";
import plugins from "./plugins";
import "vue3-lottie/dist/style.css";
import { createHead } from "@unhead/vue";

const app = createApp(App);
app.use(plugins);
app.use(routes);

const head = createHead();
app.use(head);

app.mount("#app");
