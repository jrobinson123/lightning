


class lightningStorm {
  int stormLength = 15;
  rateOfChangeBuffer[][] storm;
  circularBuffer[] buffersOne;
  circularBuffer[] buffersTwo;
 
  
lightningStorm(){
    buffersOne = new circularBuffer[stormLength];
    buffersTwo = new circularBuffer[stormLength];
  
    for(int i = 0; i < stormLength; i++){
      buffersOne[i] = new circularBuffer(1, i + 1);
      buffersTwo[i] = new circularBuffer(1, i + 1);
    }
    storm = new rateOfChangeBuffer[stormLength][stormLength];
    for (int i = 0; i < stormLength; i++) {
        for (int j = 0; j < stormLength; j++) {
            storm[i][j] = new rateOfChangeBuffer(i + 1, j + 1, buffersOne[i], buffersTwo[j]);
        }
    }
 }
  
  void show(){
    for (int i = 0; i < stormLength; i++) {
        for (int j = 0; j < stormLength; j++) {
            int y = 400;
            int prevX = 0;
            int prevY = 400;
            int x = 0;
            while(x < width && y >= 0){
            float change = storm[i][j].next();
            y -= change;
            line(prevX,prevY,x,y);
            prevX = x;
            prevY = y;
            x += 1;
        }
      }
    }
  }
  
}



class rateOfChangeBuffer{
 
  int max;
  int currentIndex = 0;
  float[] changes;
  rateOfChangeBuffer(int i, int j, circularBuffer cb1, circularBuffer cb2){
    max = lcm(i, j);
    changes = new float[max];
    for (int z = 0; z < max; z++) {
        changes[z] = cb1.next() / cb2.next();
    }
    
  }
  float next() {
    float valToReturn = changes[currentIndex];
    if (currentIndex == max - 1) {
      currentIndex = 0;
    }else{
       currentIndex += 1;
     }
    return valToReturn;
  }
  
  int gcd(int a, int b) {
    if (a == 0) {
      return b;
    } else {
      return this.gcd(b % a, a);
    }
  }
  int lcm(int a, int b)
  {
      return (a / gcd(a, b)) * b;
  }
}
