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

1. gitに設定したユーザー名/メールアドレスの保存場所
    `~/.gitconfig`, `.git/config`
    > 【A1（著者から）】
    > Gitのコンフィギュレーション（設定）は、/etc/gitconfig、$HOME/.gitconfig、.git/configの3箇所に置かれる。
    > これについては第20章に詳しい情報があるけれど、いまの段階では（とくにGitの初心者には）難解と思われるかもしれない。
    > 完全な情報は、git config helpを参照。
2. Gitの"stupid content tracker"という記述は`git help`のどこにある？
    答えより`git help git`
3. ローカルコミットをフォアードポート(forward-port)するGitコマンド
    git rebase(答え見た…)
4. DAGの略
    はぇ~↓
    > 【A4（著者から）】
    > Directed Acyclic Graph（閉路のない有向グラフ）。
    > git help glossaryを参照。日本語の文献としては、エイホ、ホップクロフト、ウルマン著、
    > 大野義夫訳の『データ構造とアルゴリズム』「6.6 閉路のない有向グラフ」を参照。
    > グラフについては、ウィキペディアの「木（数学）」の項を参照。
5. チュートリアル形式のヘルプ
    `git help tutorial`
6. 他のコマンドに`--help`を付けたらヘルプは表示されるか
    表示される
7. `git -p`使用時の`less`の使いかた
    vimと同じなんだよなぁ……

<!-- }}} -->
