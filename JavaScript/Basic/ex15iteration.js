// 1. while
let num1 = 0;
let num2 = 0;
console.log('while >> ');

while(num1 < 3){
    console.log(num1);
    num1++;
}

while(true){
    console.log(num2);
    num2++;
    if(num2 === 6) break;
}


// 2.do-while
let num3 = 6
console.log('do-while >> ');
do{
    console.log(num3);
    num3++;
} while (num3<9)

// 3. for
console.log('for >> ');
for(let num5=10; num5<13; num5++){
    console.log(num5);
}