abstract class A {
  int a = 10;
  void display();
}

class B extends A{
  
  @override
  void display()
  {
    print("Hello, this is overrided method");
    print("Value of a : ${a}");
  }
  
}

void main()
{
  B obj = new B();
  obj.display();
}
