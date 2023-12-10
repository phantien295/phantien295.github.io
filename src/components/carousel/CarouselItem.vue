<template>
  <transition :name="transitionEffect">
    <div
      class="absolute top-0 bottom-0 left-0 right-0"
      v-show="props.currentSlide === props.index"
    >
      <img :src="props.slide" />
    </div>
  </transition>
</template>

<script setup>
import { ref, watchEffect } from "vue";

const props = defineProps({
  slide: String,
  currentSlide: Number,
  index: Number,
  direction: String,
});

const transitionEffect = ref("slide-in");

watchEffect(() => {
  transitionEffect.value =
    props.direction === "left" ? "slide-in" : "slide-out";
});
</script>

<style scoped>
.slide-in-enter-active,
.slide-in-leave-active {
  transition: all 1s ease-in-out;
}

.slide-in-enter-from {
  transform: translateX(-100%);
}

.slide-in-leave-to {
  transform: translateX(100%);
}

.slide-out-enter-active,
.slide-out-leave-active {
  transition: all 1s ease-in-out;
}

.slide-out-enter-from {
  transform: translateX(100%);
}

.slide-out-leave-to {
  transform: translateX(-100%);
}
</style>
