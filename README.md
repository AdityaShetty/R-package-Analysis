# R-package-Analysis

The Analysis package is a set of packages that work with Maths data dataset, which is present in package itself. The Analysis package is designed to make it easy to install and load dataset, Model fitting options, plotting and application running in a single package.


## Installation


```
#Setting path to the directory where the zip file is stored
setwd("~/R/Analysis")

#Install the package
install.packages("Analysis_0.1.0.tar.gz")

```

## Usage

```
#This will get the path for Maths_ED data from the extdata folder and store in variable
path = system.file("extdata","Maths_ED.xlsx", package = "Analysis")

#Store the dataset in variable
data = Analysis::MathsData(path)
```
![WhatsApp Image 2022-10-12 at 2 35 29 PM](https://user-images.githubusercontent.com/20254772/195383103-44b7f399-b62e-4ec6-8745-4ee2aaff3dc1.jpeg)

## Fitall

You can use the function Fitall() using the below method and example to fit model to the data. See the example at very end.

![WhatsApp Image 2022-10-12 at 3 34 13 PM](https://user-images.githubusercontent.com/20254772/195383519-3db454f5-cecd-43f3-b77d-91eff13a51c3.jpeg)

## Plot

Plot using function given directly for both categories.

![WhatsApp Image 2022-10-12 at 3 33 36 PM](https://user-images.githubusercontent.com/20254772/195383618-1a42c68c-038b-4c3b-affa-a15b68e1e244.jpeg)

## Application

Run the R application to check how this package works. 

```
Analysis :: run_example()
```

![WhatsApp Image 2022-10-12 at 3 38 35 PM](https://user-images.githubusercontent.com/20254772/195383751-dfff804a-c060-422b-aa64-805c307d6931.jpeg)

