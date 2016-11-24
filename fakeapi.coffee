express = require('express');
app = express();
util = require('util')
fs   = require('fs-extra');
qs=require('querystring');
uuid = require('node-uuid');
_ = require('lodash');

delayTime=1000

app.all '/',  (req, res) ->
  data='hello'
  res.jsonp(data);

app.all '/seat',  (req, res) ->
  data={"user":"","showInfo":{"movieId":246177,"cinemaId":7,"showId":69624,"desc":"","price":25.0,"showDate":"2016-06-21","cinemaName":"万达电影城(金桥店)","hallName":"1号厅","hallId":"1","movieName":"X战警：天启","showTime":"今天 6月21日21:30","seqNo":"201606210069624","buyNumLimit":4},"sections":[{"sectionName":"默认场区","rows":6,"sectionId":"01","columns":13,"seatRows":[{"seats":[{"rowId":"1","rowNum":1,"columnId":"1","seatNo":"1,1","columnNum":0,"type":"N"},{"rowId":"1","rowNum":1,"columnId":"2","seatNo":"1,2","columnNum":1,"type":"N"},{"rowId":"1","rowNum":1,"columnId":"3","seatNo":"1,3","columnNum":2,"type":"N"},{"rowId":"1","rowNum":1,"columnId":"4","seatNo":"1,4","columnNum":3,"type":"N"},{"rowId":"1","rowNum":1,"columnId":"5","seatNo":"1,5","columnNum":4,"type":"N"},{"rowId":"1","rowNum":1,"columnId":"6","seatNo":"1,6","columnNum":5,"type":"N"},{"rowId":"1","rowNum":1,"columnId":"7","seatNo":"1,7","columnNum":6,"type":"N"},{"rowId":"1","rowNum":1,"columnId":"8","seatNo":"1,8","columnNum":7,"type":"N"},{"rowId":"1","rowNum":1,"columnId":"9","seatNo":"1,9","columnNum":8,"type":"N"},{"rowId":"1","rowNum":1,"columnId":"","seatNo":"","columnNum":9,"type":"E"},{"rowId":"1","rowNum":1,"columnId":"","seatNo":"","columnNum":10,"type":"E"},{"rowId":"1","rowNum":1,"columnId":"10","seatNo":"1,12","columnNum":11,"type":"N"},{"rowId":"1","rowNum":1,"columnId":"11","seatNo":"1,13","columnNum":12,"type":"N"}],"columns":13,"rowId":"1","rowNum":1},{"seats":[{"rowId":"2","rowNum":2,"columnId":"1","seatNo":"2,1","columnNum":0,"type":"N"},{"rowId":"2","rowNum":2,"columnId":"2","seatNo":"2,2","columnNum":1,"type":"N"},{"rowId":"2","rowNum":2,"columnId":"3","seatNo":"2,3","columnNum":2,"type":"N"},{"rowId":"2","rowNum":2,"columnId":"4","seatNo":"2,4","columnNum":3,"type":"N"},{"rowId":"2","rowNum":2,"columnId":"5","seatNo":"2,5","columnNum":4,"type":"N"},{"rowId":"2","rowNum":2,"columnId":"6","seatNo":"2,6","columnNum":5,"type":"N"},{"rowId":"2","rowNum":2,"columnId":"7","seatNo":"2,7","columnNum":6,"type":"N"},{"rowId":"2","rowNum":2,"columnId":"8","seatNo":"2,8","columnNum":7,"type":"N"},{"rowId":"2","rowNum":2,"columnId":"9","seatNo":"2,9","columnNum":8,"type":"N"},{"rowId":"2","rowNum":2,"columnId":"","seatNo":"","columnNum":9,"type":"E"},{"rowId":"2","rowNum":2,"columnId":"","seatNo":"","columnNum":10,"type":"E"},{"rowId":"2","rowNum":2,"columnId":"10","seatNo":"2,12","columnNum":11,"type":"N"},{"rowId":"2","rowNum":2,"columnId":"11","seatNo":"2,13","columnNum":12,"type":"N"}],"columns":13,"rowId":"2","rowNum":2},{"seats":[{"rowId":"3","rowNum":3,"columnId":"1","seatNo":"3,1","columnNum":0,"type":"N"},{"rowId":"3","rowNum":3,"columnId":"2","seatNo":"3,2","columnNum":1,"type":"N"},{"rowId":"3","rowNum":3,"columnId":"3","seatNo":"3,3","columnNum":2,"type":"N"},{"rowId":"3","rowNum":3,"columnId":"4","seatNo":"3,4","columnNum":3,"type":"N"},{"rowId":"3","rowNum":3,"columnId":"5","seatNo":"3,5","columnNum":4,"type":"N"},{"rowId":"3","rowNum":3,"columnId":"6","seatNo":"3,6","columnNum":5,"type":"N"},{"rowId":"3","rowNum":3,"columnId":"7","seatNo":"3,7","columnNum":6,"type":"N"},{"rowId":"3","rowNum":3,"columnId":"8","seatNo":"3,8","columnNum":7,"type":"N"},{"rowId":"3","rowNum":3,"columnId":"9","seatNo":"3,9","columnNum":8,"type":"N"},{"rowId":"3","rowNum":3,"columnId":"","seatNo":"","columnNum":9,"type":"E"},{"rowId":"3","rowNum":3,"columnId":"","seatNo":"","columnNum":10,"type":"E"},{"rowId":"3","rowNum":3,"columnId":"10","seatNo":"3,12","columnNum":11,"type":"N"},{"rowId":"3","rowNum":3,"columnId":"11","seatNo":"3,13","columnNum":12,"type":"N"}],"columns":13,"rowId":"3","rowNum":3},{"seats":[{"rowId":"4","rowNum":4,"columnId":"1","seatNo":"4,1","columnNum":0,"type":"N"},{"rowId":"4","rowNum":4,"columnId":"2","seatNo":"4,2","columnNum":1,"type":"N"},{"rowId":"4","rowNum":4,"columnId":"3","seatNo":"4,3","columnNum":2,"type":"N"},{"rowId":"4","rowNum":4,"columnId":"4","seatNo":"4,4","columnNum":3,"type":"LK"},{"rowId":"4","rowNum":4,"columnId":"5","seatNo":"4,5","columnNum":4,"type":"LK"},{"rowId":"4","rowNum":4,"columnId":"6","seatNo":"4,6","columnNum":5,"type":"N"},{"rowId":"4","rowNum":4,"columnId":"7","seatNo":"4,7","columnNum":6,"type":"LK"},{"rowId":"4","rowNum":4,"columnId":"8","seatNo":"4,8","columnNum":7,"type":"LK"},{"rowId":"4","rowNum":4,"columnId":"","seatNo":"","columnNum":8,"type":"E"},{"rowId":"4","rowNum":4,"columnId":"","seatNo":"","columnNum":9,"type":"E"},{"rowId":"4","rowNum":4,"columnId":"","seatNo":"","columnNum":10,"type":"E"},{"rowId":"4","rowNum":4,"columnId":"","seatNo":"","columnNum":11,"type":"E"},{"rowId":"4","rowNum":4,"columnId":"","seatNo":"","columnNum":12,"type":"E"}],"columns":13,"rowId":"4","rowNum":4},{"seats":[{"rowId":"5","rowNum":5,"columnId":"1","seatNo":"5,1","columnNum":0,"type":"N"},{"rowId":"5","rowNum":5,"columnId":"2","seatNo":"5,2","columnNum":1,"type":"N"},{"rowId":"5","rowNum":5,"columnId":"3","seatNo":"5,3","columnNum":2,"type":"N"},{"rowId":"5","rowNum":5,"columnId":"4","seatNo":"5,4","columnNum":3,"type":"N"},{"rowId":"5","rowNum":5,"columnId":"5","seatNo":"5,5","columnNum":4,"type":"N"},{"rowId":"5","rowNum":5,"columnId":"6","seatNo":"5,6","columnNum":5,"type":"N"},{"rowId":"5","rowNum":5,"columnId":"7","seatNo":"5,7","columnNum":6,"type":"N"},{"rowId":"5","rowNum":5,"columnId":"8","seatNo":"5,8","columnNum":7,"type":"N"},{"rowId":"5","rowNum":5,"columnId":"","seatNo":"","columnNum":8,"type":"E"},{"rowId":"5","rowNum":5,"columnId":"","seatNo":"","columnNum":9,"type":"E"},{"rowId":"5","rowNum":5,"columnId":"","seatNo":"","columnNum":10,"type":"E"},{"rowId":"5","rowNum":5,"columnId":"","seatNo":"","columnNum":11,"type":"E"},{"rowId":"5","rowNum":5,"columnId":"","seatNo":"","columnNum":12,"type":"E"}],"columns":13,"rowId":"5","rowNum":5},{"seats":[{"rowId":"6","rowNum":6,"columnId":"","seatNo":"","columnNum":0,"type":"E"},{"rowId":"6","rowNum":6,"columnId":"1","seatNo":"6,2","columnNum":1,"type":"N"},{"rowId":"6","rowNum":6,"columnId":"2","seatNo":"6,3","columnNum":2,"type":"N"},{"rowId":"6","rowNum":6,"columnId":"","seatNo":"","columnNum":3,"type":"E"},{"rowId":"6","rowNum":6,"columnId":"3","seatNo":"6,5","columnNum":4,"type":"N"},{"rowId":"6","rowNum":6,"columnId":"4","seatNo":"6,6","columnNum":5,"type":"N"},{"rowId":"6","rowNum":6,"columnId":"5","seatNo":"6,7","columnNum":6,"type":"N"},{"rowId":"6","rowNum":6,"columnId":"6","seatNo":"6,8","columnNum":7,"type":"N"},{"rowId":"6","rowNum":6,"columnId":"7","seatNo":"6,9","columnNum":8,"type":"N"},{"rowId":"6","rowNum":6,"columnId":"8","seatNo":"6,10","columnNum":9,"type":"N"},{"rowId":"6","rowNum":6,"columnId":"","seatNo":"","columnNum":10,"type":"E"},{"rowId":"6","rowNum":6,"columnId":"","seatNo":"","columnNum":11,"type":"E"},{"rowId":"6","rowNum":6,"columnId":"","seatNo":"","columnNum":12,"type":"E"}],"columns":13,"rowId":"6","rowNum":6}]}]}

  res.setHeader('Access-Control-Allow-Origin', '*');

  res.setHeader('Access-Control-Request-Method', '*');
  setTimeout ->
    if req.callback
      res.jsonp(data);
    else
      res.json(data);
  ,delayTime
