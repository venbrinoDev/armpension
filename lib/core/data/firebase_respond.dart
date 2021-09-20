class FirebaseRespond {
  Object payload;
  String errorMessage;

  FirebaseRespond({this.payload, this.errorMessage});

 static FirebaseRespond load({Object payload,String error}){
    return  FirebaseRespond(payload: payload??null,errorMessage: error??null);
  }
}