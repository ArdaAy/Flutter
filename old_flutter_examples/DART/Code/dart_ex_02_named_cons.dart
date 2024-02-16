//Parametre sırasına bakılmaksızın verilebilir
class Card{
  String number;
  String type;

  Card({this.type, this.number});

  toString(){
    return '$number of $type';
  }
}

for(var i = 0; i < typeList.length; i++){
      for(var j = 0; j < 2; j++){
        var cnt = j+1;
        cardList.add(new Card(
          type        : typeList.elementAt(i),
          number  : '$cnt'));
      }
    }
