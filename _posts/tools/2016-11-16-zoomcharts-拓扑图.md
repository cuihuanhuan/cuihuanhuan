---
title: zoomcharts-拓扑图
categories: zoomcharts
tags: zoomcharts
---

<h4>zoomcharts-拓扑图</h4>

拓扑图：https://zoomcharts.com/en/javascript-charts-library/html5-charts/netchart/



zoomchart.js在官网下载,是压缩过的,没有源码.
![img](/img/demo/zoomcharts-demo-1.png)


index.html

```html
<script src="zoomcharts.js"></script>
<content>
    <div id="demo"></div>

</content>
<script>


    var t = new NetChart({
        container: document.getElementById("demo"),
        area: { height: 500},

//        layout:{
//
//            nodeSpacing: 100, // horizontal spacing between nodes
//            rowSpacing: 100 // vertical spacing between node rows in the hierarchy layout
//        },
//        interaction:{
//            nodesMovable:false,
//            panning:{
//                enabled:false
//            }
//        },
        data: { url: "index2.json" },
        style: {
            nodeLabel:{
                margin:5
            },
            nodeStyleFunction: function(node) {
                node.aura = node.data.auras;
                node.image = "" + node.data.type + "_" +node.data.status + ".png";
            },
            node: {
                radius: 30,
                imageCropping: true,
                shadowBlur: 15,
                shadowColor: "#262626",
                fillColor: "rgba(44,233,233,0.8)",
                display:"image",
            }
        }
    });

//    function nodeStyle(node) {
//        var min = 20;
//        var max = 50;
//        var radius = Math.floor(Math.random() * (max - min)) + min;
//        node.radius = radius;
//    }



</script>
```

index2.json

```json
{
        "nodes":[
            {"id":"db1","status":"online","type":"db","loaded":true, "style":{"label":"源端数据库节点"}},
            {"id":"node1","status":"online","type":"node","loaded":true, "style":{"label":"源端机器节点"}},
            {"id":"db2","status":"online","type":"db", "loaded":true, "style":{"label":"备端数据库节点"}},

            {"id":"node2","status":"online","type":"node", "loaded":true, "style":{"label":"备端机器节点"}},
          {"id":"db2_rac1","status":"online","type":"db", "age":28, "name":"Anna", "loaded":true, "auras":"db2","style":{"label":"192.168.17.1"}},
          {"id":"db2_rac2","status":"offline","type":"db", "age":21, "name":"Wendy", "loaded":true, "auras": "db2","style":{"label":"192.168.17.2"}},
          {"id":"db2_rac3","status":"online","type":"db", "age":17, "name":"Dina", "loaded":true, "auras": "db2","style":{"label":"192.168.17.3"}},


          {"id":"db1_rac1","status":"online","type":"db", "age":28, "name":"Anna", "loaded":true, "auras":"db1","style":{"label":"192.168.17.5"}},
          {"id":"db1_rac2","status":"offline","type":"db", "age":21, "name":"Wendy", "loaded":true, "auras": "db1","style":{"label":"192.168.17.6"}}

        ],
        "links":[
            {"id":"l1","from":"db1", "to":"node1", "style":{"fillColor":"rgba(47,195,47,0.5)", "toDecoration":"arrow", "label":"OK","direction":"R"}},
            {"id":"l2","from":"node2", "to":"db2", "style":{"fillColor":"rgba(47,195,47,0.5)", "toDecoration":"arrow", "label":"OK"},"type":"collegue"},
            {"id":"l3","from":"node1", "to":"node2", "style":{"fillColor":"rgba(47,195,47,0.5)", "toDecoration":"arrow", "label":"OK"}},


          {"id":"l01", "from":"db2", "to":"db2_rac1", "type":"friend"},
          {"id":"l02", "from":"db2", "to":"db2_rac2", "type":"friend"},
          {"id":"l03", "from":"db2", "to":"db2_rac3", "type":"friend"},


          {"id":"l04", "from":"db1", "to":"db1_rac1", "type":"friend"},
          {"id":"l05", "from":"db1", "to":"db1_rac2", "type":"friend"}


        ]
    }
```


![img](/img/demo/zoomcharts-demo-2.png)
![img](/img/demo/zoomcharts-demo-3.png)
![img](/img/demo/zoomcharts-demo-4.png)