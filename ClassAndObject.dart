class A
{
  int? a;
  A(int val)
  {
     this.a = val;
  }
  
  void display()
  {
    print("The value of a : ${a}");
  }
}

void main()
{
  A obj = new A(100);
  obj.display();
}
