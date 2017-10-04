# sample-spring-boot-with-gradle

TODO ![Badge Status](https://ci-as-a-service)

自分流のSpring Boot with Gradleプロジェクトを開始する手順を説明します。

## Requirement

- Java SDK 8

```
$ java -version
java version "1.8.0_144"
Java(TM) SE Runtime Environment (build 1.8.0_144-b01)
Java HotSpot(TM) 64-Bit Server VM (build 25.144-b01, mixed mode)
```

- Docker

```
$ docker version
Client:
 Version:      17.03.1-ce
 API version:  1.27
 Go version:   go1.7.5
 Git commit:   c6d412e
 Built:        Tue Mar 28 00:40:02 2017
 OS/Arch:      windows/amd64

Server:
 Version:      17.06.2-ce
 API version:  1.30 (minimum version 1.12)
 Go version:   go1.8.3
 Git commit:   cec0b72
 Built:        Tue Sep  5 19:59:19 2017
 OS/Arch:      linux/amd64
 Experimental: false
```

## Step

### やりたいことをREADMEに書く

- TODO Featuresに欲しい機能を列挙する。
- Readme Driven Development http://tom.preston-werner.com/2010/08/23/readme-driven-development.html
- Readme駆動開発を和訳してみた - Qiita https://qiita.com/syossan27/items/38e2f4b7f0dc74207dc9
- わかりやすい README 駆動開発 - Qiita https://qiita.com/b4b4r07/items/c80d53db9a0fd59086ec#_reference-b44ebe2d406688f9bd3b

### Spring Initializrでプロジェクトを作成、ダウンロード

- TODO Gradleプロジェクト
- TODO 各ファイルの書式を調整
- TODO 不要ファイルを削除

### Dockerfileを作成

- TODO 開発用Dockerfile
- TODO 実行用Dockerfile

### CircleCIビルドを設定

- TODO

### v0.0.1をリリース

- TODO とりあえず起動するだけで良い。

### v0.1.0をリリース

- TODO 最低限必要な、ドッグフーディングできる機能を実装する。
- TODO この時点で、自分だけが使えるように実行環境で実行する。
- TODO ユーザー管理はまだ不要。最初のころはBASIC認証で十分。
- TODO リファレンス、サイト・ドキュメントも不要。
- TODO 未実装のFeatureはTODOに書く。

### 機能を少しずつリリース

- TODO CHANGELOGに、そのバージョンの実装目標を書いておく。Keep a Changelog http://keepachangelog.com/
- TODO 少しずつ機能を追加、体裁を整備していく。
- TODO UML図は、PlantUMLで書く。
- TODO REST APIリファレンスは、Swaggerで書く。
- TODO 設計情報は、サイト・ドキュメントにMarkdownで書く。
- TODO バージョン情報を表示する。Spring Bootアプリケーションのバージョン情報を外部から確認したい - Qiita https://qiita.com/u6k/items/d86e339ab870c39ed08f
- 47. Endpoints - 47.7.4 Build information https://docs.spring.io/spring-boot/docs/current/reference/html/production-ready-endpoints.html#production-ready-application-info-build
- 84. Build - 84.1 Generate build information https://docs.spring.io/spring-boot/docs/current/reference/html/howto-build.html#howto-build-info
- TODO しばらくは、DBはhsqldbなどで良い。
- TODO Web 1.0形式で良い。フロントエンドに凝るのは、後で良い。

## Author

- [u6k.Blog()](https://blog.u6k.me/)
- [u6k - GitHub](https://github.com/u6k)
- [u6k_yu1 | Twitter](https://twitter.com/u6k_yu1)

## License

- [MIT License](https://github.com/u6k/sample-spring-boot-with-gradle/blob/master/LICENSE)
