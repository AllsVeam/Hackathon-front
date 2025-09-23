import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @page_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get page_home;

  /// No description provided for @page_dwelling.
  ///
  /// In en, this message translates to:
  /// **'Dwelling'**
  String get page_dwelling;

  /// No description provided for @page_calculator.
  ///
  /// In en, this message translates to:
  /// **'Calculator'**
  String get page_calculator;

  /// No description provided for @page_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get page_profile;

  /// No description provided for @home_welcome.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get home_welcome;

  /// No description provided for @home_lema.
  ///
  /// In en, this message translates to:
  /// **'Here is your account overview!'**
  String get home_lema;

  /// No description provided for @home_accounts.
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get home_accounts;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @exchange.
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get exchange;

  /// No description provided for @payout.
  ///
  /// In en, this message translates to:
  /// **'Payout'**
  String get payout;

  /// No description provided for @cards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get cards;

  /// No description provided for @analytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get analytics;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @goodAfeternoom.
  ///
  /// In en, this message translates to:
  /// **'goodAfternoon'**
  String get goodAfeternoom;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @totalBalance.
  ///
  /// In en, this message translates to:
  /// **'Total Balance'**
  String get totalBalance;

  /// No description provided for @availableBalance.
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get availableBalance;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @receive.
  ///
  /// In en, this message translates to:
  /// **'Receive'**
  String get receive;

  /// No description provided for @topUp.
  ///
  /// In en, this message translates to:
  /// **'Top up'**
  String get topUp;

  /// No description provided for @payBills.
  ///
  /// In en, this message translates to:
  /// **'Pay Bills'**
  String get payBills;

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get income;

  /// No description provided for @expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expenses;

  /// No description provided for @recentTransaction.
  ///
  /// In en, this message translates to:
  /// **'Recent Transaction'**
  String get recentTransaction;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @subtitleWelcome.
  ///
  /// In en, this message translates to:
  /// **'Your Digital Wallet'**
  String get subtitleWelcome;

  /// No description provided for @textInfoSecure.
  ///
  /// In en, this message translates to:
  /// **'Secure Transactions'**
  String get textInfoSecure;

  /// No description provided for @textInfoTransfer.
  ///
  /// In en, this message translates to:
  /// **'Instant Transfers'**
  String get textInfoTransfer;

  /// No description provided for @buttonGetWel.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get buttonGetWel;

  /// No description provided for @textButtonWel.
  ///
  /// In en, this message translates to:
  /// **'I read have an account'**
  String get textButtonWel;

  /// No description provided for @createAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccountTitle;

  /// No description provided for @createAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join App and start managing your money'**
  String get createAccountSubtitle;

  /// No description provided for @inputName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get inputName;

  /// No description provided for @inputLastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get inputLastName;

  /// No description provided for @inputEmail.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get inputEmail;

  /// No description provided for @inputPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get inputPhone;

  /// No description provided for @inputPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get inputPassword;

  /// No description provided for @inputConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get inputConfirmPassword;

  /// No description provided for @buttonCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get buttonCreateAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @linkSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get linkSignIn;

  /// No description provided for @carrouseltitle1.
  ///
  /// In en, this message translates to:
  /// **'You need to have a wallet'**
  String get carrouseltitle1;

  /// No description provided for @carrouseltitle2.
  ///
  /// In en, this message translates to:
  /// **'Congratulations, you now have a wallet.'**
  String get carrouseltitle2;

  /// No description provided for @carrouseltitle3.
  ///
  /// In en, this message translates to:
  /// **'Easy & Convenient'**
  String get carrouseltitle3;

  /// No description provided for @carrouselsubtitle1.
  ///
  /// In en, this message translates to:
  /// **'Create your wallet at the following URL'**
  String get carrouselsubtitle1;

  /// No description provided for @carrouselsubtitle2.
  ///
  /// In en, this message translates to:
  /// **'Now you can send money safely with just AddressUrl.'**
  String get carrouselsubtitle2;

  /// No description provided for @carrouselsubtitle3.
  ///
  /// In en, this message translates to:
  /// **'Make payments, pay bills, and transfer money with just a few taps.'**
  String get carrouselsubtitle3;

  /// No description provided for @buttonNext.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get buttonNext;

  /// No description provided for @buttonNext2.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get buttonNext2;

  /// No description provided for @buttonSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get buttonSkip;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @signInToYourAppAccout.
  ///
  /// In en, this message translates to:
  /// **'Sing in to your App account'**
  String get signInToYourAppAccout;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email Required'**
  String get emailRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid Email'**
  String get invalidEmail;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
