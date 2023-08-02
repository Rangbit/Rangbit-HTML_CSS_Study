let arrNum = [23, 54, 78, 13, 44];
let maxNum = arrNum[0];


// for

for (let i = 0; i < arrNum.length; i++) {
    if (maxNum < arrNum[i]) {
        maxNum = arrNum[i];
    }
}
console.log('for', maxNum);

// for-of

for(let i of arrNum){
    if(i>maxNum){
        maxNum=i;
    }
}
console.log('for-of', maxNum);

// for Each
arrNum.forEach((element)=>{
    if(element>maxNum){
        maxNum=element;
    }
});
console.log('forEach', maxNum);

// alert(`최댓값 : ${maxNum}`);