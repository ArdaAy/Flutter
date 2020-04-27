import 'dart:async';

void main(){
  final bloc = new Bloc();
  
  /*
  bloc.emailController.stream.listen((value){
    print(value);
  });
  */
  bloc.email.listen((value){
    print(value);
  });
  
  //bloc.emailController.sink.add('MY NEW EMAIL');
  
  bloc.changeEmail('My New Email');
}

class Bloc {
  final emailController = StreamController<String>();
  
  // Add data to stream
  get changeEmail => emailController.sink.add;
  
  // Retrieve data from stream
  get email => emailController.stream;
}