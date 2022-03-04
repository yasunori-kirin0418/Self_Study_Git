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

詳しい解説と回答
`study_files/answer_and_supplement_files/TY-Git_Answers.txt:107`

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

詳しい解説と回答
`study_files/answer_and_supplement_files/TY-Git_Answers.txt:142`

#### 7.5.1

1. 3つ
5. 2つ

<!-- }}} -->

## chapter_8 {{{

`git log`を使いたおす章。
`git checkout <SHA1_ID>`で過去のコミットにチェックアウトする。
`detached HEAD`の説明あり。
`git tag`で過去のコミットにタグを付ける。

### 課題

詳しい解説と回答
`study_files/answer_and_supplement_files/TY-Git_Answers.txt:203`

#### 8.5.1

1. `git log --reverse`
    逆順でコミット表示する。
    正直どちらも体感的に速度の変化を感じなかった。
    詳しくは回答を参照。
2. `git log -<n>`
    <n>を数値で指定すると最新から<n>件だけ、
    `--reverse`使用中なら、逆順で<n>件だけコミットを表示する。
3. `git log --date=relative`で現在の時刻から相対時間で表示する。
    `git log --relative-date`でも同じ結果になる模様。(答え見た)
4. あれ、chapter_6でも同じ様な問題が…。
    `--pretty=oneline --abbrev-commit`のショートカットらしい。(答え見た)
    `--oneline`と同じ表示をするだけならいろいろあるっていう話。

### 8.5.2

適当に`math/`を変更する。
`git commit --amend -m 'Fix commit' -m 'Second paragraph' -m 'Wall of text'`
↑これで`math/`最新のコミットを修正する。

### 8.5.3

```
git rev-parse main~3
git show main@{3}
git show main^^^
git rev-parse :/"Removed a and b"
```

1. main~3はmainから3つ前のコミット
    main@{3}は、mainを1番目として3番目のコミット
    main^^^は、main~3と同じ
    :/"Removed a and b"は、このログメッセージを持つコミット
2. 詳しくは答えを…
3. 使えた。zshなら途中までタグ名を入力すれば補完してくれる。
4. @{n}以外は使えた。
    答えの方では使えないと解説されているが、バージョンの問題かと。
    `git version 2.35.1`を使用中

### 8.5.4

`four_files_galore`でコミットは可能
コミットしたときは特別エラーはでないが、`detached HEAD`であることは表示される。
その状態で`main`にチェックアウトすると、以下の警告が出た。

```shell
Warning: you are leaving 1 commit behind, not connected to
any of your branches:

  8a73211 test detached HEAD

If you want to keep it by creating a new branch, this may be a good time
to do so with:

 git branch <new-branch-name> 8a73211

Switched to branch 'main'
```

### 8.5.5

タグの削除は、`git tag -d <tag_name>`

### 8.5.6

1. 最初のコミットメッセージと日付時刻
    メッセージ:The very first commit. Hi!
    日付時刻:スクリプトを実行した時間から5日前
2. 'ubiquitous'が含まれるコミットのSHA1_ID
    `git rev-parse :/'ubiquitous'`で取得可能
    SHA1_ID:c426060b58e0959809bf4965254b606fdba535d6
3. 'rgu@freeshell.org'というアドレスのコミッターのコミットID
    `git log --author='rgu@freeshell.org'`
    SHA1_ID:c89f5664fc7174fae59bc8a29ed38a5c42cb1c25
4. 昨日以降のコミットを表示する。
    `git log --since=yesterday`

<!-- }}} -->

## chapter_9 {{{

ブランチの操作。追加と削除。
stashの使い方。
```shell
git stash
git stash list
git stash pop
```

### 課題

詳しい解説と回答
`study_files/answer_and_supplement_files/TY-Git_Answers.txt:266`

#### 9.5.1

1. 課題が始まる前にanother_fix_branchでは作業がコミットされていない。
    その状態だと、GUIクライアントを使用してもnew_featureブランチへは、チェックアウトできない。
2-3. ブランチを作成すると、それらのブランチへチェックアウトする。
    現在または過去へはチェックアウトできる？

#### 9.5.2

1. 削除する代りに名前を変更する。
    可能。`git branch -m <branch_name> <new_branch_name>`

2. `git rev-parse :/'<commit log message>'`で探索可能

3. `git log --graph --decorate --pretty=oneline --all --abbrev-commit`
    `--graph`: 左端に*や|でコミットグラフを表示する
    `--decorate`: (HEAD tag_name branch_name)を表示する
    `--pretty=oneline --abbrev-commit`は`--oneline`と同じ
    `--all`: 全てのブランチのコミットメッセージを表示する。
