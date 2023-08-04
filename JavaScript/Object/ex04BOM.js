// Brawser Object Model : 브라우저를 다루기위한 객체

// window : 브라우저 객체 최상위, 브라우저 창 관련 기능, 생략가능
// window.open() / open()
// window.open('http://www.naver.com', '네이버',
// 'width=500 height=500');

// location : 브라우저 주소 관련 정보
console.log(location);
console.log('현재 주소 : ', location.href);

// location.href = 'http://www.google.com'

// screen : 화면 해상도 정보(width, height)
console.log(screen);

// navigator : 현재 브라우저 정보
console.log(navigator);

// history : 브라우저 이동 관련 기능(뒤로, 앞으로)
// history.내장기능
// back() , forward() , go(number)

