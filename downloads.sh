#!/bin/bash

dirs='./study_files/archive_files/'

if [ -d $dirs ]; then
    cd $dirs
else
    mkdir -p $dirs ; cd $_
fi

curl \
    -O https://www.shoeisha.com/down/book/9784798144610/TY-Git.zip \
    -O https://www.shoeisha.com/down/book/9784798144610/TY-Git-P190-Note.pdf \
    -O https://manning-content.s3.amazonaws.com/download/5/12a774c-8c2d-4ffd-9ebe-d3c5d01605e0/LearnGitMoL_SourceCode.zip

if [ $? -gt 0 ]; then
    echo "ダウンロードに失敗しました。\n \
          README.mdのリンクから参考ファイルをダウンロードしてみてください。"
    exit 1
fi

unzip -d ../ TY-Git.zip
mv ../TY-Git ../answer_and_supplement_files
unzip -d ../LearnGitMoL_SourceCode LearnGitMoL_SourceCode.zip
cp TY-Git-P190-Note.pdf ../answer_and_supplement_files/
