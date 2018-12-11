const submitDamage = () => {

// FORM YES/NO => EVENT : CLICK YES TO DAMAGES => AFFICHAGE FORM => NATURE DOMAGE
const submitYesDamage = document.getElementById("submit-yes-damage");
submitYesDamage.addEventListener('click', (event) => {
  const chooseFormDamageNature = document.querySelector(".choose-form-damage-nature");
  chooseFormDamageNature.classList.add("active");
  console.log(submitYesDamage)
  console.log(chooseFormDamageNature)
  const formDamageYesNo = document.querySelector(".formDamageYesNo");
  formDamageYesNo.classList.add("hidden");
});
// FORM DAMAGE => EVENT : CLICK FOR NATURE OF DAMAGES
  const damageNatures = document.querySelectorAll(".damages-type li");
  damageNatures.forEach((nature) => {
    nature.addEventListener('click', (event) => {
      const dataName = nature.dataset.name;
      const trueNature = document.getElementById(`true-nature-${dataName}`);
      console.log(event)
      const targetNatureValue = event.currentTarget.dataset.name;
      trueNature.value = targetNatureValue
      console.log(targetNatureValue);
      console.log(trueNature.value);
      // => DISPLAY FORM TITLE DOMAGE
      const targetNature = event.currentTarget.dataset.target;
      const formTarget = document.getElementById(targetNature);
      document.querySelectorAll('.hide-or-active').forEach((form) => {
        form.classList.remove('active');
      })
      formTarget.classList.add("active");

      // => NATURE DATA SAVE IN FORM
      // const trueNatures = document.querySelectorAll("true-nature")
      // trueNatures.forEach((trueNature) => {
      //   if (event.currentTarget.dataset.name === "Carrosserie"){
      //     const targetNatureValue = event.currentTarget.dataset.name;
      //     trueNature.value = targetNatureValue
      //     console.log(targetNatureValue);
      //     const formTarget = document.getElementById(targetNature);
      //     formTarget.classList.add("active");
      //   } else {
      //     const targetNatureValue = event.currentTarget.dataset.name;
      //     trueNature.value = targetNatureValue
      //     console.log(targetNatureValue);
      //     const formTarget = document.getElementById(targetNature);
      //     formTarget.classList.add("active");
      //   }
      // }


      // if (formTarget = nature) {
      //   formTarget.classList.add("active");
      //   formTarget.classList.add("hidden");
      // }
    });

  });

// FORM-DAMAGE-NATURE => EVENT : CLICK FOR TITLE OF DAMAGES
  const damagesTitle = document.querySelectorAll(".damages-nature li");
  damagesTitle.forEach((title) => {
    title.addEventListener('click', (event) => {
      const dataName = title.dataset.name;
    // => TITLE DATA SAVE IN FORM
    const trueTitle = document.getElementById(`true-title-${dataName}`);
    const targetTitleValue = event.currentTarget.dataset.value;
    trueTitle.value = targetTitleValue
    console.log(damagesTitle)
    console.log(trueTitle)
  // => DISPLAY FORM PICTURES
    });
  });

// EVENT : CLICK FOR PICTURES VALIDATION OF DAMAGES
// => DISPLAY FORM DESCRIPTION
// EDIT AND UPDATE "Finaliser"
};
export {submitDamage};
