### Three vulnerable programs:
- vprog_0: without any protection mechanism
- vprog_1: simulated MAC computation with only return addresses and frame pointers
- vprog_2: simulated MAC computation with proposed framework (see the paper)
### To run the vulnerable programs:
- vprog_0:
```
make vprog_0
./vprog_0 < expl_0
```
- vprog_1 and vprog_2:
```
make vprog_<1/2>
gdb vprog_<1/2>
r < expl_<1/2>
```
