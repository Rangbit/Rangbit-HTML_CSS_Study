// hoisting : 선언문이 코드의 선두로 끌어올려진 것처럼 동작하는 현상

console.log(lunchMenu);
var lunchMenu = 'meat';
console.log(lunchMenu);

defFunc('up');
function defFunc(value) {
    console.log(value, '함수 선언문');
}
defFunc('down');

const expFunc = function(value){
    console.log(value, '함수 표현식');
}
expFunc('down');