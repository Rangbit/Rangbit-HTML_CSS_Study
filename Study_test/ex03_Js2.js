const plusNum = ()=>{
    let spanFunc = document.getElementById('spanTag');
    spanFunc.innerText = Number(spanFunc.innerText)+1;
}

const minusNum = ()=>{
    let spanFunc = document.getElementById('spanTag');
    if(Number(spanFunc.innerText) > 0 ){
        spanFunc.innerText = Number(spanFunc.innerText)-1;
    }
}

const resetNum = ()=>{
    let spanFunc = document.getElementById('spanTag');
    spanFunc.innerText = 0;
}
