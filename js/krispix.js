var possiblePics = ["/img/car.jpg", "/img/desk.jpg", "/img/pic_mnt.jpg", "/img/picture.jpg", "/img/texasstuff.jpg", "/img/window.jpg",
  "/img/matt.jpg", "/img/snowman.jpg", "/img/micro.jpg"]

function load()
{
  a = new Image();
  a.src = possiblePics[Math.floor(Math.random() * possiblePics.length)];
  document['profilepic'].src = a.src;
}
