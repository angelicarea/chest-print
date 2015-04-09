#chest-print
##使用场景
这个插件,适用于针式打印机等需要定位打印的需求,如本人使用场景是打印快递单.
##如何使用
插件主体是as3编写的swf文件,扩充部分写了一个jQuery小插件,所以需要引入[jQuery][] 包,[swfobject][]包.  

- 创建一个空DIV并创建jQuery对象:
```
  $("#printAll").printAll();
```
- 需要一个JSON数组参数,数组中的对象为多Page打印,一个对象代表一个Page;
Page对象中,存在width,height,frontSize(拼写错误,囧),content属性;
Page对象中的Content属性是一个打印元素对象数组,元素对象又有left,top,name(打印无效属性,后台对象转化过来的属性),value(打印内容),width属性.例子如下,这是打印一页快递单:
```
        [
            {
                "width": "900",
                "height": "600",
                "frontSize": "12",
                "content": [
                    {
                        "left": "343",
                        "top": "345",
                        "name": "shipName",
                        "value": "收货人小凳子",
                        "width": "130"
                    },
                    {
                        "left": "126",
                        "top": "373",
                        "name": "shipAddress",
                        "value": "山东省 临沂市 费县 世茂大道",
                        "width": "309"
                    },
                    {
                        "left": "142",
                        "top": "308",
                        "name": "shipZip",
                        "value": "150000",
                        "width": "130"
                    },
                    {
                        "left": "219",
                        "top": "434",
                        "name": "shipMobile",
                        "value": "13569696969",
                        "width": "179"
                    },
                    {
                        "left": "358",
                        "top": "164",
                        "name": "deliverUserName",
                        "value": "王二虎",
                        "width": "134"
                    },
                    {
                        "left": "127",
                        "top": "192",
                        "name": "deliverAddress",
                        "value": "辽宁省 沈阳市市辖区 淮海路",
                        "width": "253"
                    },
                    {
                        "left": "136",
                        "top": "131",
                        "name": "deliverZip",
                        "value": "1456253",
                        "width": "161"
                    },
                    {
                        "left": "210",
                        "top": "258",
                        "name": "deliverMobile",
                        "value": "15369554687",
                        "width": "153"
                    }
                ]
            }
        ]
``` 
   [jQuery]: http://jquery.com/
   [swfobject]: http://jquery.thewikies.com/swfobject/
