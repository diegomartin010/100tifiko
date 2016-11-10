  

    $.post( "/simulacion/getGraph", function( resp ) {
            // create a network
            var container = document.getElementById('mynetwork');

            // provide the data in the vis format
            var data = {
                nodes: resp.nodos,
                edges: resp.dependencias
            };
            var options = {};
            var options = {
                 autoResize: false
                // ,height: '100%'
                // ,width: '100%'
               , physics : { enabled:false }
               
                  ,interaction: {hover:true,hoverConnectedEdges:true}
                  ,layout: {
                    randomSeed: undefined,
                    improvedLayout:false,
                    hierarchical: {
                      enabled:false,
                      levelSeparation: 1000,
                      nodeSpacing: 300,
                      treeSpacing: 1,
                      blockShifting:false,
                      edgeMinimization: false,
                      parentCentralization: false,
                      direction: 'LR',        // UD, DU, LR, RL
                      sortMethod: 'hubsize'   // hubsize, directed
                    }
                  }
                   , edges: {
                    hoverWidth: 0.5
                  }
            }
            // initialize your network!
            var network = new vis.Network(container, data, options); 
    });

    