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

1. main\~3はmainから3つ前のコミット
    main@{3}は、mainを1番目として3番目のコミット
    main^^^は、main\~3と同じ
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

## chapter_12 {{{

`git remote, git ls-remote`を使用して、リモートリポジトリの情報を取得、名前の変更、リポジトリの追加などを行なう。
githubなどのサービスを利用するのがあたりまえの現状ではあるが、「知っておくと良さそう。」なtipsという感じだ。

### 課題

詳しい解説と回答
12章には無いようだ…。

#### 12.4.1

1. `git log --oneline --decorate`
2. 23d3077 (origin/another_fix_branch) Renaming c and d.
3. ef47d3f (tag: four_files_galore) Adding four empty files.
    githubからcloneしたリポジトリのため、どのPCからcloneしても同じSHA1_IDになる。
4. math.githubがその他の`math.*/`と違うのはSHA1_IDは理論上同じIDにならない為


#### 12.4.5

GitLabにある`rickumali/math`をクローンしてSHA1_IDを調査する。
Gitlabの方リポジトリから更に2つコミットが追加されている。
`0342422`と`a49addc`の二つコミットが違う。


<!-- }}} -->

## chapter_13 {{{

`git push`を使用して、リモート追跡ブランチを操作する。
普通にoriginにローカルの変更をpushする他に、不用なリモート追跡ブランチの削除。

chapter_13内の演習で`--set-upstream`を使ってリモートブランチを作成してみるところがあるが、
gitのバージョンの関係で、`push.default`を設定しないといけなかったはずなので`current`にしていた。
リモート追跡ブランチの作成に`--set-upstream`が必要なのは把握しているので、多分きっと大丈夫。

`git push`の正確な構文の解説があり、内容的には忘れたころに必要になりそうな感じ。

```shell
         push先の
         リモート
         ┌─┴──┐
git push origin src:dest
└──┬───┘        └──┬───┘
コマンド        refspec

```

詳しい解説は257ページ(kindle:275)

13.6で`push.default`の解説あり。
そこでは`push.default simple`にしている。

自分が`push.default current`にしている理由は、キリのいいところでdevブランチをgithubにpushして、
別環境でも作業ができるようにしたいので、結構雑にpushしている。
`current`にしていると、「リモートブランチ無いけど作る？」みたいなことを聞いてこないので横着できる(おい!)。

### 課題

詳しい解説と回答
`study_files/answer_and_supplement_files/TY-Git_Answers.txt:422`

課題全体の答えは`git help push`を良く読むほかない。*はい……。*

<!-- }}} -->

## chapter_14 {{{

`git pull`について触れていく。
ちなみに冒頭でプッシュは元のリポジトリとの同期をチェックするようだ。
もしかして、プッシュしたときにリジェクトしたら、勝手にプルするようにすると便利なのでは…。

`git fetch`は、リモートリポジトリから更新したコミット(ファイル)を取得する。
フェッチしたリモートブランチへのリファレンスとして、書籍では`FETCH_HEAD`を紹介している。
しかし、自分の環境ではその`FETCH_HEAD`のコミットIDを`git rev-parse FETCH_HEAD`で取得すると、
フェッチしたリモートブランチのSHA1_IDではなく、`four_files_galore`のSHA1_IDを取得した。
書籍通りに`git rev-parse`でリモートブランチのSHA1_IDを取得するなら、
`git rev-parse origin/HEAD`が適当であった。
なので、ローカルのHEADとリモートのHEADのdiffを見るなら、以下のようにコマンドを実行した。

```shell
git diff HEAD...origin/HEAD
```

`git pull`の仕組みは以下のようになる。

```shell
git fetch
git merge origin/HEAD
```

285pでcarolとbillのリポジトリで変更を行ない、意図的にコンフリクトを発生させて、
プルしたときにコンフリクトを対処するという操作をする。
このときプルするリポジトリが`math.git`を指定されるが、ベアリポジトリではgitコマンドを使えないので、
間違いの可能性があり、または環境の問題？
この部分は、carolでプルしてコンフリクトを発生させた。
やっぱり書き間違いの可能性大。コンフリクトを解決したあとはcarolにコミットしている。

書籍ではcitoolを使ってコミットしているが、既存のguiツールが上手く動作しないので、Gitkrakenを使用している。
しかし、Gitkrakenではリポジトリがコンフリクト中のとき、エディタでコンフリクトを解決してもコンフリクトしているものとして動作する。
なので書籍の通りには対処していない。そこはvimから……。
guiとそれ以外とで操作は対して変わらない。コンフリクト解決する際のコミットには自動的にメッセージが挿入されている。

`git pull --ff-only`はリモートブランチをローカルブランチにマージする際、fast-forwardできるならそうするが、できない場合はマージを中止する。
これに関しては、`git pull`の仕様を理解してないと、マージされなかったときに困惑してしまうが、
`git merge origin/HEAD`などで対処方法を知っていれば問題無い。
むしろ、リモートブランチとローカルブランチがコンフリクトしそうになったときに、マージを中断してくれるので、普通にプルするより安全かもしれない。


### 課題

詳しい解説と回答
この章には無し。

この章の課題は、章の中でやった演習のあと片付けと`git rev-parse FETCH_HEAD`の確認

4. `git branch --set-upstream-to=bill/main`
    math.gitを中心に考えて操作しているが、carolとbillの間で変更のやり取りをする場合の操作になる。
    現在使用しているGitのバージョンの問題か、上記のコマンドを実行すると以下のような案内をされる。

