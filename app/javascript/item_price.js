// 金額を入力した数値をpriceInputという変数に格納する
window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    console.log(priceInput.value)
    const inputValue = priceInput.value;
    // 販売手数料
    const charNum1  = document.getElementById("add-tax-price");
    // charNum1.innerHTML = inputValue * 0.1;
    charNum1.innerHTML = Math.floor(inputValue * 0.1);
    // 販売手数料
    const charNum2  = document.getElementById("profit");
    charNum2.innerHTML = Math.ceil(inputValue * 0.9);
    // charNum2.innerHTML = inputValue * 0.9;
  })
})


