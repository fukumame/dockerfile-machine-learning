# dockerfile-machine-learning

## 概要
- python3で、主に自然言語処理を行うために必要なライブラリを揃えたdockerfile
- mecab、mecab-ipadic-NEologd(mecabの新語辞書)、及び以下のpythonライブラリを含む
  - jupyter
  - numpy
  - scipy
  - scikit-learn
  - matplotlib
  - pandas
  - mecab-python3
  - neologdn
- Jupyter notebookがport 8888でexposeされています。

## 使い方

```bash
cd /docker/file/path
# イメージファイルの作成 (IMAGE_NAMEとTAGは任意の値)
docker build -t IMAGE_NAME:TAG .
# 任意のCONTAINER_NAMEをつけて、HOST_PORTで任意のポート、を指定し、HOST_VOLUME_PATHでホスト側のパスを指定し、container作成
docker run -it --name CONTAINER_NAME -p HOST_PORT:8888 -v HOST_VOLUME_PATH:/notebook IMAGE_NAME bash
```

## 詳しい説明はこちら
http://qiita.com/fukumame55/items/a3ff348b5893a9ef7ee3
