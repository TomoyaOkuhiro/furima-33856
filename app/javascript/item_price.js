window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price")
   priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
   const addTaxDom = document.getElementById("add-tax-price")
   addTaxDom.innerHTML = Math.floor(priceInput.value / 10)
  const profit = document.getElementById("profit")
    profit.innerHTML = Math.floor(priceInput.value - addTaxDom.innerHTML)
 
  })
});



// 金額の場所を指定する必要がある(ID) (①金額入力欄、②販売手数料、③利益)
// 入力時にイベントが発火するという記述(addEventListener)
 // 入力された金額の計算を行う
// ビューに反映させる必要がある(innerHTML)
