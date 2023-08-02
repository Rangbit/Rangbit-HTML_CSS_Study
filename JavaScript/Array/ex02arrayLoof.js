console.log('for');
let nameList = ['name1', 'name2', 'name3', 'name4'];
for(let i = 0; i < nameList.length; i++){
    console.log(nameList[i]);
}

console.log('for-of');
let foodList = ['food1', 'food2', 'food3'];
for (let i of foodList) {
    console.log(i);
}

console.log('forEach');
let coffeeList = ['Americano', 'cafelatte']
coffeeList.forEach((element, index)=>{
    console.log(index, element);
});
