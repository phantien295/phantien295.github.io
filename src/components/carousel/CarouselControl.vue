<template>
  <button
    class="bg-[rgba(0,0,0,0.5)] inline-block absolute h-[50px] w-[70px] top-[calc(50%-25px)] text-[#f3f3f3] cursor-pointer rounded-none border-none hover:outline-none focus:outline-none left-0"
    @click="onClickPrev"
  >
    Prev
  </button>
  <button
    class="bg-[rgba(0,0,0,0.5)] inline-block absolute h-[50px] w-[70px] top-[calc(50%-25px)] text-[#f3f3f3] cursor-pointer rounded-none border-none hover:outline-none focus:outline-none right-0"
    @click="onClickNext"
  >
    Next
  </button>
</template>

<script setup>
const emit = defineEmits(["prev", "next"]);

const onClickPrev = () => {
  emit("prev");
};

const onClickNext = () => {
  emit("next");
};
</script>
