enum EnvType{DEVELOPMENT, STAGING, PRODUCTION, TESTING}

class Environment{
  static late Environment value;

  Environment(){
    value = this;
    _init();
  }

  _init(){

  }
}