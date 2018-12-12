function cameraStart() {
  const constraints = { video: true, audio: false };

  const cameraView = document.querySelector("#camera--view"),
        cameraView1 = document.querySelector("#camera--view-1"),
        cameraOutput = document.querySelector("#camera--output"),
        cameraOutput1 = document.querySelector("#camera--output-1"),
        cameraSensor = document.querySelector("#camera--sensor"),
        cameraSensor1 = document.querySelector("#camera--sensor-1"),
        cameraTrigger1 = document.querySelector("#camera--trigger-1"),
        cameraTrigger2 = document.querySelector("#camera--trigger-2");

  navigator.mediaDevices
    .getUserMedia(constraints)
    .then(function(stream) {
      const track = stream.getTracks()[0];
      cameraView.srcObject = stream;
  })
  .catch(function(error) {
    console.error("Oops. Something is broken.", error);
  });

  navigator.mediaDevices
    .getUserMedia(constraints)
    .then(function(stream) {
      const track = stream.getTracks()[0];
      cameraView1.srcObject = stream;
  })
  .catch(function(error) {
    console.error("Oops. Something is broken.", error);
  });

  cameraTrigger1.onclick = function() {
    cameraSensor.width = cameraView.videoWidth;
    cameraSensor.height = cameraView.videoHeight;
    cameraSensor.getContext("2d").drawImage(cameraView, 0, 0);
    cameraOutput.src = cameraSensor.toDataURL("image/png");
    cameraOutput.classList.add("taken");
    const imageData = cameraOutput.src
    document.getElementById("car_photo_1").setAttribute("value", imageData)
  };

  cameraTrigger2.onclick = function() {
    cameraSensor1.width = cameraView1.videoWidth;
    cameraSensor1.height = cameraView1.videoHeight;
    cameraSensor1.getContext("2d").drawImage(cameraView1, 0, 0);
    cameraOutput1.src = cameraSensor1.toDataURL("image/png");
    cameraOutput1.classList.add("taken");
    const imageData1 = cameraOutput1.src
    document.getElementById("car_photo_2").setAttribute("value", imageData1)
  };



}



// window.addEventListener("load", cameraStart, false);

export {cameraStart};
