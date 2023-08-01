var height = prompt('키를 입력하세요');
var weight = prompt('몸무게를 입력하세요');
var weight_avg = (height-100)*0.9;

document.write(`신장 : ${height}cm<br>`);
document.write(`체중 : ${weight}kg<br>`);
document.write(`적정 체중 : (${height} - 100 X 0.9 = ${weight_avg}(kg))<br>`);

if(weight>weight_avg){
    document.write(`적정체중은 ${weight_avg}kg이며, 현재 적정체중에서 ${weight-weight_avg}kg 초과한 것을 알 수 있습니다.`);
}else if(weight<weight_avg){
    document.write(`적정체중은 ${weight_avg}kg이며, 현재 적정체중에서 ${weight_avg-weight}kg 미만인 것을 알 수 있습니다.`);
}else {
    document.write('현재 적정체중입니다.');
}