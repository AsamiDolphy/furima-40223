const calc = () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  const ProfitDom = document.getElementById("profit");
  // 入力した金額から販売手数料を計算
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  // 出品価格から販売手数料を引
  ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })
}

window.addEventListener("turbo:load", calc);
window.addEventListener("turbo:render",calc);