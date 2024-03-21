# Guida di sopravvivenza all'analisi dei dati


## Generalità


### Date

Le date vengono scritte in formato ISO 8601, cioè seguento lo schema seguente:

```
AAAA-MM-GG 
    
AAAA-MM
    
AAAA
```
    
Questo formato ha il vantaggio di non avere ambiguità (gli anglo-sassoni usano il formato MM/GG/AAAA e in gli italiani GG/MM/AAAA).
Usando questo formato l'ordine alfabetico corrisponde anche all'ordine cronologico.

Se dovete aggiungere l'ora, il formato diventa::

```
AAAA-MM-GG_HHMMSS
```
    
Usate il sistema a 24 ore.
Per esempio le 14:36:45 del 12 ottobre 2023 saranno scritte:

```
2023-10-12_143645
```    
    
Non utilizzate i 2 punti (:) per separare ore, minuti e secondi perché alcuni *file system* non gestiscono nomi di file contenenti questo carattere (quello di Windows ad esempio).
    
    
### Nomi dei file

**Non utilizzate spazi nei nomi dei file!**

I file contenenti spazi nel loro nome sono più difficili da gestire utilizzando programmi in command-line (nella bash ad esempio).

Gli spazi possono essere sostituiti dal carattere _ (underscore).

```
Comando per un nome di file senza spazi:
wc -l nome_file

Comando per un nome di file con uno spazio:
wc -l "nome file"

```



Sono da evitare anche caratteri come:

```
/ \ | :
```

Usate lo 0 come _left-padding_ usando il numero di digit necessario:

```
1
2
...
9
10
11
```

ma 

```
01
02
...
09
10
11
```


oppure 

```
001
002
...
009
010
011
...
099
100
101
```



### Dati numerici

#### Separatore decimale dei numeri


Usate il punto (.) come fanno gli anglo-sassoni e non la virgola (,) come in Italia.

Ad esempio:
```
1.2
12.334
```

Questa pratica faciliterà lo scambio di dati tra i vari programmi che potrete utilizzare.

Avete la possibilità di impostare il vostro computer perché usi il punto al posto della virgola (impostazione di default se usate la lingua italiana).



## Uso della bash


La bash (o terminale di Linux) permette di eseguire operazioni su file molto velocemente. E' in grado di manipolare file di grandi dimensioni o un umero di file molto elevato.



https://www.digitalocean.com/community/tutorials/an-introduction-to-linux-basics


## Excel 

https://www.forbes.com/sites/timworstall/2013/02/13/microsofts-excel-might-be-the-most-dangerous-software-on-the-planet/?sh=5dab7d27633d


https://arstechnica.com/science/2024/01/we-keep-making-the-same-mistakes-with-spreadsheets-despite-bad-consequences/