app.all '/reactcomment',  (req, res) ->
  data=[
    {id: 1, author: "Pete Hunt", text: "This is one comment"},
    {id: 2, author: "Jordan Walk", text: "This is *another* comment"}
  ]
  res.setHeader('Access-Control-Allow-Origin', '*');

  res.setHeader('Access-Control-Request-Method', '*');
  setTimeout ->
    if req.callback
      res.jsonp(data);
    else
      res.json(data);
  ,delayTime

app.all '/project/list', (req, res) ->
  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/projectList.txt','utf8')

  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1
  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1
  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()
  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime
app.all '/project/disciplineType/list', (req, res) ->
  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/disciplineTypeList.txt','utf8')

  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1
  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1
  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()
  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime

app.all '/project/discipline/list', (req, res) ->
  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/disciplineList.txt','utf8')

  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1
  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1
  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()
  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime

app.all '/project/wbs/list', (req, res) ->
  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/wbsList.txt','utf8')

  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1
  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1
  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()
  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime

app.all '/project/plant/list', (req, res) ->
  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/plantList.txt','utf8')

  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1
  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1
  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()
  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime
app.all '/project/user/list', (req, res) ->
  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/userList.txt','utf8')

  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1
  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1
  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()
  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime
app.all '/project/group/list', (req, res) ->
  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/groupList.txt','utf8')

  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1
  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1
  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()
  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime

