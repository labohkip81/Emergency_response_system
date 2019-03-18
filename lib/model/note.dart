class Note{
  int _id;
  String _blood;
  String _health;
  String _doctor;
  int _priority;

  Note(this._priority,this._blood,this._health,this._doctor);
  Note.withId(this._id,this._priority,this._blood,this._health,this._doctor);

  int get id => _id;
  String get blood => _blood;
  String get health => _health;
  String get doctor => _doctor;
  int get priority => _priority;


  set blood(String newBlood){
    if (newBlood.length <= 300){
    this._blood =newBlood;
    }
  }
  set health(String newHealth){
    if (newHealth.length <= 300){
    this._health =newHealth;
    }
  }
  set doctor(String newDoctor){
    if (newDoctor.length <= 300){
    this._doctor =newDoctor;
    }
  }
  set priority(int newPriority){
    if (newPriority >= 1 && newPriority <= 2){
    this._priority =newPriority;
    }

    // convert a note object into a map object
    Map <String, dynamic> toMap(){
      var map =Map<String,dynamic>();
      if ( id !=null) {
        map['id'] = _id;
      }
      map['blood'] =_blood;
      map['health'] = _health;
      map['doctor'] =_doctor;
      map['priority'] =_priority;

      return map;
    }
    // Extract a Note Object from a Map Object
    Note.fromMapObject(Map<String, dynamic> map){
      this._id = map['id'];
      this._blood = map['blood'];
      this._health = map['health'];
      this._doctor = map['doctor'];
      this._priority = map['priority'];





    }


  }
}