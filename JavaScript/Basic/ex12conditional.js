let coffeeMenu = prompt('메뉴를 입력하세요.');


// 변수명 조건식 변수 ? if=true : else
coffeeMenu === '아메리카노'?console.log('주문하신 음료가 나왔습니다.')
:console.log(`${coffeeMenu}는(은) 현재 대기시간이 5분 있습니다.`);

// 변수명 조건식 변수 && true , 앞의조건이 true 일 때
coffeeMenu === '수박주스' && console.log('이벤트중인 메뉴입니다.');

let num = 15;
if(num > 10){
    console.log('10보다 큰 수입니다.');
}else{
    console.log('10보다 작은 수입니다.');
}