app.all '/project/detail', (req, res) ->
  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  if !true
    data=
      "code":"1002"
      "message":"您没有填项目号"
      "data":""
  else


    currenData=JSON.parse fs.readFileSync('data/projectList.txt','utf8')

    currentProject=_.find(currenData,'projectNo',req.query.projectNo)

    if !currentProject
      data=
        "code":"1004"
        "message":"没有查找到您的项目号："+req.query.projectNo
        "data":""
    else
      data.data=currentProject





  setTimeout ->
    res.jsonp(data);
  ,delayTime
app.all '/project/create', (req, res) ->
  console.log req.query
  data=
    "code":"1"
    "message":"操作成功"
    "data":""
  if !req.query.projectNo
    data=
      "code":"1002"
      "message":"项目号是必填的"
      "data":""
  else
    writeData=
      objectId:uuid()
      projectNo:         req.query.projectNo
      projectName:   req.query.projectName
      projectContractNo:  req.query.projectContractNo
      projectLocation:        req.query.projectLocation
      projectManager:     req.query.projectManager
      projectStartDate:       req.query.projectStartDate
      projectEndDate: req.query.projectEndDate
      status: req.query.status
    currenData=JSON.parse fs.readFileSync('data/projectList.txt','utf8')
    data.data=writeData
    currenData.unshift writeData
    fs.writeFileSync('data/projectList.txt', JSON.stringify currenData)
  setTimeout ->
    res.jsonp(data);
  ,delayTime
