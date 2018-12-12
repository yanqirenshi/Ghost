# Ghost

![画面イメージ](https://github.com/yanqirenshi/ghost/blob/master/web/src/assets/images/ss-self.png)

各種ネットサービスのユーザーを管理するためのライブラリ。

というか、サイン・インするためのもの。

## Usage

`web/` 配下がサンプルのようになっています。

`web/` を以下のように使う感じです。
1. 自分のプロジェクトにコピペする。
2. 不要な部分を削る。
3. 自分の好みに併せて整える。

## Dependencies

- [Riot.js](https://riot.js.org/ja/)
- [bulma](https://bulma.io/)
- [Google fonts](https://fonts.google.com/)

## Directories

| Directory | Description                                           |
|-----------|-------------------------------------------------------|
| core/     | Ghost のコア。 いわゆるモデル。                       |
| graph/    | Graph DB の管理                                       |
| web/      | サインイン画面。 基本ここをカスタマイズして利用する。 |
| api/      | web/ と core/ を繋ぐ API。                            |
| docker/   | うーん。。。                                          |
| docs/     | Ghost のマニュアル                                    |

## Author

* Satoshi Iwasaki (yanqirenshi@gmail.com)

## Copyright

Copyright (c) 2015 Satoshi Iwasaki (yanqirenshi@gmail.com)

## License

Licensed under the LLGPL License.
