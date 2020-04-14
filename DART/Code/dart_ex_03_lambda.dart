removeCard(String suit, String rank){
    cardList.removeWhere((card){
      return (card.type == suit) && (card.number == rank);
    });
  }



removeCard(String suit, String rank){
  	cardList.removeWhere((card) => (card.type == suit) && (card.number == rank));
  }
