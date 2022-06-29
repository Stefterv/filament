# Filament Swift Package

This directory contains the bindings for using Filament in Apple's Swift language


## Building


```
$ ./build.sh -p ios -i -s -S debug               # generate the xcframeworks binary targets
```


The Package.swift is placed required to be placed at the root of the repository 


## Folders

```
Swift
    - Bindings // contains the c++ to obj-c code
      - Include // contains the obj-c headers
    - Helpers // contains swift helper functions
    - Samples // Sample code on how to use the swift bindings

Sources // Deprecated proof of concept bindings 

```