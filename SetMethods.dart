void main()
{
    Set s = {};
    s.add(10);
    s.add(40);
    s.add("hello world");
    
    print("Set : $s");
    
    //find length
    print("Lenght : ${s.length}");
    
    //remove element
    s.remove(10);
    print("Set : $s");
    
    //add multiple elements
    s.addAll({10,20,30,40,50});
    print("Set : $s");
    
    //iterate elements
    s.forEach((e){
        print(e);
    });
    
    //remove all elements
    s.clear();
    print("Set : $s");
    
    //check presence of elements
    print("Contains 10 : ${s.contains(10)}");
    
    
    Set<int> s1 = {10,20,30};
    Set<int> s2 = {30,40,50};
    
    //union
    print("Union : ${s1.union(s2)}");
    
    //intersection
    print("Intersection : ${s1.intersection(s2)}");
    
    //difference
    print("Difference : ${s2.difference(s2)}");
    
    
    print("First element : ${s1.elementAt(0)}");
    
    List<int> lis = [1,2,3,4,1,3,1];
    print("List : $lis");
    
    print("Converting list to set : ${lis.toSet()}");
}
