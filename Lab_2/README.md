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

