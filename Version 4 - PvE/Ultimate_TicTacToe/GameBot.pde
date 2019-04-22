//A virtual opponent for the game
//For now, this opponent will only chose random boxes
class GameBot{
  int playerNum;
  void GameBot(int playerNum){
    this.playerNum = playerNum;
  }
  
  //Bot will always play as player = 1 (player 2)
  ArrayList<Integer> moveRandom(){
    ArrayList<Integer> returnArray = new ArrayList<Integer>();
    returnArray.add(0);
    int i = int(random(0, 4));
    int j = int(random(0, 4));
    returnArray.add(i);
    returnArray.add(j);
    
    return returnArray;
  }
  
}