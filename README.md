## ER 図

[ER 図 URL](https://dbdiagram.io/d/66c6a5aca346f9518cbd1faf)

[![Image from Gyazo](https://i.gyazo.com/e1a3dd5ebdccda3b395870eda1fe1a6c.png)](https://gyazo.com/e1a3dd5ebdccda3b395870eda1fe1a6c)

- 【User】
アプリ内で使用するユーザー情報を取得するためのテーブルになります。例えば、名前や性別、HRなどがあります。

- 【UserAuthenticationsx(ユーザー・オーセンティケーションズ)】
あえてUsersテーブルとは切り離して認証のために作成したテーブルになります。こちらは`google_id`や`provider`などがあります。
ユーザー情報を取得するときはこちらのテーブル経由して取得します。

- 【Quests】
クエストのタイトルなどを保存するために使用しました。

- 【UserQuests】
ユーザーひとりひとりのクエストを作成するための中間テーブルとして作成しました。

- 【DefeatedRecords(ディフィーテッド・レコーズ)】
ユーザーひとりひとりのクエストのクリア時間を記録するために作成しました。
これによりユーザーがクエストをクリアした際の時間が保存されます。

- 【Monsters】
モンスター情報を保存するために作成しました。

- 【GuildCards】
各ユーザーのモンスター討伐回数を記録するために作成しました。

## Dockerについて

#### 立ち上げ
```
docker compose up back
```

#### コンテナの入り方、コンテナ外から実行する場合

```
docker compose run back bash
```
```
docker compose run back ~~~
```

## Lintチェックについて

Rubocopを採用していますのでPR作成前に以下コマンドを実行して問題ないことを確認してください。

```
docker compose exec web bundle exec rubocop
```