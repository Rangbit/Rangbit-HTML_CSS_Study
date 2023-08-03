const intro = function(){
    console.log('test text..');
}
intro();

const intro2 = function(userTeam, userName){
    console.log(`${userTeam} text 2 ${userName} `);
}
intro2('team2');

const intro3 = function(userName){
    return `test text ==> ${userName}`;
}
setTimeout(() => {
    console.log(intro3('name3'));
}, 3000);