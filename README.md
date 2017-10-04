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

- CircleCI CLI

```
$ circleci version

circleci version: 0.0.4292-afe39e9
Build Agent version: 0.0.4291-afe39e9
built: 2017-10-01T01:05:45+0000
```

## Steps

Spring Boot with Gradleプロジェクトを開始する手順を説明します。

### やりたいことをREADMEに書く

まず、やりたいこと、欲しい機能をREADMEに書きます。ここで多く書きすぎた場合は、別プロジェクトに切り出せばよいだけなので、頭の中を空っぽにする勢いで書き出します。次の記事を参考にすると良いです。

- [Readme Driven Development](http://tom.preston-werner.com/2010/08/23/readme-driven-development.html)
- [Readme駆動開発を和訳してみた - Qiita](https://qiita.com/syossan27/items/38e2f4b7f0dc74207dc9)

筆者は、次のREADMEテンプレートを好んで使っています。

- [わかりやすい README 駆動開発 - Qiita](https://qiita.com/b4b4r07/items/c80d53db9a0fd59086ec#_reference-b44ebe2d406688f9bd3b)

TODO: READMEテンプレートを自分用に修正します。

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

[Spring Initializr](https://start.spring.io/)でプロジェクトを作成、ダウンロードします。設定は、次のように行います。

- Gradle Project
- Java
- Spring Boot Version = 最新の安定版
- Project Metadata
    - Group = 自分が所有するドメイン名の逆
        - ドメインを所有していない場合、Artifactと同じでも良いです。
    - Artifact = GitHubリポジトリ名
- Dependencies
    - DevTools
    - Web, Thymeleaf, Actuator
        - Webアプリケーションの場合。
        - REST APIのみの場合、Thymeleafは不必要です。
    - JPA, H2
        - DBを使用する場合。
        - しばらくはH2 DatabaseなどEmbedded DBで良いです。

ダウンロードしたプロジェクトは展開して、Gitコミットします。次に、プロジェクトの内容を調整します。

- 全体的に
    - インデントがタブ文字なので、スペース文字に変換
    - 改行コードがLFなので、CRLFに変換

- `build.gradle`

`sourceCompatibility`は設定されていますが`targetCompatibility`が未設定なので、設定します。

```
targetCompatibility = 1.8
```

Gradleのビルド結果は`build/`に出力されますが、Eclipseはデフォルトで`bin/`に出力します。`build/`に合わせたほうが管理が楽なので、設定を追加します。

```
eclipse {
    classpath {
        defaultOutputDir = file('build/eclipse-classes')
    }
}
```

- パッケージ

Artifactの設定によってはパッケージが不適切になっていることがあるので、修正します。

`resources/static/`、`resources/templates/`が生成されますが、現時点では使わないので、削除します。

- javaファイル

Artifact名でメイン・クラスが生成されますが、個人的な慣習のため`Main.java`に変更します。あわせて、テスト・クラスも生成されているので、`MainTest.java`に変更します。

これらのファイルを開き、フォーマット、インポートの整理を行います。

テスト・クラスには空のテスト・メソッドが定義されていますが、ビルドのために残しておきます。

- `src/main/resources/application.properties`

DBを使用する場合、DB接続設定を追加します。次の設定は、Apache Derbyの設定例です。

```
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.url=jdbc:h2:${APP_DB_PATH:./build/db/my-app}
spring.datasource.username=sa
spring.datasource.password=sa
spring.jpa.hibernate.show-sql=true
spring.jpa.hibernate.ddl-auto=update
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
```

JDBC URLに`APP_DB_PATH`環境変数またはデフォルト値として`./build/db/my-app`を設定しています。これは、開発時は`./build/db/my-app`にDBデータを出力して、実行時は`APP_DB_PATH`環境変数で設定したパスにDBデータを出力するためです。

ログ出力設定を追加します。筆者は、「ライブラリはともかくアプリケーションはできるだけログ出力したほうが良い」と考えているため、次のように設定します。rootではないほうの設定は、アプリケーションのパッケージ名を設定していることに注意してください。

```
logging.level.root=INFO
logging.level.me.u6k=DEBUG
```

### Eclipseプロジェクトを作成、動作確認

Spring Bootプロジェクトとして最低限の体裁が整ったので、Eclipseプロジェクトを生成してみます。

```
$ ./gradlew eclipse
```

生成したEclipseプロジェクトをインポートしてみて、正常にインポートできることを確認します。

次に、実行してみます。

```
$ ./gradlew bootRun
```

起動したら、 http://localhost:8080/health にアクセスして、次のように出力されることを確認します。

```
{"status":"UP"}
```

また、`./build/db/my-app`にDBデータが出力されることを確認します。

### Dockerfileを作成

Dockerで開発用イメージと実行用イメージを構築するために、Dockerfileを作成します。開発用と実行用の違いは、開発用は開発中ソースコードをマウントしてシェルを起動しますが、実行用はビルドしたjarファイルを基に起動します。ただ、開発用イメージはホスト環境を汚さないためにありますが、Java以外に依存しないのであれば必要ありません。Java以外の例えばLinuxアプリケーションなどに依存するようになったら、改めて開発用イメージを作れば良いです。

- `Dockerfile-dev`

```
FROM openjdk:8-alpine
LABEL maintainer="u6k.apps@gmail.com"

VOLUME /var/my-app
WORKDIR /var/my-app

CMD ["sh"]
```

- `Dockerfile`

```
FROM openjdk:8-alpine AS dev

COPY . /var/my-app
WORKDIR /var/my-app
RUN ./gradlew build

FROM openjdk:8-alpine
LABEL maintainer="u6k.apps@gmail.com"

COPY --from=dev /var/my-app/build/libs/my-app-x.x.x.jar /opt/my-app.jar

ENV APP_DB_PATH /var/my-app/db/my-app
VOLUME /var/my-app

CMD ["java", "-jar", "/opt/my-app.jar"]
```

ファイル中の`my-app`は、アプリケーション名に変更します。`Dockerfile`の`x.x.x`は、バージョン番号に変更します。DBを使用する場合、出力先としての`/var/my-app`と`APP_DB_PATH`環境変数を定義しますが、DBを使用しない場合は不要です。

__TODO:__ バージョン番号は`build.gradle`の1箇所で管理したいのですが、現時点ではしかたなく`Dockerfile`にも記述してしまっています。将来的に、これは解消したいと考えています。

Dockerfileを作成したら、動作確認を行います。

開発用Dockerイメージを構築します。

```
$ docker build -t my-app-dev -f Dockerfile-dev .
```

開発用Dockerイメージを起動します。

```
$ docker run \
    -it \
    -p 8080:8080 \
    -v ${PWD}:/var/my-app \
    my-app-dev sh
```

アプリケーションを起動して、 http://localhost:8080/health にアクセスできることを確認します。

```
$ ./gradlew bootRun
```

テストを実行できることを確認します。

```
$ ./gradlew test
```

実行用Dockerイメージを構築します。

```
$ docker build -t u6kapps/my-app .
```

実行用Dockerイメージを起動して、 http://localhost:8080/health にアクセスできることを確認します。

```
$ docker run \
    -p 8080:8080 \
    -v ${DOCKER_VOLUMES}/my-app:/var/my-app \
    u6kapps/my-app
```

### CircleCIビルドを設定

CircleCIでビルドを行うため、ビルド設定ファイルを作成します。

- `.circleci/config.yml`
    - 例によって、`my-app`は適切に置換します。

```
version: 2
jobs:
    unittest:
        docker:
            - image: openjdk:8-alpine
        steps:
            - checkout
            - run:
                name: Test application
                command: ./gradlew test
            - run:
                name: Save test result
                command: |
                    mkdir -p ~/xunit/
                    find . -type f -regex ".*/build/test-results/.*xml" -exec cp {} ~/xunit/ \;
                when: always
            - store_test_results:
                path: ~/xunit
            - store_artifacts:
                path: ~/xunit
    build:
        docker:
            - image: docker:17.07.0-ce
        steps:
            - checkout
            - setup_remote_docker:
                version: 17.07.0-ce
            - run:
                name: Build docker image
                command: docker build -t u6kapps/my-app .
            - run:
                name: Save docker image
                command: |
                    mkdir -p ~/caches/
                    docker save u6kapps/my-app -o ~/caches/image.tar
            - save_cache:
                key: docker-{{ .Revision }}
                paths:
                    - ~/caches/image.tar
    push:
        docker:
            - image: docker:17.07.0-ce-git
        steps:
            - checkout
            - setup_remote_docker:
                version: 17.07.0-ce
            - restore_cache:
                key: docker-{{ .Revision }}
                paths:
                    - ~/caches/image.tar
            - run:
                name: Load docker image
                command: docker load -i ~/caches/image.tar
            - run:
                name: Push docker image
                command: |
                    TAG=`git describe --abbrev=0`
                    docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
                    docker tag u6kapps/my-app u6kapps/my-app:${TAG}
                    docker push u6kapps/my-app
workflows:
    version: 2
    unittest-build-and-push:
        jobs:
            - unittest
            - build:
                requires:
                    - unittest
            - push:
                requires:
                    - build
                filters:
                    branches:
                        only: master
```

`unittest`、`build`、`push`ジョブを定義します。CircleCI CLIではWorkflowsが機能しないため、動作確認するためにはオプションを指定します。例えば、`unittest`ジョブは次のように実行します。

```
$ circleci build --job unittest
```

作成したら、CircleCIにプロジェクトを登録して、ビルドしてみます。

### v0.0.1をリリース

起動してhealthを返すだけですが、この状態をv0.0.1としてリリースします。ここまでの作業をREADMEに反映して、v0.0.1をリリースして、実行用Dockerイメージを作成します。実行用Dockerイメージが作成できたら、自分用サーバーで実行、公開してしまいます。作成したら、さっさと公開することが大事。

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

## おわりに

手順が長い…もっとサクッとプロジェクトを開始して、サクッと実行できるようにしたいです。Dokkuとかかなぁ。

## Author

- [u6k.Blog()](https://blog.u6k.me/)
- [u6k - GitHub](https://github.com/u6k)
- [u6k_yu1 | Twitter](https://twitter.com/u6k_yu1)

## License

- [MIT License](https://github.com/u6k/sample-spring-boot-with-gradle/blob/master/LICENSE)
