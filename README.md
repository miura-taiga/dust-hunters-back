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