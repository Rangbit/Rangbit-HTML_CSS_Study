// 1. 색상을 입력받을 입력창 만들기
// 2. 빨강 -> red, 초록 -> green, 파랑 -> blue
//    그외 -> '잘못 입력하셨습니다' (알림 팝업창)

var inputColor = prompt('색상을 입력해주세요.(빨강,초록,파랑)')

// if(inputColor === '빨강'){
//     document.querySelector('body').style.backgroundColor = 'red';
// }else if(inputColor === '초록'){
//     document.querySelector('body').style.backgroundColor = 'green';
// }else if(inputColor === '파랑'){
//     document.querySelector('body').style.backgroundColor = 'blue';
// }else{
//     document.write('잘못 입력하셨습니다.')
// }


let resultColor;
switch (inputColor) {
    case '빨강': resultColor = 'red'; 
        break;
    case '초록': resultColor = 'green'; 
        break;
    case '파랑': resultColor = 'blue'; 
        break;
    default: alert('잘못 입력하셨습니다.');
        break;
}
document.querySelector('body').style.backgroundColor = resultColor;