// 변수 선언시
// 1. 재선언 O / 재할당 O
var num = 3;
var num = 4; // 재선언 O 
num = 5; // 재할당 O

// 2. 재선언 X / 재할당 O
let str = 'A';
//let str = 'A';  // 재선언 X
str = 'B'; // 재할당 O

// 3. 재선언 X / 재할당 X
const str1 = true;
// const str1 = true; // 재선언 X
// str1 = false; // 재할당 X