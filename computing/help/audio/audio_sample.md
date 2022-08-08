# Audio sampling (PCM)

## Definitions
```
1 sample = 16 bits (2 bytes)
Sample rate : 8 KHz

Audio card produces chunks of 60 samples each:
8000/60 samples => every 7.5 ms
60 samples = 120 bytes
```

## Examples

```
Question 1: 
Sample rate = 8 KHz
16 bits per sample
How many samples we get every 20 ms ?
8000 / (1000/20) = 160 samples (= 320 bytes)
```

```
Question 2:
Calulute bits pers second for this stream.
(Sample rate)*(bits per sample) = 8KHz * 16 = 128 Kbs
```

```
Question 3:
packet = 60 samples. packet rate = every 7.5 ms
What is the sample rate ?
(1000/7.5)*60 = 8KHz
```

