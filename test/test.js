function Person(first, last, age, gender, interests) {

    // property and method definitions
    this.name = {
      'first': first,
      'last' : last
    };
    this.age = age;
    this.gender = gender;
    //...see link in summary above for full definition
  }



var person1 = new Person();

var person2 = Object.create(person1);

console.log(Object.prototype);


