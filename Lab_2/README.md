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

Παρακάτω φαίνεται το γράφημα το οποίο απεικονίζει τα παραπάνω αποτελέσματα από τα αρχεία stats.txt.  
![image](https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_2/charts/images/vima_1.png)

Επίσης παρακάτω φαίνονται τα γραφήματα ξεχωριστά για κάθε μια από τις πληροφορίες που πρέκυψαν από τα αρχεία stats.txt.  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_2/charts/images/vima_1_sim_sec.png" width="60%" height="60%">
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_2/charts/images/vima_1_cpi.png" width="60%" height="60%">
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_2/charts/images/vima_1_l1i_miss_rate.png" width="60%" height="60%">
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_2/charts/images/vima_1_l1d_miss_rate.png" width="60%" height="60%">
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_2/charts/images/vima_1_l2_miss_rate.png" width="60%" height="60%">

Παρατηρούμε ότι τα benchmarks 458.sjeng και 470.lbm έχουν μεγαλύτερα simulation seconds και cpi σχετικά με τα άλλα benchmarks. Επίσης παρατηρούμε ότι για αυτά τα 2 benchmarks έχουμε μεγαλύτερα L2 miss rates σε σχέση με τα άλλα. Κάθε φορά που υπάρχει miss στις L1 και L2 υπάρχει και miss penalty. Η L2 cache είναι πιο αργή από την L1 cache. Άρα αφού το miss rate της L2 cache σε αυτές τις περιπτώσεις είναι μεγαλύτερο είναι αναμενόμενο να είναι μεγαλύτεροι οι χρόνοι εκτέλεσης και τα cpi.

### Ερώτημα 3

Από το αρχείο Options.py στο οποο ορίζονται κάποιες παράμετροι οι οποίοι περνάνε στο αρχείο se.py βλέπουμε ότι το default cpu clock είναι 2GHz οπότε τρέχουμε τα benchmarks με clock 1GHz και με το flag --cpu-clock=1GHz.

Από τα αρχεία stats.txt και για όλα τα benchmarks στις αντίστοιχες γραμμές κώδικα έχουμε:  
cpu clock 1GHz:  
```system.clk_domain.clock                          1000                       # Clock period in ticks```  
```system.cpu_clk_domain.clock                      1000                       # Clock period in ticks```

cpu clock 2GHz:
```system.clk_domain.clock                          1000                       # Clock period in ticks```  
```system.cpu_clk_domain.clock                       500                       # Clock period in ticks```

Αυτό που αλλάζει είναι το system.cpu_clk_domain.clock. Ενώ το system.clk_domain.clock παραμένει ίδιο. Αυτό το οποίο χρονίζεται στα 1GHz (system.clk_domain.clock) είναι το clock που έχει σχέση με τα components του συστήματος (η συχνότητα στην οποία λειτουργουν τα components του συστήματος). Αυτό το οποίο χρονίζεται στα 2GHz είναι το cpu (η συχνότητα λειτουργίας των block του cpu). Σε αυτό το συμπέρασμα βοήθησαν και οι πληροφορίες από τα αρχεία se.py, configs/common/Options.py, config.ini.

Από τα αρχεα config.json έχουμε:

Για το benchmark 401.bzip:  
cpu clock 1GHz:  
<pre>
"clk_domain": {
            "type": "SrcClockDomain",
            "cxx_class": "SrcClockDomain",
            "name": "clk_domain",
            "path": "system.clk_domain",
            "clock": [
                1000
            ],
(line 81 - line 88)
</pre>

<pre>
"cpu_clk_domain": {
            "type": "SrcClockDomain",
            "cxx_class": "SrcClockDomain",
            "name": "cpu_clk_domain",
            "path": "system.cpu_clk_domain",
            "clock": [
                1000
            ],
(line 1424 - line 1431)
</pre>

cpu clock 2GHz:  
<pre>
"clk_domain": {
            "type": "SrcClockDomain",
            "cxx_class": "SrcClockDomain",
            "name": "clk_domain",
            "path": "system.clk_domain",
            "clock": [
                1000
            ],
(line 81 - line 88)
</pre>

<pre>
cpu_clk_domain": {
            "type": "SrcClockDomain",
            "cxx_class": "SrcClockDomain",
            "name": "cpu_clk_domain",
            "path": "system.cpu_clk_domain",
            "clock": [
                500
            ],
(line 1424 - line 1431)
</pre>

Οι ίδιες πληροφορίες υπάρχουν και για τα άλλα benchmarks στις αντίστοιχες γραμμές κώδικα.  
Από τα παραπάνω επαληθεύονται και από το αρχείο config.json ότι στα 1GHz χρονίζεται το σύστημα (componenets συστήματος) και στα 2GHz χρονίζεται το cpu.  
Αν προσθέσουμε άλλον ένα επεξεργαστή η συχνότητα του θα είναι ίδια δηλαδή 1GHz ή 2GHz αναλόγως την τιμή που έχει το flag --cpu-clock.

Από τα αρχεα stats.txt για cpu clock 1GHz έχουμε:  
401.bzip:  
```sim_seconds                                  0.160703                       # Number of seconds simulated (line 12)```  
```system.cpu.cpi                               1.607035                       # CPI: cycles per instruction (line 16)```

429.mcf:  
```sim_seconds                                  0.109233                       # Number of seconds simulated (line 12)```  
```system.cpu.cpi                               1.092334                       # CPI: cycles per instruction (line 16)```

456.hmmer:  
```sim_seconds                                  0.118547                       # Number of seconds simulated (line 12)```  
```system.cpu.cpi                               1.185466                       # CPI: cycles per instruction (line 16)```

458.sjeng:  
```sim_seconds                                  0.705453                       # Number of seconds simulated (line 12)```  
```system.cpu.cpi                               7.054533                       # CPI: cycles per instruction (line 16)```

470.lbm:  
```sim_seconds                                  0.262248                       # Number of seconds simulated (line 12)```  
```system.cpu.cpi                               2.622476                       # CPI: cycles per instruction (line 16)```


401.bzip: Μείωση χρόνου στο: 0.083847/0.160703 = 52.17%  
429.mcf: Μείωση χρόνου στο: 0.055471/0.109233 = 50.78%  
456.hmmer: Μείωση χρόνου στο: 0.059410/0.118547 = 50.11%  
458.sjeng: Μείωση χρόνου στο: 0.513819/0.705453 = 72.83%  
470.lbm: Μείωση χρόνου στο: 0.059410/0.262248 = 22.65%

Παραπάνω βλέπουμε τον χρόνο με clock στα 2GHz σαν ποσοστό του χρόνου με clock στα 1GHz. Παρατηρούμε ότι σε 3 από τα benchmarks το ποσοστό είναι αρκετά κοντά στο 50% ενώ στα άλλα 2 benchmarks δε είναι. Άρα δεν υπάρχει τέλειο scaling. Συνεπώς διπλάσιο clock δεν σημαίνει απαραίτητα μισός χρόνος. Γενικά δεν υπάρχει πάντα τέλειο scaling του cpu frequency με τον χρόνο εκτέλεσης γιατί ο χρόνος εκτέλεσης εξαρτάται και από παράγοντες όπως το width του CPU data bus, η καθυστέρησηη της μνήμης και η αρχιτεκτονική της cache. Επίσης παίζει ρόλο και το cpi. Ενώ εάν ο επεξεργαστής χρησιμοποιεί παραλληλία τότε είναι πιο γρήγορος και δεν ισχύει η αναλογία clock με time.

