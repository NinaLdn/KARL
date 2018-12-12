const submitCar = () => {

  // Select forms
  const form1 = document.querySelector(".form1");
  const form2 = document.querySelector(".form2");
  const form3 = document.querySelector(".form3");
  const form4 = document.querySelector(".form4");
  const form5 = document.querySelector(".form5");
  const form6 = document.querySelector(".form6");
  const form7 = document.querySelector(".form7");
  const form8 = document.querySelector(".form8");

// Select submit buttons in the forms
  const submitWhySelling = document.getElementById("submit-why-selling");
  const submitAddress = document.getElementById("submit-address");
  const submitKm = document.getElementById("submit-km");
  const takePicture1 = document.getElementById("camera--trigger-1");
  const takePicture2 = document.getElementById("camera--trigger-2");
  const submitPic1 = document.getElementById("submit-picture-1");
  const submitPic2 = document.getElementById("submit-picture-2");
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

    takePicture1.addEventListener("click", (event) => {
      event.preventDefault();
      form4.classList.add("hidden")
      form5.classList.remove("hidden")
    });

    submitPic1.addEventListener("click", (event) => {
      event.preventDefault();
      form5.classList.add("hidden")
      form6.classList.remove("hidden")
    });

    takePicture2.addEventListener("click", (event) => {
      event.preventDefault();
      form6.classList.add("hidden")
      form7.classList.remove("hidden")
    });

    submitPic2.addEventListener("click", (event) => {
      event.preventDefault();
      form7.classList.add("hidden")
      form8.classList.remove("hidden")
    });

  }
  // submitWhySelling.addEventListener("click", (event) => {

  //   form3.classList.add("hidden")
  // });

};

export {submitCar}

