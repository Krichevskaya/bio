### Первое задание:

Ссылка на прочтения: https://www.ncbi.nlm.nih.gov/sra/SRX11379711[accn]

Результат работы программы: 

```
106729 + 0 in total (QC-passed reads + QC-failed reads)
6196 + 0 secondary
5723 + 0 supplementary
0 + 0 duplicates
86682 + 0 mapped (81.22% : N/A)
0 + 0 paired in sequencing
0 + 0 read1
0 + 0 read2
0 + 0 properly paired (N/A : N/A)
0 + 0 with itself and mate mapped
0 + 0 singletons (N/A : N/A)
0 + 0 with mate mapped to a different chr
0 + 0 with mate mapped to a different chr (mapQ>=5)
```


### Второе задание: 

Фреймворк [nextflow.io](https://www.nextflow.io)

Инструкция по развертыванию и установке фреймворка:

1. Проверить наличие 8 версии Java и выше ```java -version```
2. Установить фреймворк ```curl -s https://get.nextflow.io | bash```

В качестве альтернативы фреймворк можно установить, скачав его с [гитхаба](https://github.com/nextflow-io/nextflow) или же с помощью [Bioconda](https://bioconda.github.io/recipes/nextflow/README.html) ```conda install nextflow```

3. Простое демо можно вызвав команду ```./nextflow run hello```

Тестовый пайплайн №1:

Пайплайн представляет собой стандартную программу Hello World. Для запуска необходимо вызвать команду ```./nextflow ./pipelines/helloworld.nf```
Исходный код в файле ```pipelines/helloworld.nf```, результат работы программы: 

```
root@d54b9fafeb69:/usr/src/myapp# ./nextflow ./pipelines/helloworld.nf
N E X T F L O W  ~  version 21.04.3
Launching `./pipelines/helloworld.nf` [evil_meitner] - revision: c4bf263a8e
executor >  local (4)
[87/8f5323] process > sayHello (4) [100%] 4 of 4 ✔
Bonjour world!

Ciao world!

Hello world!

Hola world!
```

Тестовый пайплайн №2:

Этот пайплайн приведен на сайте [nextflow.io](https://www.nextflow.io/example1.html) в качестве туториала. В этом примере показано, как написать конвейер, состоящий из двух простых процессов BASH, чтобы результаты, полученные первым, потреблялись вторым процессом.

Для запуска вызывается команда ```./nextflow ./pipelines/pipeline.nf -with-dag graph.png -with-report```. Флаг ```-with-dag``` визуализирует пайплайн, фдаг ```-with-report``` строит отчет о его работе. Для визуализации необходимо установить [graphviz](https://graphviz.org), который конвертирует пайплайн в формат изображений. 
Исходный код представлен в файле ```pipelines/pipeline.nf```, результатом работы программы являются два файла ```report.html``` и ```graph.png```.






