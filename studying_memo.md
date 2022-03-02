# やったこと

## chapter_2 {{{
```shell
git clone https://github.com/rickumali/RickUmaliVanityWebsite
git ls-files
git blame master README.md
git log --oneline
```

Gitの基本的な用語の解説などなど

<!-- }}} -->

## chapter_3 {{{

コマンドの基本(cd, ls, pwd, mkdir, rm, touch)
gitのヘルプの確認


### 課題

1. gitに設定したユーザー名/メールアドレスの保存場所<br>
    `~/.gitconfig`, `.git/config`
    > 【A1（著者から）】
    > Gitのコンフィギュレーション（設定）は、/etc/gitconfig、$HOME/.gitconfig、.git/configの3箇所に置かれる。
    > これについては第20章に詳しい情報があるけれど、いまの段階では（とくにGitの初心者には）難解と思われるかもしれない。
    > 完全な情報は、git config helpを参照。
2. Gitの"stupid content tracker"という記述は`git help`のどこにある？<br>
    答えより`git help git`
3. ローカルコミットをフォアードポート(forward-port)するGitコマンド<br>
    git rebase(答え見た…)
4. DAGの略<br>
    はぇ~↓
    > 【A4（著者から）】
    > Directed Acyclic Graph（閉路のない有向グラフ）。
    > git help glossaryを参照。日本語の文献としては、エイホ、ホップクロフト、ウルマン著、
    > 大野義夫訳の『データ構造とアルゴリズム』「6.6 閉路のない有向グラフ」を参照。
    > グラフについては、ウィキペディアの「木（数学）」の項を参照。
5. チュートリアル形式のヘルプ<br>
    `git help tutorial`
6. 他のコマンドに`--help`を付けたらヘルプは表示されるか<br>
    表示される
7. `git -p`使用時の`less`の使いかた<br>
    vimと同じなんだよなぁ……

<!-- }}} -->

## chapter_4 {{{

```shell
mkdir buildtools
cd buildtools
git init
git status
echo -n contents > filefixup.bat
git status
git add filefixup.bat
git status
git commit -m "This is the first commit message"
git log
```

↑を見てもらえば分かるが、リポジトリの作成と、リポジトリ内にファイルを作成して、
ステージングとコミットをした。
Gitの基本操作といった感じ。

### 課題

1. 作りたてのリポジトリで`git log`を実行したときのエラーログとその理由
    ```error_log
    fatal: your current branch 'main' does not have any commits yet
    ```
    `git log`はコミットログを見るもので、コミットしないとログは出せない。
2. 以下を実行

    ```shell
    mkdir twoatonece
    cd twoatonece
    git init
    echo -n contents > file.txt
    git add file.txt
    echo -n newcontents > file.txt
    git status
    ```

    実行結果:

    ```shell
    On branch main

    No commits yet

    Changes to be committed:
      (use "git rm --cached <file>..." to unstage)
        new file:   file.txt

    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git restore <file>..." to discard changes in working directory)
        modified:   file.txt
     ```

    file.txtは2つ表示される。

3. OS間の改行コード問題の話し。
    LinuxでしかGitを使わないので問題無し。
    詳しい解説は`study_files/answer_and_supplement_files/TY-Git_Answers.txt:59`
    Windowsの方がやっかい問題。

<!-- }}} -->

## chapter_5 {{{

GitのGUIクライアントを使って、リポジトリを作成してファイルの追加などの操作。
なお、本の中ではgit-guiを使用しているが、環境の問題で使用できないので、Gitkrakenで代用。

### 課題
前述通り、git-guiを使用できないので、課題通りの操作はできず。
目的としては、コマンド操作でGUIクライアントの表示がどうなるのかを確認すること。

問題の回答は、`study_files/answer_and_supplement_files/TY-Git_Answers.txt:81`を確認。

<!-- }}} -->

## chapter_6 {{{

ステージングについての解説とdiffについて。
実際に、ファイルを作成して、コードを書いて`add/diff`を実行した。

### 知見
`add --dry-run`で、コマンド実行後の内容だけ表示される。実際には実行されない。

`diff --staged`でステージングしたものと、`HEAD`とのdiffが見れる。
ステージングしてないファイルのdiffは見れない。

### 課題

#### 6.4.1

1. `diff --staged`の代り
    `diff --cached`
2. `add --dry-run`の代り
    `add -n`
3. catコマンドで行番号を表示する。
    `cat -n <file>`
4. `git log --oneline`の長い形式
    `git log --pretty=format:'%C(auto)%h %d %s'`
    答えの方:
        `git log --format=oneline --abbrev-commit`
5. `git commit -a`の`-a`スイッチの長い形式
    `git commit -all`


#### 6.4.2 アンステージングする方法。

ヒントには以下のコマンドが紹介されている。
`git rm --cached <file>...`
statusコマンドで紹介されている方法。
`git restore --staged <file>...`


#### 6.4.3
ファイルを追加して、`git log --shortstat --oneline`を実行してみる。


<!-- }}} -->

## chapter_7 {{{

ステージングする各種コマンドを実行する。

```shell
git add
git rm
git mv
```

GUIを使って部分的にコミットする。

`git add -p`を使ってファイルを部分的にコミットする。
対話モードになるので、eを使うとエディタが起動する。
ステージングしない場所を削除して保存すれば、残した部分がステージングされる。

`git checkout -- <file>`で最後にコミットしたバージョンに戻す。
`git checkout <file>`でも同じことできるけどね…。

### 課題

#### 7.5.1

1. 3つ
5. 2つ

<!-- }}} -->

## template {{{



<!-- }}} -->
