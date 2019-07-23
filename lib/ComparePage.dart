import 'package:flutter/material.dart';
import 'models/ClientModel.dart';
import 'database.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum PageState { Brand, Sizing, Result }

class _MyAppState extends State<MyApp> {
  // data for testing
  List<Client> testClients = [
    Client(brandName: "Abercrombie & Fitch", sizeName: "XS", chest: 34),
    Client(brandName: "Abercrombie & Fitch", sizeName: "S", chest: 37),
    Client(brandName: "Abercrombie & Fitch", sizeName: "M", chest: 40),
    Client(brandName: "Abercrombie & Fitch", sizeName: "L", chest: 43),
    Client(brandName: "Abercrombie & Fitch", sizeName: "XL", chest: 46),
    Client(brandName: "Abercrombie & Fitch", sizeName: "2XL", chest: 49),
    Client(brandName: "Adidas", sizeName: "XS", chest: 33),
    Client(brandName: "Adidas", sizeName: "S", chest: 37),
    Client(brandName: "Adidas", sizeName: "M", chest: 40),
    Client(brandName: "Adidas", sizeName: "L", chest: 44),
    Client(brandName: "Adidas", sizeName: "XL", chest: 48),
    Client(brandName: "Adidas", sizeName: "2XL", chest: 52),
    Client(brandName: "Adidas", sizeName: "3XL", chest: 58),
    Client(brandName: "Aeropostale", sizeName: "XS", chest: 36),
    Client(brandName: "Aeropostale", sizeName: "S", chest: 39),
    Client(brandName: "Aeropostale", sizeName: "M", chest: 42),
    Client(brandName: "Aeropostale", sizeName: "L", chest: 45),
    Client(brandName: "Aeropostale", sizeName: "XL", chest: 48),
    Client(brandName: "Aeropostale", sizeName: "2XL", chest: 51),
    Client(brandName: "Aeropostale", sizeName: "3XL", chest: 54),
    Client(brandName: "Affliction", sizeName: "S", chest: 38),
    Client(brandName: "Affliction", sizeName: "M", chest: 40),
    Client(brandName: "Affliction", sizeName: "L", chest: 42),
    Client(brandName: "Affliction", sizeName: "XL", chest: 44),
    Client(brandName: "Affliction", sizeName: "2XL", chest: 46),
    Client(brandName: "Affliction", sizeName: "3XL", chest: 48),
    Client(brandName: "Affliction", sizeName: "4XL", chest: 50),
    Client(brandName: "American Apparel", sizeName: "XS", chest: 34),
    Client(brandName: "American Apparel", sizeName: "S", chest: 36),
    Client(brandName: "American Apparel", sizeName: "M", chest: 38),
    Client(brandName: "American Apparel", sizeName: "L", chest: 40),
    Client(brandName: "American Apparel", sizeName: "XL", chest: 42),
    Client(brandName: "American Apparel", sizeName: "2XL", chest: 44),
    Client(brandName: "American Apparel", sizeName: "3XL", chest: 46),
    Client(brandName: "American Eagle", sizeName: "XS", chest: 36),
    Client(brandName: "American Eagle", sizeName: "S", chest: 39),
    Client(brandName: "American Eagle", sizeName: "M", chest: 42),
    Client(brandName: "American Eagle", sizeName: "L", chest: 45),
    Client(brandName: "American Eagle", sizeName: "XL", chest: 48),
    Client(brandName: "American Eagle", sizeName: "2XL", chest: 51),
    Client(brandName: "American Eagle", sizeName: "3XL", chest: 54),
    Client(brandName: "Arc'teryx", sizeName: "2XS", chest: 34),
    Client(brandName: "Arc'teryx", sizeName: "XS", chest: 36),
    Client(brandName: "Arc'teryx", sizeName: "S", chest: 38),
    Client(brandName: "Arc'teryx", sizeName: "M", chest: 40),
    Client(brandName: "Arc'teryx", sizeName: "L", chest: 43),
    Client(brandName: "Arc'teryx", sizeName: "XL", chest: 46),
    Client(brandName: "Arc'teryx", sizeName: "2XL", chest: 50),
    Client(brandName: "Billabong", sizeName: "XS", chest: 38),
    Client(brandName: "Billabong", sizeName: "S", chest: 40),
    Client(brandName: "Billabong", sizeName: "M", chest: 42),
    Client(brandName: "Billabong", sizeName: "L", chest: 44),
    Client(brandName: "Billabong", sizeName: "XL", chest: 46),
    Client(brandName: "Billabong", sizeName: "2XL", chest: 48),
    Client(brandName: "Burberry", sizeName: "XS", chest: 35),
    Client(brandName: "Burberry", sizeName: "S", chest: 38),
    Client(brandName: "Burberry", sizeName: "M", chest: 40),
    Client(brandName: "Burberry", sizeName: "L", chest: 43),
    Client(brandName: "Burberry", sizeName: "XL", chest: 45),
    Client(brandName: "Burberry", sizeName: "2XL", chest: 47),
    Client(brandName: "Burberry", sizeName: "3XL", chest: 50),
    Client(brandName: "Calvin Klein", sizeName: "XS", chest: 40),
    Client(brandName: "Calvin Klein", sizeName: "S", chest: 41),
    Client(brandName: "Calvin Klein", sizeName: "M", chest: 42),
    Client(brandName: "Calvin Klein", sizeName: "L", chest: 44),
    Client(brandName: "Calvin Klein", sizeName: "XL", chest: 45),
    Client(brandName: "Calvin Klein", sizeName: "2XL", chest: 47),
    Client(brandName: "Carrots", sizeName: "S", chest: 36),
    Client(brandName: "Carrots", sizeName: "M", chest: 40),
    Client(brandName: "Carrots", sizeName: "L", chest: 44),
    Client(brandName: "Carrots", sizeName: "XL", chest: 48),
    Client(brandName: "Champion", sizeName: "XS", chest: 32),
    Client(brandName: "Champion", sizeName: "S", chest: 36),
    Client(brandName: "Champion", sizeName: "M", chest: 40),
    Client(brandName: "Champion", sizeName: "L", chest: 44),
    Client(brandName: "Champion", sizeName: "XL", chest: 48),
    Client(brandName: "Champion", sizeName: "2XL", chest: 52),
    Client(brandName: "Champion", sizeName: "3XL", chest: 56),
    Client(brandName: "Converse", sizeName: "XS", chest: 35),
    Client(brandName: "Converse", sizeName: "S", chest: 38),
    Client(brandName: "Converse", sizeName: "M", chest: 41),
    Client(brandName: "Converse", sizeName: "L", chest: 44),
    Client(brandName: "Converse", sizeName: "XL", chest: 48),
    Client(brandName: "Converse", sizeName: "2XL", chest: 52),
    Client(brandName: "DC", sizeName: "XS", chest: 35),
    Client(brandName: "DC", sizeName: "S", chest: 38),
    Client(brandName: "DC", sizeName: "M", chest: 41),
    Client(brandName: "DC", sizeName: "L", chest: 44),
    Client(brandName: "DC", sizeName: "XL", chest: 47),
    Client(brandName: "DC", sizeName: "2XL", chest: 49),
    Client(brandName: "Diamond Supply Co.", sizeName: "S", chest: 36),
    Client(brandName: "Diamond Supply Co.", sizeName: "M", chest: 40),
    Client(brandName: "Diamond Supply Co.", sizeName: "L", chest: 44),
    Client(brandName: "Diamond Supply Co.", sizeName: "XL", chest: 48),
    Client(brandName: "Diamond Supply Co.", sizeName: "2XL", chest: 52),
    Client(brandName: "Diamond Supply Co.", sizeName: "3XL", chest: 56),
    Client(brandName: "Diamond Supply Co.", sizeName: "4XL", chest: 60),
    Client(brandName: "Etnies", sizeName: "XS", chest: 33),
    Client(brandName: "Etnies", sizeName: "S", chest: 36),
    Client(brandName: "Etnies", sizeName: "M", chest: 39),
    Client(brandName: "Etnies", sizeName: "L", chest: 42),
    Client(brandName: "Etnies", sizeName: "XL", chest: 44),
    Client(brandName: "Etnies", sizeName: "2XL", chest: 46),
    Client(brandName: "Fila", sizeName: "S", chest: 36),
    Client(brandName: "Fila", sizeName: "M", chest: 40),
    Client(brandName: "Fila", sizeName: "L", chest: 44),
    Client(brandName: "Fila", sizeName: "XL", chest: 48),
    Client(brandName: "Fila", sizeName: "2XL", chest: 52),
    Client(brandName: "Forever 21", sizeName: "XS", chest: 35),
    Client(brandName: "Forever 21", sizeName: "S", chest: 37),
    Client(brandName: "Forever 21", sizeName: "M", chest: 40),
    Client(brandName: "Forever 21", sizeName: "L", chest: 43),
    Client(brandName: "Forever 21", sizeName: "XL", chest: 46),
    Client(brandName: "Fruit Of The Loom", sizeName: "S", chest: 36),
    Client(brandName: "Fruit Of The Loom", sizeName: "M", chest: 40),
    Client(brandName: "Fruit Of The Loom", sizeName: "L", chest: 44),
    Client(brandName: "Fruit Of The Loom", sizeName: "XL", chest: 48),
    Client(brandName: "Fruit Of The Loom", sizeName: "2XL", chest: 52),
    Client(brandName: "Fruit Of The Loom", sizeName: "3XL", chest: 56),
    Client(brandName: "Fruit Of The Loom", sizeName: "4XL", chest: 60),
    Client(brandName: "Gap", sizeName: "XS", chest: 36),
    Client(brandName: "Gap", sizeName: "S", chest: 38),
    Client(brandName: "Gap", sizeName: "M", chest: 41),
    Client(brandName: "Gap", sizeName: "L", chest: 34),
    Client(brandName: "Gap", sizeName: "XL", chest: 48),
    Client(brandName: "Gap", sizeName: "2XL", chest: 52),
    Client(brandName: "Gap", sizeName: "3XL", chest: 55),
    Client(brandName: "Gildan", sizeName: "S", chest: 36),
    Client(brandName: "Gildan", sizeName: "M", chest: 40),
    Client(brandName: "Gildan", sizeName: "L", chest: 44),
    Client(brandName: "Gildan", sizeName: "XL", chest: 48),
    Client(brandName: "Gildan", sizeName: "2XL", chest: 52),
    Client(brandName: "Gucci", sizeName: "XS", chest: 38),
    Client(brandName: "Gucci", sizeName: "S", chest: 39),
    Client(brandName: "Gucci", sizeName: "M", chest: 41),
    Client(brandName: "Gucci", sizeName: "L", chest: 43),
    Client(brandName: "Gucci", sizeName: "XL", chest: 44),
    Client(brandName: "Gucci", sizeName: "2XL", chest: 46),
    Client(brandName: "Gucci", sizeName: "3XL", chest: 47),
    Client(brandName: "Guess", sizeName: "XS", chest: 36),
    Client(brandName: "Guess", sizeName: "S", chest: 37),
    Client(brandName: "Guess", sizeName: "M", chest: 40),
    Client(brandName: "Guess", sizeName: "L", chest: 43),
    Client(brandName: "Guess", sizeName: "XL", chest: 46),
    Client(brandName: "Guess", sizeName: "2XL", chest: 49),
    Client(brandName: "Guess", sizeName: "3XL", chest: 51),
    Client(brandName: "Hanes", sizeName: "XS", chest: 32),
    Client(brandName: "Hanes", sizeName: "S", chest: 36),
    Client(brandName: "Hanes", sizeName: "M", chest: 40),
    Client(brandName: "Hanes", sizeName: "L", chest: 44),
    Client(brandName: "Hanes", sizeName: "XL", chest: 48),
    Client(brandName: "Hanes", sizeName: "2XL", chest: 52),
    Client(brandName: "Hanes", sizeName: "3XL", chest: 56),
    Client(brandName: "Hanes", sizeName: "4XL", chest: 60),
    Client(brandName: "Hanes", sizeName: "5XL", chest: 64),
    Client(brandName: "Hanes", sizeName: "6XL", chest: 68),
    Client(brandName: "Hurley", sizeName: "XS", chest: 36),
    Client(brandName: "Hurley", sizeName: "S", chest: 38),
    Client(brandName: "Hurley", sizeName: "M", chest: 40),
    Client(brandName: "Hurley", sizeName: "L", chest: 42),
    Client(brandName: "Hurley", sizeName: "XL", chest: 45),
    Client(brandName: "Hurley", sizeName: "2XL", chest: 48),
    Client(brandName: "John Elliott", sizeName: "XS", chest: 36),
    Client(brandName: "John Elliott", sizeName: "S", chest: 38),
    Client(brandName: "John Elliott", sizeName: "M", chest: 40),
    Client(brandName: "John Elliott", sizeName: "L", chest: 42),
    Client(brandName: "John Elliott", sizeName: "XL", chest: 44),
    Client(brandName: "John Elliott", sizeName: "2XL", chest: 46),
    Client(brandName: "Kappa", sizeName: "XS", chest: 34),
    Client(brandName: "Kappa", sizeName: "S", chest: 36),
    Client(brandName: "Kappa", sizeName: "M", chest: 38),
    Client(brandName: "Kappa", sizeName: "L", chest: 41),
    Client(brandName: "Kappa", sizeName: "XL", chest: 43),
    Client(brandName: "Kappa", sizeName: "2XL", chest: 45),
    Client(brandName: "Kappa", sizeName: "3XL", chest: 48),
    Client(brandName: "Levi's", sizeName: "XS", chest: 34),
    Client(brandName: "Levi's", sizeName: "X", chest: 37),
    Client(brandName: "Levi's", sizeName: "M", chest: 40),
    Client(brandName: "Levi's", sizeName: "L", chest: 43),
    Client(brandName: "Levi's", sizeName: "XL", chest: 46),
    Client(brandName: "Levi's", sizeName: "2XL", chest: 49),
    Client(brandName: "Levi's", sizeName: "3XL", chest: 52),
    Client(brandName: "Levi's", sizeName: "4XL", chest: 56),
    Client(brandName: "Levi's", sizeName: "5XL", chest: 60),
    Client(brandName: "Lululemon", sizeName: "XS", chest: 35),
    Client(brandName: "Lululemon", sizeName: "S", chest: 37),
    Client(brandName: "Lululemon", sizeName: "M", chest: 39),
    Client(brandName: "Lululemon", sizeName: "L", chest: 42),
    Client(brandName: "Lululemon", sizeName: "XL", chest: 45),
    Client(brandName: "Lululemon", sizeName: "2XL", chest: 48),
    Client(brandName: "Michael Kors", sizeName: "XS", chest: 34),
    Client(brandName: "Michael Kors", sizeName: "S", chest: 37),
    Client(brandName: "Michael Kors", sizeName: "M", chest: 40),
    Client(brandName: "Michael Kors", sizeName: "L", chest: 43),
    Client(brandName: "Michael Kors", sizeName: "XL", chest: 46),
    Client(brandName: "Michael Kors", sizeName: "2XL", chest: 49),
    Client(brandName: "Michael Kors", sizeName: "3XL", chest: 52),
    Client(brandName: "Nike", sizeName: "S", chest: 38),
    Client(brandName: "Nike", sizeName: "M", chest: 41),
    Client(brandName: "Nike", sizeName: "L", chest: 44),
    Client(brandName: "Nike", sizeName: "XL", chest: 49),
    Client(brandName: "Nike", sizeName: "2XL", chest: 54),
    Client(brandName: "Nike", sizeName: "3XL", chest: 58),
    Client(brandName: "Nike", sizeName: "4XL", chest: 63),
    Client(brandName: "Patagonia", sizeName: "2XS", chest: 33),
    Client(brandName: "Patagonia", sizeName: "XS", chest: 35),
    Client(brandName: "Patagonia", sizeName: "S", chest: 37),
    Client(brandName: "Patagonia", sizeName: "M", chest: 40),
    Client(brandName: "Patagonia", sizeName: "L", chest: 44),
    Client(brandName: "Patagonia", sizeName: "XL", chest: 48),
    Client(brandName: "Patagonia", sizeName: "2XL", chest: 52),
    Client(brandName: "Patagonia", sizeName: "3XL", chest: 56),
    Client(brandName: "Prada", sizeName: "XS", chest: 34),
    Client(brandName: "Prada", sizeName: "S", chest: 36),
    Client(brandName: "Prada", sizeName: "M", chest: 38),
    Client(brandName: "Prada", sizeName: "L", chest: 40),
    Client(brandName: "Prada", sizeName: "XL", chest: 42),
    Client(brandName: "Prada", sizeName: "2XL", chest: 44),
    Client(brandName: "Prada", sizeName: "3XL", chest: 46),
    Client(brandName: "Prada", sizeName: "4XL", chest: 48),
    Client(brandName: "Quiksilver", sizeName: "2XS", chest: 34),
    Client(brandName: "Quiksilver", sizeName: "XS", chest: 36),
    Client(brandName: "Quiksilver", sizeName: "S", chest: 38),
    Client(brandName: "Quiksilver", sizeName: "M", chest: 40),
    Client(brandName: "Quiksilver", sizeName: "L", chest: 42),
    Client(brandName: "Quiksilver", sizeName: "XL", chest: 44),
    Client(brandName: "Quiksilver", sizeName: "2XL", chest: 46),
    Client(brandName: "Quiksilver", sizeName: "3XL", chest: 48),
    Client(brandName: "Ralph Lauren", sizeName: "XS", chest: 34),
    Client(brandName: "Ralph Lauren", sizeName: "S", chest: 37),
    Client(brandName: "Ralph Lauren", sizeName: "M", chest: 40),
    Client(brandName: "Ralph Lauren", sizeName: "L", chest: 45),
    Client(brandName: "Ralph Lauren", sizeName: "XL", chest: 48),
    Client(brandName: "Ralph Lauren", sizeName: "2XL", chest: 52),
    Client(brandName: "Reebok", sizeName: "XS", chest: 34),
    Client(brandName: "Reebok", sizeName: "S", chest: 37),
    Client(brandName: "Reebok", sizeName: "M", chest: 40),
    Client(brandName: "Reebok", sizeName: "L", chest: 45),
    Client(brandName: "Reebok", sizeName: "XL", chest: 48),
    Client(brandName: "Reebok", sizeName: "2XL", chest: 52),
    Client(brandName: "Reebok", sizeName: "3XL", chest: 57),
    Client(brandName: "RVCA", sizeName: "XS", chest: 36),
    Client(brandName: "RVCA", sizeName: "S", chest: 38),
    Client(brandName: "RVCA", sizeName: "M", chest: 40),
    Client(brandName: "RVCA", sizeName: "L", chest: 42),
    Client(brandName: "RVCA", sizeName: "XL", chest: 44),
    Client(brandName: "RVCA", sizeName: "2XL", chest: 46),
    Client(brandName: "Sitka", sizeName: "XS", chest: 35),
    Client(brandName: "Sitka", sizeName: "S", chest: 37),
    Client(brandName: "Sitka", sizeName: "M", chest: 39),
    Client(brandName: "Sitka", sizeName: "L", chest: 41),
    Client(brandName: "Sitka", sizeName: "XL", chest: 44),
    Client(brandName: "Sitka", sizeName: "2XL", chest: 47),
    Client(brandName: "Superdry", sizeName: "XS", chest: 34),
    Client(brandName: "Superdry", sizeName: "S", chest: 36),
    Client(brandName: "Superdry", sizeName: "M", chest: 38),
    Client(brandName: "Superdry", sizeName: "L", chest: 40),
    Client(brandName: "Superdry", sizeName: "XL", chest: 42),
    Client(brandName: "Superdry", sizeName: "2XL", chest: 44),
    Client(brandName: "Superdry", sizeName: "3XL", chest: 46),
    Client(brandName: "Supreme", sizeName: "S", chest: 38),
    Client(brandName: "Supreme", sizeName: "M", chest: 44),
    Client(brandName: "Supreme", sizeName: "L", chest: 46),
    Client(brandName: "Supreme", sizeName: "XL", chest: 50),
    Client(brandName: "tentree", sizeName: "S", chest: 38),
    Client(brandName: "tentree", sizeName: "M", chest: 41),
    Client(brandName: "tentree", sizeName: "L", chest: 43),
    Client(brandName: "tentree", sizeName: "XL", chest: 46),
    Client(brandName: "tentree", sizeName: "2XL", chest: 49),
    Client(brandName: "The Hundreds", sizeName: "S", chest: 36),
    Client(brandName: "The Hundreds", sizeName: "M", chest: 40),
    Client(brandName: "The Hundreds", sizeName: "L", chest: 44),
    Client(brandName: "The Hundreds", sizeName: "XL", chest: 48),
    Client(brandName: "The Hundreds", sizeName: "2XL", chest: 52),
    Client(brandName: "The North Face", sizeName: "S", chest: 38),
    Client(brandName: "The North Face", sizeName: "M", chest: 41),
    Client(brandName: "The North Face", sizeName: "L", chest: 44),
    Client(brandName: "The North Face", sizeName: "XL", chest: 48),
    Client(brandName: "The North Face", sizeName: "2XL", chest: 52),
    Client(brandName: "The North Face", sizeName: "3XL", chest: 56),
    Client(brandName: "Thrasher", sizeName: "S", chest: 36),
    Client(brandName: "Thrasher", sizeName: "M", chest: 40),
    Client(brandName: "Thrasher", sizeName: "L", chest: 44),
    Client(brandName: "Thrasher", sizeName: "XL", chest: 48),
    Client(brandName: "Thrasher", sizeName: "2XL", chest: 52),
    Client(brandName: "Thrasher", sizeName: "3XL", chest: 56),
    Client(brandName: "Tommy Hilfiger", sizeName: "XS", chest: 36),
    Client(brandName: "Tommy Hilfiger", sizeName: "S", chest: 38),
    Client(brandName: "Tommy Hilfiger", sizeName: "M", chest: 40),
    Client(brandName: "Tommy Hilfiger", sizeName: "L", chest: 43),
    Client(brandName: "Tommy Hilfiger", sizeName: "XL", chest: 45),
    Client(brandName: "Tommy Hilfiger", sizeName: "2XL", chest: 47),
    Client(brandName: "Tommy Hilfiger", sizeName: "3XL", chest: 50),
    Client(brandName: "True Religion", sizeName: "XS", chest: 35),
    Client(brandName: "True Religion", sizeName: "S", chest: 38),
    Client(brandName: "True Religion", sizeName: "M", chest: 40),
    Client(brandName: "True Religion", sizeName: "L", chest: 42),
    Client(brandName: "True Religion", sizeName: "2XL", chest: 45),
    Client(brandName: "True Religion", sizeName: "3XL", chest: 47),
    Client(brandName: "Uniqlo", sizeName: "2XS", chest: 38),
    Client(brandName: "Uniqlo", sizeName: "XS", chest: 40),
    Client(brandName: "Uniqlo", sizeName: "S", chest: 42),
    Client(brandName: "Uniqlo", sizeName: "M", chest: 44),
    Client(brandName: "Uniqlo", sizeName: "L", chest: 47),
    Client(brandName: "Uniqlo", sizeName: "XL", chest: 50),
    Client(brandName: "Uniqlo", sizeName: "2XL", chest: 53),
    Client(brandName: "Uniqlo", sizeName: "3XL", chest: 57),
    Client(brandName: "Vans", sizeName: "S", chest: 36),
    Client(brandName: "Vans", sizeName: "M", chest: 40),
    Client(brandName: "Vans", sizeName: "L", chest: 44),
    Client(brandName: "Vans", sizeName: "XL", chest: 48),
    Client(brandName: "Vans", sizeName: "2XL", chest: 50),
    Client(brandName: "Volcom", sizeName: "S", chest: 36),
    Client(brandName: "Volcom", sizeName: "M", chest: 40),
    Client(brandName: "Volcom", sizeName: "L", chest: 44),
    Client(brandName: "Volcom", sizeName: "XL", chest: 46),
    Client(brandName: "Volcom", sizeName: "2XL", chest: 48),
    Client(brandName: "Wrangler", sizeName: "S", chest: 36),
    Client(brandName: "Wrangler", sizeName: "M", chest: 40),
    Client(brandName: "Wrangler", sizeName: "L", chest: 44),
    Client(brandName: "Wrangler", sizeName: "XL", chest: 48),
    Client(brandName: "Wrangler", sizeName: "2XL", chest: 52),
    Client(brandName: "Yves Saint Laurent", sizeName: "3XS", chest: 32),
    Client(brandName: "Yves Saint Laurent", sizeName: "2XS", chest: 33),
    Client(brandName: "Yves Saint Laurent", sizeName: "XS", chest: 35),
    Client(brandName: "Yves Saint Laurent", sizeName: "S", chest: 36),
    Client(brandName: "Yves Saint Laurent", sizeName: "M", chest: 38),
    Client(brandName: "Yves Saint Laurent", sizeName: "L", chest: 39),
    Client(brandName: "Yves Saint Laurent", sizeName: "XL", chest: 40),
    Client(brandName: "Yves Saint Laurent", sizeName: "2XL", chest: 42),
    Client(brandName: "Yves Saint Laurent", sizeName: "3XL", chest: 44),
    Client(brandName: "", sizeName: "", chest: null),
  ];

