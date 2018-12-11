const submitDamage = () => {

  const damageNatures = document.querySelectorAll(".damages-type li");
  damageNatures.forEach((nature) => {
    nature.addEventListener('click', (event) => {
      const targetNature = event.currentTarget.dataset.target;
      const formTarget = document.getElementById(targetNature);
      formTarget.classList.add("active");

      const trueTitle = document.getElementById("true-title");
      const targetNatureValue = event.currentTarget.dataset.name;
      trueTitle.value = targetNatureValue
      console.log(targetNatureValue);
    });

  });

};

export {submitDamage};
