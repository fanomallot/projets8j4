$(document).ready(function() {
// Mets ici ton code
	let make = $('.category-title');
	let card = make.next();
	card.hide();
	make.on('click',function(){
			card.hide();
	$(this).next().fadeIn(500);
});
});