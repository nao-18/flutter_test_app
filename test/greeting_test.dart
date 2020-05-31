import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertestapp/greeting.dart';
import 'package:fluttertestapp/main.dart';
import 'package:mockito/mockito.dart';

class MockGreeting extends Mock implements Greeting{}

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

  //Mockテスト
  test('mockito', () async {
    // 2. モックのインスタンス化
    final greeting = MockGreeting();

    // 3. モックの実装
    when(greeting.slowGreeting()).thenAnswer((_) => Future.value("こんばんは"));

    var result = await greeting.slowGreeting();
    expect(result, 'こんばんは');
  });

  //Widgetテスト
  testWidgets('挨拶が表示されるテスト', (WidgetTester tester) async {
    //widgetツリーの構築
    await tester.pumpWidget(MyApp());
    //初期値のテスト
    expect(find.text('名前を入力してください'), findsOneWidget);
    //テキストフィールドに名前を入力する
    await tester.enterText(find.byKey(const Key('name text field')), '太郎');
    //『挨拶をする』ボタンをタップする
    await tester.tap(find.text('挨拶をする'));
    //Widgetツリーの更新待ち
    await tester.pump();
    //表示された挨拶の文言をチェックする
    expect(find.text('こんにちは 太郎 さん'), findsOneWidget);
  });

}