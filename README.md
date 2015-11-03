# Pixel Face Quote
by Paul Thompson - nossidge@gmail.com - [tilde.town/~nossidge](http://tilde.town/~nossidge/)

Feed it a string, and it will make a random pixel face person saying the text.

## Usage

```
face_quote.rb hello.png 'Hello world! My name is Paul Thompson. Pleased to meet you!' 3
```

![Hello world!](hello.png?raw=true "Hello world!")

## Dependencies

Uses [chunky_png](https://github.com/wvanbergen/chunky_png) or [oily_png](https://github.com/wvanbergen/oily_png) to generate the png file.

Also needs [Pixel Font](https://github.com/nossidge/pixel-font), which isn't a gem. Just git clone to the repo root and it should work.

## Install

```
git clone https://github.com/nossidge/pixel-face-quote.git
gem install chunky_png
```

Then, within the "pixel-face-quote" directory:
```
git clone https://github.com/nossidge/pixel-font.git
```

## Licence

[GNU General Public License v3.0](http://www.gnu.org/licenses/gpl-3.0.txt)
