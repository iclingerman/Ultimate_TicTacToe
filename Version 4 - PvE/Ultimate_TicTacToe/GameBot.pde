//A virtual opponent for the game
//For now, this opponent will only chose random boxes
class GameBot{
  
  //Bot will always play as player = 1 (player 2)
  ArrayList<Integer> moveRandom(){
    ArrayList<Integer> returnArray = new ArrayList<Integer>();
    returnArray.add(0);
    int i = int(random(0, 3));
    int j = int(random(0, 3));
    println(i);
    println(j);
    returnArray.add(i);
    returnArray.add(j);
    return returnArray;
  }
  
}
