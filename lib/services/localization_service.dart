import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pharmacy/services/storage_service.dart';

class LocalizationService extends GetxService implements Translations {
  static const String _languageKey = 'language';
  final StorageService _storage = Get.find();
  late Locale _locale;

  static LocalizationService get to => Get.find();

  @override
  void onInit() {
    super.onInit();

    if (_storage.read(_languageKey) == null) {
      _locale = Get.deviceLocale == const Locale('ar')
          ? const Locale('ar')
          : const Locale('en');
    } else {
      _locale = Locale(_storage.read(_languageKey) == 'ar' ? 'ar' : 'en');
    }
  }

  Locale get local => _locale;

  void changeLocal(String languageCode) {
    _storage.write(_languageKey, languageCode);
    Get.updateLocale(Locale(languageCode));
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'enter_mobile': 'ادخل رقم هاتفك',
          'enter_name': 'ادخل اسمك',
          'enter_password': 'ادخل كلمة السر',
          'new_user': ' ليس لديك حساب؟',
          'create_account': 'إنشاء',
          'medicines': 'الأدوية',
          'medicines_list': 'قائمة الأدوية',
          'basket': 'السلة',
          'my_orders': 'طلباتي',
          'orders_list': 'قائمة الطلبات',
          'scientific_name': 'الاسم العلمي',
          'commercial_name': 'الاسم التجاري',
          'category': 'التصنيف',
          'manufacturer': 'الشركة المصنعة',
          'available_quantity': 'الكمية المتوفرة',
          'required_quantity': 'الكمية المطلوبة',
          'expiry_date': 'تاريخ إنتهاء الصلاحية',
          'price': 'السعر',
          'search_medicine': 'البحث عن دواء',
          'choose_category': 'اختيار تصنيف',
          'favorite': 'المفضلة',
          'profile': 'ملفي الشخصي',
          'login': 'تسجيل الدخول',
          'logout': 'تسجيل الخروج',
          'language': 'اللغة',
          'arabic': 'عربي',
          'english': 'إنكليزي',
          'add_to_basket': 'إضافة إلى السلة',
          'send_order': 'إرسال الطلب',
        },
        'en': {
          'enter_mobile': 'Enter your mobile number',
          'enter_name': 'Enter your name',
          'enter_password': 'Enter your password',
          'new_user': "Don't have an account? ",
          'create_account': 'Create',
          'medicines': 'Medicines',
          'medicines_list': 'Medicines list',
          'basket': 'Basket',
          'my_orders': 'My orders',
          'orders_list': 'Orders list',
          'scientific_name': 'Scientific name',
          'commercial_name': 'Commercial name',
          'category': 'Category',
          'manufacturer': 'Manufacturer',
          'available_quantity': 'Available quantity',
          'required_quantity': 'Required quantity',
          'expiry_date': 'Expiry Date',
          'price': 'Price',
          'search_medicine': 'Search for a medicine',
          'choose_category': 'Choose a category',
          'favorite': 'Favorite',
          'profile': 'My profile',
          'login': 'Login',
          'logout': 'Logout',
          'language': 'Language',
          'arabic': 'Arabic',
          'english': 'English',
          'add_to_basket': 'add to basket',
          'send_order': 'send the order',
        },
      };
}
