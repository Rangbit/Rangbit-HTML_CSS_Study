function intro() {
    console.log('함수란 하나의 로직을 재실행 할 수 있도록 하는 것으로 코드의 재사용성을 높여주고 유지보수에 용이하고 가독성이 좋다. ');    
}
intro();

// 기본값 설정
function intro2(userteam, userName = 'name2') {
    /* 특정조건 값 부여
    if (userName===undefined) {
        userName = 'name0'
    }
    */
    console.log(`${userteam} の ${userName}`);
}
intro2('TestTeam'/*, 'name1'*/);

function intro3(userName){
    return `test text ==> ${userName}`;
}
setTimeout(() => {
    console.log(intro3('name3'));
}, 3000);