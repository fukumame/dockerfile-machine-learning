# dockerfile-machine-learning

## 概要
- python3で、主に自然言語処理を行うために必要なライブラリを揃えたdockerfile
- mecabのインストール、及び以下のpythonライブラリを含む
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
# 任意のCONTAINER_NAMEをつけて、PORT_NAMEで任意のポートを指定し、container作成
docker run -it --name CONTAINER_NAME --port HOST_PORT:8888 IMAGE_NAME bash
```
