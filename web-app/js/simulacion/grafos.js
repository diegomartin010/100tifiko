  // create an array with nodes
    // var nodes = new vis.DataSet([
    //     {
    //           id: "AM1"
    //         , label: 'Analisis Matematico 1'
    //         , shape: "box"
    //         , shadow: true  
    //         , x: 0
    //         , fixed: { x: true, y: false}
    //         , level: 1
    //     } ,
    //     {
    //           id: "KK1"
    //         , label: 'KK uno'
    //         , shape: "box"
    //         , shadow: true  
    //         , x: 0
    //         , fixed: { x: true, y: false}
    //         , level: 1
    //     } ,
    //     {
    //           id: "AM2"
    //         , label: 'Analisis Matematico 2'
    //         , shape: "box"
    //         , shadow: true
    //         , fixed: { x: true, y: false}
    //         , level: 2
    //     } , 
    //     {
    //           id: "FI2"
    //         , label: 'Fisica 2'
    //         , shape: "box"
    //         , shadow: true
    //         , fixed: { x: true, y: false}
    //         , level: 3
    //     } , 
    //     {
    //           id: "MS"
    //         , label: 'Matematica Superior'
    //         , shape: "box"
    //         , shadow: true
    //         , fixed: { x: true, y: false}
    //         , level: 3
    //     }

    // ]);

    // create an array with edges
    // var edges = new vis.DataSet([
    //       {from: "AM1", to: "AM2"}
    //     , {from: "KK1", to: "AM2"}
    //     , {from: "AM2", to: "MS"}
    //     , {from: "AM2", to: "FI2"}

    // ]);

    $.post( "simulacion/getGraph", function( resp ) {
            // create a network
            var container = document.getElementById('mynetwork');

            // provide the data in the vis format
            var data = {
                nodes: resp.nodos,
                edges: resp.dependencias
            };
            var options = {};
            var options = {
              layout: {
                randomSeed: undefined,
                improvedLayout:true,
                hierarchical: {
                  enabled:true,
                  levelSeparation: 300,
                  nodeSpacing: 300,
                  treeSpacing: 10,
                  blockShifting: true,
                  edgeMinimization: true,
                  parentCentralization: false,
                  direction: 'LR',        // UD, DU, LR, RL
                  sortMethod: 'hubsize'   // hubsize, directed
                }
              }
            }
            // initialize your network!
            var network = new vis.Network(container, data, options); 
    });

    // // create a network
    // var container = document.getElementById('mynetwork');

    // // provide the data in the vis format
    // var data = {
    //     nodes: nodes,
    //     edges: edges
    // };
    // var options = {};
    // var options = {
    //   layout: {
    //     randomSeed: undefined,
    //     improvedLayout:true,
    //     hierarchical: {
    //       enabled:true,
    //       levelSeparation: 100,
    //       nodeSpacing: 200,
    //       treeSpacing: 10,
    //       blockShifting: true,
    //       edgeMinimization: true,
    //       parentCentralization: true,
    //       direction: 'UD',        // UD, DU, LR, RL
    //       sortMethod: 'hubsize'   // hubsize, directed
    //     }
    //   }
    // }
    // // initialize your network!
    // var network = new vis.Network(container, data, options);