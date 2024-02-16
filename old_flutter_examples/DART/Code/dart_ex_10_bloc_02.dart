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

// email ve password hepsi bir arada
class Bloc {
  final emailController = StreamController<String>();
  final passwordController = StreamController<String>();
  
  // Add data to stream
  Function(String) get changeEmail => emailController.sink.add;
  Function(String) get changePassword => passwordController.sink.add;
  
  // Retrieve data from stream
  Stream<String> get email => emailController.stream;
  Stream<String> get password => passwordController.stream;
}

