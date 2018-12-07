const submitDamage = () => {

  const form4 = document.querySelector(".form4");
  const form5 = document.querySelector(".form5");
  const form6 = document.querySelector(".form6");

  const submitYesDamage = document.getElementById("submit-yes-damage");
  const submitNoDamage = document.getElementById("submit-no-damage");
  const submitTitleDescriptionDamage = document.getElementById("submit-damage-title-description");
  const submitPicDamage = document.getElementById("submit-damage-pic");

  if (submitYesDamage) {
    submitYesDamage.addEventListener("click", (event) => {
      event.preventDefault();
      form4.classList.add("hidden")
      form5.classList.remove("hidden")
    });
    submitNoDamage.addEventListener("click", (event) => {
      event.preventDefault();
    });

    submitTitleDescriptionDamage.addEventListener("click", (event) => {
      event.preventDefault();
      form5.classList.add("hidden")
      form6.classList.remove("hidden")
    });
  }
};

export {submitDamage};
