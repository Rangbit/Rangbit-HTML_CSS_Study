// 1. 랜덤숫자 하나뽑기
// 2. 사용자에게 숫자를 입력받기

let random_num = parseInt(Math.random()*100)+1;
console.log(random_num);

while (true) {
    let input_num = Number(prompt('숫자를 입력하세요'))
    if(input_num > random_num){
        alert("입력한 숫자보다 작은 수 입니다")
    }else if(input_num < random_num){
        alert("입력한 숫자보다 큰 수 입니다")
    }else if(input_num == random_num){
        alert("정답입니다. 축하합니다")
        break;
    }else{
        alert('다시 입력해주세요')
    }
}