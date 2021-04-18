---
layout: post
title: Type Of Dependencies
category: Others
---

<i class="fa fa-asterisk text--green" aria-hidden="true"></i> dependencies\
Là những normal dependencies (những thứ cần thiết khi run code).
Ví dụ: React, ImmutableJS

<i class="fa fa-asterisk text--green" aria-hidden="true"></i> devDependencies\
Những thứ cần thiết khi development. Không cần thiết khi run code.
Ví dụ: Babel, Flow

<i class="fa fa-asterisk text--green" aria-hidden="true"></i> peerDependencies\
Những dependencies cần khi publish package. Một package được sử dụng yêu cầu phải cài đặt một dependency khác.
Ví dụ: `react` cần cài đặt `react-dom`.

<i class="fa fa-asterisk text--green" aria-hidden="true"></i> optionalDependencies\
Những dependencies tùy chọn, trong trường hợp install thất bại thì vẫn báo về là đã xử lý thành công.
Ví dụ: Watchman

<i class="fa fa-asterisk text--green" aria-hidden="true"></i> bundledDependencies\
Array of package names that will be bundled when publishing the package.
Normal dependencies are usually installed from the npm registry. Bundled dependencies are useful in cases normal dependencies are not sufficient:

- When you want to re-use a third party library that doesn’t come from the npm registry or that was modified.
- When you want to re-use your own projects as modules.
- When you want to distribute some files with your module.
