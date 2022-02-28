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

## chpater_3 {{{

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



<!-- }}} -->
