# How I learned to love the Bash

## My tale of woe

When I started to write my first ebook I decided to use pandoc to transform markdown into pdf.
I basically looked like this

`pandoc metadata_de.yaml -o ./level_up_de.pdf --from markdown -V lang=de-DE level_up_de.md`

This simple command can be pasted into the command line everytime I want to build a new version of the ebook.
But: I have to keep in mind the command which is tedious. I could write it into a text file and copy it everytime I use it. 
there is a more elegant way: let's make a script!

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
so the "de" strings should be replaced by a variable to switch between languages.

To declare a variable, you write down the name and assign it a value with the equal sign.
You use a variable by using thew $ sign to access its content.

```bash
language="en"
echo "Language: $language"
```
**Caveat: whitespaces are not allowed around the equal sign!**
```bash
language = "en" # this won't work
```


Let's have a look at our script now:

```bash
#!/bin/bash
echo "Start generating PDF"
language="en"
echo "Language: $language"
pandoc metadata_$language.yaml -o ./level_up_$language.pdf --from markdown -V lang=de-DE level_up_$language.md
```

Pretty neat! 

But we need to get rid of the "de-DE" as well

### Conditions
When we get "en" as language we want to use en-GB as language code. When "de" is used we want de-DE
Let's write some conditions.

```bash
if [[ $language = "en" ]]
then
  lang_subtag="$language-GB"
elif [[ $language = "de" ]]
then
  lang_subtag="$language-DE"
else
  echo "Wrong language"
fi
```
Now we can replace the de-DE with $lang_subtag


