# Alan — a simple command line alignment viewer

What does Alan do?
==========
Alan is a simple, light command line alignment viewer, for viewing fasta alignments in a linux terminal.

https://github.com/mpdunne/Alan

Usage
=====

Alan can be used to view both FASTA and CLUSTAL format alignments. The command ```alan``` will automatically detect the format of the input file, and the nature of the sequences contained in the file. To load the alan commands in bash, simply type:

```
source alan.sh
```

To run alan in bash, simply type:

```
alan your_alignment.fasta
```

Finally, to load Alan every time you turn on your terminal, add

```
source path_to_alan/alan.sh
```

to your ~/.bashrc.


Variants
========

Alan will automatically decide what is the best way to view your alignment file. In the case that you know what format your alignment is, or you want to be more specific, you may want to use one of alan's subcommands:

| Command       | Description           | Example                               |
| ------------- |-----------------------| --------------------------------------|
| alanbennett   | Fasta, automatic      | ```alanbennett alignment.fasta```     |
| alandavies    | Fasta, protein        | ```alandavies prot_alignment.fasta``` |
| alanrickman   | Fasta, nucleotide     | ```alanrickman nuc_alignment.fasta``` |
| alanpartridge | Clustal, automatic    | ```alanpartridge alignment.fasta```   |
| alanmenken    | Clustal, protein      | ```alanmenken prot_alignment.fasta``` |
| alanshearer   | Clustal, nucleotide   | ```alanshearer nuc_alignment.fasta``` |


Examples
=====

Alan Davies:

![alt text](https://i.imgsafe.org/40fb47a159.jpg "Alan Davies, for amino acids")

Alan Rickman:

![alt text](https://i.imgsafe.org/40fb5c40f5.jpg "Alan Rickman, for nucleotide alignments")


