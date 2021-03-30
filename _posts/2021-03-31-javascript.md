---
layout: post
title: Javascript
category: Blog
---

##### Promise

Promise chain:

Có thể catch sau mỗi then nhưng then sau catch vẫn được thực hiện.

Có thể `throw err` trong catch để then tiếp theo không được thực hiện, nhưng catch kế tiếp sẽ được thực hiện.

Để tránh nested, có thể dùng then hoặc await

```js
try {
  let data1 = await callFirstApi().then((rs) => rs.data);
  let data2 = await callSecondApi().then((rs) => rs.data);
} catch (err) {
  console.log(err);
}
```
