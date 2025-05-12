class A 
{
  void display1()
  {
    print("This is Grand Parrent Class");
  }
}


class B extends A 
{
  void display2()
  {
    print("This is Parent Class");
  }
}


class C extends B 
{
  void display3()
  {
    print("This is Child Class");
  }
}


void main()
{
  C obj1 = new C();
  
  obj1.display1();
  obj1.display2();
  obj1.display3();
  print("");
  
  
  B obj2 = new B();
  obj2.display1();
  obj2.display2();
  print("");
  
  A obj3 = new A();
  obj3.display1();
}
