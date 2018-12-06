
// Select submit button
const form1 = document.querySelector(".form1");
const form2 = document.querySelector(".form2");
const form3 = document.querySelector(".form3");
const form4 = document.querySelector(".form4");

const submitKm = document.getElementById("submit-km");
const submitDamages = document.getElementById("submit-damages");
const submitPic = document.getElementById("submit-picture");
const submitWhySelling = document.getElementById("submit-why-selling");

submitKm.addEventListener("click", (event) => {
  // console.log(form1)
  // console.log(form2)
  // console.log(form3)
  event.preventDefault();
  // form2.toggle();
  form1.classList.add("hidden")
  form2.classList.remove("hidden")
});

// submitDamages.addEventListener("click", (event) => {
//   form.classList.add("hidden")
//   form3.classList.remove("hidden")
// });

submitPic.addEventListener("click", (event) => {
  event.preventDefault();
  form2.classList.add("hidden")
  form3.classList.remove("hidden")
});

// submitWhySelling.addEventListener("click", (event) => {
//   form4.classList.add("hidden")
// });


export {submit};
