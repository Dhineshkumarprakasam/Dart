void main()
{
    List<int> lis = [8,40];
    print("List : $lis");
    
    lis.add(20); 
    print("List : $lis");
    
    lis.addAll([9,110]);
    print("List : $lis");
    
    lis.insert(0,17);
    print("List : $lis");
    
    lis.remove(40);
    print("List : $lis");
    
    lis.removeLast();
    print("List : $lis");
    
    lis.shuffle();
    print("List : $lis");
    
    lis.sort();
    print("List : $lis");
    
    List<String> lis2 = ["h","g","a","c","b","f","e","d"];
    print("List : $lis2");
    
    lis2.removeAt(0);
    print("List : $lis2");
    
    lis2.sort();
    print("List : $lis2");
    
}
