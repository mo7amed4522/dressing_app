import 'package:get/get.dart';

class MyTranslation implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          'start': 'مرحبا بك في My Dresses',
          'Dressing': 'My Dresses',
          'Login to your account': 'تسجيل الدخول الي حساب',
          'Good to see you again, enter your details below to continue ordering.': 'من الجيد رؤيتك مره آخدي من فضلك اكمل البيانات',
          'Login to my account': 'تسجيل الدخول الي حساب',
          'forget': 'هل نسيت كلمه المرور ؟',
          "Don't have an account ?": 'اذا كنت لا تمتلك حساب ؟ !',
          " Register NOW!": "انشاء الحساب",
          'Create an account': 'انشاء الحساب ',
          'Welcome , enter your details so lets get started in ordering Dress.': 'برجاء اكمل البيانات لتتمكن من شراء فساتين ',
          "Enter your Name": "ادخل الاسم الكامل",
          "Name": 'الاسم',
          "Enter your e-mail": 'ادخل البريد الالكترونى',
          'Email': 'البريد الالكتروني',
          'amount': 'الكميه :',
          'amount1': 'الكميه',
          'loading': 'تحميل البيانات',
          'update': 'تعديل البيانات',
          "Enter your password": 'ادخل كلمه المرور',
          "Passowrd": 'كلمه المرور',
          "Enter your Phone": 'ادخل الهاتف المحمول',
          'Enter your confPhone': 'ادخل تآكيد الهاتف المحمول',
          "Phone": 'الهاتف المحمول',
          'date1': 'تاريخ الاستلام : ',
          'date2': 'تاريخ الرجوع :',
          'errorOrder': 'نآسف لوجود خطآ ',
          'errorOrder1': 'لا يمكنك تآكيد بدون تآكيد بياناتك يجب ادخال رقم هاتف اخر للتآكيد',
          'confPhone': 'تآكيد الهاتف المحمول',
          'noCollection': 'نآسف حيث ان لا توحد مجموعات من المفضله لديك ',
          "Enter your City": 'ادخل محافظتك',
          "City": "المحافظه",
          'confError': 'من فضلك ادخل رقم الهاتف',
          'priceat': 'السعر : ',
          'City cannot be empty': "المحافظه لا يمكن ان تكون فارغه",
          "Enter your Age": 'ادخل العمر',
          'AGE': 'العمر',
          "Age cannot be empty": 'لا يمكن للعمر ان يكون فارغا',
          'Sign up': 'إنشاء الحساب',
          'verifiy': 'برجاء ادخال الكود المرسل اليك عبر البريد الالكتدوني لتاكيد عمليه الدخول',
          'Confirm': 'تأكيد',
          'forgetPassword': 'نسيت كلمه المرور',
          'forgetPassword1': 'برجاء ادخال البريد الالكتروني لارسال رمز تفعيل جديد الي حسابك',
          'sendCode': 'ارسال الرمز',
          'home': 'الرئيسيه',
          'cart': 'الطلبات',
          'size': "المقاس",
          'collection': 'المجموعه',
          'codeOrder': 'كود الطلب : ',
          'favorite': 'المفضله',
          'confOrder': 'مرحبا بك ! في تآكيد الحجز والطلب لتلك المنتج لا بد من اكمال البيانات لكي يتم حجز المنتج .',
          'account': 'الحساب',
          'Dep': 'الاقسام',
          'noProd': 'نآسف حيث ان لا توحد منتجات من المفضله لديك ',
          'prod': 'المنتجات',
          'coll': 'المجموعات',
          'rate': 'التقييم',
          'Error At Server very Sorry !!': "خطا لم يتم تحميل بيانات بعد !!",
          "order": 'طلب المنتج',
          "des": 'الوصف',
          'price': 'السعر',
          'price1': 'الايجار',
          'price2': 'الشراء',
          'updatedata': 'تحديث البيانات',
          'termuse': 'شروط الاستخدام',
          'privacypolicy': 'سياسة الخصوصية',
          'logout': 'تسجيل الخروج',
          'mode': 'تغيير الثيمات',
          'lang': 'تغيير اللغه',
          'conf': ' تأكيد ',
          'createat': 'وقت طلب : ',
          'updateat': 'معاد التسليم : ',
          'endat': 'وقت الرجوع : ',
          'cond': 'بذالك تتم الموافقه علي ',
          'and': ' و ',
          'edit': 'تعديل البيانات',
          'bodylog1': 'هل تريد تأكيد الخروج من الحساب',
          'bodylog2': 'يجب عليك معرفه في حاله الخروج من الحساب لم يتم فقد اي بيانات التي تمتلكها الا ف حاله تريد حذف الحساب يمكنك التواصل مع اداره التطبيق',
          'cancle': 'الغاء',
          'change': 'تغيير',
          'wait': 'انتظار',
          'accept': 'تآكيد',
          'phone1': 'الهاتف المحمول المرسل اليه : ',
          'phone2': 'الهاتف المحمول الراسل : ',
          'theme': 'الثيمات',
          'bodytheme1': 'تغيير الثيمات التطبيق',
          'bodytheme2': 'لا بد من اختيار اي الثيمات التي تفضل ان يكون بيها الجهاز اي من الاختيارات تفضل ؟؟ ',
          'darkmode': 'الوضع المظلم',
          'lightmode': 'الوضه الفاتح',
          'error': 'خطآ اثناء التنفيذ',
          'error1': 'ناسف لتلك الخاصيه في تلك الخاصيه تغيير اللغات لم تمم بالشكل المطلوب بعد !!',
          'editerror': 'حدث خطآ غير مقصود',
          'editerror2': 'حدث خطآ حيث ان لا يمكنك تعديل البيانات الا اذا ضغط ع علامه تعديل البيانات ليتم الاستماع الي تعديلات',
        },
        "en": {
          'start': 'Welcome to the My Dresses',
          'Dressing': 'My Dresses',
          'Login to your account': 'Login to your account',
          'Good to see you again, enter your details below to continue ordering.': 'Good to see you again, enter your details below to continue ordering.',
          'Login to my account': "Login to my account",
          'forget': "Forget your password ?",
          "Don't have an account ?": "Don't have an account ?",
          " Register NOW!": " Register NOW!",
          'Create an account': 'Create an account',
          'Welcome , enter your details so lets get started in ordering Dress.': 'Welcome , enter your details so lets get started in ordering Dress.',
          "Enter your Name": "Enter your Name",
          "Name": "Name",
          'amount': "amount :",
          'confError': 'Please enter a confirmed phone',
          'amount1': 'amount ',
          'date1': 'date first : ',
          'loading': "loading",
          'date2': 'date second : ',
          'errorOrder': 'Error!!',
          'errorOrder1': 'Error you must add confirm phone to order',
          'phone1': 'Phone of admin : ',
          'phone2': 'Phone Sender : ',
          'wait': 'Wait',
          'accept': 'Accepted',
          'priceat': 'price : ',
          "Enter your e-mail": "Enter your e-mail",
          'Email': 'Email',
          "Enter your password": "Enter your password",
          "Passowrd": "Passowrd",
          'cart': 'Order',
          "Enter your Phone": "Enter your Phone",
          'Enter your confPhone': 'Enter your Confirm Phone',
          "Phone": "Phone",
          'update': 'upadte data',
          'confPhone': 'Confirm Phone',
          "Enter your City": "Enter your City",
          "City": "City",
          'createat': 'time Order :',
          'updateat': 'time ask :',
          'endat': 'time back : ',
          'City cannot be empty': 'City cannot be empty',
          "Enter your Age": "Enter your Age",
          'AGE': 'AGE',
          "Age cannot be empty": "Age cannot be empty",
          'Sign up': 'Sign up',
          'verifiy': "verifiy your account by code that has sernt to your email address ",
          'Confirm': 'Confirm',
          'forgetPassword': 'Forget Your password',
          'forgetPassword1': 'please enter your e - mail to send verifiy code to your account',
          'sendCode': 'Send Code',
          'home': 'HOME',
          'collection': 'offer'.toUpperCase(),
          'favorite': 'favorite'.toUpperCase(),
          'account': 'account'.toUpperCase(),
          'Dep': "Department",
          'prod': 'Product',
          'noCollection': 'Sorry !! , There is no favorite of collection for you',
          'noProd': 'Sorry !! , There is no favorite of product for you',
          'coll': 'Collection',
          'rate': "Rate",
          'Error At Server very Sorry !!': 'Error At Server very Sorry !!',
          "order": "Order Producr",
          'des': "Description",
          'price': 'Price',
          'size': "Size",
          'edit': 'Edit Data',
          "price1": "Rent",
          "price2": "Buy",
          'updatedata': 'Update Data',
          'termuse': 'Terms Of Use',
          'privacypolicy': 'Privacy Policy',
          'logout': 'Logout',
          'mode': 'Change Theme',
          'lang': 'Change Language',
          'conf': 'Confirm',
          'codeOrder': "Code of order :",
          'cond': 'Confirm of ',
          'and': ' and ',
          'bodylog1': 'Do you want to logout from your account',
          'bodylog2': 'You have to know that your data not deleted from your account and if you want that you should contact to the manager of application !',
          'cancle': 'Cancle',
          'change': 'Change',
          'theme': 'Theme',
          'bodytheme1': 'Change Theme Mode',
          'bodytheme2': 'You must choose which themes you would like the device to have. Which of the options do you prefer ??',
          'darkmode': 'Darks Mode',
          'lightmode': 'Light Mode',
          'error': 'Error !',
          'confOrder': "Welcome at confirm order !! please complete data to pick this product .",
          'error1': 'Error while change Language of application this feature is not supported yet.',
          'editerror': "Error While Updating Data",
          'editerror2': "You have yo Make Edit on to continue editing this feature your data",
        },
      };
}
