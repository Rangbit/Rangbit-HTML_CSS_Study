let emoticon = prompt('이모티콘을 입력하세요');
let cnt = Number(prompt('출력할 행의 갯수를 입력하세요'));
// let sumEmoticon = '';
console.log(emoticon);
console.log(cnt);
// 함수 선언문
function pyramid1(emo, count) {
        for (let i = 1; i <= count; i++) {
            // document.write(emo)
            for (let e = 1; e <= i; e++) {
                document.write(emo)
            }
            document.write('<br>')
        }
}

// 함수 표현식
const pyramid2 = function(emo, count) {
    for (let i = 1; i <= count; i++) {
        for (let e = 1; e <= i; e++) {
            document.write(emo)
        }
        document.write('<br>')
    }
}

// 화살표 함수
const pyramid3 = (emo, count) => {
    for (let i = 1; i <= count; i++) {
        for (let e = 1; e <= i; e++) {
            document.write(emo)
        }
        document.write('<br>')
    }
}

pyramid1(emoticon,cnt);
pyramid2(emoticon,cnt);
pyramid3(emoticon,cnt);