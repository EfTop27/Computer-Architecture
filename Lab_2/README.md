# Αρχιτεκτονική Προηγμένων Υπολογιστών
## Εργαστήριο 2 - Αναφορά

**Εργαστήριο Β - Ομάδα 6**

**Τοπαλίδης Ευθύμης  (8417)**

**Τσιαμήτας Γιώργος  (8742)**

### Βήμα 1
### Ερώτημα 1

Από το αρχείο config.ini έχουμε:

L1 instruction cache:  
```[system.cpu.icache] (line 812)```  
```size=32768 (line 833) (32 KBytes)```  
```associativity: assoc=2 (line 816)```  
Για την L1 icache βλέπουμε ότι έχει μέγεθος 32KB και το associativity είναι 2.

L1 data cache:  
```[system.cpu.dcache] (line 148)```  
```size=65536 (line 169) (64 KBytes)```  
```associativity: assoc=2 (line 152)```  
Για την L1 dcache βλέπουμε ότι έχει μέγεθος 64KB και το associativity είναι 2.

L2 cache:
```[system.l2] (line 1057)```  
```size=2097152 (line 1078) (2 MBytes)```  
```associativity: assoc=8 (line 1061)```  
Για την L1 dcache βλέπουμε ότι έχει μέγεθος 2MB και το associativity είναι 8.

Cache line:  
```[system] (line 11)```  
```cache_line_size=64 (line 15) (64 bytes)```  
Η cache line έχει μέγεθος 64B.

Τα παραπάνω είναι οι default επιλογές οι οποίες ορίζονται στο αρχείο configs/common/Options.py και περνάν στο αρχεο se.py.  
Οι παραπάνω τιμές είναι ίδιες για τα 5 benchmarks.

### Ερώτημα 2

Από τα αρχεία stats.txt των benchmark έχουμε:

401.bzip:  
<pre>
sim_seconds                                  0.083847                       # Number of seconds simulated (line 12)
system.cpu.cpi                               1.676947                       # CPI: cycles per instruction (line 16)
system.cpu.icache.overall_miss_rate::total     0.000075                       # miss rate for overall accesses (line 347)
system.cpu.dcache.overall_miss_rate::total     0.014289                       # miss rate for overall accesses (line 124)
system.l2.overall_miss_rate::total           0.294749                       # miss rate for overall accesses (line 510)
</pre>

429.mcf:  
<pre>
sim_seconds                                  0.055471                       # Number of seconds simulated (line 12)
system.cpu.cpi                               1.109419                       # CPI: cycles per instruction (line 16)
system.cpu.icache.overall_miss_rate::total     0.000037                       # miss rate for overall accesses (line 332)
system.cpu.dcache.overall_miss_rate::total     0.002038                       # miss rate for overall accesses (line 124)
system.l2.overall_miss_rate::total           0.727788                       # miss rate for overall accesses (line 495)
</pre>

456.hmmer:  
<pre>
sim_seconds                                  0.059410                       # Number of seconds simulated (line 12)
system.cpu.cpi                               1.188197                       # CPI: cycles per instruction (line 16)
system.cpu.icache.overall_miss_rate::total     0.000204                       # miss rate for overall accesses (line 348)
system.cpu.dcache.overall_miss_rate::total     0.001692                       # miss rate for overall accesses (line 124)
system.l2.overall_miss_rate::total           0.079948                       # miss rate for overall accesses (line 512)
</pre>

458.sjeng:  
<pre>
sim_seconds                                  0.513819                       # Number of seconds simulated (line 12)
system.cpu.cpi                              10.276385                       # CPI: cycles per instruction (line 16)
system.cpu.icache.overall_miss_rate::total     0.000020                       # miss rate for overall accesses (line 345)
system.cpu.dcache.overall_miss_rate::total     0.121829                       # miss rate for overall accesses (line 124)
system.l2.overall_miss_rate::total           0.999979                       # miss rate for overall accesses (line 507)
</pre>

470.lbm:  
<pre>
sim_seconds                                  0.059410                       # Number of seconds simulated (line 12)
system.cpu.cpi                               3.495573                       # CPI: cycles per instruction (line 16)
system.cpu.icache.overall_miss_rate::total     0.000098                       # miss rate for overall accesses (line 347)
system.cpu.dcache.overall_miss_rate::total     0.060971                       # miss rate for overall accesses (line 124)
system.l2.overall_miss_rate::total           0.999927                       # miss rate for overall accesses (line 509)
</pre>

