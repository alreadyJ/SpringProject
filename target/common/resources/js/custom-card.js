$(window).on("load", function() {
   var cardImage = document.getElementsByClassName("card-image");
    var min = 0, diff = 0;
   for (var i = 0; i < cardImage.length; i++) {
       if (cardImage[i].width < cardImage[i].height) {
           cardImage[i].height *= (240 / cardImage[i].width);
           cardImage[i].width *=  (240 / cardImage[i].width);
           diff = (cardImage[i].height - cardImage[i].width) / 2;
           cardImage[i].style.position = "absolute";
           cardImage[i].style.top = -diff;
       }else {
           cardImage[i].width *=  (240 / cardImage[i].height);
           cardImage[i].height *= (240 / cardImage[i].height);
           diff = (cardImage[i].width - cardImage[i].height) / 2;
           cardImage[i].style.position = "absolute";
           cardImage[i].style.left = -diff;
       }
   }
});