app.all '/project/update', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/projectList.txt','utf8')

  console.log req.query,'database' ,currenData
  #currentVP=_.find(currenData,'objectId',req.query.objectId)
  selectedVPList=_.filter currenData,(item)->
    _.includes [].concat(req.query.objectId),item.objectId

  console.log selectedVPList


  if !selectedVPList
    data=
      "code":"1002"
      "message":"没有找到objectId"
      "data":""
  else
    _.forEach selectedVPList,(VP,n)->

      _.forIn VP,(value, key)->
        console.log  value, key
        VP[key]=[].concat(req.query[key])[n]

      console.log VP,n
    fs.writeFileSync('data/projectList.txt', JSON.stringify currenData)

  setTimeout ->
    res.jsonp(data);
  ,delayTime


app.all '/project/delete', (req, res) ->

  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/projectList.txt','utf8')
  #currentVP=_.find(currenData,'objectId',req.query.objectId)
  #console.log req.query.objectId
  selectedVPList=_.filter currenData,(item)->
    _.includes [].concat(req.query.objectId),item.objectId
  #console.log selectedVPList
  if !selectedVPList
    data=
      "code":"1002"
      "message":"没有找到objectId"
      "data":""
  else
    _.forEach selectedVPList,(VP,n)->
#console.log VP
      _.remove(currenData,'objectId',VP.objectId)
      return

    fs.writeFileSync('data/projectList.txt', JSON.stringify currenData)
  setTimeout ->
    res.jsonp(data);
  ,delayTime



app.all '/project/vp/create', (req, res) ->
  console.log req.query
  data=
    "code":"1"
    "message":"操作成功"
    "data":""
  if !req.query.title
    data=
      "code":"1002"
      "message":"文件名是必填的"
      "data":""
  else
    writeData=
      objectId:uuid()
      vPNo:         req.query.vPNo
      vPNoClient:   req.query.vPNoClient
      title:        req.query.title
      revision:     req.query.revision
      latest:       req.query.latest
      IssuedStatus: req.query.IssuedStatus
      VSQNo: req.query.VSQNo
      FrVendorRef: req.query.FrVendorRef
      ReceivedDate: req.query.ReceivedDate
      ForecastReturnDate: req.query.ForecastReturnDate
      VSQIssueRef: req.query.VSQIssueRef
      VSQIssueDate: req.query.VSQIssueDate
      VSQForecastReturnDate: req.query.VSQForecastReturnDate
      VSQActualReturnDate: req.query.VSQActualReturnDate
      VSQDelayDays: req.query.VSQDelayDays
      VSQIssueRefOwner: req.query.VSQIssueRefOwner
      IssueDateOwner: req.query.IssueDateOwner
      ForecastReturnDateOwner: req.query.ForecastReturnDateOwner
      ActualReturnDateOwner: req.query.ActualReturnDateOwner
      DelayDaysOwner: req.query.DelayDaysOwner
      ToVendorRef: req.query.ToVendorRef
      ReturnDate: req.query.ReturnDate
      ToVendorDelayDays: req.query.ToVendorDelayDays
      Result: req.query.Result
      ToSiteRef: req.query.ToSiteRef
      ToSiteActualDate: req.query.ToSiteActualDate
      PONumber: req.query.PONumber
      PODescription: req.query.PODescription
      Vendor: req.query.Vendor
      ProjectNo: req.query.ProjectNo
      PlantNo: req.query.PlantNo
      Discipline: req.query.Discipline
      ItemNo: req.query.ItemNo
      ItemDescription: req.query.ItemDescription
      PageNo: req.query.PageNo
      VolNo: req.query.VolNo
      DCC: req.query.DCC
    currenData=JSON.parse fs.readFileSync('data/vpList.txt','utf8')
    data.data=writeData
    currenData.unshift writeData
    fs.writeFileSync('data/vpList.txt', JSON.stringify currenData)
  setTimeout ->
    res.jsonp(data);
  ,delayTime

app.all '/project/vp/list', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/vpList.txt','utf8')



  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1


  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1




  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

#  switch req.query.sortField
#    when 'objectId'
#      currenData=_.sortBy(currenData, 'objectId')
#    when 'Title'
#      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()




  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime

app.all '/project/PO/list', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/POList.txt','utf8')



  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1


  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1




  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()




  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime

app.all '/project/vendor/list', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/vendorList.txt','utf8')



  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1


  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1




  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()




  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime
app.all '/project/equipment/list', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/vendorList.txt','utf8')



  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1


  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1




  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()




  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime

