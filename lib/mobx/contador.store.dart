

import 'package:mobx/mobx.dart';

part 'contador.store.g.dart';

class ContadorStore = _ContadorStore with _$ContadorStore;

abstract class _ContadorStore with Store{
  @observable
  int contador = 0;


  @action
  void incrementar(){
    contador++;
  }
}