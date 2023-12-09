<template>
  <div class="flex flex-col items-center justify-center gap-2">
    <div class="flex flex-col p-2 justify-center items-center gap-2">
      <button @click="searchImage">Search</button>
      <div>
        {{ searchImageResponse }}
      </div>
    </div>
    <a
      href="https://publuu.com/flip-book/322026/742792/page/1?cover"
      target="_blank"
      style="
        width: auto;
        height: 240px;
        position: relative;
        display: inline-block;
      "
      ><img
        src="https://p6aqvvqp5i.execute-api.us-east-2.amazonaws.com/images/cover/322026/742792"
        style="height: 100%"
    /></a>
    <div class="flex gap-2">
      <div class="p-2 border rounded-full">
        <LottiePlayer
          :animationData="QRCodeJSON"
          :height="50"
          :width="50"
        ></LottiePlayer>
      </div>
      <div class="p-2 border rounded-full">
        <LottiePlayer
          :animationData="CameraJSON"
          :height="50"
          :width="50"
        ></LottiePlayer>
      </div>
      <div class="p-2 border rounded-full">
        <LottiePlayer
          :animationData="QRCodeJSON"
          :height="50"
          :width="50"
        ></LottiePlayer>
      </div>
    </div>
    <div class="flex gap-2">
      <div class="p-2 border rounded-full">
        <LottiePlayer
          :animationLink="'https://cdn.lordicon.com/wxnxiano.json'"
          :height="50"
          :width="50"
        ></LottiePlayer>
      </div>
      <div class="p-2 border rounded-full">
        <LottiePlayer
          :animationData="ApiJSON"
          :height="50"
          :width="50"
        ></LottiePlayer>
      </div>
      <div class="p-2 border rounded-full">
        <LottiePlayer
          :animationData="BookJSON"
          :height="50"
          :width="50"
        ></LottiePlayer>
      </div>
    </div>
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
import BookJSON from "../assets/lotties/book-morph-outline-edited.json";
import CameraJSON from "../assets/lotties/wired-outline-61-camera.json";
import QRCodeJSON from "../assets/lotties/wired-outline-1335-qr-code.json";
import ApiJSON from "../assets/lotties/wired-outline-1330-rest-api.json";

import OpenAI from "openai";
import axios from "axios";

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

const searchImageResponse = ref();
const imageBase64 = ref();

const searchImage = async () => {
  try {
    const openai = new OpenAI({
      apiKey: "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",
      dangerouslyAllowBrowser: true,
    });

    const { data } = await openai.images.generate({
      model: "dall-e-3",
      prompt: "pokemon gengar flat design",
      response_format: "b64_json",
    });
    searchImageResponse.value = data;
    imageBase64.value = data[0].b64_json;

    await upload();
  } catch (error) {
    console.log(error);
  }
};

const upload = async () => {
  const apiKey = "a7_VBgMCHp3L_T63L9a4pNFRuMQ";
  const cloudName = "dgxh8lvu2";
  const presets = "chmpjnu9";
  const endpoint = `https://api.cloudinary.com/v1_1/${cloudName}/image/upload`;

  try {
    const formData = new FormData();
    formData.append("file", "data:image/png;base64," + imageBase64.value);
    formData.append("api_key", apiKey);
    formData.append("upload_preset", presets);
    const { data } = await axios.post(endpoint, formData);
    /**
     {
      "asset_id": "9df88062d3ae07711ed2172dd13c2d7c",
      "public_id": "test/e0gdwkvwjca9i0tepaps",
      "version": 1701634057,
      "version_id": "edadae4b41db883d52570cea6ff33c65",
      "signature": "165956fa5c38488118c56fce231226e6d9fc3ee4",
      "width": 1024,
      "height": 1024,
      "format": "webp",
      "resource_type": "image",
      "created_at": "2023-12-03T20:07:37Z",
      "tags": [],
      "pages": 1,
      "bytes": 46524,
      "type": "upload",
      "etag": "eb47444330910224f9cb132ac05c9be2",
      "placeholder": false,
      "url": "http://res.cloudinary.com/dgxh8lvu2/image/upload/v1701634057/test/e0gdwkvwjca9i0tepaps.webp",
      "secure_url": "https://res.cloudinary.com/dgxh8lvu2/image/upload/v1701634057/test/e0gdwkvwjca9i0tepaps.webp",
      "folder": "test",
      "access_mode": "public"
    }
     **/
  } catch (error) {
    console.log(error);
  }
};
</script>

<style scoped>
.read-the-docs {
  color: #888;
}
</style>
