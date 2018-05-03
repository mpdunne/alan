![alt text](http://empede.co.uk/imgrepos/Alan_head.png? "Alan header")


# Alan — a simple in-terminal alignment viewer

Alan is a simple, light command line alignment viewer, for viewing amino acid and DNA alignments in a linux terminal.

It can be used for viewing FASTA or Clustal format alignment files, and relies on just a few standard unix packages.

Current Alan version (2.0.0): https://github.com/mpdunne/Alan


Usage
=====

Alan is essentially a modified version of the ubiquitous ```less``` text reader. It uses a number of very common unix tools (```awk```, ```sed```, ```grep``` among others).

The ```alan``` command should be ready to use straight out of the box - no installation is required.

Before using Alan, you may wish to add the directory containing the ```alan``` executable to your ```$PATH``` by editing the ```.bashrc```file in your home directory (e.g. add the line ```PATH=$PATH:/path/to/alan_dir```). If you've done this, Alan can be run by simply typing ```alan your_alignment.fa```. Alternatively, explicitly reference the location of the alan executable, for example by typing ```/path/to/alan your_alignment.fa```.

File types and options
======================

Alan works on FASTA and Clustal format alignments. It's a very basic alignment reader, and any other alignment formats will confuse it. If this is an issue, convert files before viewing. The choice of file format (FASTA or Clustal) is detected automatically. Alan has been principally tested with FASTA files -- raise a support request if you have any trouble with Clustal files.

If no information on molecule type is supplied, Alan will try to detect whether an alignment is composed of protein or nucleotide sequences, and will display them accordingly. To override this, use the options ```-n``` for nucleotides, or ```-p``` for protein sequences.

To navigate the alignment, use the keyboard arrow keys. The amount by which an alignment is shifted using the arrow keys can be set using the ```-s``` or ```--shift``` options, followed by a numeric value. The default is 10.

Alan uses ```less``` as its main viewer, and so any other in-viewer commands contained in less will also work in Alan. 

Examples
=====

![Alt Text](http://empede.co.uk/imgrepos/aa.png "Alan Davies")
![Alt Text](http://empede.co.uk/imgrepos/cds.png "Alan Rickman")


The Alan museum
===============

The original Alan command was a one-line modification of the ````less ``` command. For its simplicity and portability, you may wish to use the orignal alan on your system, or simply admire its splendour. This and some derived commands are contained in the alan_museum directory, and they are loaded as functions, so type ```source alan_museum/alan_orig.sh``` to load them, and then type the individual commands to use them. The original Alan commands are:


| Command Name   | Command         | Description           | Example                               |
|----------------|-----------------|-----------------------| --------------------------------------|
| Alan Bennett   | `alanbennett`   | Fasta, automatic      | ```alanbennett alignment.fasta```     |
| Alan Davies    | `alandavies`    | Fasta, protein        | ```alandavies prot_alignment.fasta``` |
| Alan Rickman   | `alanrickman`   | Fasta, nucleotide     | ```alanrickman nuc_alignment.fasta``` |
| Alan Partridge | `alanpartridge` | Clustal, automatic    | ```alanpartridge alignment.fasta```   |
| Alan Menken    | `alanmenken`    | Clustal, protein      | ```alanmenken prot_alignment.fasta``` |
| Alan Shearer   | `alanshearer`   | Clustal, nucleotide   | ```alanshearer nuc_alignment.fasta``` |
