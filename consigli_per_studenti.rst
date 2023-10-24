Qualche consiglio a chi inizia una attività di ricerca
===========================================================



Date
=======

Le date vengono scritte in formato ISO 8601, cioè seguento lo schema seguente::

    AAAA-MM-GG 
    
    AAAA-MM
    
    AAAA
    
Questo formato ha il vantaggio di non avere ambiguità (gli anglo-sassoni usano il formato MM/GG/AAAA e in gli italiani GG/MM/AAAA).
Usando questo formato l'ordine alfabetico corrisponde anche all'ordine cronologico.

Se dovete aggiungere l'ora, il formato diventa::

  AAAA-MM-GG_HHMMSS

    
Usate il sistema a 24 ore.
Per esempio le 14:36:45 del 12 ottobre 2023 saranno scritte::

  2023-10-12_143645
    
    
Non utilizzate i 2 punti (:) per separare ore, minuti e secondi perché alcuni *file system* non gestiscono nomi di file contenenti questo carattere (quello di Windows ad esempio).
    
    
Nomi dei file
==============================

Non utilizzate spazi nei nomi dei file. 

I file contenenti spazi nel loro nome sono difficili da gestire utilizzando programmi in command-line (nella bash ad esempio).


Sono da evitare anche caratteri come::

   / \ | :


Separatore decimale dei numeri
=======================================

Usate il punto (.) come fanno gli anglo-sassoni e non la virgola (,) come in Italia.

Ad esempio::

  1.2
  12.334

Questa pratica faciliterà lo scambio di dati tra i vari programmi che potrete utilizzare.

Avete la possibilità di impostare il vostro computer perché usi il punto al posto della virgola (impostazione di default se usate la lingua italiana).






