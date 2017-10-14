# template-spring-boot

TODO ![Badge Status](https://ci-as-a-service)

自分流のSpring Boot with Mavenプロジェクトを開始する手順を説明します。また、テンプレートを提供します。

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

- Travis CI
    - CIを使わない場合、該当手順を読み飛ばしてください。

## Steps

Spring Boot with Mavenプロジェクトを開始する手順を説明します。なお、説明中の`u6kapps`や`my-app`などは、適宜読み替えてください。

### やりたいことをREADMEに書く

まず、やりたいこと、欲しい機能をREADMEに書きます。ここで多く書きすぎた場合は、別プロジェクトに切り出せばよいだけなので、頭の中を空っぽにする勢いで書き出します。次の記事を参考にすると良いです。

- [Readme Driven Development](http://tom.preston-werner.com/2010/08/23/readme-driven-development.html)
- [Readme駆動開発を和訳してみた - Qiita](https://qiita.com/syossan27/items/38e2f4b7f0dc74207dc9)

筆者は、次のREADMEテンプレートを好んで使っています。

- [わかりやすい README 駆動開発 - Qiita](https://qiita.com/b4b4r07/items/c80d53db9a0fd59086ec#_reference-b44ebe2d406688f9bd3b)

> __TODO:__ READMEテンプレートを自分用に修正します。

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

- Maven Project
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

#### 全体的に

- インデントがタブ文字なので、スペース文字に変換
- 改行コードがLFなので、CRLFに変換
- 不要ファイルを削除
    - `resources/static/`
    - `resources/templates/`
- パッケージを調整
    - Artifact名によってはよく分からないパッケージになることがあります

#### `pom.xml`

プロジェクト詳細、開始年、プロジェクトURLを記述します。

```
<description>Demo project for Spring Boot</description>
<inceptionYear>2017</inceptionYear>
<url>https://github.com/u6k/template-spring-boot/</url>
```

組織情報を追加します。ブログやGitHubでも書いておけば良いです。

```
<organization>
    <name>u6k Apps</name>
    <url>https://github.com/u6k</url>
</organization>
```

よく使うライブラリを依存関係に追加します。

```
<dependency>
    <groupId>org.apache.commons</groupId>
    <artifactId>commons-lang3</artifactId>
    <version>3.6</version>
</dependency>
```

ビルド設定を追加します。

- Spring Bootプラグインを追加
- Eclipseプラグインを追加
    - ソースコード、Javadocをダウンロード

```
<build>
    <finalName>${project.name}</finalName>
    <plugins>
        ...
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-eclipse-plugin</artifactId>
            <configuration>
                <downloadSources>true</downloadSources>
                <downloadJavadocs>true</downloadJavadocs>
            </configuration>
        </plugin>
    </plugins>
</build>
```

レポート設定を追加します。長いですが、ほぼお決まりの設定です。

```
<issueManagement>
    <system>GitHub</system>
    <url>https://github.com/u6k/template-spring-boot/issues</url>
</issueManagement>

<ciManagement>
    <system>Travis CI</system>
    <url>https://travis-ci.org/u6k/template-spring-boot</url>
</ciManagement>

<distributionManagement>
    <site>
        <id>github-releases</id>
        <name>GitHub</name>
        <url>https://github.com/u6k/template-spring-boot/releases</url>
    </site>
</distributionManagement>

<licenses>
    <license>
        <name>MIT License</name>
        <url>https://raw.githubusercontent.com/u6k/template-spring-boot/master/LICENSE</url>
    </license>
</licenses>

<scm>
    <url>https://github.com/u6k/template-spring-boot/</url>
</scm>

<reporting>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-project-info-reports-plugin</artifactId>
            <version>2.9</version>
            <reportSets>
                <reportSet>
                    <reports>
                        <report>index</report>
                        <report>cim</report>
                        <report>dependencies</report>
                        <report>distribution-management</report>
                        <report>issue-tracking</report>
                        <report>license</report>
                        <report>plugin-management</report>
                        <report>scm</report>
                        <report>summary</report>
                    </reports>
                </reportSet>
            </reportSets>
            <configuration>
                <dependencyLocationsEnabled>false</dependencyLocationsEnabled>
            </configuration>
        </plugin>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-surefire-report-plugin</artifactId>
            <version>2.20.1</version>
        </plugin>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-checkstyle-plugin</artifactId>
            <version>2.17</version>
        </plugin>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-pmd-plugin</artifactId>
            <version>3.8</version>
            <configuration>
                <rulesets>
                    <ruleset>/rulesets/java/basic.xml</ruleset>
                    <ruleset>/rulesets/java/braces.xml</ruleset>
                    <ruleset>/rulesets/java/naming.xml</ruleset>
                </rulesets>
            </configuration>
        </plugin>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-javadoc-plugin</artifactId>
            <version>3.0.0-M1</version>
        </plugin>
        <plugin>
            <groupId>org.codehaus.mojo</groupId>
            <artifactId>findbugs-maven-plugin</artifactId>
            <version>3.0.5</version>
        </plugin>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-jxr-plugin</artifactId>
            <version>2.5</version>
        </plugin>
        <plugin>
            <groupId>org.codehaus.mojo</groupId>
            <artifactId>taglist-maven-plugin</artifactId>
            <version>2.4</version>
        </plugin>
        <plugin>
            <groupId>org.codehaus.mojo</groupId>
            <artifactId>cobertura-maven-plugin</artifactId>
            <version>2.7</version>
        </plugin>
    </plugins>
</reporting>
```

#### `src/main/resources/application.properties`

DB接続設定、ログ出力設定を追加します。DBを使用しない場合は、DB接続設定は不要です。ログ出力は、「ライブラリはともかく自アプリケーションはできるだけログ出力すべき」と考えているため、DEBUGレベルを設定します。

```
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.url=jdbc:h2:${APP_DB_PATH:./target/db/my-app}
spring.datasource.username=sa
spring.datasource.password=sa
spring.jpa.hibernate.show-sql=true
spring.jpa.hibernate.ddl-auto=update
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect

logging.level.root=INFO
logging.level.me.u6k=DEBUG
```

JDBC URLに`APP_DB_PATH`環境変数またはデフォルト値として`./target/db/my-app`を設定しています。これは、開発時は`./target/db/my-app`にDBデータを出力して、実行時は`APP_DB_PATH`環境変数で設定したパスにDBデータを出力するためです。

> __TODO:__ プロファイルで管理すべき

#### メイン・クラス

エントリーポイントを作成します。Artifact名でクラスが生成されていますが、個人的な慣習のため`Main.java`に変更します。

```
@SpringBootApplication
public class Main {
    public static void main(String[] args) {
        SpringApplication.run(Main.class, args);
    }
}
```

#### テスト・クラス

空のテスト・クラスを作成します。メイン・クラスと同様に生成されていますが、`MainTest.java`に変更します。レポートのため、1テスト・メソッドのみ、残しておきます。もちろん、テストをちゃんと実装したら、空テスト・メソッドは削除します。

```
@RunWith(SpringRunner.class)
@SpringBootTest
public class MainTest {
    @Test
    public void pass() {
        // TODO: 後で削除します
    }
}
```

#### `mvnw`に実行権限を付与

Windowsで作業をしている場合、`mvnw`の実行権限が保持されない場合があります。この時、Windows以外のプラットフォーム、例えばTravis CIで`mvnw`を実行しようとすると、実行権限がないためにエラーになります。このため、`mvnw`に実行権限を付与します。

```
$ git update-index --chmod=+x mvnw
```

### Eclipseプロジェクトを生成、動作確認

Spring Bootプロジェクトとして最低限の体裁が整ったので、Eclipseプロジェクトを生成してみます。

```
$ ./mvnw eclipse:eclipse
```

生成したEclipseプロジェクトをインポートしてみて、正常にインポートできることを確認します。

次に、実行してみます。

```
$ ./mvnw spring-boot:run
```

起動したら、 http://localhost:8080/health にアクセスして、次のように出力されることを確認します。

```
{"status":"UP"}
```

また、`./target/db/my-app`にDBデータが出力されることを確認します。

プロジェクト・レポートを出力してみます。

```
$ ./mvnw site
```

`target/site/`にレポートが出力されることを確認します。

### Dockerfileを作成

Dockerで開発用イメージと実行用イメージを構築するために、Dockerfileを作成します。開発用と実行用の違いは、開発用は開発中ソースコードをマウントしてシェルを起動しますが、実行用はビルドしたjarファイルを基に起動します。ただ、開発用イメージはホスト環境を汚さないためにありますが、Java以外に依存しないのであれば必要ありません。Java以外の、例えばLinuxアプリケーションなどに依存するようになったら、改めて開発用イメージを作れば良いです。

- `Dockerfile-dev`

```
FROM openjdk:8-alpine
LABEL maintainer="u6k.apps@gmail.com"

VOLUME /var/my-app
WORKDIR /var/my-app

EXPOSE 8080

CMD ["sh"]
```

- `Dockerfile`

```
FROM openjdk:8-alpine AS dev

COPY . /var/my-app
WORKDIR /var/my-app
RUN ./mvnw clean package

FROM openjdk:8-alpine
LABEL maintainer="u6k.apps@gmail.com"

COPY --from=dev /var/my-app/target/my-app.jar /opt/my-app.jar

ENV APP_DB_PATH /var/my-app/db/my-app
EXPOSE 8080

CMD ["java", "-jar", "/opt/my-app.jar"]
```

ファイル中の`my-app`は、アプリケーション名に変更します。DBを使用する場合、出力先としての`/var/my-app`と`APP_DB_PATH`環境変数を定義しますが、DBを使用しない場合は不要です。

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
    -v ${HOME}/.m2:/root/.m2 \
    my-app-dev sh
```

アプリケーションを起動して、 http://localhost:8080/health にアクセスできることを確認します。

```
$ ./mvnw spring-boot:run
```

テストを実行できることを確認します。

```
$ ./mvnw test
```

実行用Dockerイメージを構築します。

```
$ docker build -t u6kapps/my-app .
```

実行用Dockerイメージを起動して、 http://localhost:8080/health にアクセスできることを確認します。

```
$ docker run \
    -p 8080:8080 \
    u6kapps/my-app
```

### Travis CIビルドを設定

ビルド作業はCIサービスに任せます。ここでいう「ビルド作業」は、具体的にはクリーンな環境で次の作業を行うことを言います。

- ユニット・テスト
- E2Eテスト
- 各種メトリクス
- Dockerイメージをビルド
- Dockerイメージをアップロード
- テスト、メトリクスのレポートをアップロード
- 上記の結果をSlack通知

> __TODO:__ 「E2Eテスト」「レポートをアップロード」が実装できていません。
> __TODO:__ Docker multi stage buildにおいて、依存ライブラリのキャッシュを再利用することができません。このため、Dockerイメージのビルドに時間がかかります。

CIサービスは、Travis CI、Circle CI、wercker、Jenkinsなどがありますが、ここではTravis CIを利用します。Circle CIは2.0になってハマりどころが増え、werckerは知見が少なく、Jenkinsは(基本的に)オンプレミスなので。Travis CIのサインアップや基本的な利用方法は、ここでは説明しません。

Travis CIでビルドを行うため、`.travis.yml`ファイルを次のように作成します。

```
sudo: required
language: java

services:
    - docker

before_install:
    - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    - sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    - sudo apt-get update
    - sudo apt-get -y install docker-ce

script:
    - docker build -t u6kapps/my-app .

after_success:
    - if [ -n "$TRAVIS_TAG" ]; then
          docker login -u "$DOCKER_USER" -p "$DOCKER_PASS";
          docker tag u6kapps/my-app u6kapps/my-app:$TRAVIS_TAG;
          docker push u6kapps/my-app;
      else
          echo skip docker push;
      fi

notifications:
    slack:
        secure: xxx
```

内容を説明します。

```
sudo: required
language: java

services:
    - docker
```

Travis CIでDockerを利用するための宣言です。`sudo`は本来は不必要ですが、Dockerを利用するために必要です。

Dockerを利用するだけならば`language`は不必要ですが、`./mvnw site`を実行するため、`language: java`を宣言します。

```
before_install:
    - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    - sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    - sudo apt-get update
    - sudo apt-get -y install docker-ce
```

Travis CIのDockerバージョンは少々古く、Docker multi stage buildがサポートされていません。このため、最新版のDockerにアップグレードする必要があり、そのための処理です。

- 参照: [Using Docker in Builds - Travis CI](https://docs.travis-ci.com/user/docker/#Installing-a-newer-Docker-version)

```
script:
    - docker build -t u6kapps/my-app .
```

Dockerイメージをビルドします。

> __TODO:__ ユニット・テスト、E2Eテスト、レポーティングを実装します。

```
after_success:
    - if [ -n "$TRAVIS_TAG" ]; then
          docker login -u "$DOCKER_USER" -p "$DOCKER_PASS";
          docker tag u6kapps/my-app u6kapps/my-app:$TRAVIS_TAG;
          docker push u6kapps/my-app;
      else
          echo skip docker push;
      fi
```

Gitタグのpushによるビルドの場合、Docker HubにDockerイメージをアップロードします。Gitタグのpushによるビルドの場合、`TRAVIS_TAG`環境変数に文字列が設定されるので、設定された場合は`docker login`、`docker tag`、`docker push`を行います。この時、あらかじめTravis CIの該当プロジェクトの環境変数に`DOCKER_USER`、`DOCKER_PASS`を設定しておきます。

```
notifications:
    slack:
        secure: xxx
```

ビルドが成功/失敗した時に、Slackで通知します。Slackの「Manage Apps」でTravis CIを追加すると、「Setup Instructions」で`notifications`を追加するコマンドが説明されています。ただ、このコマンドにはRubyとtravisコマンドが必要になります。環境はなるべく汚したくないので、ここではtravisコマンドが使えるDockerイメージを使用します。具体的には、次のようにコマンドを実行します。

```
$ docker run --rm -v $(pwd):/project skandyla/travis-cli encrypt "xxx" --add notifications.slack
```

なお、このコマンドを実行すると`.travis.yml`が自動整形されますが、わざわざ手動で整形しなおす必要もないでしょう。

`.travis.yml`を作成したら、Travis CIで該当プロジェクトを有効化して、Git pushします。しばらく待つと、Travis CIがビルドを開始します。もし失敗したら、修正します。

### v0.0.1をリリース

起動してhealthを返すだけですが、この状態をv0.0.1としてリリースします。ここまでの作業をREADMEに反映して、v0.0.1をリリースして、実行用Dockerイメージを作成します。実行用Dockerイメージが作成できたら、自分用サーバーで実行、公開してしまいます。さっさと公開することが大事。

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
