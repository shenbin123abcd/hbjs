http = require('http');
url = require('url');
formidable = require('formidable')
util = require('util')
fs   = require('fs-extra');
qs=require('querystring');
uuid = require('node-uuid');
_ = require('lodash');

#console.log(process.argv)
#console.log(formidable,util)
#fs.writeFileSync('test.txt', 'Hello fs!');
#
#os = require('os');
#gigaByte = 1 / (Math.pow(1024, 3));
#console.log('Total Memory', os.totalmem() * gigaByte, 'GBs');
#console.log('Available Memory', os.freemem() * gigaByte, 'GBs');
#console.log('Percent consumed', 100 * (1 - os.freemem() / os.totalmem()));


server = http.createServer (req, res) ->



  params = url.parse(req.url, true);

#  console.log('request headers...');
  console.log(req.headers);
#  console.log('urlll',params);
  delayTime=1000
  res.setHeader('Access-Control-Allow-Origin', '*');

  res.setHeader('Access-Control-Request-Method', '*');
#  res.setHeader('Access-Control-Allow-Methods', '*');
  res.setHeader('Access-Control-Allow-Headers', 'Authorization');
#  res.setHeader('Access-Control-Allow-Headers', '*');
#  res.addTrailers('Authorization');
  #  res.addHeader("Access-Control-Allow-Headers", "Content-Type, Authorization")

  if  req.method == 'OPTIONS'
    res.writeHead(200);
    res.end();

    return
  res.writeHead(200, {'Content-Type': 'text/plain; charset=utf-8'});

#  res.writeHead(200, {'Content-Type': 'application/json'});
#  res.writeHead(200, {'Content-Type': 'application/javascript; charset=utf-8'});

  #  switch req.url
  switch params.pathname
    when "/"
      do->
        data=
          "code":"1111"
          "message":"操作成功"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            #jsonp
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime
    when "/workspace/list"
      do->

        data = undefined
        fakeSample=
          "logoImageUrl":"http://img.zizaidian.com/web/icon_default_shop.png"
          "objectName":"document系统文件夹采购"
          "fileNum":"99"
          "projectCode":"2010001002"
          "folderNum":"19"
          "userNum":"29"
          "description":"新视野项目"
          "state":1
          "objectId":"327DB460312811E5"
        data=
          "code":"1"
          "message":"操作成功"
          "data":[]
        for i in [0..8]
          data.data.push fakeSample

        currenData=JSON.parse fs.readFileSync('data/workspaceList.json','utf8')

        realData=
          "code":"1"
          "message":"操作成功"
          "data":currenData


        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(realData) + ')');
          else
            res.write(JSON.stringify realData);
          res.end();
        ,delayTime
    when "/workspace/create"
      do->

#        console.log params.query

        data=
          "code":"1"
          "message":"操作成功"
          "data":""

        writeData=
          objectName: params.query.objectName
          projectCode: params.query.projectCode
          description: params.query.description
          logoImageUrl: params.query.logoImageUrl
          workspaceType: params.query.workspaceType
          objectId:uuid()
          state:1
          fileNum:0
          folderNum:0
          userNum:0

        currenData=JSON.parse fs.readFileSync('data/workspaceList.json','utf8')
        currenData.unshift writeData
        fs.writeFileSync('data/workspaceList.json', JSON.stringify currenData)

        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime
    when "/workspace/update"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":""





        currenData=JSON.parse fs.readFileSync('data/workspaceList.json','utf8')

        currentWS=_.find(currenData,'objectId',params.query.objectId)
        currentWS.objectName=params.query.objectName
        currentWS.projectCode=params.query.projectCode
        currentWS.description=params.query.description
        currentWS.logoImageUrl=params.query.logoImageUrl
        currentWS.workspaceType=params.query.workspaceType


        fs.writeFileSync('data/workspaceList.json', JSON.stringify currenData)


        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,2000
    when "/workspace/delete"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":""

        currenData=JSON.parse fs.readFileSync('data/workspaceList.json','utf8')

        _.remove(currenData,'objectId',params.query.workspaceId)

        fs.writeFileSync('data/workspaceList.json', JSON.stringify currenData)

        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime

    when "/workspace/changeState"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":""

        currenData=JSON.parse fs.readFileSync('data/workspaceList.json','utf8')

        _.find(currenData,'objectId',params.query.workspaceId).state=Number params.query.state

        fs.writeFileSync('data/workspaceList.json', JSON.stringify currenData)

        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime

    when "/workspace/appointAdmin"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime


    when "/workspace/disAppointAdmin"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime


    when "/workspace/info"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":
            "logoImageUrl":"http://img.zizaidian.com/web/icon_default_shop.png"
            "objectName":"document系统文件夹采购"
            "objectId":"327DB460312811E5"
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime



    when "/user/login"
      do->

        data=
          "code":"1"
          "message":"操作成功"
          "data":

            "accessKey":"fgdf"
            "accessToken":"fdgfd"
            "user":
              "userId":"fdgfd"
              "photo":"http://img.zizaidian.com/web/icon_default_shop.png"
              "userName":"小明"
            "role": [
              "workspaceId" : "0b12323"
              "roleName"    : "0b12323_workspace_manager"
            ,
              "workspaceId" : "4343dgr"
              "roleName"    : "4343dgr_normal_user"
            ,
              "workspaceId" : "235sdf"
              "roleName"    : "dw_document_administrator"
            ]



        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime
    when "/user/logout"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":''
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime
    when "/user/info"
      do->


        currenData=JSON.parse fs.readFileSync('data/workspaceList.json','utf8')
        roles = []
        _.forEach currenData,(item)->
          role={}
          role.workspaceId=item.objectId
          role.roleName='dw_document_administrator'
          roles.push role
          return

        data=
          "code":"1"
          "message":"操作成功"
          "data":
            "photo":"http://img.zizaidian.com/web/icon_default_shop.png"
            "userName":"小明"
            "objectId":"345435fdgr"
            "roles":roles
