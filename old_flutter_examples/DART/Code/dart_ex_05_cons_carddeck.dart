// Card Deck
class Deck{
	List<Card> cardList;

  Deck(){
    cardList = new List<Card>();
  }

  void printCards(){
    for(var i = 0; i < cardList.length;i++){
      print(cardList.elementAt(i).type + " - "+ cardList.elementAt(i).number);
    }
  }

  void createNewDeck(){
    List<String> typeList = ['Space', 'type2'];
    for(var i = 0; i < typeList.length; i++){
      for(var j = 0; j < 2; j++){
        var cnt = j+1;
        cardList.add(new Card(
          							type: typeList.elementAt(i),
          							number: '$cnt'));
      }
    }
  }

  void shuffleDeck(){
    cardList.shuffle();
  }

  cardWithSuit(String suit){
    return cardList.where((card) => card.type == suit);

  }

  deal(int handsize){
    var hand = cardList.sublist(0, handsize);
    cardList = cardList.sublist(handsize);
    return hand;
 	}

  /*
  removeCard(String suit, String rank){
    cardList.removeWhere((card){
      return (card.type == suit) && (card.number == rank);
    });
  }
  */
  removeCard(String suit, String rank){
  	cardList.removeWhere((card) => (card.type == suit) && (card.number == rank));
  }

  toString(){
    return cardList.toString();
  }

}

class Card{
  String number;
  String type;

  Card({this.type, this.number});

  toString(){
    return '$number of $type';
  }
}

void main(){
  Deck deck = new Deck();

  deck.createNewDeck();
  deck.shuffleDeck();
  //print(deck.cardWithSuit('type2').toString());

  //print(deck.cardList.length);
  //print(deck.deal(2));
  print(deck);
  deck.removeCard("Space", "1");
  print(deck);

}
