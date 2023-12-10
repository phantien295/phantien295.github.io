<template>
  <div
    class="flex flex-col justify-center items-center min-h-screen w-screen overflow-hidden relative"
  >
    <div
      class="flex flex-col w-[50%] min-h-[90vh] rounded-lg items-center gap-4"
    >
      <div class="rounded-full w-[200px] h-[200px] overflow-hidden">
        <img src="@/assets/avatar.jpeg" class="scale-[160%]" />
      </div>
      <div class="text-2xl font-bold">
        TIEN PHAN<br />(ファン・ミン・ティエン)
      </div>
      <carousel :slides="slides" />
    </div>
    <div>Lorem Picsum: https://picsum.photos</div>
    <img
      class="absolute left-[-1px] bottom-[10px] w-[450px] z-[-1]"
      :src="bgSvg"
    />
  </div>
</template>

<script setup>
import {
  ref,
  watchEffect,
  watchPostEffect,
  watchSyncEffect,
  readonly,
  inject,
} from "vue";
import OpenAI from "openai";
import axios from "axios";

import bgSvg from "@/assets/bg.svg";
import carousel from "@/components/carousel/Carousel.vue";

defineProps({
  msg: String,
});

const slides = [
  "https://picsum.photos/id/10/900/400",
  "https://picsum.photos/id/11/900/400",
  "https://picsum.photos/id/12/900/400",
  "https://picsum.photos/id/13/900/400",
  "https://picsum.photos/id/14/900/400",
  "https://picsum.photos/id/15/900/400",
];

const onLeave = e => {
  console.log(e);
  e.setDirection(-1);
};

const animationData = "/lotties/book-morph-outline-edited.json";

const test = inject("test");

const count = ref(0);

const a = ref(0);
const b = ref(0);
const c = ref(0);

watchEffect(() => {
  // console.log(b.value);
  // console.log(a.value);
});

const original = ref({ count: 0 });

const copy = readonly(original);

watchEffect(() => {
  // works for reactivity tracking
  // console.log(original.value.count, "watchEffect")
  console.log(copy.value.count, "watchEffect");
});

copy.value.count++; // warning!

const searchImageResponse = ref();
const imageBase64 = ref();

/**
 * shadow-[-10px_-10px_20px_rgba(255,255,255,0.25),5px_5px_24px_rgba(72,63,168,0.4)]
 */
</script>

<style scoped>
.read-the-docs {
  color: #888;
}
</style>
