function launchSim2(){
	var sys = arbor.ParticleSystem({
		repulsion:100,
		stiffness:0,
		friction:0,
		gravity:false,
		fps:200,
		dt:255,
		precision:2.5
	});

		
	sys.renderer = Renderer("#viewport") ;

	function rand(min,max)
	{
		return Math.floor(Math.random()*(max-min+1)+min);
	}

	var palabras = ["am1", "am2", "ms", "cpsas raras", "que se yo", "basicamente"];
	var colores = ["red","blue","green","orange"];
	var nodes = new Array();
	for (var i = 0; i <= 5; i++) {
		console.log("iteracion"+i);
		var num = rand(1,3);
		nodes[i] = sys.addNode(	i.toString() , {
		 	color:colores[num],
		 	shape:'square',
		 	label: palabras[i]+"(nivel: "+num+")"
		});
		console.log("iteracion"+i);	
	}
	for (var i = 0; i <= 5; i++) {
		sys.addEdge( nodes[rand(1,5)], nodes[rand(1,5)] , {
			directed: true,
			weight:2,
			color:'#3F002F',
	    });
	}
}

function launchSim( parametro ){
	
	var sys = arbor.ParticleSystem({
		repulsion:100,
		stiffness:0,
		friction:0,
		gravity:false,
		fps:200,
		dt:255,
		precision:2.5
	});
		
	sys.renderer = Renderer("#viewport") ;

	var materias = ["am1", "am2", "ms", "cpsas raras", "que se yo", "basicamente"];
	var nodes = new Array(200);
	for (var i = 0; i <= materias.length; i++) {
		// console.log("iteracion"+i+"parametro = "+materias[i]);
		nodes[i] = sys.addNode(	i.toString() , {
		 	color:"red",
		 	shape:'square',
		 	label: materias[i]+"(nivel: "+i+")"
		});

	}

}

// launchSim();
// Console.log
$.post( "/simulacion/getSim2Curse", function( result ) {
	console.log(result);
	launchSim(result)
});
