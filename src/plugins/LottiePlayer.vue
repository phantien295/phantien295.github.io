<template>
  <Vue3Lottie
    ref="playerRef"
    v-bind="$attrs"
    :playOnHover="true"
    :loop="false"
    @mouseenter="onMouseEnter"
    @mouseleave="onMouseLeave"
  />
</template>

<script setup>
import { ref } from "vue";
import { Vue3Lottie } from "vue3-lottie";

const playerRef = ref();

const onMouseEnter = () => {
  const player = playerRef.value;
  player.setDirection("forward");
  player.play();
};

const onMouseLeave = () => {
  const player = playerRef.value;
  player.setDirection("reverse");
  player.play();
};
</script>
