# How I learned to love the Bash

## My tale of woe

When I started to write my first ebook I decided to use pandoc to transform markdown into pdf.
I basically looked like this

`pandoc metadata_de.yaml -o ./level_up_de.pdf --from markdown -V lang=de-DE level_up_de.md`

This simple command can be pasted into the command line everytime I want to build a new version of the ebook.
But: I have to keep in mind the command which is tedious, so let's make a script

### Make a script
A shell script is basically a file with the extension .sh
When You want to specify with shell shall be used you put 
```bash
#!/bin/bash
```

in the first line of your script.

### Echo
To put some text on the command line for e.g. displaying the start of your script, you can use the command echo like this

```bash
echo "Start generating PDF"
```

The script now looks like that
```bash
#!/bin/bash
echo "Start generating PDF"
pandoc metadata_de.yaml -o ./level_up_de.pdf --from markdown -V lang=de-DE level_up_de.md
```
### Variables
After finishing the german version I also wanted to create an english version,
so the _de strings should be replaced by a variable to switch between languages

To declare a variable you 
```bash
language = "en"
echo "$language"
```




