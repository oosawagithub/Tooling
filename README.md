# README

# Tooling
このサイトはバイク乗りのコミュニケーションを図るための投稿サイトです
基本機能は
新規投稿、その投稿にコメントができます。
また都道府県での検索やカテゴリー別での検索結果表示もできます。
一週間ごとのランキングを確認することもできます。


# Dependency
ruby 2.5.5
Rails 5.2.3

# Usage
ユーザー機能
・新規投稿のリンクをクリックすると新しく投稿するための入力画面がでるのですべての欄を入力すると投稿することができます。
どこか入力漏れがあると投稿することができず入力エラーが発生します
・投稿後は自分の投稿した詳細画面に行き自分の投稿を確認することができます。
また、詳細画面の下部にコメント欄があり名前とコメントを入力することで、投稿に対してコメントをすることができます。
・ヘッダー左上のロゴを押すとトップ画面へ遷移することができます。
・お問い合わせリンクを押すことでお問い合わせのページへ移動します。
必要項目を入力することで送ることができます。
お問い合わせの確認は管理者のみ確認することができます。
・カテゴリーを選択を押すと現在登録してあるカテゴリーを一覧を見ることができます。
また、その中から選択することでカテゴリに関連している投稿一覧を見ることができます。
・都道府県検索も同様で見たい都道府県を選択し検索をボタンを押すと選択した都道府県に関連している投稿一覧を見ることができます

管理者機能
・管理者は投稿の削除、投稿についたコメントの削除お問い合わせ確認をすることができる。
・管理者側は削除要請が来たときに検索をしやすいように投稿タイトルで検索をできるようにしてあります。
・管理者はカテゴリーを追加することもできる（10個まで）。
ヘッダーにあるカテゴリー追加を押すと入力欄が出るので追加したいカテゴリーを入力するとカテゴリーを追加できます。

# License
This software is released under the MIT License, see LICENSE.
