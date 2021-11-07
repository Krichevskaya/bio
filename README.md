### Первое задание:

Ссылка на прочтения: https://www.ncbi.nlm.nih.gov/sra/SRX11379711[accn]

Результат работы программы: 

```
105025 + 0 in total (QC-passed reads + QC-failed reads)
5677 + 0 secondary
4538 + 0 supplementary
0 + 0 duplicates
84717 + 0 mapped (80.66% : N/A)
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

3. Простое демо можно запустить вызвав команду ```./nextflow run hello```

Тестовый пайплайн №1:

Пайплайн представляет собой стандартную программу Hello World. Для запуска необходимо вызвать команду ```./nextflow 2/pipelines/helloworld.nf```
Исходный код в файле ```2/pipelines/helloworld.nf```, результат работы программы: 

```
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

Для запуска вызывается команда ```./nextflow 2/pipelines/pipeline.nf -with-dag graph.png -with-report```. Флаг ```-with-dag``` визуализирует пайплайн, фдаг ```-with-report``` строит отчет о его работе. Для визуализации необходимо установить [graphviz](https://graphviz.org), который конвертирует пайплайн в формат изображений. 
Исходный код представлен в файле ```2/pipelines/pipeline.nf```, результатом работы программы являются два файла ```report.html``` и ```graph.png```.


### Третье задание: 

Код пайплайна лежит в файле ```3/pipeline.nf```
Запуск пайплайна ```./nextflow 3/pipeline.nf```
Вывод при запуске пайплайна:

```
N E X T F L O W  ~  version 21.04.3
Launching `pipeline.nf` [pedantic_kirch] - revision: 92412f66a9
executor >  local (5)
[8a/783487] process > fastqc     [100%] 1 of 1 ✔
[f4/333396] process > minimap    [100%] 1 of 1 ✔
[6b/63ef70] process > minimap2   [100%] 1 of 1 ✔
[38/6782bf] process > samtools   [100%] 1 of 1 ✔
[b4/849b62] process > evaluation [100%] 1 of 1 ✔
Not OK
Completed at: 07-Nov-2021 21:00:46
Duration    : 4m 58s
CPU hours   : 0.1
Succeeded   : 5
```

Визуализация:

<p align="center">
  <img src="https://github.com/Krichevskaya/bio/blob/master/3/graph.png">
</p>




