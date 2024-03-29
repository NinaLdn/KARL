import {cameraDamageStart} from './damage-camera';
// Fonction qui sert à activer une classe sur une liste d'élément
function setClass(el, klass, target) {
  document.querySelectorAll(el).forEach((form) => {
    form.classList.remove(klass);
  })
  target.classList.add(klass);
}

const submitDamage = () => {

  console.log("hellooooo");

  const damageVideo = document.querySelector(".damage-camera-video");
  const damageTake = document.querySelector(".damage-camera-capture");
  const submitCameradamage = document.getElementById("damage-camera-button");
  const takePicturedamage = document.getElementById("camera--trigger-3");
  const textForm = document.querySelector(".nature-damages");

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

      // => DATA SAVE IN FORM
      const dataName = nature.dataset.name;
      const trueNature = document.getElementById(`true-nature-${dataName}`);
      console.log(event)
      const targetNatureValue = event.currentTarget.dataset.name;
      trueNature.value = targetNatureValue;
      console.log(targetNatureValue);
      console.log(trueNature.value);
      // => FRONT JS OPACITY
      if (event.currentTarget.dataset.name === "carrosserie"){
        const otherItem = document.querySelector(`li[data-name="mecanique"]`);
        setClass('.damages-type li', 'not-selected', otherItem);
        // otherItem.classList.toggle("not-selected");
        // event.currentTaret.dataset.name
      } else {
        const otherItem = document.querySelector(`li[data-name="carrosserie"]`);
        // otherItem.classList.toggle("not-selected")
        setClass('.damages-type li', 'not-selected', otherItem);
      }


    // => DISPLAY FORM TITLE DOMAGE
    const targetNature = event.currentTarget.dataset.target;
    const formTarget = document.getElementById(targetNature);
    setClass('.hide-or-active', 'active', formTarget);
    // document.querySelectorAll('.hide-or-active').forEach((form) => {
    //   form.classList.remove('active');
    // })
    // formTarget.classList.add("active");

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

    if (submitCameradamage) {
      submitCameradamage.addEventListener("click", (event) => {
        damageVideo.classList.remove("hidden")
        textForm.classList.add("hidden")
        cameraDamageStart();
      });
      takePicturedamage.addEventListener("click", (event) => {
        event.preventDefault();
        damageVideo.classList.add("hidden")
        damageTake.classList.remove("hidden")
      });
    };
  });


// FORM-DAMAGE-NATURE => EVENT : CLICK FOR TITLE OF DAMAGES
  const damagesTitle = document.querySelectorAll(".info-card-small-damage");

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
// EVENT: CLICK ON DAMAGE TITLE => VALIDATION CHECK BTN TO BE GREEN
  const cardToClick = document.querySelectorAll(".info-card-small-damage");
  cardToClick.forEach((card) => {
    card.addEventListener('click', (event) => {
      document.querySelectorAll(".info-card-small-damage").forEach((card) => {
        if (card.querySelector(".tick-vert") || card.querySelector(".tick-gris") ) {
          card.querySelector(".tick-vert").classList.add('hidden');
          card.querySelector(".tick-gris").classList.remove('hidden');
        }
      })
      const grayTick = card.querySelector(".tick-gris");
      const greenTick = card.querySelector(".tick-vert");
      // const currentSelected = document.querySelector(".tick-vert");
      // const validationCheck = card.querySelector(".tick-gris");

      if (greenTick) {
        grayTick.classList.add("hidden")
        greenTick.classList.remove("hidden")
      }
        // greenTick.classList.remove("hidden")
        // grayTick.classList.add("hidden")


      // if (currentSelected) {
      //   currentSelected.classList.add('hidden');
      //   validationCheck.classList.remove("hidden");
      // }
      // currentSelected.classList.remove("hidden");
      // validationCheck.classList.add("hidden");
      // document.querySelector(".svgClass").getSVGDocument().getElementById("svgInternalID").setAttribute("fill", "red")
    });

  });
    console.log(cardToClick);

// };

// Quand on click sur gris --> ajouter la hidden au gris et enlever la hidden au vert


// const cardToClick = document.querySelectorAll("info-card-small");
// function setClass(el, klass, cardToClick) {
//   document.querySelectorAll(el).forEach((form) => {
//     form.classList.remove(klass);
//   })
//   target.classList.add(klass);
}

export {submitDamage};
