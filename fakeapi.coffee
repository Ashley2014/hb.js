express = require('express');
app = express();
util = require('util')
fs   = require('fs-extra');
qs=require('querystring');
uuid = require('node-uuid');
_ = require('lodash');

delayTime=0

app.all '/',  (req, res) ->
  data='hello'
  res.jsonp(data);

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