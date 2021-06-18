# How I learned to love the Bash

## My tale of woe

When I started to write my first ebook I decided to use pandoc to transform markdown into pdf.
It basically looked like this

`pandoc metadata_de.yaml -o ./level_up_de.pdf --from markdown -V lang=de-DE level_up_de.md`

This simple command can be pasted into the command line everytime I want to build a new version of the ebook.
But: I have to keep in mind the command which is tedious. I could write it into a text file and copy it everytime I use it. 
There is a more elegant way: let's make a script!

### Make a script
A shell script is basically a file with the extension .sh
When You want to specify which shell shall be used, you put

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
After finishing the German version I also wanted to create an English version,
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
lang="en"
echo "Language: $lang"
pandoc metadata_$lang.yaml -o ./level_up_$lang.pdf --from markdown -V lang=de-DE level_up_$lang.md
```

Pretty neat! 

But we need to get rid of the "de-DE" as well

### Conditions
When we get "en" as language we want to use en-US as language subtag. When "de" is used we want de-DE
Let's write some conditions.

```bash
if [[ $lang = "en" ]]
then
  lang_subtag="$lang-US"
elif [[ $lang = "de" ]]
then
  lang_subtag="$lang-DE"
else
  echo "Wrong language"
fi
```
Now we can replace the de-DE with $lang_subtag

```bash
pandoc metadata_$lang.yaml -o ./level_up_$lang.pdf --from markdown -V lang=$lang_subtag level_up_$lang.md
```

### Command Line Arguments

Now that we can generate the ebook for english and german we could introduce a command line parameter.
In bash every argument provided to the script is stored in variables $1 .. $n

```bash
lang="$1"
```

### Arrays and loops

I wanted to break down the big markdown file into individual chapters.
To make an array variable in bash you can do the following:

```bash
chapters=(
./de/chapter_01.txt
./de/chapter_02.txt
./de/chapter_03.txt
)
```

Looping over an array looks like this:

```bash
for chapter in ${chapters[*]}
do
	cat "$chapter"
	printf "\n"
done
```

So now we can pass the chapters array to pandoc
```bash
pandoc metadata_$lang.yaml -o ./level_up_$lang.pdf --from markdown -V lang=$lang_subtag ${chapters[*]}
```

### Reading from files


