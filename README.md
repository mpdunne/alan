# Alan — a simple command line alignment viewer

What does Alan do?
==========
Alan is a simple, light command line alignment viewer, for viewing fasta alignments in a linux terminal.

https://github.com/mpdunne/Alan

Usage
=====
Alan currently comes in two flavours: Alan Rickman and Alan Davies. Alan Rickman is designed for viewing nucleotide alignments; Alan Davies for amino acid alignments. The default Alan is Alan Davies.

To run Alan in bash, simply type:

```
bash alan.sh
```

The Alan commands will now be available to use. To view an alignment, type, e.g.:

```
alan alignment.fasta

alanrickman nuc_alignment.fasta

alandavies aa_alignment.fasta
etc.
```

To load Alan every time you turn on your terminal, add

```
bash path_to_alan/alan.sh
```

to your ~/.bashrc.
