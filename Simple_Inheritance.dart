class Animal {
  String? name;
  void get(String n) {
    this.name = n;
  }

  void display() {
    print("Name : ${name}");
  }

  void eat() {
    print("Eating using mouth");
  }
}


class Dog extends Animal {
  void bark() {
    print("I am dog and i can bark");
  }
}


class Cat extends Animal {
  void meow() {
    print("I am cat and i say meow");
  }
}


void main() {
  //dog object
  Dog obj1 = Dog();
  obj1.get("Simba");
  obj1.display();
  obj1.eat();
  obj1.bark();

  print("");
  
  //cat object
  Cat obj2 = Cat();
  obj2.get("kitty");
  obj2.display();
  obj2.eat();
  obj2.meow();
}
