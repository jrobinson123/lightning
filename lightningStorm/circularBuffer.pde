

class circularBuffer{
  int max;
  int val;
  int start;
  
  circularBuffer(int start, int max){
    this.max = max;
    this.start = start;
    val = start;
  }
  
  void sendToStart(){
    val = start;
  }
  
  int next(){
    int valToReturn = val;
    if (val == max) {
      val = start;
    }else{
       val += 1;
     }
    return valToReturn;
  }
}