#              [
#              "workspaceId" : "0b12323"
#              "roleName"    : "0b12323_workspace_manager"
#            ,
#              "workspaceId" : "4343dgr"
#              "roleName"    : "4343dgr_normal_user"
#            ,
#              "workspaceId" : "327DB460312811E5"
#              "roleName"    : "dw_document_administrator"
#            ]
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime
    when "/user/list"
      do->
        data = undefined
        fakeSample=
          "avatarUrl":"http://img.zizaidian.com/web/icon_default_shop.png"
          "userName":"小明"
          "userId":"345435fdgr"
          "telephone":"13817345012"
          "state":	1
          "email":'1746534101@qq.com'
          "userSource":"in"
          "roles":[
            "workspaceId" : "0b12323"
            "roleName"    : "0b12323_workspace_manager"
          ,
            "workspaceId" : "4343dgr"
            "roleName"    : "4343dgr_normal_user"
          ,
            "workspaceId" : "235sdf"
            "roleName"    : "dw_document_administrator"
          ]
        data=
          "code":"1"
          "message":"操作成功"
          "data":[]
        for i in [0..8]
          data.data.push JSON.parse JSON.stringify fakeSample
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime
    when "/user/update"
      do->
        data = undefined
        data=
          "code":"1"
          "message":"操作成功"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime
    when "/user/remove"
      do->
        data = undefined
        data=
          "code":"1"
          "message":"操作成功"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime
    when "/user/invite"
      do->
        data = undefined
        data=
          "code":"1"
          "message":"操作成功"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime

    when "/user/search"
      do->
        data = undefined
        fakeSample=
          "avatarUrl":"http://img.zizaidian.com/web/icon_default_shop.png"
          "userName":"小明"
          "userId":"12345"
          "telephone":"13817345012"
          "state":	1
          "email":'1746534101@qq.com'
          "userSource":"in"
          "roles":[
            "workspaceId" : "0b12323"
            "roleName"    : "0b12323_workspace_manager"
          ,
            "workspaceId" : "4343dgr"
            "roleName"    : "4343dgr_normal_user"
          ,
            "workspaceId" : "235sdf"
            "roleName"    : "dw_document_administrator"
          ]
        data=
          "code":"1"
          "message":"操作成功"
          "data":[]
        for i in [0..8]
          fakeSample.userId++
          data.data.push JSON.parse JSON.stringify fakeSample
        data.data[0].email='1746534101@qq.com'
        data.data[1].email='1746534103@qq.com'
        data.data[2].email='173322@qq.com'
        data.data[3].email='ewrewr101@qq.com'
        data.data[4].email='1746wer101@qq.com'
        data.data[5].email='17werfwerf534101@qq.com'
        data.data[6].email='5146534101@qq.com'
        data.data[7].email='5146534101@tryrt.com'
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime


    when "/group/list"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":[
            description: "空间管理员"
            displayName: "空间管理员"
            objectId: "120186a180002548"
            objectName: "0b0186a1800073ba_workspace_manager"
            objectType: "role"
          ,
            description: "销售"
            displayName: "销售"
            objectId: "120186a180002550"
            objectName: "0b0186a1800073ba_销售"
            objectType: "group"
          ,
            description: "客服"
            displayName: "客服"
            objectId: "120186a180002551"
            objectName: "0b0186a1800073ba_客服"
            objectType: "group"
          ,
            description: ""
            displayName: "xiaoming"
            objectId: "110186a180002d56"
            objectName: "xiaoming"
            objectType: "user"
          ]
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime



    when "/group/breadcrumb"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":[
            displayName: "男客服"
            id: "120186a18000255a"
            name: "0b0186a1800073ba_男客服"
            pId: null
            pName: "0b0186a1800073ba_group"
          ,
            displayName: "客服"
            id: "120186a180002551"
            name: "0b0186a1800073ba_客服"
            pId: null
            pName: "0b0186a1800073ba_男客服"
          ]
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime




    when "/group/create"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":''
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime



    when "/group/addMembers"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":''
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime



    when "/group/removeMembers"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":''
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime






    when "/file/list"
      do->
        data = undefined
        fakeSample=
          "objectType":"dw_document" #dw_document,dw_folder
          "contentType":"pdf" #decided ico
          "objectName":"document系统文件夹采购"
          "objectId":"327DB460312811E5"
          "ownerName":"peter"
          "modifier":"john"
          "modifyDate":1440153417651 #2015-08-21-18:37
          "contentSize":"20mb"
          "description":"新视野项目"
          "state":"open"

        data=
          "code":"1"
          "message":"操作成功"
          "data":
            pageInfo:
              currentPage: 1
              pageCount: 1
              pageSize: 30
              totalCount: 0
            resultSet:[]
        for i in [0..8]
          data.data.resultSet.push JSON.parse JSON.stringify fakeSample
        data.data.resultSet[0].objectType='dw_folder'
        for i in [0..8]
          data.data.resultSet[i].objectId=i
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime



    when "/file/breadcrumb"
      do->
        data = undefined
        fakeSample=
          id: "0b0186a180004171"
          name: "惠世科技"
          pId: "0c0186a180003d1f"
        data=
          "code":"1"
          "message":"操作成功"
          "data":[]
        for i in [0..8]
          data.data.push fakeSample
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime




    when "/file/collaborator/list"
      do->
        data = undefined
        fakeSample=
          accessorPermit: 3
          avatarUrl: null
          description: "大明"
          objectId: "110186a18000291f"
          objectName: "大明"
          type: 1
        data=
          "code":"1"
          "message":"操作成功"
          "data":[]
        for i in [0..8]
          data.data.push JSON.parse JSON.stringify fakeSample
        data.data[0].accessorPermit=0
        data.data[1].accessorPermit=1
        data.data[2].accessorPermit=2
        data.data[3].accessorPermit=3
        data.data[4].accessorPermit=4
        data.data[5].accessorPermit=5
        data.data[6].accessorPermit=6
        data.data[7].accessorPermit=7
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime


    when "/file/version/list"
      do->
        data = undefined
        data=
          "code":"1"
          "message":"操作成功"
          "data":[
            {
              "objectId": "090186a180004adc",
              "hidden": false,
              "aclDomain": "Administrator",
              "aclName": "dm_450186a180001111",
              "contentSize": 0,
              "objectName": "huishi",
              "accessDate": null,
              "creationDate": 1442225455000,
              "creatorName": "Administrator",
              "modifier": "Administrator",
              "modifyDate": 1442225455000,
              "folderId": null,
              "objectType": "dw_document",
              "title": "",
              "contentType": "",
              "folderPath": "/交换区/文档交换区/syf",
              "storagePath": "",
              "versionLabel": "4.0"
            },
            {
              "objectId": "090186a180004acd",
              "hidden": false,
              "aclDomain": "Administrator",
              "aclName": "dm_450186a180001111",
              "contentSize": 0,
              "objectName": "huishi",
              "accessDate": null,
              "creationDate": 1442223894000,
              "creatorName": "Administrator",
              "modifier": "Administrator",
              "modifyDate": 1442223894000,
              "folderId": null,
              "objectType": "dw_document",
              "title": "",
              "contentType": "",
              "folderPath": "/交换区/文档交换区/syf",
              "storagePath": "",
              "versionLabel": "3.0,CURRENT"
            },
            {
              "objectId": "090186a180004acb",
              "hidden": false,
              "aclDomain": "Administrator",
              "aclName": "dm_450186a180001111",
              "contentSize": 0,
              "objectName": "huishi",
              "accessDate": null,
              "creationDate": 1442223635000,
              "creatorName": "Administrator",
              "modifier": "Administrator",
              "modifyDate": 1442223635000,
              "folderId": null,
              "objectType": "dw_document",
              "title": "",
              "contentType": "",
              "folderPath": "/交换区/文档交换区/syf",
              "storagePath": "",
              "versionLabel": "2.0"
            },
            {
              "objectId": "090186a18000496c",
              "hidden": false,
              "aclDomain": "Administrator",
              "aclName": "dm_450186a180001111",
              "contentSize": 0,
              "objectName": "huishi",
              "accessDate": null,
              "creationDate": 1441872375000,
              "creatorName": "Administrator",
              "modifier": "110186a180000d1e",
              "modifyDate": 1441934148000,
              "folderId": null,
              "objectType": "dw_document",
              "title": "",
              "contentType": "",
              "folderPath": "/交换区/文档交换区/syf",
              "storagePath": "",
              "versionLabel": "1.0"
            }
          ]

        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime




    when "/file/collaborator/update"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":''
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime



    when "/file/treeNode"
      do->
        dataSample=[
            id:"1-1", pId:"0-1", name:"1-1"
          ,
            id:"1-2", pId:"0-1", name:"1-2"
          ,
            id:"1-3", pId:"0-1", name:"1-3"
          ,
            id:"2-3", pId:"1-1", name:"2-3"
          ]

        data=
          "code":"1"
          "message":"操作成功"
          "data":dataSample
        console.log 'data',data
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime


    when "/file/copy"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime


    when "/file/delete"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime



    when "/file/move"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime


    when "/file/update"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime

    when "/file/newFolder"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime



    when "/file/version/list"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":[
            {
              "objectId": "090186a180004adc",
              "hidden": false,
              "aclDomain": "Administrator",
              "aclName": "dm_450186a180001111",
              "contentSize": 0,
              "objectName": "huishi",
              "accessDate": null,
              "creationDate": 1442225455000,
              "creatorName": "Administrator",
              "modifier": "Administrator",
              "modifyDate": 1442225455000,
              "folderId": null,
              "objectType": "dw_document",
              "title": "",
              "contentType": "",
              "folderPath": "/交换区/文档交换区/syf",
              "storagePath": "http://dl1sw.baidu.com/client1/common/install/49091686215/BaiduAn_OnlineSetup_hdpi_50001.exe",
              "versionLabel": "4.0"
            },
            {
              "objectId": "090186a180004acd",
              "hidden": false,
              "aclDomain": "Administrator",
              "aclName": "dm_450186a180001111",
              "contentSize": 0,
              "objectName": "huishi",
              "accessDate": null,
              "creationDate": 1442223894000,
              "creatorName": "Administrator",
              "modifier": "Administrator",
              "modifyDate": 1442223894000,
              "folderId": null,
              "objectType": "dw_document",
              "title": "",
              "contentType": "",
              "folderPath": "/交换区/文档交换区/syf",
              "storagePath": "http://dl1sw.baidu.com/client1/common/install/49091686215/BaiduAn_OnlineSetup_hdpi_50001.exe",
              "versionLabel": "3.0,CURRENT"
            },
            {
              "objectId": "090186a180004acb",
              "hidden": false,
              "aclDomain": "Administrator",
              "aclName": "dm_450186a180001111",
              "contentSize": 0,
              "objectName": "huishi",
              "accessDate": null,
              "creationDate": 1442223635000,
              "creatorName": "Administrator",
              "modifier": "Administrator",
              "modifyDate": 1442223635000,
              "folderId": null,
              "objectType": "dw_document",
              "title": "",
              "contentType": "",
              "folderPath": "/交换区/文档交换区/syf",
              "storagePath": "http://dl1sw.baidu.com/client1/common/install/49091686215/BaiduAn_OnlineSetup_hdpi_50001.exe",
              "versionLabel": "2.0"
            },
            {
              "objectId": "090186a18000496c",
              "hidden": false,
              "aclDomain": "Administrator",
              "aclName": "dm_450186a180001111",
              "contentSize": 0,
              "objectName": "huishi",
              "accessDate": null,
              "creationDate": 1441872375000,
              "creatorName": "Administrator",
              "modifier": "110186a180000d1e",
              "modifyDate": 1441934148000,
              "folderId": null,
              "objectType": "dw_document",
              "title": "",
              "contentType": "",
              "folderPath": "/交换区/文档交换区/syf",
              "storagePath": "http://dl1sw.baidu.com/client1/common/install/49091686215/BaiduAn_OnlineSetup_hdpi_50001.exe",
              "versionLabel": "1.0"
            }
          ]
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime



    when "/file/download"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":
            storagePath: "http://dl1sw.baidu.com/client1/common/install/47638288230/BaiduSd_OnlineSetup_hdpi_10100.exe"
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime





    when "/file/upload", "/workspace/uploadImage", "/file/version/upload"
      console.log "dddd"
