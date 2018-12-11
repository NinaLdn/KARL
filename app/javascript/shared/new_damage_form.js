const submitDamage = () => {

  const formDamage4 = document.querySelector(".formDamage4");
  const formDamage5 = document.querySelector(".formDamage5");
  const formDamage6 = document.querySelector(".formDamage6");

  const submitYesDamage = document.getElementById("submit-yes-damage");
  const submitNoDamage = document.getElementById("submit-no-damage");
  const submitTitleDescriptionDamage = document.getElementById("submit-damage-title-description");
  const submitPicDamage = document.getElementById("submit-damage-pic");

  if (submitYesDamage) {
    submitYesDamage.addEventListener("click", (event) => {
      event.preventDefault();
      formDamage4.classList.add("hidden")
      formDamage5.classList.remove("hidden")
    });
    submitNoDamage.addEventListener("click", (event) => {
      event.preventDefault();
    });

    submitTitleDescriptionDamage.addEventListener("click", (event) => {
      event.preventDefault();
      formDamage5.classList.add("hidden")
      formDamage6.classList.remove("hidden")
    });
  }
};

export {submitDamage};
