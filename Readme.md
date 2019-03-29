## Spark NLP Workshop

### Prerequisites

[Docker](https://www.docker.com/get-started) version 18.09.2+

### Installation

1. Clone the repo.

```
git clone https://github.com/nikolaypavlov/spark-nlp-workshop.git
cd spark-nlp-workshop
```

2. Download the [News Category Dataset](https://www.kaggle.com/rmisra/news-category-dataset) from Kaggle and unzip it into `data` directory.

3. Build the container and start it.

If you have `make` utility in your environment:

```
make build
make run
```

If you don't have `make` utility:

```
docker build -t spark-nlp-workshop .
docker run -it --rm -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 -v `pwd`/data:/app/data -p 8888:8888 spark-nlp-workshop
```

**Note: for Windows use `%cd%` instead of `` `pwd` `` to start the container**

4. Open Jupyter notebook in the browser: http://localhost:8888 and paste session token from the Terminal to login form.

![Session token](img/screen.png?raw=true)

5. Open `spark-spacy.ipynb` notebook and try to run the code blocks to test that everything works fine.
