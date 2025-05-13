//mixin does't create any parrent child relationtion
//it is just for the purpose of code reusablility
mixin eat {
  
  int quantity = 10;
}

mixin sound {
  void speak()
  {
    print("Animal can make sound");
  }
}


class Animal with eat, sound
{
  void fun()
  {
    print("Food quantity : ${quantity}");
    speak();
  }
}


void main()
{
  Animal obj = new Animal();
  obj.fun();
}
