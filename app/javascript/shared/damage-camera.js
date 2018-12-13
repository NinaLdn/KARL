function cameraDamageStart() {
  const constraints = { video: true, audio: false };

  const cameraViewdamage = document.querySelector("#camera--view-damage"),
        cameraOutputdamage = document.querySelector("#camera--output-damage"),
        cameraSensordamage = document.querySelector("#camera--sensor-damage"),
        cameraTriggerdamage = document.querySelector("#camera--trigger-3");

  navigator.mediaDevices
    .getUserMedia(constraints)
    .then(function(stream) {
      const track = stream.getTracks()[0];
      cameraViewdamage.srcObject = stream;
  })
  .catch(function(error) {
    console.error("Oops. Something is broken.", error);
  });



  cameraTriggerdamage.onclick = function() {
    cameraSensordamage.width = cameraViewdamage.videoWidth;
    cameraSensordamage.height = cameraViewdamage.videoHeight;
    cameraSensordamage.getContext("2d").drawImage(cameraViewdamage, 0, 0);
    cameraOutputdamage.src = cameraSensordamage.toDataURL("image/png");
    cameraOutputdamage.classList.add("taken");
    const imageDatadamage = cameraOutputdamage.src
    document.getElementById("damage_photo_1").setAttribute("value", imageDatadamage)
  };

}



// window.addEventListener("load", cameraStart, false);

export {cameraDamageStart};
