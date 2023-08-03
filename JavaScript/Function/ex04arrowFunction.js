const intro = () => {
    console.log('test text..');
}
intro();

const intro2 = (userTeam, userName) => {
    console.log(`${userTeam} text 2 ${userName} `);
}
intro2('team2');

const intro3 = userName => `test text ==> ${userName}`;

setTimeout(() => {
    console.log(intro3('name3'));
}, 3000);