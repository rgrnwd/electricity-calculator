# Introduction

At GreenSync, we consume data from many sources and in varied formats; one common format we receive data in is ‘comma separated values’ or CSV. Today we’re providing you with two CSVs containing data to process. 

The first (`data/01-solar_generation.csv`) is the electricity generation data for a customer’s rooftop solar installation. Each row in the CSV contains the following information:

* `time` - The time of the reading
* `power_real` - The power output from panels at the given time in watts

The second CSV (`data/02-consumption.csv`) is the electricity usage data for the customer and includes the following:

* `period` - The 30 minute block that the data is for
* `usage` - The energy consumed in the period in kilowatt hours

# Requirements

Write a program to find the total amount of electricity generated, the total amount of electricity consumed and then print the result to screen.

EG:
```text
20123Wh of electricity was generated
40000Wh of electricity was consumed
```

Assume that the power output from the solar installation is constant for the period between the timestamps. 

To calculate the electricity generated in kilowatt hours by the solar panels, find the sum of (instantaneous value in watts x 1000 x period duration in hours)

To calculate the amount of energy consumed, find the sum of the energy consumed in the 48 periods.

NOTE: If the language you’re using does not contain a built in library for reading CSVs, simply split each line where there is a comma rather than using a third party library.

