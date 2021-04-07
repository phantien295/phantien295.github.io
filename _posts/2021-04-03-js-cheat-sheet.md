---
layout: post
title: JS Cheat Sheet
category: Javascript
---

#### ...

```js
/* void expression => undefined */
void (2 == 2) // undefined

/* Optional chaining (?.) */
// Trả về undefined nếu val, arr, func là null hoặc undefined (nullish value)
obj.val?.prop
obj.val?.[expr]
obj.arr?.[index]
obj.func?.(args)

/* Nullish coalescing operator (??) */
// leftExpr ?? rightExpr: trả về biểu thức bên phải nếu biểu thức bên trái trả về null hoặc undefined
const foo = str ?? 'default string';

/* Using || to assign a default value */
// Notes: 0, '', NaN, null, undefined => false
0 || 0 // => 0
0 || 'text' // => 'text'

```

<hr class="divide-line" />

##### CSS in JS

- Styled components: tạo component với css được tạo cùng code JS\
<a href="https://styled-components.com">https://styled-components.com</a>

##### ...
