<template>
  <h1>{{ msg }}</h1>

  <div class="card">
    <button type="button" @click="count++">count is {{ count }}</button>
    <p>
      Edit
      <code>components/HelloWorld.vue</code> to test HMR
    </p>
  </div>

  <p>
    Check out
    <a href="https://vuejs.org/guide/quick-start.html#local" target="_blank"
      >create-vue</a
    >, the official Vue + Vite starter
  </p>
  <p>
    Install
    <a href="https://github.com/johnsoncodehk/volar" target="_blank">Volar</a>
    in your IDE for a better DX
  </p>
  <p class="read-the-docs">Click on the Vite and Vue logos to learn more</p>
  <div>
    A:
    <input v-model="a" />
  </div>
  <div>
    B:
    <input v-model="b" />
  </div>
  <div>
    C:
    <input v-model="c" />
  </div>
  <popup />
  <button @click="test">Test</button>
  <LottiePlayer
    :animationLink="'https://cdn.lordicon.com/wxnxiano.json'"
    :height="50"
    :width="50"
  ></LottiePlayer>
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

defineProps({
  msg: String,
});

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

// mutating original will trigger watchers relying on the copy
// original.value.count++

// mutating the copy will fail and result in a warning
copy.value.count++; // warning!
</script>

<style scoped>
.read-the-docs {
  color: #888;
}
</style>