4. ブランチを削除すると、そのブランチのコミットがどうなるか。
    ブランチを消して良いか確認される。
    また消すときは`git branch -D`使う様に案内される。

#### 9.5.4

注意: `make_lots_of_branches.sh`を実行するとき、
`git config --global init.defaultbranch=main`にしていると、
上手くスクリプトが動かない。
`init.defaultbranch=master`に変更するか、
スクリプトでmasterブランチを指定している場所をmainに変更すれば解決する。

1. `lots_of_branches/`:ブランチの開始地点コミット
    'Adding four empty files.'のコミットが開始地点
2. 開始地点からbranch_30までにいくつのコミットがあるか
    クッソだるい……106のコミットがあった…。
3. random_prize_1 -> branch_18
   random_prize_2 -> branch_12
   random_prize_3 -> branch_33
   branch_40のanswer.txtに答えあり。
4. random_tag_on_fileというタグが、どのブランチに含まれているか。
    `git branch`を使用することが指定されている。
    `git branch --contain random_tag_on_file`で知らべることが可能。
5. `git log --oneline --decorate --simplify-by-decoration --all --graph`
    全てのブランチの最新のコミットと最初のコミットだけが表示される。
    間のコミットは表示されない。
    答えより:
    `--simplify-by-decoration`は"Commits that are referred by some branch or tag are selected."
    「何らかのブランチまたはタグで参照されているコミットだけを選択する」という意味。

<!-- }}} -->

## chapter_10 {{{

マージの説明。
意図的にコンフリクトを作って対処する。
あくまで、コンフリクトの解説くらい。
マージツールの紹介もあるが、gina.vimを使っているので、chaperonを活かしたい。
`git merge --abort`は覚えておこう…。

fast-forwardの説明。
ブランチグラフが真っ直ぐになるけど、個人的にはマージコミットがあるのが好き。

### 課題

詳しい解説と回答
`study_files/answer_and_supplement_files/TY-Git_Answers.txt:353`

1. `https://git-scm.com/docs/git-merge#_how_to_resolve_conflicts`
    答えの方には日本語訳があり。かなり丁寧。
2. できるだろうけど……やる？
3. diffをやっても何も表示されない。詳しい解説は回答を…。
4. mergesampleを作りなおして、bugfixにファイルを追加したあとに、
`git diff --name-status main...bugfix`の実行結果

    ```shell
    M       baz
    A       foo
    ```

5. マージコミットを作るスイッチは`--no-ff`

<!-- }}} -->

## chapter_11 {{{

chapter_6で作った、mathリポジトリをCUIやGUIからクローンする。
リモートリポジトリの説明。
ベアリポジトリを作る。
この章以降でmath.gitというベアリポジトリを、メインに使うので、
ルートにmath.gitを配置する。

### 課題

詳しい解説と回答
`study_files/answer_and_supplement_files/TY-Git_Answers.txt:405`

1. `git clone`コマンドで複製した訳ではないので、math.copyにはリモートリポジトリは生成されない。
    math.copyはmathをコピーしたに過ぎない。
2. クローン元のアクティブリポジトリがクローン先にも反映される。
3. `git checkout remotes/origin/main`を実行すると、mainブランチのSHA1_IDにチェックアウトして、
    ローカルブランチは作成されない。以下は実行後のログである。
    結論、コマンドとしては実行可能。しかし、正しくはない。

    ```shell
    Note: switching to 'remotes/origin/main'.

    You are in 'detached HEAD' state. You can look around, make experimental
    changes and commit them, and you can discard any commits you make in this
    state without impacting any branches by switching back to a branch.

    If you want to create a new branch to retain commits you create, you may
    do so (now or later) by using -c with the switch command. Example:

      git switch -c <new-branch-name>

    Or undo this operation with:

      git switch -

    Turn off this advice by setting config variable advice.detachedHead to false

    HEAD is now at 51d545b A small update to readme.
    ```

4. リモートブランチとは違う名前でローカルブランチの作成はできる。
    p10kでブランチ表示していると<ローカルブランチ:リモートブランチ>で表示されて、
    ちょっとうざい。これは決してp10kがうざい訳ではなく……

5. 解説を参照してください。

<!-- }}} -->

## template {{{



### 課題

詳しい解説と回答
`study_files/answer_and_supplement_files/TY-Git_Answers.txt:`


<!-- }}} -->
