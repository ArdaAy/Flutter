import 'dart:async';


class Validators {  // StreamTransformer<inputType, outputType>
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains('@')){
        sink.add(email);
      }
      else {
        sink.addError('Enter a valid email');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length > 3){
        sink.add(password);
      }
      else {
        sink.addError('password must be at least 4 characters');
      }
    }
  );
}