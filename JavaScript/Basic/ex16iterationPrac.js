var num1 = prompt('시작할 숫자를 입력하세요');
var num2 = prompt('마지막 숫자를 입력하세요');
var num3 = num1;
var sum = 0;
for(num3; num3<=num2; num3++){
    sum += Number(num3);
}
console.log(`${num1}부터 ${num2}까지의 합은? >> ${sum}`);