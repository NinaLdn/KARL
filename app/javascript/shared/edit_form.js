const submitCar = () => {

  // Select forms
  const form1 = document.querySelector(".form1");
  const form2 = document.querySelector(".form2");
  const form3 = document.querySelector(".form3");
  const form4 = document.querySelector(".form4");
  const form5 = document.querySelector(".form5");

// Select submit buttons in the forms
  const submitWhySelling = document.getElementById("submit-why-selling");
  const submitAddress = document.getElementById("submit-address");
  const submitKm = document.getElementById("submit-km");
  const submitPic = document.getElementById("submit-picture");
  const submitTechnicalControl = document.getElementById("submit-technical-control");

  if (submitWhySelling) {

    submitWhySelling.addEventListener("click", (event) => {
      event.preventDefault();
      form1.classList.add("hidden")
      form2.classList.remove("hidden")
    });

    submitAddress.addEventListener("click", (event) => {
      event.preventDefault();
      form2.classList.add("hidden")
      form3.classList.remove("hidden")
    });

    submitKm.addEventListener("click", (event) => {
      event.preventDefault();
      form3.classList.add("hidden")
      form4.classList.remove("hidden")
    });

    submitPic.addEventListener("click", (event) => {
      event.preventDefault();
      form4.classList.add("hidden")
      form5.classList.remove("hidden")
    });

  }
  // submitWhySelling.addEventListener("click", (event) => {

  //   form3.classList.add("hidden")
  // });

};

export {submitCar}

