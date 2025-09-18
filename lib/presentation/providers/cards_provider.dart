import 'package:alquiler_app/domain/entities/card.dart';
import 'package:flutter/material.dart';

class CardsProvider extends ChangeNotifier {
  final int userId;
  List<CardModel> _cards = [];

  CardsProvider({required this.userId});

  List<CardModel> get cards => _cards;

  Future<void> loadCards() async {
    //_cards = await CardService.fetchCards();
    _cards = [
      CardModel(
        id: 12346789,
        tokenid: "asdasdas",
        card: 4561,
        cardHolder: 'Alan Vega Amaro',
        mounth: '02',
        year: '28',
        type: 'debit',
        bank: 'BBVA',
      ),
      CardModel(
        id: 12346789,
        tokenid: "asdasdas",
        card: 4585,
        cardHolder: 'Alan Vega Amaro',
        mounth: '06',
        year: '28',
        type: 'credit',
        bank: 'Azteca',
      ),
      CardModel(
        id: 12346789,
        tokenid: "asdasdas",
        card: 4561,
        cardHolder: 'Alan Vega Amaro',
        mounth: '02',
        year: '28',
        type: 'debit',
        bank: 'Banamex',
      ),
      CardModel(
        id: 12346789,
        tokenid: "asdasdas",
        card: 4585,
        cardHolder: 'Alan Vega Amaro',
        mounth: '06',
        year: '28',
        type: 'credit',
        bank: 'Banjio',
      ),
      CardModel(
        id: 12346789,
        tokenid: "asdasdas",
        card: 4561,
        cardHolder: 'Alan Vega Amaro',
        mounth: '02',
        year: '28',
        type: 'debit',
        bank: 'HSBC',
      ),
      CardModel(
        id: 12346789,
        tokenid: "asdasdas",
        card: 4585,
        cardHolder: 'Alan Vega Amaro',
        mounth: '06',
        year: '28',
        type: 'credit',
        bank: 'bANORTE',
      ),
    ];

    notifyListeners();
  }

  Future<void> addCard(CardModel card) async {
    //await CardService.createCard(card);
    _cards.add(card);
    notifyListeners();
  }

  Future<void> deleteCard(int id) async {
    //await CardService.deleteCard(id);
    _cards.removeWhere((c) => c.id == id);
    notifyListeners();
  }

  Future<void> updateCard(CardModel updatedCard) async {
    //await CardService.updateCard(updatedCard);
    final index = _cards.indexWhere((c) => c.id == updatedCard.id);
    if (index != -1) {
      _cards[index] = updatedCard;
      notifyListeners();
    }
  }
}