#      res.setHeader('Content-Type','application/json');
#      res.writeHead(200, {'Content-Type': 'text/json; charset=utf-8'});
      if req.method.toLowerCase()=='post'
        do->
#          chunk = '';
#          req.on 'data',(data) ->
#            chunk += data;
#            return

          form = new formidable.IncomingForm();
#          form.uploadDir = "uploads";
          form.parse(req, (err, fields, files)->
            data=
              "code":"1"
              "message":"文件上传：成功"
              "data":util.inspect({fields: fields, files: files})

#            res.write('received upload:\n\n');
#            res.end();

#            chunk = '';
#            req.on 'data',(data) ->
#              console.log('data',data);
#              chunk += data;
#
#            req.on 'end',(data) ->
#              params = qs.parse(chunk)
#
#              console.log(params);
#              res.write(util.inspect(qs.parse(chunk)))
#              res.end()

            setTimeout ->
#              res.write('a' + '(' + JSON.stringify(data) + ')');

#              res.write('{"height":"3642","url":"http://7kttnj.com2.z0.glb.qiniucdn.com/avatar/temp/201605/03/Fji-cm4_ej1sVvNmQX9WPv0UICa3.jpg","width":"1920"}');
#              res.write('<textarea data-type="application/json">
#                          {"ok": true, "message": "Thanks so much"}
#                        </textarea>');
              res.write(JSON.stringify(data));
#              if params.query && params.query.callback
#                res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
#              else
#                res.write(JSON.stringify data);
              res.end();

            ,delayTime

          );
          form.on('end', (fields, files) ->
            #/* Temporary location of our uploaded file */
            temp_path = this.openedFiles[0].path;
           # /* The file name of the uploaded file */
            file_name = this.openedFiles[0].name;
            #/* Location where we want to copy the uploaded file */
            new_location = 'uploads/';
            fs.copy(temp_path, new_location + file_name, (err) ->
              if (err)
                console.error(err);
              else
                console.log("success!")
              );
            return;
          )

        return
      data=
        "code":"2"
        "message":"文件上传：传输错误"
        "data":""
      setTimeout ->
        res.write(JSON.stringify(data));
