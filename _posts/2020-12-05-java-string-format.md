---
layout: post
title: String format
category: Java
---
#### General syntax

`%[argument_index$][flags][width][.precision]conversion`\
width: indicate the minimum number of characters to be written to the output\
precision: restrict the number of characters

#### Argument index

```Java
    String.format("%1$s %1$s %1$s", "Hello");
    // => Hello Hello Hello
```

#### Notes

> Using %% to print %
