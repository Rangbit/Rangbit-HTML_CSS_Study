

let date = new Date();
console.log('오늘 : ',date);

let yesterday = new Date(2023, 7, 3, 0, 0, 0);
console.log('어제 : ', yesterday);


let tYear = date.getFullYear();
let tMonth = date.getMonth()+1;  //0~11 
let tDate = date.getDate();
let tDay = date.getDay();  //0~6
let tHour = date.getHours();
let tMinute = date.getMinutes();
let tSeconds = date.getSeconds();

switch(tDay){
    case 0 : tDay = '일'; break;
    case 1 : tDay = '월'; break;
    case 2 : tDay = '화'; break;
    case 3 : tDay = '수'; break;
    case 4 : tDay = '목'; break;
    case 5 : tDay = '금'; break;
    case 6 : tDay = '토'; break;
}

console.log(`${tYear}년 ${tMonth}월 ${tDate}일 ${tDay}요일`);
console.log(`${tHour}시 ${tMinute}분 ${tSeconds}초 입니다.`);


