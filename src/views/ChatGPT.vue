<template>
  <div class="flex flex-col items-center justify-center gap-2">
    <div class="flex flex-col p-2 justify-center items-center gap-2">
      <textarea v-model="jsonInput">

      </textarea>
      <button @click="searchImage">Search Image</button>
      <button @click="searchContent">Search Content</button>
      <button @click="formatInput">Format Input</button>
      <div class="max-w-[70%]">
        {{ loading ? "LOADING..." : searchContentResponse }}
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

import OpenAI from "openai";
import axios from "axios";

// const openai = ref();

const searchImageResponse = ref();
const searchContentResponse = ref();
const imageBase64 = ref();
const loading = ref(false);

const jsonInput = ref();

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

const searchContent = async () => {
  try {
    loading.value = true;

    const inputValue =
      "7 sai lầm khi sài máy giặt và gơị ý nội dung hình ảnh, trả kết quả về dạng javascript object";

    const openai = new OpenAI({
      apiKey: "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",
      dangerouslyAllowBrowser: true,
    });

    const stream = await openai.beta.chat.completions.stream({
      model: "gpt-4",
      messages: [
        {
          role: "user", // user or assistant, system
          content: inputValue,
        },
      ],
      stream: true,
    });
    const chatCompletion = await stream.finalChatCompletion();
    console.log(chatCompletion);
    searchContentResponse.value = JSON.parse(
      chatCompletion.choices[0].message.content
    );
  } catch (error) {
    console.log(error);
  } finally {
    loading.value = false;
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

const formatInput = () => {
  const jsonData = JSON.parse(jsonInput.value);
  searchContentResponse.value = jsonData;

  console.log(Object.keys(jsonData[0]));
}
</script>