app.all '/project/fromVendor/list', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/fromVendorList.txt','utf8')



  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1


  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1




  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()




  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime

app.all '/project/toVendor/list', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/toVendorList.txt','utf8')



  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1


  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1




  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()




  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime

app.all '/project/fromOwner/list', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/fromOwnerList.txt','utf8')



  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1


  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1




  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()




  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime

app.all '/project/finishedDoc/list', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/finishedDocList.txt','utf8')



  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1


  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1




  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()




  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime

app.all '/project/relatedDoc/list', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/relatedDocList.txt','utf8')



  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1


  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1




  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()




  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime
app.all '/project/format/list', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/formatList.txt','utf8')



  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1


  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1




  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()




  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime

app.all '/project/version/list', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/versionList.txt','utf8')



  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1


  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1




  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()




  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime

app.all '/project/toOwner/list', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/toOwnerList.txt','utf8')



  if req.query.keywords
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1


  if req.query.PONumber
    currenData=_.filter currenData,(item)->
      return item.Title.toLowerCase().indexOf(req.query.PONumber.toLowerCase())>-1




  if req.query.sortField
    currenData=_.sortBy(currenData, req.query.sortField)

  #  switch req.query.sortField
  #    when 'objectId'
  #      currenData=_.sortBy(currenData, 'objectId')
  #    when 'Title'
  #      currenData=_.sortBy(currenData, 'Title')

  if req.query.sortWay=='DESC'
    currenData.reverse()




  #switch req.query.sortWay


  data.data.pageInfo=
    currentPage: req.query.currentPage||1
    pageCount:  Math.ceil(currenData.length/(Number(req.query.pageSize)))||10
    pageSize: Number(req.query.pageSize)||10
    totalCount: currenData.length

  startI=(data.data.pageInfo.currentPage-1)*data.data.pageInfo.pageSize
  endI=(data.data.pageInfo.currentPage)*data.data.pageInfo.pageSize

  console.log req.query,data.data.pageInfo,startI,endI
  data.data.resultSet=currenData.slice(startI,endI)
  setTimeout ->
    res.jsonp(data);
  ,delayTime


app.all '/project/vpList/VPNoClient', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/vpList.txt','utf8')
  if req.query.keywords
    currenData=_.filter currenData,(item)->
    return item.Title.toLowerCase().indexOf(req.query.keywords.toLowerCase())>-1

  data.data=_.pluck(currenData,'VPNoClient')



  data.data=currenData



  setTimeout ->
    res.jsonp(data);
  ,delayTime




app.all '/project/vp/update', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/vpList.txt','utf8')

  console.log req.query,'database' ,currenData
  #currentVP=_.find(currenData,'objectId',req.query.objectId)
  selectedVPList=_.filter currenData,(item)->
    _.includes [].concat(req.query.objectId),item.objectId

  console.log selectedVPList


  if !selectedVPList
    data=
      "code":"1002"
      "message":"没有找到objectId"
      "data":""
  else
    _.forEach selectedVPList,(VP,n)->

      _.forIn VP,(value, key)->
        console.log  value, key
        VP[key]=[].concat(req.query[key])[n]

      console.log VP,n
    fs.writeFileSync('data/vpList.txt', JSON.stringify currenData)

  setTimeout ->
    res.jsonp(data);
  ,delayTime



app.all '/project/vp/delete', (req, res) ->

  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/vpList.txt','utf8')
  #currentVP=_.find(currenData,'objectId',req.query.objectId)
  #console.log req.query.objectId
  selectedVPList=_.filter currenData,(item)->
    _.includes [].concat(req.query.objectId),item.objectId
  #console.log selectedVPList
  if !selectedVPList
    data=
      "code":"1002"
      "message":"没有找到objectId"
      "data":""
  else
    _.forEach selectedVPList,(VP,n)->
      #console.log VP
      _.remove(currenData,'objectId',VP.objectId)
      return

    fs.writeFileSync('data/vpList.txt', JSON.stringify currenData)
  setTimeout ->
    res.jsonp(data);
  ,delayTime


app.all '/project/PO/PONumbers', (req, res) ->


  data=
    "code":"1"
    "message":"操作成功"
    "data":{}

  currenData=JSON.parse fs.readFileSync('data/POList.txt','utf8')

  data.data=_.pluck(currenData,'PONumber')
  setTimeout ->
    res.jsonp(data);
  ,delayTime

server = app.listen 1111,()->
  host = server.address().address;
  port = server.address().port;
  console.log('Example app listening at http://%s:%s', host, port);