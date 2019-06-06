
//CARTOLINA 150
function Fronte150(){
	divretro150.setAttribute("hidden", "hidden");
	divfronte150.removeAttribute("hidden");
}

function Retro150(){
	divfronte150.setAttribute("hidden", "hidden");
	divretro150.removeAttribute("hidden");
}

function Info150(){
	divinfo150.removeAttribute("hidden");
	window.location = "main.html#info150";
}

function CloseInfo150(){
	divinfo150.setAttribute("hidden", "hidden");
	window.location = "main.html#sezione150";
}

var angleF150=0;
var angleR150=0;
var rotatestring;
function Ruota150(){
	if(divretro150.getAttribute("hidden")=="hidden"){ //se il retro è nascosto ruoto la cartolina di fronte.
	angleF150 = angleF150 + 90;
	if (angleF150==360) {
		angleF150 = 0;
	}
	imgdivfronte150.firstChild.setAttribute("style", "transform: rotate(" + angleF150 + "deg)");
	}
	else {
		angleR150 = angleR150 + 90;
	if (angleR150==360) {
		angleR150 = 0;
	}
	imgdivretro150.firstChild.setAttribute("style", "transform: rotate(" + angleR150 + "deg)");
	}
}

//CARTOLINA 47
function Fronte47(){
	divretro47.setAttribute("hidden", "hidden");
	divfronte47.removeAttribute("hidden");
}

function Retro47(){
	divfronte47.setAttribute("hidden", "hidden");
	divretro47.removeAttribute("hidden");
}

function Info47(){
	divinfo47.removeAttribute("hidden");
	window.location = "main.html#info47";
}

function CloseInfo47(){
	divinfo47.setAttribute("hidden", "hidden");
	window.location = "main.html#sezione47";
}

var angleF47=0;
var angleR47=0;
var rotatestring;
function Ruota47(){
	if(divretro47.getAttribute("hidden")=="hidden"){ //se il retro è nascosto ruoto la cartolina di fronte.
	angleF47 = angleF47 + 90;
	if (angleF47==360) {
		angleF47 = 0;
	}
	imgdivfronte47.firstChild.setAttribute("style", "transform: rotate(" + angleF47 + "deg)");
	}
	else {
		angleR47 = angleR47 + 90;
	if (angleR47==360) {
		angleR47 = 0;
	}
	imgdivretro47.firstChild.setAttribute("style", "transform: rotate(" + angleR47 + "deg)");
	}
}


// CARTOLINA 65
function Fronte65(){
	divretro65.setAttribute("hidden", "hidden");
	divfronte65.removeAttribute("hidden");
}

function Retro65(){
	divfronte65.setAttribute("hidden", "hidden");
	divretro65.removeAttribute("hidden");
}

function Info65(){
	divinfo65.removeAttribute("hidden");
	window.location = "main.html#info65";
}

function CloseInfo65(){
	divinfo65.setAttribute("hidden", "hidden");
	window.location = "main.html#sezione65";
}

var angleF65=0;
var angleR65=0;
var rotatestring;
function Ruota65(){
	if(divretro65.getAttribute("hidden")=="hidden"){ //se il retro è nascosto ruoto la cartolina di fronte.
	angleF65 = angleF65 + 90;
	if (angleF65==360) {
		angleF65 = 0;
	}
	imgdivfronte65.firstChild.setAttribute("style", "transform: rotate(" + angleF65 + "deg)");
	}
	else {
		angleR65 = angleR65 + 90;
	if (angleR65==360) {
		angleR65 = 0;
	}
	imgdivretro65.firstChild.setAttribute("style", "transform: rotate(" + angleR65 + "deg)");
	}
}

//definizione variabili
var bottoneretro150;
var bottonefronte150;
var bottoneinfo150;
var bottonechiudiinfo150;
var bottoneruota150;
var imgdivfronte150;
var imgdivretro150;
var divfronte150;
var divretro150;
var divinfo150;

var bottoneretro47;
var bottonefronte47;
var bottoneinfo47;
var bottonechiudiinfo47;
var bottoneruota47;
var imgdivfronte47;
var imgdivretro47;
var divfronte47;
var divretro47;
var divinfo47;

var bottoneretro65;
var bottonefronte65;
var bottoneinfo65;
var bottonechiudiinfo65;
var bottoneruota65;
var imgdivfronte65;
var imgdivretro65;
var divfronte65;
var divretro65;
var divinfo65;

// gestoreload

function gestoreLoad() {
	try {
	bottoneretro150 = document.getElementById("buttonretro_150");
	bottonefronte150 = document.getElementById("buttonfronte_150");
	bottoneinfo150 = document.getElementById("buttoninfo_150");
	bottonechiudiinfo150 = document.getElementById("buttonchiudiinfo_150");
	divfronte150 = document.getElementById("fronte150");
	divretro150 = document.getElementById("retro150");
	divinfo150 = document.getElementById("info150");
	bottoneruota150 = document.getElementById("buttonruota_150");
	imgdivfronte150 = document.getElementById("imgfronte150");
	imgdivretro150 = document.getElementById("imgretro150");
	bottonefronte150.onclick=Fronte150;
	bottoneretro150.onclick=Retro150;
	bottoneinfo150.onclick=Info150;
	bottonechiudiinfo150.onclick=CloseInfo150;
	bottoneruota150.onclick=Ruota150;
	
	bottoneretro47 = document.getElementById("buttonretro_47");
	bottonefronte47 = document.getElementById("buttonfronte_47");
	bottoneinfo47 = document.getElementById("buttoninfo_47");
	bottonechiudiinfo47 = document.getElementById("buttonchiudiinfo_47");
	divfronte47 = document.getElementById("fronte47");
	divretro47 = document.getElementById("retro47");
	divinfo47 = document.getElementById("info47");
	bottoneruota47 = document.getElementById("buttonruota_47");
	imgdivfronte47 = document.getElementById("imgfronte47");
	imgdivretro47 = document.getElementById("imgretro47");
	bottonefronte47.onclick=Fronte47;
	bottoneretro47.onclick=Retro47;
	bottoneinfo47.onclick=Info47;
	bottonechiudiinfo47.onclick=CloseInfo47;
	bottoneruota47.onclick=Ruota47;
	
	bottoneretro65 = document.getElementById("buttonretro_65");
	bottonefronte65 = document.getElementById("buttonfronte_65");
	bottoneinfo65 = document.getElementById("buttoninfo_65");
	bottonechiudiinfo65 = document.getElementById("buttonchiudiinfo_65");
	divfronte65 = document.getElementById("fronte65");
	divretro65 = document.getElementById("retro65");
	divinfo65 = document.getElementById("info65");
	bottoneruota65 = document.getElementById("buttonruota_65");
	imgdivfronte65 = document.getElementById("imgfronte65");
	imgdivretro65 = document.getElementById("imgretro65");
	bottonefronte65.onclick=Fronte65;
	bottoneretro65.onclick=Retro65;
	bottoneinfo65.onclick=Info65;
	bottonechiudiinfo65.onclick=CloseInfo65;
	bottoneruota65.onclick=Ruota65;
	
	
	}
	
	catch(e) {
    alert("gestoreLoad: "+e);
  }
}

window.onload=gestoreLoad;