# p5PaletteHelper

PaletteHelper loads color palettes from a JSON file and provide useful methods to use them in Processing.

## Features

* Load palettes from a JSON file
* Traverse through your palettes just by calling next()
* Supports weights in colors so getColor() will return a weighted random color

## Try

Download or clone this repo and open p5PaletteHelper.pde

## Use

Copy Palette.pde and PaletteHelper.pde to your beloved project and have fun

## JSON format

Check data/palettes.json and data/palettes2.json for the supported formats. 
The first format is more expressive and the second one is smaller.

The format in palettes2.json array is [r, g, b, weight]. Weight is optional.
