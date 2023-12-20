<template>
  <div
    class="flex flex-col justify-center items-center min-h-screen w-screen overflow-hidden relative"
  >
    <div
      class="flex flex-col w-[50%] min-h-[90vh] rounded-lg items-center gap-4"
    >
      <div class="font-bold">Tomcat 7</div>
      <br />
      <a href="https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.99/bin/"
        >https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.99/bin/</a
      >
      <p>
        Error: Could not find or load main class
        org.apache.catalina.startup.Bootstrap Solution:
      </p>
      <p>Download source từ folder bin thay vì src</p>
      <div class="relative">
        <div class="absolute top-0 right-0 bg-[gray] text-white p-1 px-2 cursor-pointer hover:text-[#000]" @click="copy">Copy</div>
        <pre class="bg-[#d3d6db] p-3 text-base break-word rounded" ref="copyRef">
          {{ `
              <?xml version="1.0" encoding="UTF-8"?>
              <tomcat-users xmlns="http://tomcat.apache.org/xml"
                  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                  xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
                  version="1.0">
                <role rolename="admin"/>
                <role rolename="tomcat"/>
                <role rolename="manager-gui"/>
                <role rolename="manager-jmx"/>
                <role rolename="manager-status"/>
                <user username="tomcat" password="tomcat" roles="tomcat,manager-status,manager-gui,manager-jmx"/>
              </tomcat-users>

              -Dcom.sun.management.jmxremote.port=9999
              -Dcom.sun.management.jmxremote.authenticate=false
              -Dcom.sun.management.jmxremote.ssl=false
          ` }}
        </pre>
      </div>
    </div>
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

// const copy = readonly(original);

// watchEffect(() => {
//   // works for reactivity tracking
//   // console.log(original.value.count, "watchEffect")
//   console.log(copy.value.count, "watchEffect");
// });

// copy.value.count++; // warning!

const searchImageResponse = ref();
const imageBase64 = ref();

/**
 * shadow-[-10px_-10px_20px_rgba(255,255,255,0.25),5px_5px_24px_rgba(72,63,168,0.4)]
 */

const copyRef = ref();
const copy = () => {
  const range = document.createRange();
  range.selectNode(copyRef.value);
  window.getSelection().removeAllRanges();
  window.getSelection().addRange(range);

  document.execCommand("copy");
  window.getSelection().removeAllRanges();
}

// https://www.codewithfaraz.com/content/164/create-a-code-snippet-box-with-copy-functionality
// https://docs.oracle.com/javadb/10.10.1.2/adminguide/radminjmxenabledisable.html
// ping -p 8080 127.0.0.1
</script>

<style scoped>
.read-the-docs {
  color: #888;
}
</style>
