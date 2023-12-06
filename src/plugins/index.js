import Popup from "./Popup.vue";
import LottiePlayer from "./LottiePlayer.vue";

export default {
  install: (app, options) => {
    app.component("Popup", Popup);

    app.component("LottiePlayer", LottiePlayer);
  },
};
