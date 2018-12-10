const submitDamage = () => {

  const formDamage1 = document.querySelector(".formDamage1");
  const formDamage2 = document.querySelector(".formDamage2");
  const formDamage3 = document.querySelector(".formDamage3");
  const formDamage4 = document.querySelector(".formDamage4");
  const formDamage5 = document.querySelector(".formDamage5");

  const submitYesDamage = document.getElementById("submit-yes-damage");
  const submitNoDamage = document.getElementById("submit-no-damage");
  const submitMecanique = document.getElementById("type-mecanique");
  const submitCarrosserie = document.getElementById("type-carrosserie");

  const submitPicDamage = document.getElementById("submit-damage-pic");

  if (submitYesDamage) {

    submitYesDamage.addEventListener("click", (event) => {
      event.preventDefault();
      formDamage1.classList.add("hidden")
      formDamage2.classList.remove("hidden")
    });

    // submitNoDamage.addEventListener("click", (event) => {
    //   event.preventDefault();
    // });

    submitMecanique.addEventListener("click", (event) => {
      event.preventDefault();
      formDamage2.classList.add("hidden")
      formDamage3.classList.remove("hidden")
    });

    submitCarrosserie.addEventListener("click", (event) => {
      event.preventDefault();
      // console.log("hello")
      formDamage2.classList.add("hidden")
      formDamage4.classList.remove("hidden")
      console.log(formDamage4)
    });








    // submitTitleDescriptionDamage.addEventListener("click", (event) => {
    //   event.preventDefault();
    //   formDamage5.classList.add("hidden")
    //   formDamage6.classList.remove("hidden")
    // });
  }
};

export {submitDamage};
