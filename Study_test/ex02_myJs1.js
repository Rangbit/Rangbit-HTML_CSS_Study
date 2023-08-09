
const marginBox = () =>{
    let box1 = document.querySelector('#redBox');
    let box2 = document.querySelector('#greenBox');
    let box3 = document.querySelector('#blueBox');
    let box4 = document.querySelector('#grayBox');
    box2.style.marginLeft = '100px';
    box3.style.marginLeft = '200px';
    box4.style.marginLeft = '300px';
} 

const borderBox = () => {
    let divList = document.querySelectorAll('div');
    divList.forEach(element => element.style.borderRadius = '0 50%');
}