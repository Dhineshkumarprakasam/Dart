class A
{
  int number = 0;
  A(this.number);
  
  void compare(A obj)
  {
    if(this.number > obj.number)
      print("${number} is greater than ${obj.number}");
    
    else
       print("${obj.number} is greater than ${number}");
  }
}

void main()
{
  
  A obj1 = new A(100);
  A obj2 = new A(200);
  
  obj1.compare(obj2);
}
