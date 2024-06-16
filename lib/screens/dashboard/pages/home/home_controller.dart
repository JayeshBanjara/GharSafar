import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isHomeSelected = true;
  bool isApartmentsSelected = false;
  bool isFlatsSelected = false;
  bool isVillaSelected = false;

   List<bool> isFavouriteSelected = [false,false,false,false,false];
   List<bool> isBuyFavouriteSelected = [false,false,false,false,false];
   List<bool> isConsultantFavouriteSelected = [false,false,false,false,false];
   List<bool> isRentFavouriteSelected = [false,false,false,false,false];
}
