window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price")
   priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
   const addTaxDom = document.getElementById("add-tax-price")
   addTaxDom.innerHTML = Math.floor(Input.value / 10)
  const profit = document.getElementById("profit")
    profit.innerHTML = Math.floor(Input.value - addTaxDom.innerHTML)
 
  })
});




