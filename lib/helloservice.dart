import 'dart:async';

abstract class HelloService{

  Future<String> getMessage();
}

class DefaultHelloService implements HelloService{
  @override
  Future<String> getMessage() {
    return Future.value("Hello World");
  }

}