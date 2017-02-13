 //ver 0.3 25.12.2016

 var App={
  rx:/([А-Я])\sLETTER\s(\d{3})\s\NUMBER\s\w+\sBUTTON\s(\d{1,2})\sOKNO/,
  displayStack:[],
  isInit:false,
  tempTicketArray:[],
  lines:4,
  run:function(maxlines){
    this.Collection = new TicketsCollection();
    if (maxlines) {
      this.lines = maxlines;
      
    };
    if (!this.isInit) {
      this.init();
    };
     qwin_event.trig= _.bind(function(eventType, unit, result){
      if(unit == 1) {
        if (eventType==112) {// если вызов
          var rawstr = result;
          var mtch = this.rx.exec(rawstr);
          this.Collection.push({letter:mtch[1],number:mtch[2], win:this.normalizeWindowNumber(mtch[3]),isNew:true});

        };
        if (eventType==113) { //если завершение
          var rawstr1 = result;
          var mtch1 = this.rx.exec(rawstr1);
          var workpoint =this.normalizeWindowNumber(mtch1[3]);
          var arr = this.Collection.where({win:workpoint});
          if (arr.length>0) {
            this.Collection.remove(arr);
          };
        };
      };
    },this),

    qwin_event.setEvents= function(){
      qwin_event.waitForEventTrig("112.113");
    },
    qwin_event.setEvents();
  },
  init:function(){
    $.ajax( "/touchscreens/vdisplay/includes/counter_info.qsp2", {
        cache: false,
        async:false,
        dataType: "html",
        context:this,
        error: this.onErrorStartup,
        success: this.onSuccesStartup
    });
  },
  onSuccesStartup:function(resp){
    var array_result = resp.split(';');
    
    $.each(array_result,_.bind(function(i,val){
      if (val != "") {
        var tmpTicketData = val.split(':');
        
        //проверка на корректность номеров талонов
        if (tmpTicketData[1]!="-" && tmpTicketData[1]!='n'  && typeof tmpTicketData[1]!=='undefined') {

          var btn = tmpTicketData[1];
          var num = tmpTicketData[2];
          var wind = tmpTicketData[0];
          var timeServ = parseInt(tmpTicketData[3],10);
          this.tempTicketArray.push({letter:btn,number:num, win:wind, time:timeServ});
        };
      };
    },this));
    this.sortByTime();
    $.each(this.tempTicketArray,_.bind(function(i,val){
      this.Collection.push({'letter':val.letter, 'number':val.number, 'win':val.win,'isNew':true});
    },this));
    this.Collection.models.reverse();
    this.tv = new TicketsListView({collection:this.Collection});
    
    $("#mytest").html(this.tv.render().el);
  },
  onErrorStartup:function(data){
  },
 
  sortByTime:function(){
    this.tempTicketArray.sort(function(a,b){
      if (a.time<b.time) {
        return -1;
      }else
      if(a.time>b.time){
        return 1;
      }
      return 0;
    });
  },

  _add:function(){
    this.Collection.push({'letter':"U", 'number':_.random(1,333), 'win':"12", 'isNew':true});
  },
  _remove:function(){
    var _rndVar = _.random(0,this.Collection.length);
    var _model = this.Collection.at(_rndVar);

    this.Collection.remove(_model);
  },
  normalizeWindowNumber:function(str){
    while(str.length<2){
      str = "0"+str;
    }
    return str;
  }
}


 var Ticket =Backbone.Model.extend({
  initialize:function(){
    this.normalizeWindowNumber();
  },
  normalizeWindowNumber:function(){
    var num = this.get('win');
    while(num.length<2){
      num = "0"+num;
    }
    this.set('win',num);
  }
 });

 var TicketsCollection = Backbone.Collection.extend({
  model:Ticket,
  comparator:function(model){
    return -model.cid;
  }
 });

var TicketView = Backbone.View.extend({
  tagName:'center',
  tpl:_.template($("#row_table").html()),
  initialize:function(){

    this.listenTo(this.model,'destroy',this.deleteView);
  },
  render:function(){
    this.$el.html(this.tpl(this.model.toJSON()));
    if (this.model.get('isNew')===true) {
      this.$el.children("font").css('color','red');
      setTimeout(_.bind(function(){
        this.$el.children("font").css('color','white');
        this.model.set('isNew',false);
      },this),10000);
    }
    return this;
  },
  deleteView:function(){
    this.remove();
  }
});

var TicketsListView = Backbone.View.extend({
  el:'#infoqq',
   initialize:function(){
      this.listenTo(this.collection,'add',this.addTicket);
      this.listenTo(this.collection,'remove',this.removeTicket);
  },
  render:function(){
    this.collection.each(function(ticket, i){
        var pv = new  TicketView({model:ticket});
        this.$el.prepend(pv.render().el);
    },this);
    this.collection.each(function(ticket, i){
        if (i>App.lines-1) {
          this.collection.remove(this.collection.first());
        }
     
    },this);
    
    return this;
  },
  addTicket:function(ticket){
    var newmodel = new TicketView({model:ticket});
    this.$el.prepend(newmodel.render().el);
    if (this.collection.length>App.lines) {
       this.collection.remove(this.collection.first());
    };
   
    

  },
  removeTicket:function(ticket){
    ticket.destroy();
  }
});