  //Simulating Inputs from app
//  String brand = "Vans"; //input brand
//  int userM = 50; //input measurement
//  int fit = 0; //0 = Slim, 1 = Fitted, 2 = Oversized

  PageState pagestate = PageState.Brand;
  String brand;
  int userM;
  int fit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose a brand"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () async {
                //Client rnd = testClients[math.Random().nextInt(testClients.length)];
                //await DBProvider.db.newClient(rnd);

                await DBProvider.db.deleteAll();
                for (int i = 0; i < testClients.length; i++) {
                  Client nextClient = testClients[i];
                  await DBProvider.db.newClient(nextClient);
                  setState(() {});
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Next page',
              onPressed: () {
                null;
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[],
        ));
  }

  String compare() {
    bool noSize = false;
    //Search through brands
    for (int i = 0; i < testClients.length; i++) {
      //Search through sizes of specified brand
      if (testClients[i].brandName == brand) {
        noSize = true; //for "no size found" error
        //Size too small
        if (testClients[i].chest < userM) {
        }
        //Proper size found
        else if (testClients[i].chest >= userM) {
          //Slim fit
          if (fit == 0 && testClients[i - 1].brandName == brand) {
            return (testClients[i - 1].sizeName);
          }
          //Fitted
          else if (fit == 1) {
            return (testClients[i].sizeName);
          }
          //Oversized
          else if (fit == 2 && testClients[i + 1].brandName == brand) {
            return (testClients[i + 1].sizeName);
          }
          //Fitted is smallest fit but user wants slim fit
          else if (fit == 0 && testClients[i - 1].brandName != brand) {
            String pval = testClients[i].sizeName;
            return ('No slim fit, fitted size is $pval');
          }
          //Fitted is biggest fit but user wants oversized fit
          else if (fit == 2 && testClients[i + 1].brandName != brand) {
            String pval = testClients[i].sizeName;
            return ('No oversized fit, fitted size is $pval');
          }
        }
      }
      //Cannot find fitted size
      else if (testClients[i].brandName != brand && noSize) {
        return ('size not found');
      }
    }

    return 'big error oops';
  }

  List<Widget> getBody() {
    switch (pagestate) {
      case PageState.Brand:
        return testClients
            .map((client) => FlatButton(
                onPressed: () => setState(() {
                      brand = client.brandName;
                      pagestate =
                          fit != null ? PageState.Result : PageState.Sizing;
                    }),
                child: Text(client.brandName)))
            .toList();
      case PageState.Sizing:
        return <Widget>[];
      case PageState.Result:
        return <Widget>[];
    }
  }
}
