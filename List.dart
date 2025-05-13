void main()
{
  List<dynamic> l = [10,20,30];
  print("Marks $l");
    
  List<double> marks = [10,20.3,50,45,30,22,6,13,40,41,35,49];
  print(marks);
  
  List<double> filtered = [];
  for(int i=0;i<marks.length;i++)
    if(marks[i]>=40)
      filtered.add(marks[i]);
  
  print("Filtered : "+filtered.toString());
  
}