```
hint: If you are planning on basing your work on an upstream
hint: branch that already exists at the remote, you may need to
hint: run "git fetch" to retrieve it.
hint:
hint: If you are planning to push out a new local branch that
hint: will track its remote counterpart, you may want to use
hint: "git push -u" to set the upstream config as you push.

日本語訳:
リモートにすでに存在するアップストリームブランチに基づいて
作業を行うことを計画している場合は、"git fetch"を実行して取得する必要がある場合があります。

リモートの対応するブランチを追跡する新しいローカルブランチを
プッシュすることを計画している場合は、"git push -u"を使用して、
プッシュするときにアップストリーム構成を設定することをお勧めします。
```

<!-- }}} -->

## chapter_15 {{{

Gitコマンドの仕様を細かく見ていく章
最初は`git log`を叩きまくるだけで、正直退屈な作業でした……。

gitkは使えないのでとばしました。なお、使えるようにする予定はない模様。


### 課題

詳しい解説と回答
`study_files/answer_and_supplement_files/TY-Git_Answers.txt:465`

3. SHA1_IDの部分の色を変更する方法。
`git log --abbrev-commit --pretty=format:'%C(bold red)%h%Creset %C(auto)%d%Creset%s'`
ためしに、SHA1_IDの部分を太文字赤色にしたもの。それ以外は`git log --oneline`と同じ。
解説には具体例は無いので、本来だとヘルプを読んで、いろいろ試行錯誤することになる。

5. `-L <start>,<end>`と、`-L:<funcname>`の二つがあるようだ。
後者は正規表現で指定できるみたい？

<!-- }}} -->

## chapter_16 {{{

rebaseの基本的な操作を行う。
現在のブランチの分岐元となるコミットを変更する。これがrebaseというもの。

`git rebase -i`でインタラクティブモードでリベースを操作する。
この章では、new_featureでの二つのコミットのsquashを行なった。
二つのコミットをsquashして、mainの最新のコミットにリベースした。

### 課題

詳しい解説と回答
`study_files/answer_and_supplement_files/TY-Git_Answers.txt:494`

1. 過去に作成したmath.bobでrebaseを実行しろということだろうが、`make_rebase_repo.sh`を使用して、そこからmath.bobを作成した。
実行してみた結果、mainブランチにnew_featureのコミットが取り込まれるが、detachedHead状態になる。

2. 上記の操作をリセットしたあとに、リストの最初にあるコミットのスカッシュをしろということだが、よく分からなかったのでスルー。

3. オンラインヘルプは[こちら](https://git-scm.com/docs/git-reflog)
`git log -g --abbrev-commit --pretty=oneline`

4. こちらも詳細不明…。

5. 解説を見てくれ…。

<!-- }}} -->

## chapter_17 {{{

この章ではgit-flowやGitHub Flowの解説と実践した。

### 課題

詳しい解説と回答
`study_files/answer_and_supplement_files/TY-Git_Answers.txt:510`

1. git-flowとGitHub Flowの解説/紹介サイト
[git-flow](http://nvie.com/posts/a-succsessful-git-branching-model/)
[git-flow(日本語解説)](https://atmarkit.itmedia.co.jp/ait/series/1323/)
[GitHub Flow](http://scottchacon.com/2011/08/31/github-flow.html)
[GitHub Flow(日本語訳)](https://gist.github.com/Gab-km/3705015/)
[GitHub Flow(日本語解説)](https://atmarkit.itmedia.co.jp/ait/articles/1401/21/news042.html)

2. 3way-merge-commitのことを言っていると思われ。
git-flowと違い、大量にブランチを作成しないので、merge-commitは圧倒的に少ない。

3. 実行するなら`:%s/master/main`をしておく必要があり。

4. [参考リンクその1](https://www.drupal.org/docs/develop/git)
[参考リンクその2](https://www.drupal.org/docs/develop/git/git-for-drupal-project-maintainers/moving-from-a-master-to-a-major-version-branch)

5. 本の中で紹介されているリンクでは必要な情報が得られず。
解説に代替で紹介している。


<!-- }}} -->

## chapter_18 and chapter_19 {{{

### chapter_18
GitHubの簡単な使い方が紹介されている。
正直、自分には必要のない操作説明ばかりなので、ほぼ飛しました。

### chapter_19
サードパーティーツールを紹介してくれる。
GUIクライアントとしてSourceTree、IDEでEclipseが紹介されているが、個人的にはどちらも不用。
エディタはVimが活躍してくれるし、GUIクライアントはGitKrakenが使いやすい。というか、GitKrakenしか使ってない。
カスタムした`git lol`は、ちょっとしたブランチグラフを見るときには十分な性能を出してくれるので、ぜひカスタマイズして欲しい
VimからGitを操作するなら、Ginaやfugitiveがあるし、今ならEclipseよりVSCodeが優秀だから、そっちを使う方がいい。

### 課題

この章には解説はありません。

<!-- }}} -->

## chapter_20 {{{

最後はconfigの説明で終りだった。
ここまでそこそこ長い説明だったが、終りはあっさりしていてちょっと寂しい。

### 課題

詳しい解説と回答
`./study_files/answerand_supplement_files/TY-Git_Answers.txt:519`


<!-- }}} -->

<!-- ## template {{{



### 課題

詳しい解説と回答
`study_files/answer_and_supplement_files/TY-Git_Answers.txt:`


 }}} -->
