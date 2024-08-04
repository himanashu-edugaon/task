
class AppTranslation{
  static Map<String,Map<String,String>> translations = {
    'en_US' : Locales.en_US,
    'hi_HI' : Locales.hi_HI,
  };
}
class LocalKeys{
  LocalKeys._();
  static const selectLanguage =  "Please select your Language";
  static const youCanLanguage = "You can change the language at any time.";
  static const next ="Next";
  static const enterPhone = "Please enter your mobile number";
  static const receiveFourDigit = "You'll receive a 4 digit code to verify next";
  static const continues = "CONTINUE";
  static const phoneNumber = "Phone Number";
  static const verifyPhone = "Verify Phone";
  static const codeSent = "Code is sent to";
  static const didntRecevie = "Didn't receive the code? Request Again";
  static const verifyContinue = "VERIFY AND CONTINUE";
  static const selectProfile = "Select Profile";
  static const shipper = "Shipper";
  static const loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing";
  static const transport = "Transport";

}
class Locales{
  static const en_US= {
    "selectLanguage":"Please select your Language",
    "youCanLanguage":"You can change the language at any time.",
    "next":"Next",
    "enterPhone":"Please enter your mobile number",
    "receiveFourDigit": "You'll receive a 4 digit code to verify next",
    "continues": "CONTINUE",
    "phoneNumber": "Phone Number",
    "verifyPhone": "Verify Phone",
    "codeSent": "Code is sent to @phone",
    "didntRecevie":"Didn't receive the code? Request Again",
    "verifyContinue":"VERIFY AND CONTINUE",
    "selectProfile":"Please select your profile",
    "shipper":"Shipper",
    "loremIpsum":"Lorem ipsum dolor sit amet, consectetur adipiscing",
    "transport":"Transport",


  };
  static const hi_HI = {
    "selectLanguage":"कृपया अपनी भाषा चुनें",
    "youCanLanguage":"आप किसी भी समय भाषा बदल सकते हैं",
    "next":"अगला",
    "enterPhone":"अपना मोबाइल नंबर दर्ज करें",
    "receiveFourDigit":"आपको आगे सत्यापन के लिए 4 अंकों का कोड प्राप्त होगा।.",
    "continues":"जारी रखना",
    "phoneNumber":"फ़ोन नंबर",
    "verifyPhone":"फ़ोन सत्यापित करें",
    "codeSent": "कोड @phone पर भेजा गया",
    "didntRecevie":"कोड प्राप्त नहीं हुआ? पुनः अनुरोध करें",
    "verifyContinue": "सत्यापित करें और जारी रखें",
    "selectProfile":"कृपया अपना प्रोफ़ाइल चुनें",
    "shipper":"भेजनेवाला",
    "loremIpsum":"ग्राहक बहुत महत्वपूर्ण है, ग्राहक का पालन किया जाएगा",
    "transport":"ट्रांसपोर्टर",
  };
}