#        res.write('<textarea data-type="application/json">
#                          {"ok": false, "message": "error"}
#                        </textarea>');
#        res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
#        res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
#        if params.query && params.query.callback
#          res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
#        else
#          res.write(JSON.stringify data);
        res.end();
      ,delayTime


    when "/recyclebin/list"
      do->
        data = undefined
        fakeSample=
          contentType: ""
          deleteDate: 1443069643000
          objectId: "0b0186a180006b63"
          objectName: "3"
          objectType: "dw_folder"
          originalPath: "/交换区/大信心"
        data=
          "code":"1"
          "message":"操作成功"
          "data":
            pageInfo:
              currentPage: 1
              pageCount: 1
              pageSize: 10
              startIndex: 0
              totalCount: 0
            resultSet:[]
        for i in [0..8]
          data.data.resultSet.push JSON.parse JSON.stringify fakeSample
        data.data.resultSet[0].objectId='453t3tg43t5g'
        data.data.resultSet[1].objectId='546t54tg5tg5'
        data.data.resultSet[2].objectId='45tg54tg54y'
        data.data.resultSet[3].objectId='45ygt45rygt45r'
        data.data.resultSet[4].objectId='54yg54rgyt54ry'
        data.data.resultSet[5].objectId='hb5466y66y'
        data.data.resultSet[6].objectId='rthg545466'
        data.data.resultSet[7].objectId='54reg54g5r'
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime

    when "/recyclebin/destroy"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime


    when "/recyclebin/clean"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime


    when "/recyclebin/recover"
      do->
        data=
          "code":"1"
          "message":"操作成功"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime




    else
      do->
        data=
          "code":"404"
          "message":"连接未找到"
          "data":""
        setTimeout ->
          if params.query && params.query.callback
            res.write(params.query.callback + '(' + JSON.stringify(data) + ')');
          else
            res.write(JSON.stringify data);
          res.end();
        ,delayTime

#  res.end();

.listen(1111);


console.log('server running on port 1111');