$(document).ready(function(){
	newGrid(16);
	$('button').on("click",function(){
		var size = prompt("Which is the height of the grid?");

		$(".container div").remove();
		newGrid(size)
	});
})

function newGrid(x){
	var squareSize = 500/x;

	for (var i=0; i<x;i++){
	    for (var j=0; j<x;j++){
	    	$('.container').prepend('<div></div>');
	  	}
	  }

	$("div").width(squareSize);
	$("div").height(squareSize)
	$("div").css("background-color","black");
	
	$('div').mouseenter(function(){
		$(this).css("background-color", randomColor());
	});

	$('div').mouseleave(function(){
		$(this).css("background-color", randomColor());
	});

	
  	
}



	

function randomColor(){
	var r = Math.floor(Math.random() * 256);
	var g = Math.floor(Math.random() * 256);
	var b = Math.floor(Math.random() * 256);
	return "rgb(" + r + "," +  g + ","+ b + ")"
}
