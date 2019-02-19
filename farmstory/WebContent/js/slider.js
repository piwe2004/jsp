$(document).ready(function(){
  var li = $(".slider > ul > li");
  var i = 0;
  setInterval(function(){
    li.eq(i).animate({left:"-980px"},1000);
    i++
    if(i >= li.length){
      i = 0;
    }
    li.eq(i).css("left","980px").animate({left:"0"},1000);
  }, 3000);
});
