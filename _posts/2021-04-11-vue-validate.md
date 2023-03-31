---
layout: post
title: Vue Validate
category: Javascript
---

Vue Validate

<i class="fa fa-asterisk text--green" aria-hidden="true"></i> State

```js
<form @submit.prevent="submitForm" autocomplete="off">
  <div class="form-group">
    <label for="name">Name:</label>
    <input v-model="form.name" id="name">
    <p v-if="!nameIsValid" class="error-message">The name field is required</p>
  </div>

  <div class="form-group">
    <label for="age">Age:</label>
    <input v-model.number="form.age" id="age">
    <p v-if="!ageIsValid" class="error-message">The age field is invalid</p>
  </div>

  <div>
    <button :disabled="!formIsValid">Submit</button>
  </div>
</form>


data () {
  return {
    form: {
      name: null,
      age: null
    }
  }
},

computed: {
  nameIsValid () {
    return !!this.form.name
  },

  ageIsValid () {
    return typeof this.form.age === 'number' && this.form.age > 12 && this.form.age < 120
  },

  formIsValid () {
    return this.nameIsValid && this.ageIsValid
  }
},

methods: {
  submitForm () {
    if (this.formIsValid) {
      console.log('📝 Form Submitted', this.form)
    } else {
      console.log('❌ Invalid form')
    }
  }
}
```

https://vuelidate.js.org/#getting-started
