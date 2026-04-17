---
title: Foldable Words and Thue-Morse
date: 2026-03-31
tags:
  - log
draft: false
---


http://bit-player.org/2021/foldable-words/


>  So much for foldability. Next comes the fraught question: What is a word? Linguists and lexicographers offer many subtly divergent opinions on this point, but for present purposes a very simple definition will suffice: A finite sequence of characters drawn from the 26-letter English alphabet is a word if it can legally be played in a game of Scrabble.

>  The following Python procedure generates random foldable sequences of letters drawn from a given source text, then returns those sequences that are found in the Scrabble word list. (The parameter _k_ is the length of the words to be generated, and _reps_ specifies the number of random trials.)

```python
def randomFoldableWords(text, lexicon, k, reps):
    normtext = normalize(text)
    n = len(normtext)
    findings = []
    for i in range(reps):
        indices = random.sample(range(n), k)
        indices.sort()
        letters = ""
        for idx in indices:
            letters += normtext[idx]
        if letters in lexicon:
            findings.append(letters)
    return findings
```

 A regex is a pattern defining a set of strings, or character sequences; from a collection of strings, a regex search will pick out those that match the pattern. For example, the regular expression `^.*love.*$` selects from the Scrabble word list all words that have the letter sequence _love_ somewhere within them. There are 137 such words, including some that I would not have thought of, such as _rollover_ and _slovenly_. The regex `^.*l.*o.*v.*e.*$` finds all words in which _l, o, v,_ and _e_ appear in sequence, whether of not they are adjacent. The set has 267 members, including such secret-lover gems as _bloviate_, _electropositive_, and _leftovers_.

The procedure below generates all three-letter strings that can be folded from the given text, and returns the subset of those strings that appear in the Scrabble word list:

```python
def foldableStrings3(lexicon, text):
    normtext = normalize(text)
    n = len(normtext)
    words = []
    for i in range(0, n-2):
        for j in range(i+1, n-1):
            for k in range(j+1, n):
                s = normtext[i] + normtext[j] + normtext[k]
                if s in lexicon:
                    words.append(s)
    return(words)
```


Consider the first letter of the text, which in our case is the letter _I_. In the set of all foldable strings, half include this letter and half exclude it. The same is true of the second letter, and the third, and so on. Thus each letter added to the text doubles the number of foldable strings, which means the total number of strings is simply . (Included in this count is the empty string, made up of no letters.)
This observation suggests a simple algorithm for generating all the foldable strings in any _n_-letter text. Just count from  to , and for each value along the way line up the binary representation of the number with the letters of the text. Then select those letters that correspond to a `1` bit, like so:

                    itsa**p**leasu**re**to**serve**you
                    0000100000110011111000

And so we see that the word `preserve` corresponds to the binary representation of the number `134392`.

Counting is something that computers are good at, so a word-search procedure based on this principle is straightforward:

```python
def foldablesByCounting(lexicon, text):
    normtext = normalize(text)
    n = len(normtext)
    words = []
    for i in range(2**n - 1):
        charSeq = ''
        positions = positionsOf1Bits(i, n)
        for p in positions:
            charSeq += normtext[p]
        if charSeq in lexicon:
            words.append(charSeq)
    return(words)
```

The outer loop (variable `i`) counts from  to ; for each of these numbers the inner loop (variable `p`) picks out the letters corresponding to 1 bits. The program produces the output expected. Unfortunately, it does so very slowly. For every character added to the text, running time roughly doubles. I haven’t the patience to plod through the  patterns in “itsapleasuretoserveyou”; estimates based on shorter phrases suggest the running time would be more than three hours.



To make this algorithm work, we need a procedure to report whether or not a word can be formed by folding the given text. The simplest approach is to slide the candidate word along the text, looking for a match for each character in turn:

                    taste
                    itsapleasuretoserveyou

                     **t**aste
                    i**t**sapleasuretoserveyou

                     **t a**ste
                    i**t**s**a**pleasuretoserveyou

                     **t a    s**te
                    i**t**s**a**plea**s**uretoserveyou

                     **t a    s   t**e
                    i**t**s**a**plea**s**ure**t**oserveyou

                     **t a    s   t  e**
                    i**t**s**a**plea**s**ure**t**os**e**rveyou

If every letter of the word finds a mate in the text, the word is foldable, as in the case of `taste`, shown above. But an attempt to match `tastes` would fall off the end of the text looking for a second `s`, which does not exist.

The following code implements this idea:

```python
def wordIsFoldable(word, text):
    normtext = normalize(text)
    t = 0                      # pointer to positions in normtext
    w = 0                      # pointer to positions in word
    while t < len(normtext):
        if word[w] == normtext[t]:  # matching chars in word and text
            w += 1                  # move to next char in word
        if w == len(word):          # matched all chars in word
            return(True)            # so: thumbs up
        t += 1                 # move to next char in text
    return(False)              # fell off the end: thumbs down
```


I can now report that there are 778 unique foldable Scrabble words in “It’s a pleasure to serve you” (including the three one-letter words I added to the list). Words that can be formed in multiple ways bring the total count to 899.

And so we come to the tah-dah! moment—the unveiling of the complete list. I have organized the words into groups based on each word’s starting position within the text. (By Python convention, the positions are numbered from 0 through .) Within each group, the words are sorted according to the position of their last character; that position is given in the subscript following the word. For example, _tapestry_ is in Group 1 because it begins at position 1 in the text (the _t_ in _It’s_), and it carries the subscript 19 because it ends at position 19 (the _y_ in _you_).



![[Pasted image 20260331174644.png]]
![[Pasted image 20260331174656.png]]
![[Pasted image 20260331174731.png]]
![[Pasted image 20260331175020.png]]


The Thue-Morse words are [overlapfree](https://mathworld.wolfram.com/OverlapfreeWord.html) (Allouche and Shallit 2003, p. 15), and therefore also [cubefree](https://mathworld.wolfram.com/CubefreeWord.html) on two symbols (Morse and Hedlund 1944)