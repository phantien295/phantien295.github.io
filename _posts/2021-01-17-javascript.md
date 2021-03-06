---
layout: post
title: JavaScript
category: Blog
---

#### JavaScript

##### Class

##### Object

Có thể tạo một empty object

```js
var obj = Object.create(null);
```

Hầu hết các object là instance của Object.

##### Object's prototype

Kiểm tra prototype của một object:

```js
Object.getPrototypeOf(obj);
// obj.__proto__ is deprecated

// Object.getPrototypeOf(new Foobar()) refers to the same object as Foobar.prototype
```

Mỗi object sẽ có một prototype object để thừa kế các methods và properties.

Ví dụ:
person1 inherits from prototype Person inherits from prototype Object.

Khi gọi person1.valueOf() trình duyệt sẽ kiểm tra trong constructor của Person xem có method valueOf hay không, nếu không có sẽ kiểm tra prototype của Object.

// Object.setPrototypeOf)

// the prototype property on constructor functions.

Object.create(obj) sẽ tạo object mới từ prototype object được chỉ định.

obj.constructor sẽ chỉ đến the original constructor function. Có thể tạo một object bằng constructor này.

```js
    let person2 = new person1.constructor(...);
```

instanceName.constructor.name trả về constructor name. constructor name có thể bị thay đổi, vì thế nên sử dụng instanceof.

##### Modify prototype

Person.prototype.farewell = function() {};

Khi modify prototype thì những thì phương thức mới này sẽ được tự động update cho những object instance được khởi tạo từ constructor.

Khi sử dụng delete person1.`__proto__`.farewell cũng sẽ tự động remove trên tất cả instances. Có thể sử dụng Object.defineProperty() để thay thế.

Notes:

- Function is a type of object.
- Object.prototype định nghĩa những thành phần cho phép các object khác kế thừa. `__proto__` sẽ trỏ đến prototype object của đối tượng hiện tại.

<hr class="divide-line" />

#### String

```js
/* repeat */
"a".repeat(3); // "aaa"
```

<hr class="divide-line" />

#### Array

```js
/* fill */
[0, 0, 0].fill(1); // [1, 1, 1]
[(0, 0, 0)].fill(1, 0, 1); // [1, 0, 0]
[(0, 0, 0)].fill(1, 1); // [0, 1, 1]

/* entries */
["a", "b"].entries(); // iterator [0, "a"], [1, "b"]

Array.from().map();
```

#### Map, Set, WeakMap, WeakSet

```js
/* Set
 * Không chứa phần tử trùng
 * Không báo lỗi nếu add vào phần tử đã trùng
 *
 */
let s = new Set();
s.add("a").add("b");
s.size;
s.has("a");
[...s]; // ["a", "b"]
[...new Set(["a", "b", "a"])];

for (let item of mySet1) console.log(item);
for (let item of mySet1.keys()) console.log(item);
for (let item of mySet1.values()) console.log(item);
for (let [key, value] of mySet1.entries()) console.log(key);

WeakSet chỉ chứa object, không thể get size, chỉ có add, delete và has

let m = new Map();
m.set("a", 1);
m.get("a");
```

#### Babel polyfill

#### Notes

- So sánh với chuỗi true, false: value === "true", value === "false"

#### Tips

- Remove empty strings with Boolean constructor

```js
["a", "", "b", "c"].filter(Boolean); //  ["a", "b", "c"]
```

```js
let arr = [{ id: 1 }, { id: 2 }, { id: 1 }, { id: 4 }];
let tmp = [];
arr.forEach((e, index) => (tmp[e.id] = e));
arr.filter(Boolean);

let m = new Map();
arr.forEach((e, index) => m.set(e.id, e));
[...m.values()];

check index trong array phụ nếu không có thì add vào
```
