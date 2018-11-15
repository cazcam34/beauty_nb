function sumTotal() {
  const totals = document.querySelectorAll('.order-item-total')
  var nums = [];
  var sum = 0
  totals.forEach ((total) => {
    const value = parseInt(total.innerHTML.substring(1))
    nums.push(value)
  });
  nums.forEach ((num) => {
    sum += num
  })
  const totalsum = document.querySelector('.total-sum')
  totalsum.innerHTML = sum
};

export { sumTotal };
