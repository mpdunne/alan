# Alan — a simple command line alignment viewer

What does Alan do?
==========
Alan is a simple, light command line alignment viewer, for viewing fasta alignments in a linux terminal.

https://github.com/mpdunne/Alan

Usage
=====
Alan currently comes in three flavours: Alan Rickman,  Alan Davies, and Alan Bennett. Alan Rickman is designed for viewing nucleotide alignments, Alan Davies for amino acid alignments. Alan Bennett is designed to detect automatically the type of alignment being inspected. The default Alan is Alan Bennett.

To run Alan in bash, simply type:

```
source alan.sh
```

The Alan commands will now be available to use. To view an alignment, type, e.g.:

```
alan alignment.fasta

alanbennett alignment.fasta

alanrickman nuc_alignment.fasta

alandavies aa_alignment.fasta
etc.
```

To load Alan every time you turn on your terminal, add

```
source path_to_alan/alan.sh
```

to your ~/.bashrc.
