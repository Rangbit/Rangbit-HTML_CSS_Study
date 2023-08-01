// 변수 선언시
// 1. 재선언 O / 재할당 O
var num = 3;
console.log('var 최초 선언', num);
var num = 4; // 재선언 O 
console.log('var 재선언', num);
num = 5; // 재할당 O
console.log('var 값변경', num);

// 2. 재선언 X / 재할당 O
let str = 'A';
console.log('str 최초 선언', str);
//let str = 'A';  // 재선언 X
str = 'B'; // 재할당 O
console.log('str 값 변경', str);

// 3. 재선언 X / 재할당 X
const str1 = true;
console.log('str1 최초선언', str1);
// const str1 = true; // 재선언 X
// str1 = false; // 재할당 X