let person = {
    'name' : 'myName',
     age : 20,
    favorite : {food:'pizza', drink:'coffee'},
    test : ['name1', 'name2', 'name3']
}

console.log(person);
console.log(person.name);
console.log(person.age);
console.log(person.favorite);
console.log(person.favorite.food);
console.log(person.favorite.drink);
console.log(person.test[1]);

person.name = 'myName2';
console.log(person.name);
person.height = 170;
console.log(person.height);
console.log(person);