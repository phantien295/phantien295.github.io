---
layout: post
title: Test With Jest
category: Javascript
---

<i class="fa fa-asterisk text--green" aria-hidden="true"></i> Install\

```js
yarn init -y

yarn add --dev jest

yarn add --dev babel-core babel-jest babel-preset-env
```
```json
{
  "name": "jest",
  "version": "1.0.0",
  "main": "index.js",
  "license": "MIT",
  "type": "module",
  "scripts": {
    "test": "jest"
  },
  "devDependencies": {
    "@babel/preset-env": "^7.13.15",
    "babel-core": "^6.26.3",
    "babel-jest": "^26.6.3",
    "babel-preset-env": "^1.7.0",
    "jest": "^26.6.3"
  }
}
```

```
touch .babelrc
{
  "presets": [
    "@babel/preset-env"
  ]
}
```

Sử dụng toEqual để compare array và object

```js
const result = {
  value: Date.now()
}

expect(result).toEqual({
  value: expect.any(Number)
});
```

<i class="fa fa-asterisk text--green" aria-hidden="true"></i> snapshot test\
run lần đầu để tạo ra một snapshot, ở những lần sau sẽ kiểm tra xem data hay ui có thay đổi so với snapshot đã lưu hay không.

https://jestjs.io/
