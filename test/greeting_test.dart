import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertestapp/greeting.dart';

void main() {
  //正常時
  test('正常時', () {
    final greeting = Greeting();
    var result = greeting.greeting('太郎');
    expect(result, 'こんにちは 太郎 さん');
  });

  //nullの場合
  test('nullの時', () {
    final greeting = Greeting();
    var result = greeting.greeting(null);
    expect(result, '名前を入力してください');
  });

  //空文字の場合
  test('空文字の時', () {
    final greeting = Greeting();
    var result = greeting.greeting('');
    expect(result, '名前を入力してください');
  });
}