<template>
  <div class="flex justify-center">
    <div class="relative w-[900px] h-[400px] overflow-hidden">
      <carousel-item
        v-for="(slide, index) in props.slides"
        :key="index"
        :slide="slide"
        :current-slide="currentSlide"
        :index="index"
        :direction="direction"
      />
      <carousel-control @prev="onClickPrev" @next="onClickNext" />
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount } from "vue";
import CarouselItem from "./CarouselItem.vue";
import CarouselControl from "./CarouselControl.vue";

const props = defineProps({
  slides: {
    type: Array,
  },
});

const currentSlide = ref(0);
const slideInterval = ref();
const direction = ref("");

const onClickPrev = () => {
  direction.value = "left";
  const index =
    currentSlide.value === 0 ? props.slides.length - 1 : currentSlide.value - 1;
  currentSlide.value = index;
};

const onClickNext = () => {
  direction.value = "right";
  const index =
    currentSlide.value < props.slides.length - 1 ? currentSlide.value + 1 : 0;
  currentSlide.value = index;
};

onMounted(() => {
  // slideInterval.value = setInterval(() => {
  //   const index =
  //     currentSlide.value < props.slides.length - 1 ? currentSlide.value + 1 : 0;
  //   currentSlide.value = index;
  // }, 3000);
});

onBeforeUnmount(() => {
  clearInterval(slideInterval.value);
});
</script>

<style scoped></style>
