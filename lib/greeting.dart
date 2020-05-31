class Greeting
{
  String greeting(String name) {
    if (name == null || name == '') {
      return '名前を入力してください';
    }
    return 'こんにちは $name さん';
  }

  Future<String> slowGreeting() async {
    return Future.delayed(Duration(seconds: 5), () {
      return 'こんにちは';
    });
  }
}