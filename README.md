# Alan — a simple command line alignment viewer

What does Alan do?
==========
Alan is a simple, light command line alignment viewer, for viewing fasta alignments on the command line.

https://github.com/mpdunne/Alan

Usage
=====
Alan currently comes in two flavours: Alan Rickman and Alan Davies. Alan Rickman is for nucleotide alignments, Alan Davies is for amino acid alignments. The default Alan is Alan Davies.

To run alan in bash, simply type:

```
bash alan.sh
```

The alan commands will now be available to use. To view an alignment, type, e.g.:

```
alan alignment.fasta

alanrickman nucalignment.fasta

alandaviesaaalignment.fasta
etc.
```

To load alan every time you turn on your terminal, add

```
bash path_to_alan/alan.sh
```

to your ~/.bashrc.
