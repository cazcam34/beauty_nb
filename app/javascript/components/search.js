// function initSearchOnKeyUp() {
//   const form = document.querySelector('#search-form');
//   form.addEventListener('keyup', () => {
//     form.submit();
//   });
// }


// export { initSearchOnKeyUp };


// work in progress


function clearFormAfterEnter() {
  const form = document.querySelector('search-form');
  form.addEventListener('Enter', () => {

    form.reset();
  });
}

export { clearFormAfterEnter };
