let person1 = {
    name : 'name1',
    bday : '1/2',
    subject : 'Web',
    hobby : 'game',
    favorite : '?'
}
let person2 = {
    name : 'name2',
    bday : '3/14',
    subject : 'Java',
    hobby : 'game',
    favorite : '?'
}
let person3 = {
    name : 'name3',
    bday : '5/11',
    subject : 'Python',
    hobby : 'game',
    favorite : '?'
}

let personList = [person1, person2, person3];
console.log(personList);

for (let i = 0; i < personList.length; i++) {
    
    document.write(`${personList[i].name}의 생일은 ${personList[i].bday}이고, 
    좋아하는 과목은 ${personList[i].subject}입니다.<br>
    취미는 ${personList[i].hobby}이고, 좋아하는건 ${personList[i].favorite}입니다.<br><br>`)
    
}