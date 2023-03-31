---
layout: post
title: Advanced React
category: Blog
---
#### Accessibility

https://reactjs.org/docs/accessibility.html

#### Portals

#### Context

Context cung cấp một phương pháp để pass xuống các component con mà không cần phải pass props.

https://reactjs.org/docs/context.html

##### API



##### Caveats

##### Legacy API

#### Fragments

Dùng để group các children elements mà không thêm các extra nodes đến DOM.

```js
<React.Fragment>
  <td>Hello</td>
  <td>World</td>
</React.Fragment>

// Short syntax
<>
  <td>Hello</td>
  <td>World</td>
</>
```

Có thể sử dụng `<></>` tương tự như các element khác ngoài trừ không support keys hoặc attributes.
Khi sử dụng `<React.Fragment>` syntax thì chỉ có thể passed key attribute.

```js
<React.Fragment key={item.id}>
  <dt>{item.term}</dt>
  <dd>{item.description}</dd>
</React.Fragment>
```
