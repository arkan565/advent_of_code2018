import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'dart:math';
class Events{
  String startHour;
  String event;
  Events(String event, String startHour){
    this.startHour=startHour;
    this.event=event;
  }
}
class Guard {
  int guard;
  List<Events> events;
  int rest = 0;
  List<int> minutes;
  Guard(int guard){
    this.guard=guard;
    events = new List();
    minutes = new List(60);
    minutes.setAll(0, [0]);
  }
  
}

void main(){
  List<Events> events = new List();
  List<Guard> guards = new List();
  var path = "input";
  new File(path)
    .openRead()
    .transform(utf8.decoder)
    .transform(new LineSplitter())
    .forEach((l){
      var day = l.substring(1,17);
      var event = l.substring(19);
      events.add(Events(event,day));
    }).whenComplete((){
      events.sort((event1,event2)=>event1.startHour.compareTo(event2.startHour));
      int guard=null; 
      bool resting = false;
      Guard auxguard=null;
      for(var i = 0;i<events.length;i++){
       
        if(events[i].event.contains("#")){
          String auxString =events[i].event.substring(events[i].event.indexOf(new RegExp("#"))+1);
          auxString =  auxString.substring(0,auxString.indexOf(new RegExp(" ")));
          guard = int.parse(auxString.trim());
          auxguard=guards.firstWhere((arrguard)=>arrguard.guard==guard,orElse:()=>null);
          if(auxguard==null){
            guards.add(Guard(guard));
          }
          auxguard=guards.firstWhere((arrguard)=>arrguard.guard==guard,orElse:()=>null);
        }
        if(resting){
          DateTime auxDate1=DateTime.parse(events[i].startHour);
          DateTime auxDate2=DateTime.parse(events[i-1].startHour);
          for(var i = auxDate1.minute-1;i>=auxDate2.minute;i--){
            if(auxguard.minutes[i]==null)
            {
             auxguard.minutes[i]=1;
            }else{
              auxguard.minutes[i]=auxguard.minutes[i]+1;
            }
          }
          var difference=auxDate1.difference(auxDate2);
          auxguard.rest = auxguard.rest+difference.inMinutes.abs();
        }
        if(events[i].event.trim()=="falls asleep"){
            resting=true;
        }
        if(events[i].event.trim()=="wakes up"){
          resting=false;
        }
        
      }
      guards.sort((auxguard1,auxguard2)=>auxguard2.rest-auxguard1.rest);
      var max=0;
      var imax=0;
      for(var i=0;i<60;i++){
        if(guards[0].minutes[i]!=null){
          if(guards[0].minutes[i]>max){
            max=guards[0].minutes[i];
            imax=i;
          }
        }
      }
      
      print(guards[0].guard);
      print(imax);
      print(guards[0].guard*imax);
      var imax2=0;
      var jmax2=0;
      var max2=0;
      for(var i = 0;i<guards.length;i++){
        for(var j = 0;j<60;j++){
          if(guards[i].minutes[j]!=null){
            if(guards[i].minutes[j]>max2){
              imax2=guards[i].guard;
              jmax2=j;
              max2=guards[i].minutes[j];
            }
          }
        }
      }
      print(imax2);
      print(jmax2);
      print(max2);
      print(imax2*jmax2);
    });
}