![alt text](http://empede.co.uk/imgrepos/Alan_head.png? "Alan header")


# Alan — a simple in-terminal alignment viewer

Alan is a simple, light command line alignment viewer, for viewing amino acid and DNA alignments in a linux terminal.

https://github.com/mpdunne/Alan

Usage
=====

Alan is essentially a one-line bash code that turns the ```less``` reader into an alignment viewer. The full set of alan commands is about seven lines long.

Alan can be used to view both FASTA and CLUSTAL format alignments. The command ```alan``` will automatically detect the format of the input file, and the nature of the sequences contained in the file. To load the alan commands in bash, simply type:

```
source alan.sh
```

To run alan in bash, simply type:

```
alan your_alignment.fasta
```

Finally, to load alan every time you turn on your terminal, add

```
source path_to_alan/alan.sh
```

to your ~/.bashrc.


Variants
========

Alan will automatically decide what is the best way to view your alignment file. In the case that you know what format your alignment is, or you want to be more specific, you may want to use one of alan's subcommands:

| Command Name   | Command         | Description           | Example                               |
|----------------|-----------------|-----------------------| --------------------------------------|
| Alan Bennett   | `alanbennett`   | Fasta, automatic      | ```alanbennett alignment.fasta```     |
| Alan Davies    | `alandavies`    | Fasta, protein        | ```alandavies prot_alignment.fasta``` |
| Alan Rickman   | `alanrickman`   | Fasta, nucleotide     | ```alanrickman nuc_alignment.fasta``` |
| Alan Partridge | `alanpartridge` | Clustal, automatic    | ```alanpartridge alignment.fasta```   |
| Alan Menken    | `alanmenken`    | Clustal, protein      | ```alanmenken prot_alignment.fasta``` |
| Alan Shearer   | `alanshearer`   | Clustal, nucleotide   | ```alanshearer nuc_alignment.fasta``` |


Examples
=====

![Alt Text](http://empede.co.uk/imgrepos/aa.png "Alan Davies")
![Alt Text](http://empede.co.uk/imgrepos/cds.png "Alan Rickman")






