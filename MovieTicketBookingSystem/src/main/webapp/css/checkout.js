// Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()

const movieName = document.getElementById("movie_name");
document.getElementById("product").value = movieName.textContent;

const subTotal = document.getElementById("sb_total");
document.getElementById("sub_total").value = subTotal.textContent;

const shipping = document.getElementById("serv_charge");
document.getElementById("shipping").value = shipping.textContent;

const tax = document.getElementById("ttx");
document.getElementById("tax").value = tax.textContent;

let TsbTotal = parseInt(document.getElementById("sub_total").value);
let Tshipping = parseInt(document.getElementById("shipping").value);
let Ttax = parseInt(document.getElementById("tax").value);

let total = TsbTotal + Tshipping + Ttax;
total = total.toString();

document.getElementById("total").value = total;
document.getElementById("tt").innerText = "$" + total;