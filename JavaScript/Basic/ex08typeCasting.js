let num = '3.14';
let num2 = '5';
let num3 = 100;
console.log(num);

// 1. string -> float : parseFloat(val)
console.log('string -> float' , parseFloat(num));

// 2. string -> int : parseFloat(val)
console.log('string -> int' , parseInt(num));

// 3. string -> number : Number(val)
console.log('string -> number' , Number(num));
console.log('string -> number' , Number(num2));

// 4. number -> string : String()
console.log('number -> string' , String(num3));
