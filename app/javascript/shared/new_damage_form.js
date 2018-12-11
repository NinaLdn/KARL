const submitDamage = () => {

  const damageNatures = document.querySelectorAll(".damages-type li");
  damageNatures.forEach((nature) => {
    nature.addEventListener('click', (event) => {
      const targetNature = event.currentTarget.dataset.target;
      const formTarget = document.getElementById(targetNature);
      formTarget.classList.add("active");

    });

  });

};

export {submitDamage};





const kilometer = () => {
  const slider = new Slider("#ex11", {
    step: 10000,
    min: 0,
    max: 1000000
  });
  const handle = slider.handle1
  slider.on('slideStop', (event) => {
    const trueSlider = document.getElementById('trueSlider')
    if (trueSlider){
      trueSlider.value = event
    }
  });
};
