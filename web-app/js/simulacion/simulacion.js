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

			// node1 = sys.addNode("node1", {
			// 	color:"blue"
			// });
			// node2 = sys.addNode("node2", {color:"red"});
			// edge = sys.addEdge(node1, node2, {length:.75, pointSize:3})
			// console.log(node2);

			var data = {
		    	nodes:{
		    		
		    		// Primer nivel
		        	algebra:{
		        		color:'green',
		        		shape:'square',
		        		label:'Algebra (nivel1)'
		        	},
		        	am1:{
		        		alpha:1,
		        		color:'green',
		        		shape:'square',
		        		label:'am1 (nivel 1)'
		        	},
		        	
		        	// Segundo nivel
		        	am2:{
		        		color:'blue',
		        		shape:'square',
		        		label:'am2 (nivel 2)'
		        	},
		        	fisica2:{
		        		color:'blue',
		        		shape:'square',
		        		label:'fisica2 (nivel 2)'
		        	},
		   
		        	// Tercer nivel
		        	comunic:{
		        		color:'red',
		        		shape:'square',
		        		label:'comunic (nivel 3)',
		        	},
		        	ms:{
		        		color:'red',
		        		shape:'square',
		        		label:'ms (nivel 3)',
		        	},

		    	},
		    	edges:{
		    		// Primer nivel
		    		am1:{
		    			am2:{
		    				directed: true,
		    				weight:2,
		    				color:'gray',//color:'#3F002F',
		    			},
		    			fisica2:{
		    				directed: true,
		    				weight:2,
		    				color:'gray',//color:'#3F002F',
		    			},
		    		},
		    		algebra:{
		    			am2:{
		    				directed: true,
		    				weight:2,
		    				color:'gray',//color:'#3F002F',
		    			},
		    			fisica2:{
		    				directed: true,
		    				weight:2,
		    				color:'gray',//color:'#3F002F',
		    			},
		    		},
		    		// Segundo nivel
		    		am2:{
		    			ms:{
		    				directed: true,
		    				weight:2,
		    				color:'gray',//color:'#3F002F',
		    			},
		    			comunic:{
		    				directed: true,
		    				weight:2,
		    				color:'gray',//color:'#3F002F',
		    			}
		    		},
		    		fisica2:{
		    			comunic:{
		    				directed: true,
		    				weight:2,
		    				color:'gray',//color:'#3F002F',
		    			}
		    		},

			    }
			};
			sys.graft(data);