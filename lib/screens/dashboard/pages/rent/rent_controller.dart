import 'package:get/get.dart';

class RentController extends GetxController {
  bool isHomeSelected = true;
  bool isApartmentsSelected = false;
  bool isFlatsSelected = false;
  bool isVillaSelected = false;

  List<bool> isFavouriteSelected = [false,false];
  List<bool> isFavouriteSelected1 = [false];
  List<bool> isRecentFavouriteSelected = [false,false,false,false,false];
}
