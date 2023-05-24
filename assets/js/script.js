let navbar = document.querySelector('.header .navbar')

document.querySelector('#menu-btn').onclick = () =>{
    navbar.classList.toggle('active');
    searchBar.classList.remove('active');
}

let searchBar = document.querySelector('.header .search-form')

document.querySelector('#search-btn').onclick = () =>{
    searchBar.classList.toggle('active');
    navbar.classList.remove('active');
}

document.querySelectorAll('input[type="number"]').forEach(inputNumber => {
   inputNumber.oninput = () =>{
      if(inputNumber.value.length > inputNumber.maxLength) inputNumber.value = inputNumber.value.slice(0, inputNumber.maxLength);
   };
});

AOS.init({
   duration: 400,
   delay: 200,
});

window.onscroll = () =>{
   navbar.classList.remove('active');
   searchBar.classList.remove('active');
}
