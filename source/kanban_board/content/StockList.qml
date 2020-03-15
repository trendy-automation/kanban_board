import QtQuick 2.0

ListModel {
            //id: stockModel
//            function addKanban(kanbanItem,id) {
//                if(kanbanItem){
//                    for(var i = 0; i < StockModel.count; ++i)
//                        if (StockModel.get(i).kanban===kanbanItem.kanban)
//                            //if (StockModel.get(i).count<kanbanCount){
//                            //    if (!StockModel.get(i).blocked) {
//                                    StockModel.get(i).count=StockModel.get(i).count+1
//                                    StockModel.get(i).dateTime = new Date()
//                                    console.log("kanban " + StockModel.get(i).kanban + " add 1 part")
//                                    checkBatch()
//                                    return
//                            //    } else
//                            //        console.log("kanban " + StockModel.get(i).kanban + " blocked")
//                            //}
//                    kanbanItem.count=1
//                    //kanbanItem.blocked=false
//                    kanbanItem.dateTime = new Date()
//                    StockModel.append(kanbanItem)
//                    console.log("kanbanItem " + id + " appended")
//                } else
//                    console.log("wrong kanban " + id)
//            }

//            function checkBatch() {
//                filterSettings.posFilterValue=1
//                if (proxyStockModel.countParts()>=(kanbanCount*6)){
//                    filterSettings.posFilterValue=2
//                    if (proxyStockModel.countParts()>=(kanbanCount*6)){
//                        createBatch(0)
//                    }
//                }
//                filterSettings.posFilterValue=3
//                if (proxyStockModel.countParts()>=(kanbanCount*6)){
//                    filterSettings.posFilterValue=4
//                    if (proxyStockModel.countParts()>=(kanbanCount*6)){
//                        createBatch(2)
//                    }
//                }
//            }

//            function createBatch(pos0) {
//                for(var i = 0; i < 12; ++i){
//                    filterSettings.posFilterValue=pos0 + i % 2
//                    var kanbanItem = proxyStockModel.get(i)
//                    if (kanbanItem.count>=kanbanCount){
//                        proxyStockModel.get(i).count=kanbanItem.count-kanbanCount
//                        kanbanItem.count=kanbanCount
//                        batchModel.push(kanbanItem)
//                    }
//                }
//            }

//            function countKanban(kanban) {
//                    var count = 0
//                    for(var i = 0; i < StockModel.count; ++i)
//                        if (StockModel.get(i).kanban===kanban)
//                            count=count+StockModel.get(i).count
//                    return count
//            }

//            function saveStockModel() {
//                if(!settingsReading){
//                    //var datamodel = []
//                    for (var i = 0; i < kanbanBase.count; ++i){
//                        //datamodel.push(kanbanModel.get(i))
//                        //datamodel.push({kanban:kanbanBase.get(i).kanban,count: kanbanModel.countKanban(kanbanBase.get(i).kanban)})
//                        kanbanApp.setValue('item'+i,JSON.stringify({kanban:  kanbanBase.get(i).kanban,
//                                                                    sebango: kanbanBase.get(i).sebango,
//                                                                    count:   stockModel.countKanban(kanbanBase.get(i).kanban)}))
//                    }
//                    //datastore = JSON.stringify(datamodel)
//                    //kanbanApp.setValue('shopstock',datastore)
//                }
//            }

//            function loadStockModel() {
//                stockModel.clear()
//                settingsReading=true
//                var i = 0
//                while (kanbanApp.value('item'+i)!=='{}'){
//                    ++i
//                    var item = JSON.parse(kanbanApp.value('item'+i))
//                    for (var j = 0; j < item.count; ++j)
//                        kanbanModel.addKanban(kanbanBase.indexOf(item.kanban.toString().trim()),item.kanban)
//                }
//                settingsReading=false
//            }

//            onDataChanged: {
//                saveStockModel()
//            }
//            onRowsRemoved: {
//                saveStockModel()
//            }
//            onRowsInserted: {
//                saveStockModel()
//            }
}
