let arrTeam = ['name1', 'name2', 'name3'];
console.log('첫 배열',arrTeam);

arrTeam.push('name4');
console.log('마지막 추가',arrTeam);

arrTeam.pop();
console.log('마지막 삭제',arrTeam);

arrTeam.unshift('name4');
console.log('첫번째 추가',arrTeam);

arrTeam.shift();
console.log('첫번째 삭제',arrTeam);

//splice(start, deleteCount, items)
arrTeam.splice(1, 0, 'name4', 'name5');
console.log('값 삽입',arrTeam);

arrTeam.splice(1, 2/*, 'name4', 'name5'*/);
console.log('값 지정 삭제',arrTeam);

arrTeam.splice(1, 2, 'name6', 'name7');
console.log('값 삽입 및 삭제',arrTeam);