(function(t){function e(e){for(var i,o,s=e[0],c=e[1],d=e[2],u=0,p=[];u<s.length;u++)o=s[u],Object.prototype.hasOwnProperty.call(a,o)&&a[o]&&p.push(a[o][0]),a[o]=0;for(i in c)Object.prototype.hasOwnProperty.call(c,i)&&(t[i]=c[i]);l&&l(e);while(p.length)p.shift()();return r.push.apply(r,d||[]),n()}function n(){for(var t,e=0;e<r.length;e++){for(var n=r[e],i=!0,s=1;s<n.length;s++){var c=n[s];0!==a[c]&&(i=!1)}i&&(r.splice(e--,1),t=o(o.s=n[0]))}return t}var i={},a={app:0},r=[];function o(e){if(i[e])return i[e].exports;var n=i[e]={i:e,l:!1,exports:{}};return t[e].call(n.exports,n,n.exports,o),n.l=!0,n.exports}o.m=t,o.c=i,o.d=function(t,e,n){o.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:n})},o.r=function(t){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},o.t=function(t,e){if(1&e&&(t=o(t)),8&e)return t;if(4&e&&"object"===typeof t&&t&&t.__esModule)return t;var n=Object.create(null);if(o.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var i in t)o.d(n,i,function(e){return t[e]}.bind(null,i));return n},o.n=function(t){var e=t&&t.__esModule?function(){return t["default"]}:function(){return t};return o.d(e,"a",e),e},o.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},o.p="/";var s=window["webpackJsonp"]=window["webpackJsonp"]||[],c=s.push.bind(s);s.push=e,s=s.slice();for(var d=0;d<s.length;d++)e(s[d]);var l=c;r.push([0,"chunk-vendors"]),n()})({0:function(t,e,n){t.exports=n("56d7")},"56d7":function(t,e,n){"use strict";n.r(e),n.d(e,"openMap",(function(){return U})),n.d(e,"mainObj",(function(){return q})),n.d(e,"openIDs",(function(){return G})),n.d(e,"prodaction",(function(){return H})),n.d(e,"baseUrl",(function(){return Y}));n("4160"),n("caad"),n("4ec9"),n("a9e3"),n("b680"),n("d3b7"),n("ac1f"),n("25f0"),n("3ca3"),n("466d"),n("5319"),n("159b"),n("ddb0"),n("e260"),n("e6cf"),n("cca6"),n("a79d");var i=n("2b0e"),a=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("v-app",[n("a",{ref:"openFileLink",attrs:{target:"_blanck",hidden:""}}),n("v-dialog",{attrs:{persistent:""},model:{value:t.mainObj.openAlert,callback:function(e){t.$set(t.mainObj,"openAlert",e)},expression:"mainObj.openAlert"}},[n("v-card",[n("v-card-title",[t._v(t._s(t.mainObj.alertTitle))]),n("v-card-text",[t._v(t._s(t.mainObj.alertText))]),n("v-card-actions",[n("v-spacer"),n("v-btn",{attrs:{color:"green darken-1",text:""},on:{click:function(e){return t.handleClose()}}},[t._v("ОК")]),t.mainObj.alertConfirm?n("v-btn",{attrs:{color:"green darken-1",text:""},on:{click:function(e){t.mainObj.openAlert=!1}}},[t._v("Отмена")]):t._e()],1)],1)],1),n("v-navigation-drawer",{attrs:{color:"primary",dark:"",app:"",width:"auto",left:""},model:{value:t.mainObj.drawer,callback:function(e){t.$set(t.mainObj,"drawer",e)},expression:"mainObj.drawer"}},[t.loading?n("p",[t._v("Загрузка...")]):n("v-treeview",{attrs:{items:t.treejson,hoverable:t.hoverable,"open-on-click":t.openOnClick,dense:""},scopedSlots:t._u([{key:"label",fn:function(e){var i=e.item;return[n("div",{on:{click:function(e){return t.handleselect(i)}}},[t._v(t._s(i.text))])]}}])})],1),t._l(t.openIDs,(function(t){return[[n("uni-comp",{key:t,attrs:{id:t}})]]}))],2)},r=[],o=(n("96cf"),n("1da1")),s=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticStyle:{"background-color":"#84FFFF",height:"100%"},attrs:{hidden:!t.visible}},[n("div",{staticStyle:{"background-color":"white","text-align":"center",position:"absolute",left:"0px",bottom:"0px",width:"100%","font-size":"11px"}},[t._v(' ООО "СТЭК" © 2022 ')]),n("v-app-bar",{attrs:{app:""}},[n("v-app-bar-nav-icon",{on:{click:function(e){t.mainObj.drawer=!t.mainObj.drawer}}}),n("v-toolbar-title",[t._v("Рабочее место оператора НСИ")]),n("v-spacer")],1),n("v-main",[n("div",{style:{height:t.gridHeight+"px"}},[t.loading?t._e():n("v-card",{staticClass:"mx-auto rounded-xl",staticStyle:{position:"absolute",left:"70px",top:"50px",width:"320px",height:"200px"},attrs:{tile:"",flat:""}},[n("v-list",{attrs:{dense:""}},[n("v-list-item-group",t._l(t.items,(function(e){return n("v-list-item",{key:e.id,attrs:{dense:""},on:{click:function(n){return t.open(e)}}},[n("v-list-item-content",[n("v-list-item-title",{staticClass:"subtitle-2"},[t._v(t._s(e.text))])],1)],1)})),1)],1)],1),t.loading?t._e():n("v-card",{staticClass:"mx-auto rounded-xl",staticStyle:{position:"absolute",right:"70px",bottom:"70px",width:"320px",height:"200px"},attrs:{tile:"",flat:""}},[n("v-list",{attrs:{dense:""}},[n("v-list-item-group",t._l(t.items2,(function(e){return n("v-list-item",{key:e.id,attrs:{dense:""},on:{click:function(n){return t.open(e)}}},[n("v-list-item-content",[n("v-list-item-title",{staticClass:"subtitle-2"},[t._v(t._s(e.text))])],1)],1)})),1)],1)],1)],1)])],1)},c=[],d=n("f397"),l={name:"Comp1",data:function(){return{mainObj:q,loading:!0,gridHeight:q.gridHeight(),items:[],items2:[]}},props:{visible:{type:Boolean,required:!0}},methods:{resize:function(){this.gridHeight=q.gridHeight()},open:function(t){var e={Control:d["default"],Params:t.iddeclare,SQLParams:null,data:{}},n=t.id;null==U.get(n)&&(U.set(n,e),G.push(n)),q.current=n,window.location.hash=n}},mounted:function(){var t=Object(o["a"])(regeneratorRuntime.mark((function t(){var e,n,i,a;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return e=U.get("-1"),e.resize=this.resize,n=Y+"React/Banner",t.next=5,fetch(n,{method:"GET",mode:H?"no-cors":"cors",cache:"no-cache",credentials:H?"include":"omit"});case 5:return i=t.sent,t.next=8,i.json();case 8:a=t.sent,Array.prototype.push.apply(this.items,a.items),Array.prototype.push.apply(this.items2,a.items2),this.loading=!1;case 12:case"end":return t.stop()}}),t,this)})));function e(){return t.apply(this,arguments)}return e}()},u=l,p=n("2877"),h=n("6544"),m=n.n(h),f=n("40dc"),v=n("5bc1"),b=n("b0af"),g=n("8860"),w=n("da13"),y=n("5d23"),k=n("1baa"),_=n("f6c4"),D=n("2fa4"),F=n("2a7f"),S=Object(p["a"])(u,s,c,!1,null,null,null),O=S.exports;m()(S,{VAppBar:f["a"],VAppBarNavIcon:v["a"],VCard:b["a"],VList:g["a"],VListItem:w["a"],VListItemContent:y["a"],VListItemGroup:k["a"],VListItemTitle:y["b"],VMain:_["a"],VSpacer:D["a"],VToolbarTitle:F["a"]});var x=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("Finder",{ref:"columnEdit",attrs:{id:t.id,visible:t.visible,params:t.params}},[[n("v-btn",{attrs:{icon:""},on:{click:function(e){return t.update()}}},[n("v-icon",[t._v("mdi-download")])],1),n("v-btn",{attrs:{icon:""},on:{click:function(e){return t.save()}}},[n("v-icon",[t._v("mdi-content-save")])],1),n("v-btn",{attrs:{icon:""},on:{click:function(e){return t.del()}}},[n("v-icon",[t._v("mdi-delete")])],1)]],2)},M=[],R={name:"Declare",data:function(){return{}},props:{visible:{type:Boolean,required:!0},id:String,params:String},components:{Finder:d["default"]},methods:{del:function(){var t=U.get(this.id).data.curRow;if(!(t<0||t>U.get(this.id).data.MainTab.length-1)){var e=U.get(this.id).data.MainTab[t]["iddeclare"].toString(),n=Y+"React/ClearColumn?id="+e;fetch(n,{method:"GET"}).then((function(t){return t.json()})).then((function(t){q.alert("Колонки таблиц",t.Error)}))}},update:function(){var t=U.get(this.id).data.curRow;if(!(t<0||t>U.get(this.id).data.MainTab.length-1)){var e=U.get(this.id).data.MainTab[t]["iddeclare"].toString(),n=Y+"React/UpdateColumn?id="+e;fetch(n,{method:"GET"}).then((function(t){return t.json()})).then((function(t){q.alert("Колонки таблиц",t.Error)}))}},save:function(){var t=U.get(this.id).data.curRow;if(!(t<0||t>U.get(this.id).data.MainTab.length-1)){var e=U.get(this.id).data.MainTab[t]["iddeclare"].toString(),n=Y+"React/SaveColumn?id="+e;fetch(n,{method:"GET"}).then((function(t){return t.json()})).then((function(t){q.alert("Колонки таблиц",t.Error)}))}}}},T=R,j=n("8336"),C=n("132d"),P=Object(p["a"])(T,x,M,!1,null,null,null),V=P.exports;m()(P,{VBtn:j["a"],VIcon:C["a"]});var E={name:"App",data:function(){return{openIDs:G,mainObj:q,loading:!0,treejson:[],hoverable:!1,openOnClick:!0}},methods:{back:function(){q.curhistory>0&&(q.curhistory=q.curhistory-1,q.drawer=!1,q.current=q.history[q.curhistory])},next:function(){q.curhistory<q.history.length-1&&(q.curhistory=q.curhistory+1,q.drawer=!1,q.current=q.history[q.curhistory])},exit:function(){window.location=Y+"Home/logout"},handleselect:function(t){if(!t.children){var e=t.attributes.link1;if(e){if("/"==e.substring(0,1))return e=Y+e,this.$refs.openFileLink.href=e,this.$refs.openFileLink.click(),void(q.drawer=!1);if("exit"==e)return void(window.location=Y+"Home/logout");if("test_api"==e)return void q.alert("Тест API","Test OK !")}this.open(t),q.drawer=!1}},handleClose:function(){q.openAlert=!1,q.alertConfirm&&q.confirmAction()},open:function(t){var e=t.id;if(null==U.get(e)){var n=this.getForm(t),i={Control:n.Conrol,Params:n.Params,SQLParams:n.SQLParams,data:{}};U.set(e,i),G.push(e)}q.current=e,window.location.hash=e},getForm:function(t){var e=t.attributes,n=e.params?d["default"]:O,i=e.params,a=null;return"75"==i&&(n=V),{Conrol:n,Params:i,SQLParams:a}}},mounted:function(){var t=Object(o["a"])(regeneratorRuntime.mark((function t(){var e,n,i,a;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return e=document.getElementsByTagName("html")[0],e.style.overflowY="hidden",n=Y+"ustore/gettree",t.next=5,fetch(n,{method:"POST",mode:H?"no-cors":"cors",cache:"no-cache",credentials:H?"include":"omit"});case 5:return i=t.sent,t.next=8,i.json();case 8:a=t.sent,this.treejson=a,this.loading=!1;case 11:case"end":return t.stop()}}),t,this)})));function e(){return t.apply(this,arguments)}return e}()},L=E,N=n("7496"),I=n("99d9"),W=n("169a"),A=n("f774"),$=n("eb2a"),B=Object(p["a"])(L,a,r,!1,null,null,null),z=B.exports;m()(B,{VApp:N["a"],VBtn:j["a"],VCard:b["a"],VCardActions:I["a"],VCardText:I["b"],VCardTitle:I["c"],VDialog:W["a"],VNavigationDrawer:A["a"],VSpacer:D["a"],VTreeview:$["a"]});n("5363");var Q=n("f309");i["a"].use(Q["a"]);var K=new Q["a"]({theme:{},icons:{iconfont:"mdi"}});i["a"].config.productionTip=!0;var H=!0,J="-1",U=new Map;U.set(J,{Control:O,Params:"150",SQLParams:null,data:{}});var G=[];G.push(J),window.location.hash=J;var q={message:"__",drawer:!1,current:J,openAlert:!1,alert:function(t,e){this.alertConfirm=!1,this.alertTitle=t,this.alertText=e,this.openAlert=!0},confirm:function(t,e,n){this.alertConfirm=!0,this.alertTitle=t,this.alertText=e,this.confirmAction=n,this.openAlert=!0},history:[J],curhistory:0,gridHeight:function(){return document.documentElement.clientHeight-68},selectedColor:"LightGreen",dateformat:function(t,e){if(!t)return t;if(t.length<19){var n=e.match(/0\.(0+)/),i=0;return n&&n.length>1&&(i=n[1].length),i>0?Number(t.toString()).toFixed(i):t}return e=e.replace("yyyy",t.substr(0,4)),e=e.replace("yy",t.substr(2,2)),e=e.replace("MM",t.substr(5,2)),e=e.replace("dd",t.substr(8,2)),e=e.replace("HH",t.substr(11,2)),e=e.replace("mm",t.substr(14,2)),e},resize:function(){U.forEach((function(t){t.resize&&t.resize()}))}},Y=H?"":"http://localhost:5000/";window.addEventListener("resize",(function(){q.resize&&q.resize()}),!0),window.addEventListener("popstate",(function(){var t=window.location.hash.replace("#","");t!=q.current&&G.includes(t)&&(q.current=t)}),!1),i["a"].component("uni-comp",{data:function(){return{openMap:U,mainObj:q}},props:{id:{type:String,required:!0}},render:function(t){var e=U.get(this.id).Control,n=U.get(this.id).Params,i=q.current==this.id;return t(e,{props:{id:this.id,params:n,visible:i}})}}),new i["a"]({vuetify:K,render:function(t){return t(z)}}).$mount("#app")},8529:function(t,e,n){},c4d0:function(t,e,n){"use strict";var i=n("8529"),a=n.n(i);a.a},f397:function(t,e,n){"use strict";n.r(e);var i=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticStyle:{height:"100vh",maxheight:"100vh",overflow:"auto"},attrs:{hidden:!t.visible}},[n("v-dialog",{attrs:{persistent:""},model:{value:t.openFilter,callback:function(e){t.openFilter=e},expression:"openFilter"}},[n("v-card",[n("v-card-title",[t._v("Фильтровка и сортировка")]),n("div",{staticStyle:{height:"60vh",maxheight:"60vh",overflow:"auto"}},[t.load?t._e():n("v-simple-table",{attrs:{dense:"",light:""},scopedSlots:t._u([{key:"default",fn:function(){return[n("tbody",t._l(t.OpenMapData().Fcols,(function(e,i){return n("tr",{key:e.FieldName,staticStyle:{"background-color":"white"}},[n("td",{staticStyle:{"border-bottom":"none"}},[n("v-text-field",{attrs:{label:e.FieldCaption,"append-icon":t.getIcon(e)},on:{"click:append":function(n){return t.sortChangeIndex(e,i)}},model:{value:e.FindString,callback:function(n){t.$set(e,"FindString",n)},expression:"column.FindString"}})],1),n("td",{staticStyle:{"border-bottom":"none",width:"50px"}},[t._v(" "+t._s(e.SortOrder)+" "),n("span",{attrs:{hidden:""}},[t._v(t._s(t.rangSort))]),n("span",{attrs:{hidden:""}},[t._v(t._s(t.nactord))])])])})),0)]},proxy:!0}],null,!1,283315501)})],1),n("v-card-actions",[n("v-spacer"),n("v-btn",{attrs:{color:"green darken-1",text:""},on:{click:function(e){return t.updateTab()}}},[t._v("ОК")]),n("v-btn",{attrs:{color:"green darken-1",text:""},on:{click:function(e){return t.setFilter(!1)}}},[t._v("Отмена")])],1)],1)],1),n("div",{staticStyle:{height:"100vh",maxheight:"100vh",overflow:"auto"},attrs:{hidden:"grid"!=t.mode}},[t.stateDrawer?t._e():n("v-app-bar",{attrs:{app:"","max-width":"100vw",height:"65"}},[null==t.editid?n("v-app-bar-nav-icon",{on:{click:function(e){t.mainObj.drawer=!t.mainObj.drawer}}}):t._e(),n("v-toolbar-title",[t._v(t._s(t.Descr))]),n("v-spacer"),n("v-spacer"),n("v-spacer"),t.load?t._e():n("v-text-field",{attrs:{label:"Поиск",dense:"",filled:"",rounded:"","hide-details":"","prepend-inner-icon":"mdi-magnify","single-line":""},on:{input:function(e){return t.updateTab()}},model:{value:t.OpenMapData().Fcols[t.dispIndex].FindString,callback:function(e){t.$set(t.OpenMapData().Fcols[t.dispIndex],"FindString",e)},expression:"OpenMapData().Fcols[dispIndex].FindString"}}),null!=t.editid?[n("v-btn",{attrs:{icon:""},on:{click:function(e){return t.selectFinder(t.editid)}}},[n("v-icon",[t._v("mdi-check")])],1),n("v-btn",{attrs:{icon:""},on:{click:function(e){return t.clearFinder()}}},[n("v-icon",[t._v("mdi-window-close")])],1)]:t._e(),t._t("default"),n("v-menu",{attrs:{left:""},scopedSlots:t._u([{key:"activator",fn:function(e){var i=e.on,a=e.attrs;return[n("v-btn",t._g(t._b({attrs:{icon:""}},"v-btn",a,!1),i),[n("v-icon",[t._v("mdi-dots-vertical")])],1)]}}],null,!1,3221905750)},[n("v-list",[n("v-list-item-group",[null!=t.editid||t.load?t._e():[t.OpenMapData().DelProc?n("v-list-item",{key:"6",on:{click:function(e){return t.add()}}},[n("v-list-item-icon",[n("v-icon",[t._v("mdi-plus")])],1),n("v-list-item-content",[n("v-list-item-title",[t._v("Добавить")])],1)],1):t._e(),n("v-list-item",{key:"7",on:{click:function(e){return t.edit()}}},[n("v-list-item-icon",[t.OpenMapData().EditProc?n("v-icon",[t._v("mdi-pencil")]):n("v-icon",[t._v("mdi-magnify")])],1),n("v-list-item-content",[t.OpenMapData().EditProc?n("v-list-item-title",[t._v("Редактировать")]):n("v-list-item-title",[t._v("Просмотр")])],1)],1),t.OpenMapData().DelProc?n("v-list-item",{key:"8",on:{click:function(e){return t.confirmDelete()}}},[n("v-list-item-icon",[n("v-icon",[t._v("mdi-delete")])],1),n("v-list-item-content",[n("v-list-item-title",[t._v("Удалить")])],1)],1):t._e()],t.load?t._e():[n("v-list-item",{key:"1",on:{click:function(e){return t.setFilter(!0)}}},[n("v-list-item-icon",[n("v-icon",[t._v("mdi-filter-menu")])],1),n("v-list-item-content",[n("v-list-item-title",[t._v("Фильтровка и сортировка")])],1)],1),n("v-list-item",{key:"2",on:{click:function(e){t.stateDrawer=!0}}},[n("v-list-item-icon",[n("v-icon",[t._v("mdi-code-tags")])],1),n("v-list-item-content",[n("v-list-item-title",[t._v("Страницы")])],1)],1),n("v-list-item",{key:"0",on:{click:function(e){return t.updateTab()}}},[n("v-list-item-icon",[n("v-icon",[t._v("mdi-refresh")])],1),n("v-list-item-content",[n("v-list-item-title",[t._v("Обновить")])],1)],1)],null!=t.editid||t.load?t._e():[n("v-list-item",{key:"3",on:{click:function(e){return t.csv()}}},[n("v-list-item-icon",[n("v-icon",[t._v("mdi-cloud-download")])],1),n("v-list-item-content",[n("v-list-item-title",[t._v("Экспорт в CSV")])],1)],1),t.OpenMapData().KeyValue?n("v-list-item",{key:"4",on:{click:function(e){return t.openDetail()}}},[n("v-list-item-icon",[n("v-icon",[t._v("mdi-details")])],1),n("v-list-item-content",[n("v-list-item-title",[t._v("Детали")])],1)],1):t._e()],t.OpenMapData().IdDeclareSet&&!t.load?n("v-list-item",{key:"5",on:{click:function(e){return t.editSetting()}}},[n("v-list-item-icon",[n("v-icon",[t._v("mdi-cog")])],1),n("v-list-item-content",[n("v-list-item-title",[t._v("Параметры")])],1)],1):t._e()],2)],1)],1)],2),t.stateDrawer?n("Pagination",{attrs:{findData:t.OpenMapData()}}):t._e(),n("v-main",[t.load?t._e():[t._t("table",[t.load?t._e():n("v-simple-table",{attrs:{dense:"","fixed-header":"",height:t.gridHeight},scopedSlots:t._u([{key:"default",fn:function(){return[n("thead",[n("tr",t._l(t.OpenMapData().Fcols,(function(e){return n("th",{key:e.FieldName,staticStyle:{"background-color":"LightGrey"}},[n("br"),t._v(t._s(e.FieldCaption))])})),0)]),t.nupdate>0?n("tbody",t._l(t.OpenMapData().MainTab,(function(e,i){return n("tr",{key:i,style:{"background-color":i==t.current?t.selectedColor:"white"},on:{click:function(e){return t.handleClick(i)}}},t._l(t.OpenMapData().Fcols,(function(i){return n("td",{key:i.FieldName},[t._v(t._s(""==i.DisplayFormat?e[i.FieldName]:t.dateformat(e[i.FieldName],i.DisplayFormat)))])})),0)})),0):t._e()]},proxy:!0}],null,!1,3180409333)})])]],2)],1),n("div",{staticStyle:{height:"100vh",maxheight:"100vh",overflow:"auto"},attrs:{hidden:!("edit"==t.mode||"add"==t.mode)}},[null!=t.editid||t.load?t._e():n("Editor",{attrs:{save:t.save,closeEditor:t.closeEditor,action:t.mode,findData:t.OpenMapData(),uid:t.uid,readonly:!t.OpenMapData().EditProc}},[t._t("editor")],2)],1),n("div",{staticStyle:{height:"100vh",maxheight:"100vh",overflow:"auto"},attrs:{hidden:!("setting"==t.mode)}},[t.OpenMapData().IdDeclareSet&&!t.load?n("Editor",{attrs:{save:t.saveSetting,closeEditor:t.closeEditor,action:t.mode,findData:t.OpenMapData().Setting,uid:t.uid2}}):t._e()],1)],1)},a=[],r=(n("c975"),n("d81d"),n("a434"),n("a9e3"),n("d3b7"),n("25f0"),n("3ca3"),n("ddb0"),n("2b3d"),n("96cf"),n("1da1")),o=n("56d7"),s=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("v-app-bar",{attrs:{app:"","max-width":"100vw"}},[n("span",{attrs:{hidden:""}},[t._v(t._s(t.$parent.action))]),t._v(" "+t._s(t.page()*t.nrows()+1)+" - "+t._s(Math.min((t.page()+1)*t.nrows(),t.count()))+" из "+t._s(t.count())+" "),n("v-spacer"),n("v-btn",{attrs:{icon:"",disabled:0===t.page()},on:{click:function(e){return t.$parent.onChangePage(0)}}},[n("v-icon",[t._v("mdi-page-first")])],1),n("v-btn",{attrs:{icon:"",disabled:0===t.page()},on:{click:function(e){t.$parent.onChangePage(t.page()-1)}}},[n("v-icon",[t._v("mdi-chevron-left")])],1),t._v(" "+t._s(t.page()+1)+" из "+t._s(Math.max(0,Math.ceil(t.count()/t.nrows())-1)+1)+" "),n("v-btn",{attrs:{icon:"",disabled:t.page()>=Math.ceil(t.count()/t.nrows())-1},on:{click:function(e){t.$parent.onChangePage(t.page()+1)}}},[n("v-icon",[t._v("mdi-chevron-right")])],1),n("v-btn",{attrs:{icon:"",disabled:t.page()>=Math.ceil(t.count()/t.nrows())-1},on:{click:function(e){t.$parent.onChangePage(Math.max(0,Math.ceil(t.count()/t.nrows())-1))}}},[n("v-icon",[t._v("mdi-page-last")])],1),n("v-btn",{attrs:{icon:""},on:{click:function(e){t.$parent.stateDrawer=!1}}},[n("v-icon",[t._v("mdi-window-close")])],1)],1)},c=[],d={name:"Pagination",data:function(){return{rowsPerPage:30}},props:{findData:Object},methods:{OpenMapData:function(){return this.findData},count:function(){return this.OpenMapData().TotalTab?this.OpenMapData().TotalTab[0].n_total:0},page:function(){return this.OpenMapData().page?this.OpenMapData().page-1:0},nrows:function(){return this.OpenMapData().nrows?this.OpenMapData().nrows:30}}},l=d,u=n("2877"),p=n("6544"),h=n.n(p),m=n("40dc"),f=n("8336"),v=n("132d"),b=n("2fa4"),g=Object(u["a"])(l,s,c,!1,null,null,null),w=g.exports;h()(g,{VAppBar:m["a"],VBtn:f["a"],VIcon:v["a"],VSpacer:b["a"]});var y=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticStyle:{height:"100vh",maxheight:"100vh",overflow:"auto"}},[n("div",{staticStyle:{height:"100vh",maxheight:"100vh",overflow:"auto"},attrs:{hidden:"edit"!=t.mode}},[n("v-app-bar",{attrs:{app:"","max-width":"100vw"}},["setting"!=t.action?n("v-app-bar-nav-icon",{on:{click:function(e){t.mainObj.drawer=!t.mainObj.drawer}}}):t._e(),n("v-toolbar-title",[t._v(t._s(t.Descr()))]),n("v-spacer"),t.readonly?t._e():n("v-btn",{attrs:{icon:""},on:{click:function(e){return t.save()}}},[n("v-icon",[t._v("mdi-check")])],1),n("v-btn",{attrs:{icon:""},on:{click:function(e){return t.closeEditor()}}},[n("v-icon",[t._v("mdi-window-close")])],1)],1),n("v-main",[t._t("default",[n("v-simple-table",{scopedSlots:t._u([{key:"default",fn:function(){return[t.nupdate>0&&""!=t.uid?n("tbody",[t.readonly?t._l(t.findData.Fcols,(function(e,i){return n("tr",{key:i,staticStyle:{"background-color":"white"}},[n("td",{staticStyle:{"border-bottom":"none"}},[n("v-text-field",{key:e.FieldName+t.uid,attrs:{label:e.FieldCaption,value:t.findData.WorkRow[e.FieldName],readonly:""}})],1)])})):t._l(t.findData.ReferEdit.Editors,(function(e,i){return n("tr",{key:i,staticStyle:{"background-color":"white"}},[n("td",{staticStyle:{"border-bottom":"none"}},[null==e.joinRow?n("v-text-field",{key:e.FieldName+t.uid,attrs:{label:e.FieldCaption},model:{value:t.findData.WorkRow[e.FieldName],callback:function(n){t.$set(t.findData.WorkRow,e.FieldName,n)},expression:"findData.WorkRow[column.FieldName]"}}):["Bureau.Finder"==e.joinRow.classname?n("v-text-field",{key:e.FieldName+t.uid,attrs:{label:e.FieldCaption,"append-icon":"mdi-magnify",readonly:""},on:{"click:append":function(e){return t.open(i)}},model:{value:t.findData.WorkRow[e.FieldName],callback:function(n){t.$set(t.findData.WorkRow,e.FieldName,n)},expression:"findData.WorkRow[column.FieldName]"}}):t._e(),"Bureau.GridCombo"==e.joinRow.classname?n("v-select",{key:e.FieldName+t.uid,attrs:{label:e.FieldCaption,items:e.joinRow.FindConrol.MainTab,"item-value":e.joinRow.keyField,"item-text":e.joinRow.FindConrol.DispField},on:{change:function(n){return t.sortChange(n,e)}},model:{value:t.findData.WorkRow[e.joinRow.valField],callback:function(n){t.$set(t.findData.WorkRow,e.joinRow.valField,n)},expression:"findData.WorkRow[column.joinRow.valField]"}}):t._e()]],2)])}))],2):t._e()]},proxy:!0}])})])],2)],1),t.readonly?t._e():[t._l(t.findData.ReferEdit.Editors,(function(e,i){return[null!=e.joinRow?["Bureau.Finder"==e.joinRow.classname?n("Finder",{key:i,attrs:{visible:t.mode=="finder_"+i.toString(),params:e.joinRow.IdDeclare,editid:i,findData:e.joinRow.FindConrol,selectFinder:t.selectFinder,clearFinder:t.clearFinder}}):t._e()]:t._e()]}))]],2)},k=[],_={name:"Editor",data:function(){return{mode:"edit",mainObj:o["mainObj"],nupdate:1}},props:{save:Function,closeEditor:Function,action:String,findData:Object,uid:String,readonly:Boolean},beforeCreate:function(){this.$options.components.Finder=n("f397").default},methods:{Descr:function(){return"add"==this.action?"Новая запись ("+this.findData.Descr+")":"edit"==this.action?this.readonly?"Просмотр ("+this.findData.Descr+")":"Редактирование ("+this.findData.Descr+")":"setting"==this.action?"Параметры ("+this.findData.Descr+")":void 0},open:function(t){this.mode="finder_"+t.toString()},selectFinder:function(t){var e=this.findData.ReferEdit.Editors[t],n=this.findData.ReferEdit.Editors[t].joinRow.FindConrol.curRow,i=e.joinRow.FindConrol.MainTab[n];for(var a in e.joinRow.fields)this.findData.WorkRow[e.joinRow.fields[a]]=i[a];this.nupdate=this.nupdate+1,this.mode="edit"},sortChange:function(t,e){var n=this;e.joinRow.FindConrol.MainTab.map((function(i){if(i[e.joinRow.keyField]==t)for(var a in e.joinRow.fields)n.findData.WorkRow[e.joinRow.fields[a]]=i[a]})),this.nupdate=this.nupdate+1},clearFinder:function(){this.mode="edit"},textChange:function(t,e){this.findData.WorkRow[e]=t}}},D=_,F=n("5bc1"),S=n("f6c4"),O=n("b974"),x=n("1f4f"),M=n("8654"),R=n("2a7f"),T=Object(u["a"])(D,y,k,!1,null,null,null),j=T.exports;h()(T,{VAppBar:m["a"],VAppBarNavIcon:F["a"],VBtn:f["a"],VIcon:v["a"],VMain:S["a"],VSelect:O["a"],VSimpleTable:x["a"],VSpacer:b["a"],VTextField:M["a"],VToolbarTitle:R["a"]});var C={name:"Finder",components:{Pagination:w,Editor:j},data:function(){return{mainObj:o["mainObj"],openMap:o["openMap"],load:!0,mode:"grid",Descr:"Загрузка...",current:0,stateDrawer:!1,action:1,nupdate:1,nactord:1,nadd:1,items:["Нет","ASC","DESC"],rangSort:0,uid:"zz",uid2:"yy",selectedColor:o["mainObj"].selectedColor,openFilter:!1,dispIndex:0,gridHeight:o["mainObj"].gridHeight()}},props:{visible:{type:Boolean,required:!0},id:String,params:String,editid:Number,findData:Object,selectFinder:Function,clearFinder:Function},computed:{finderRowStyle:function(){}},methods:{resize:function(){this.gridHeight=o["mainObj"].gridHeight()},sortChange:function(t,e){var n=0,i=this.OpenMapData().Fcols;i.map((function(t,i){"Нет"==t.Sort&&(t.SortOrder=null),i!=e&&t.SortOrder&&t.SortOrder>n&&(n=t.SortOrder)})),i[e].SortOrder=n+1,this.rangSort=n+1,this.nactord=this.nactord+1},sortChangeIndex:function(t,e){"ASC"==t.Sort?t.Sort="DESC":"DESC"==t.Sort?t.Sort="Нет":t.Sort="ASC",this.sortChange(null,e)},getIcon:function(t){return"ASC"==t.Sort?"mdi-arrow-down":"DESC"==t.Sort?"mdi-arrow-up":"mdi-sort"},dateformat:function(t,e){return o["mainObj"].dateformat(t,e)},OpenMapData:function(){return null!=this.id?(null==o["openMap"].get(this.id)&&o["openMap"].set(this.id,{Control:null,Params:this.params,SQLParams:null,data:{}}),o["openMap"].get(this.id).data):this.findData},OpenMapId:function(){return null==o["openMap"].get(this.id)&&o["openMap"].set(this.id,{Control:null,Params:this.params,SQLParams:null,data:{}}),o["openMap"].get(this.id)},setLoad:function(t){this.load=t},setFilter:function(t){this.openFilter=t},handleClick:function(t){this.OpenMapData().curRow==t?(this.current=t,null==this.editid?this.OpenMapData().EditProc?this.edit():this.OpenMapData().KeyValue?this.openDetail():this.edit():this.selectFinder(this.editid)):(this.OpenMapData().curRow=t,this.current=t)},openDetail:function(){var t=this.OpenMapData();if(null!=t.curRow){var e,n,i,a=t.MainTab[t.curRow],r={};if(a["iddeclare"]&&a["keyf"]){var s=a["keyf"],c=a["dispfield"],d=a["iddeclare"];e=a[s],r[s]=e,n=d,i=a[c]}else e=a[t.KeyF],r[t.KeyF]=e,n=t.KeyValue,i=a[t.DispField];var l={Control:C,Params:n,TextParams:r,title:i,data:{}},u=this.id+"_"+a[t.KeyF];null==o["openMap"].get(u)&&(o["openMap"].set(u,l),o["openIDs"].push(u)),o["mainObj"].current=u,window.location.hash=u}},csv:function(){var t=o["baseUrl"]+"React/csv",e=new FormData,n=this.OpenMapData(),i=this.params;e.append("id",i),e.append("Fc",JSON.stringify(n.Fcols)),n.SQLParams&&e.append("SQLParams",JSON.stringify(n.SQLParams)),n.TextParams&&e.append("TextParams",JSON.stringify(n.TextParams)),fetch(t,{method:"POST",mode:o["prodaction"]?"no-cors":"cors",cache:"no-cache",credentials:o["prodaction"]?"include":"omit",body:e}).then((function(t){return t.blob()})).then((function(t){var e=document.createElement("a");e.href=URL.createObjectURL(t),e.setAttribute("download","data.csv"),e.click()}))},loadFile:function(){var t=this.OpenMapData();if(null!=t.curRow){var e=t.MainTab[t.curRow],n=this.params,i="F"+n+"_"+e[t.KeyF],a=t.Descr+", "+e[t.DispField],r=o["baseUrl"]+"Docfiles/dir?id="+i+"/&caption="+a;this.$refs.fileLink2.href=r,this.$refs.fileLink2.click()}},confirmDelete:function(){var t=this.OpenMapData();if(null!=t.curRow){var e=t.MainTab[t.curRow],n=e[t.DispField];o["mainObj"].confirm(this.Descr,"Удалить запись '"+n+"'?",this.rowDelete)}},rowDelete:function(){var t=Object(r["a"])(regeneratorRuntime.mark((function t(){var e,n,i,a,r,s;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return e=this.OpenMapData(),n={},n[e.KeyF]=e.MainTab[e.curRow][e.KeyF],e.DelProc.toLowerCase().indexOf("_del_1")>-1&&(n["AUDTUSER"]=e.Account),i=o["baseUrl"]+"React/exec",a=new FormData,a.append("EditProc",e.DelProc),a.append("SQLParams",JSON.stringify(n)),a.append("KeyF",e.KeyF),t.next=11,fetch(i,{method:"POST",mode:o["prodaction"]?"no-cors":"cors",cache:"no-cache",credentials:o["prodaction"]?"include":"omit",body:a});case 11:return r=t.sent,t.next=14,r.json();case 14:if(s=t.sent,"OK"==s.message||"Invalid storage type: DBNull."==s.message){t.next=18;break}return o["mainObj"].alert("Ошибка",s.message),t.abrupt("return");case 18:e.MainTab.splice(e.curRow,1),this.nupdate=this.nupdate+1,null!=o["openMap"].get(this.id).updateTab&&o["openMap"].get(this.id).updateTab();case 21:case"end":return t.stop()}}),t,this)})));function e(){return t.apply(this,arguments)}return e}(),onChangePage:function(t){this.action=this.action+1,this.OpenMapData().page=t+1,this.updateTab()},updateTab:function(){var t=Object(r["a"])(regeneratorRuntime.mark((function t(){var e,n,i,a,r,s;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return e=o["baseUrl"]+"React/FinderStart",n=new FormData,i=this.OpenMapData(),a=this.params,n.append("id",a),n.append("mode","data"),n.append("page",i.page.toString()),n.append("Fc",JSON.stringify(i.Fcols)),i.SQLParams&&n.append("SQLParams",JSON.stringify(i.SQLParams)),i.TextParams&&n.append("TextParams",JSON.stringify(i.TextParams)),t.next=12,fetch(e,{method:"POST",mode:o["prodaction"]?"no-cors":"cors",cache:"no-cache",credentials:o["prodaction"]?"include":"omit",body:n});case 12:return r=t.sent,t.next=15,r.json();case 15:s=t.sent,s.Error?o["mainObj"].alert("Ошибка",s.Error):(i.MainTab=s.MainTab,i.TotalTab=s.TotalTab,i.page=s.page,this.mode,this.mode="grid",this.nupdate=this.nupdate+1,this.openFilter=!1,null!=o["openMap"].get(this.id).updateTab&&o["openMap"].get(this.id).updateTab());case 17:case"end":return t.stop()}}),t,this)})));function e(){return t.apply(this,arguments)}return e}(),saveSetting:function(){var t=this.OpenMapData().Setting,e=t.MainTab[0];t.ColumnTab.map((function(n){e[n]=t.WorkRow[n]}));var n=this.OpenMapData();t.ReferEdit.SaveFieldList.map((function(e){n.SQLParams["@"+e]=t.MainTab[0][e]})),this.updateTab()},save:function(){var t=Object(r["a"])(regeneratorRuntime.mark((function t(){var e,n,i,a,r,s,c,d,l,u;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:for(n in e=this.OpenMapData(),e.DefaultValues)e.WorkRow[n]=e.DefaultValues[n];for(i in e.TextParams)e.WorkRow[i]=e.TextParams[i];return a={},e.ReferEdit.SaveFieldList.map((function(t){a[t]=e.WorkRow[t]})),r=o["baseUrl"]+"React/exec",s=new FormData,s.append("EditProc",e.EditProc),s.append("SQLParams",JSON.stringify(a)),s.append("KeyF",e.KeyF),t.next=12,fetch(r,{method:"POST",mode:o["prodaction"]?"no-cors":"cors",cache:"no-cache",credentials:o["prodaction"]?"include":"omit",body:s});case 12:return c=t.sent,t.next=15,c.json();case 15:if(d=t.sent,"OK"==d.message){t.next=21;break}return o["mainObj"].alert("Ошибка",d.message),t.abrupt("return");case 21:1==d.ColumnTab.length?e.WorkRow[e.KeyF]=d.MainTab[0][d.ColumnTab[0]]:d.ColumnTab.map((function(t){e.WorkRow[t]=d.MainTab[0][t]}));case 22:l={},"edit"==this.mode&&(u=e.curRow,l=e.MainTab[u]),e.ColumnTab.map((function(t){l[t]=e.WorkRow[t]})),"add"==this.mode&&e.MainTab.push(l),this.mode="grid",this.nupdate=this.nupdate+1,null!=o["openMap"].get(this.id).updateTab&&o["openMap"].get(this.id).updateTab();case 29:case"end":return t.stop()}}),t,this)})));function e(){return t.apply(this,arguments)}return e}(),closeEditor:function(){this.mode="grid"},add:function(){var t=this.OpenMapData();null==t.WorkRow&&(t.WorkRow={}),t.ColumnTab.map((function(e){t.WorkRow[e]=""})),this.nadd=this.nadd+1,this.uid="uid"+this.nadd.toString(),this.mode="add"},edit:function(){var t=this,e=this.OpenMapData();null==e.WorkRow&&(e.WorkRow={});var n=e.curRow,i=e.MainTab[n];e.ColumnTab.map((function(t){e.WorkRow[t]=null==i[t]?"":i[t]})),e.Fcols.map((function(n){""!=n.DisplayFormat&&(e.WorkRow[n.FieldName]=t.dateformat(e.WorkRow[n.FieldName],n.DisplayFormat))})),this.nadd=this.nadd+1,this.uid="uid"+this.nadd.toString(),this.mode="edit"},editSetting:function(){var t=this,e=this.OpenMapData().Setting;e.WorkRow={};var n=e.MainTab[0];e.ColumnTab.map((function(t){e.WorkRow[t]=null==n[t]?"":n[t]})),e.Fcols.map((function(n){""!=n.DisplayFormat&&(e.WorkRow[n.FieldName]=t.dateformat(e.WorkRow[n.FieldName],n.DisplayFormat))})),this.nadd=this.nadd+1,this.uid2="uid2"+this.nadd.toString(),this.mode="setting"}},mounted:function(){var t=Object(r["a"])(regeneratorRuntime.mark((function t(){var e,n,i,a,r,s,c,d,l,u,p,h=this;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:if(e=this.OpenMapData,n=this.OpenMapId,i=this.setLoad,a=this.editid,r=this.params,null==a){t.next=14;break}return s=e(),s.curRow=0,this.Descr=s.Descr+" (выбор)",s.Fcols.map((function(t,e){t.FieldName==s.DispField&&(h.dispIndex=e)})),s.resize=this.resize,window.addEventListener("resize",(function(){s.resize&&s.resize()}),!0),i(!1),t.abrupt("return");case 14:return c=n(),c.handleClick=this.handleClick,c.resize=this.resize,d=o["baseUrl"]+"React/FinderStart",l=new FormData,l.append("id",r),c.SQLParams&&l.append("SQLParams",JSON.stringify(c.SQLParams)),c.TextParams&&l.append("TextParams",JSON.stringify(c.TextParams)),t.next=24,fetch(d,{method:"POST",mode:o["prodaction"]?"no-cors":"cors",cache:"no-cache",credentials:o["prodaction"]?"include":"omit",body:l});case 24:return u=t.sent,t.next=27,u.json();case 27:if(p=t.sent,!p.Error){t.next=31;break}return o["mainObj"].alert("Ошибка",p.Error),t.abrupt("return");case 31:p.curRow=0,p.WorkRow={},p.ColumnTab.map((function(t){p.WorkRow[t]=""})),p.Fcols.map((function(t,e){t.FieldName==p.DispField&&(h.dispIndex=e)})),c.data=p,this.Descr=p.Descr,c.title&&(this.Descr=this.Descr+" ("+c.title+")"),i(!1);case 39:case"end":return t.stop()}}),t,this)})));function e(){return t.apply(this,arguments)}return e}()},P=C,V=P,E=(n("c4d0"),n("b0af")),L=n("99d9"),N=n("169a"),I=n("8860"),W=n("da13"),A=n("5d23"),$=n("1baa"),B=n("34c3"),z=n("e449"),Q=Object(u["a"])(V,i,a,!1,null,"8cc1dac0",null);e["default"]=Q.exports;h()(Q,{VAppBar:m["a"],VAppBarNavIcon:F["a"],VBtn:f["a"],VCard:E["a"],VCardActions:L["a"],VCardTitle:L["c"],VDialog:N["a"],VIcon:v["a"],VList:I["a"],VListItem:W["a"],VListItemContent:A["a"],VListItemGroup:$["a"],VListItemIcon:B["a"],VListItemTitle:A["b"],VMain:S["a"],VMenu:z["a"],VSimpleTable:x["a"],VSpacer:b["a"],VTextField:M["a"],VToolbarTitle:R["a"]})}});
//# sourceMappingURL=app.61a3f2f1.js.map