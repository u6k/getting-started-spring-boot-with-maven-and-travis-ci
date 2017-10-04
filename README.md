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

## Steps

Spring Boot with Gradleプロジェクトを開始する手順を説明します。

### やりたいことをREADMEに書く

まず、やりたいこと、欲しい機能をREADMEに書きます。ここで多く書きすぎた場合は、別プロジェクトに切り出せばよいだけなので、頭の中を空っぽにする勢いで書き出します。次の記事を参考にすると良いです。

- [Readme Driven Development](http://tom.preston-werner.com/2010/08/23/readme-driven-development.html)
- [Readme駆動開発を和訳してみた - Qiita](https://qiita.com/syossan27/items/38e2f4b7f0dc74207dc9)

筆者は、次のREADMEテンプレートを好んで使っています。

- [わかりやすい README 駆動開発 - Qiita](https://qiita.com/b4b4r07/items/c80d53db9a0fd59086ec#_reference-b44ebe2d406688f9bd3b)

Gistでは、次のテンプレートが人気のようです。

- [A template to make good README.md](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)

### GitHubにリポジトリを作成する

やりたいことを整理したら、GitHubにリポジトリを作成してしまいます。速度が大事なWebの世界では、さっさとオープンにすることが大事。また、同様のプロジェクトが既に存在しても、それが十分に知名度を持っていない限り、あまり気にしなくても良いです。

この時、プロジェクトの命名には十分に注意します。公開してドメイン名も取得してしばらくしてから名称でもめると、非常に面倒なことになります。ただ、しばらくは知名度が低いはずなので、まずはランダム・ネーム・ジェネレーターで命名してしまい、v1.0リリースの時にリネームしても良いかもしれません。

- [Random Word Generator - Word+](http://watchout4snakes.com/wo4snakes/Random/RandomWordPlus)
- [WORDOID - Creative Name Generator - Domain names, company names, product names](http://wordoid.com/)

命名の方法論は、多くの素晴らしい記事があるので(つまり、それだけ多くの人が命名で悩んでいます)、それらを参考にしても良いです。

- [The essential guide to choosing good project names](https://www.articulatemarketing.com/blog/project-names)
- [Igor Naming Guide Naming Companies](https://www.igorinternational.com/process/naming-guide-product-company-names.php)
- [Naming Your Software Project in 5 Minutes or Less | Slaptijack](https://slaptijack.com/programming/naming-your-software-project-in-5-minutes-or-less/)

### Spring Initializrでプロジェクトを作成、ダウンロード

[Spring Initializr](https://start.spring.io/)でプロジェクトを作成、ダウンロードします。

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
