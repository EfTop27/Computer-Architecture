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
Για την L2 cache βλέπουμε ότι έχει μέγεθος 2MB και το associativity είναι 8.

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
sim_seconds                                    0.083847           # Number of seconds simulated (line 12)
system.cpu.cpi                                 1.676947           # CPI: cycles per instruction (line 16)
system.cpu.icache.overall_miss_rate::total     0.000075           # miss rate for overall accesses (line 347)
system.cpu.dcache.overall_miss_rate::total     0.014289           # miss rate for overall accesses (line 124)
system.l2.overall_miss_rate::total             0.294749           # miss rate for overall accesses (line 510)
</pre>

429.mcf:  
<pre>
sim_seconds                                    0.055471           # Number of seconds simulated (line 12)
system.cpu.cpi                                 1.109419           # CPI: cycles per instruction (line 16)
system.cpu.icache.overall_miss_rate::total     0.000037           # miss rate for overall accesses (line 332)
system.cpu.dcache.overall_miss_rate::total     0.002038           # miss rate for overall accesses (line 124)
system.l2.overall_miss_rate::total             0.727788           # miss rate for overall accesses (line 495)
</pre>

456.hmmer:  
<pre>
sim_seconds                                    0.059410           # Number of seconds simulated (line 12)
system.cpu.cpi                                 1.188197           # CPI: cycles per instruction (line 16)
system.cpu.icache.overall_miss_rate::total     0.000204           # miss rate for overall accesses (line 348)
system.cpu.dcache.overall_miss_rate::total     0.001692           # miss rate for overall accesses (line 124)
system.l2.overall_miss_rate::total             0.079948           # miss rate for overall accesses (line 512)
</pre>

458.sjeng:  
<pre>
sim_seconds                                    0.513819           # Number of seconds simulated (line 12)
system.cpu.cpi                                 10.276385          # CPI: cycles per instruction (line 16)
system.cpu.icache.overall_miss_rate::total     0.000020           # miss rate for overall accesses (line 345)
system.cpu.dcache.overall_miss_rate::total     0.121829           # miss rate for overall accesses (line 124)
system.l2.overall_miss_rate::total             0.999979           # miss rate for overall accesses (line 507)
</pre>

470.lbm:  
<pre>
sim_seconds                                    0.059410           # Number of seconds simulated (line 12)
system.cpu.cpi                                 3.495573           # CPI: cycles per instruction (line 16)
system.cpu.icache.overall_miss_rate::total     0.000098           # miss rate for overall accesses (line 347)
system.cpu.dcache.overall_miss_rate::total     0.060971           # miss rate for overall accesses (line 124)
system.l2.overall_miss_rate::total             0.999927           # miss rate for overall accesses (line 509)
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
<pre>
system.clk_domain.clock	                1000       # Clock period in ticks  
system.cpu_clk_domain.clock		1000       # Clock period in ticks
</pre>

cpu clock 2GHz:
<pre>
system.clk_domain.clock              1000       # Clock period in ticks  
system.cpu_clk_domain.clock          500        # Clock period in ticks
</pre>

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
<pre>
sim_seconds                  0.160703            # Number of seconds simulated (line 12)  
system.cpu.cpi               1.607035            # CPI: cycles per instruction (line 16)
</pre>

429.mcf:  
<pre>
sim_seconds                  0.109233            # Number of seconds simulated (line 12)  
system.cpu.cpi               1.092334            # CPI: cycles per instruction (line 16)
</pre>

456.hmmer:  
<pre>
sim_seconds                  0.118547            # Number of seconds simulated (line 12)  
system.cpu.cpi               1.185466            # CPI: cycles per instruction (line 16)
</pre>

458.sjeng:  
<pre>
sim_seconds                  0.705453            # Number of seconds simulated (line 12)  
system.cpu.cpi               7.054533            # CPI: cycles per instruction (line 16)
</pre>

470.lbm:  
<pre>
sim_seconds                  0.262248            # Number of seconds simulated (line 12)  
system.cpu.cpi               2.622476            # CPI: cycles per instruction (line 16)
</pre>


401.bzip: Μείωση χρόνου στο: 0.083847/0.160703 = 52.17%  
429.mcf: Μείωση χρόνου στο: 0.055471/0.109233 = 50.78%  
456.hmmer: Μείωση χρόνου στο: 0.059410/0.118547 = 50.11%  
458.sjeng: Μείωση χρόνου στο: 0.513819/0.705453 = 72.83%  
470.lbm: Μείωση χρόνου στο: 0.059410/0.262248 = 22.65%

Παραπάνω βλέπουμε τον χρόνο με clock στα 2GHz σαν ποσοστό του χρόνου με clock στα 1GHz. Παρατηρούμε ότι σε 3 από τα benchmarks το ποσοστό είναι αρκετά κοντά στο 50% ενώ στα άλλα 2 benchmarks δε είναι. Άρα δεν υπάρχει τέλειο scaling. Συνεπώς διπλάσιο clock δεν σημαίνει απαραίτητα μισός χρόνος. Γενικά δεν υπάρχει πάντα τέλειο scaling του cpu frequency με τον χρόνο εκτέλεσης γιατί ο χρόνος εκτέλεσης εξαρτάται και από παράγοντες όπως το width του CPU data bus, η καθυστέρησηη της μνήμης και η αρχιτεκτονική της cache. Επίσης παίζει ρόλο και το cpi. Ενώ εάν ο επεξεργαστής χρησιμοποιεί παραλληλία τότε είναι πιο γρήγορος και δεν ισχύει η αναλογία clock με time.

### Βήμα 2
### Ερώτημα 1

Τα αρχεία των simulation βρίσκονται στον φάκελο Lab_2/spec_results/vima_2_erotima_1 και στους φακέλους 1_First, 2_Second, 3_Third, 4_Fourth, 5_Fifth αντίστοιχα.

 -  First simulation: iL1_size = 64kB, 	dL1_size = 128kB, 	iL1_assoc = 4,  	dL1_assoc = 4, L2_size = 1MB, 	L2_assoc = 8,	cache_line = 64

| __Benchmarks__| __sim_sec__	| __CPI__ | __L1i_miss_rate__	| __L1d_miss_rate__	| __L2_miss_rate__ |
| -- | -- | -- | -- | -- | -- |
| __specbzip__ | 0.083544 | 1.670873 | 0.000066 | 0.010816 | 0.453121 | 
| __spechmmer__ | 0.059241	| 1.184816	| 0.000082	| 0.000641	| 0.228635 |
| __speclibm__ | 0.175258	| 3.505150	| 0.000085	| 0.060971	| 0.999983	|
| __specmcf__ | 0.057334	| 1.146681	| 0.000018	| 0.001921	| 0.857713	|
| __specsjeng__ | 	0.513873 | 10.277457	 |  0.000019  | 0.121831	| 0.999987	| 



-  Second simulation: iL1_size = 64kB, 	dL1_size = 128kB, 	iL1_assoc = 4,  	dL1_assoc = 4, L2_size = 256kB, 	L2_assoc = 8,	cache_line = 64

| __Benchmarks__| __sim_sec__	| __CPI__ | __L1i_miss_rate__	| __L1d_miss_rate__	| __L2_miss_rate__ |
| -- | -- | -- | -- | -- | -- |
| __specbzip__ | 0.160355 | 1.603553 | 0.000075 | 0.014120 | 0.295298 | 
| __spechmmer__ | 0.059410	|1.188197	|  0.000204	| 0.001692	| 0.079948 |
| __speclibm__ | 0.262253	| 2.622534	| 0.000096	| 0.060971	| 0.999940	|
| __specmcf__ | 0.122608	| 1.226077	| 0.019046	| 0.002110	| 0.067655	|
| __specsjeng__ | 	0.705450 | 7.054504	 |  0.000020   | 0.121831	| 0.999979	| 



-  Third simulation: iL1_size = 32kB, 	dL1_size = 128kB, 	iL1_assoc = 4,  	dL1_assoc = 8, L2_size = 512kB, 	L2_assoc = 8,	cache_line = 64

| __Benchmarks__| __sim_sec__	| __CPI__ | __L1i_miss_rate__	| __L1d_miss_rate__	| __L2_miss_rate__ |
| -- | -- | -- | -- | -- | -- |
| __specbzip__ |0.085883 | 1.717666  | 0.000066 | 0.010339 | 0.580442 | 
| __spechmmer__ | 0.059228	|1.184560	|  0.000103 | 0.000587	| 0.250043 |
| __speclibm__ | 0.175312	|  3.506240	| 0.000089	| 0.060971	| 0.999968	|
| __specmcf__ |0.057453	| 1.149067	| 0.000019	| 0.001913	| 0.922880	|
| __specsjeng__ | 	0.513984 | 10.279674	 |   0.000019  | 0.121831	| 0.999984	| 



-  Fourth simulation: iL1_size = 16kB, 	dL1_size = 64kB, 	iL1_assoc = 4,  	dL1_assoc = 4, L2_size = 2MB, 	L2_assoc = 16,	cache_line = 64

| __Benchmarks__| __sim_sec__	| __CPI__ | __L1i_miss_rate__	| __L1d_miss_rate__	| __L2_miss_rate__ |
| -- | -- | -- | -- | -- | -- |
| __specbzip__ | 0.174773 | 1.665311  | 0.000073 | 0.013410 | 0.317269 | 
| __spechmmer__ | 0.059361	| 1.187228	|  0.000253 | 0.001617	| 0.082404 |
| __speclibm__ | 0.262253	|  3.495469	|  0.000106	| 0.060971	| 0.999897	|
| __specmcf__ | 0.068365	| 1.367291	| 0.042981	| 0.002012	| 0.032159	|
| __specsjeng__ | 0.513883 | 10.277651	 |   0.000021  | 0.121831	| 0.999973	| 




- Fifth full optimized simulation: iL1_size = 32kB, 	dL1_size = 128kB, 	iL1_assoc = 4,  	dL1_assoc = 8, L2_size = 4MB, 	L2_assoc = 16,	cache_line = 128

| __Benchmarks__| __sim_sec__	| __CPI__ | __L1i_miss_rate__	| __L1d_miss_rate__	| __L2_miss_rate__ |
| -- | -- | -- | -- | -- | -- |
| __specbzip__ | 0.079793 | 1.595852  | 0.000055 | 0.013410 | 0.317269 | 
| __spechmmer__ | 0.059051	| 1.181024	|  0.000095  | 0.000322	| 0.232953|
| __speclibm__ | 0.128851	|  2.577017	|  0.000092	| 0.030487	| 0.999899	|
| __specmcf__ | 0.056909	| 1.138182	| 0.007211	|  0.001109	| 0.089211	|
| __specsjeng__ | 0.340134 | 6.802677	 |  0.000013 |  0.060918	| 0.999970	| 

Παρακάτω φαίνεται το διάγραμμα για τις συνδυαστικές προσομοιώσεις.  
Το Simulation Vima 1 αναφέρεται στην προσομοίωση με τις αρχικές παραμέτρους του βήματος 1.  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_2/charts/images/vima_2_erotima_1.png" width="85%" height="85%">


Πριν προχωρήσουμε στα optimizations που χρειάζεται να κάνουμε, ώστε να μειώσουμε το συνολικό CPI και miss rate των L1, L2 caches πρώτα θα αναφερθούμε 
στη θεωρία που εσωκλείει η τεχνολογία των μνημών.  
Κυρίως, στις optimized προσομοιώσεις που εκτελέσαμε εστιάσαμε στη μείωση του miss_rate ώστε να πετύχουμε τη συνολική μείωση του average access time. 
Όπως γνωρίζουμε οι caches είναι μνήμες μικρές και γρήγορες(SRAM με μικρό access time), που χρειάζεται να διατηρουν δεδομένα και εντολές που χρειάζεται εκεινη τη στιγμή ο επεξεργαστης. Στο πρώτο επίπεδο έχουμε ξεχωριστές caches για δεδομένα και εντολές όπως κι ένα δεύτερο επίπεδο μεγαλύτερης χωρητικότητας που και τα 2 επίπεδα περιέχουν αντίγραφα της κυρίως μνήμης. Tα δεδομένα ειναι οργανωμένα σε blocks, όπου το καθενα αποτελείται από πολλές λέξεις. Οι διευθύνσεις στις οποίες αναφέρεται η CPU μεταφράζονται σε tag + index όπου δείχνει σε ενα συγεκριμένο block και στo line offset το οποίο δείχνει μέσα στο block όπου βρίσκονται τα δεδομένα. Aυτό που θέλουμε να εκμεταλευτούμε είναι το locality το οποίο χωρίζεται σε χωρικό και χρονικό. Στο χρονικό locality υποθέτουμε ότι δεδομένα που χρησιμοποιήθηκαν τώρα πιθανόν να χρησιμοποιηθούν σύντομα στο μέλλον. Στο χωρικό locality υποθέτουμε πως δεδομένα που βρίσκονται σε κοντινές διευθύνσεις είναι πιθανό να χρησιμοποιηθούν άμεσα από τον επεξεργαστή. Και στις 2 περιπτώσεις το σύστημά μας φροντίζει να φορτώσει τέτοια δεδομένα από την κυρίως μνήμη στις caches. Eπίσης οι caches χωρίζονται σε: Direct-Mapped, Set-Associative and Full-Set-Associative. Στις direct mapped κάθε block της κυρίως μνήμης αντιστοιχεί σε ένα ακριβώς block της cache, ενώ στις Full-Set-Associative κάθε block της κυρίως μνήμης αντιστοιχεί σε οποιοδήποτε block της cache. Μια ενδιάμεση κατάσταση είναι οι Set-Associative cache όπου ένα block της κυρίως μνήμης αντιστοιχεί σε ένα ή περισσότερα block της cache.
	
Υπάρχουν 3 ειδών misses κατά την εκτέλεση ενός προγράμματος. Αυτά ειναι:

-  Compulsory miss: Κατά το πρώτο access σε ένα block, το block αυτό λείπει από την cache μνήμη και πρέπει να έρθει από χαμηλότερο επίπεδο.
-  Capacity miss: Όταν η cache δεν μπορεί να περιέχει όλα τα blocks που χρειάζονται κατά την εκτέλεση ενός προγράμματος.
-  Conflict miss: Όταν 2 addresses κάνουν mapping στο ίδιο block.

Στη συνέχεια εξετάζουμε αν το κάθε optimization που εφαρμόζουμε οδηγεί σε βελτιστοποιήσεις και ποιοι περιορισμοί υπάρχουν.
	
Οptimization 1: Αύξηση του block_size. Με το συγκεκριμένο optimization πετυχαίνουμε να ενισχύσουμε την χωρική τοπικότητα στις caches μας κι έτσι αυξάνεται κατά πολύ το hit rate. Επίσης μειώνονται τα compulsory misses. Ταυτόχρονα αυξάνεται το miss penalty καθώς σε περιπτωση που δεν βρίσκει το block που ψάχνει πρέπει να το ανακτήσει από την μνήμη κι αυτή η μεταφορά ενός μεγαλύτερου block δεδομένων κοστίζει σε χρόνο. Τέλος αυξάνονται τα conflict misses, διότι αν για παράδειγμα έχουμε μία cache με 32 block των 4 byte το καθένα κι αυξήσουμε το block σε 8 byte τότε θα έχουμε 16 block στην cache. Έτσι oι διευθύνσεις από την κυρίως μνήμη θα γίνοτναι mapped σε λιγότερα block πράγμα που ενισχύει την πιθανότητα για conflict miss.

Optimization 2: Αύξηση του μεγέθους της μνήμης. Τα πλεονεκτήματα που μας προσφέρει είναι: Μείωση των capacity misses, είναι εφικτό να τρέξουμε προγράμματα με μεγαλύτερο memory footprint. Στα μειονεκτήματα περιλαμβάνεται: Μεγαλύτερα hit times, διότι έχουμε περισσότερα memory blocks στη μνήμη και έτσι το indexing χρειάζεται περισσότερο χρόνο για να γίνει. Επίσης αυξάνεται το κόστος και το power consumption.

Οptimization 3: Υψηλότερο associativity μειώνει το miss rate. Οι full-associative cache έχουν πολύ χαμηλό miss rate αλλά πολύ υψηλό hit time. Αντίθετα είναι τα απότελέσματα στις direct-mapped caches. Οπότε για καλύτερα αποτελέσματα κινούμαστε κάπου ενδιάμεσα υλοποιώντας N-way associative caches. Η αύξηση του hit time καθώς αυξάνεται το associativity οφείλεται στο γεγονός πως κατά το access σε ένα block θα γίνονται περισσότερες συγκρίσεις με επιπρόσθετα tags μέχρι να βρεθεί το επιθυμητό. Tα πλεονεκτήματα είναι πως μειώνονται τα conflict misses όπως και το miss rate. Στα μειονεκτήματα ανήκουν το αυξημένο hit time, η πιο πολύπλοκη υλοποίηση από τις direct-mapped και ποιο χρονοβόρο στα tags comparisson σε ένα set από block.


Eπομένως καταλήγουμε στο συμπέρασμα πως πρέπει να γίνει ένας συμβιβασμός μεταξύ των optimizations για να μειώσουμε εν τέλη το συνολικό Average Acces Time. Με βάση την παραπάνω γνώση καθώς και με βάση τις συνδυαστικές προσομοιώσεις που τρέξαμε καταλήγουμε στο συμπέρασμα πως η ενδεδειγμένη επιλογή των παραμέτρων για εμάς είναι:

 - L1i_size = 32kB
 - L1d_size = 128kB Είδαμε κατά την εκτέλεση των benchmark πως η data cache γίνεται πιο πολλές φορές acceses από την instruction cache γι αυτό και της δώσαμε περισσότερο μέγεθος ώστε ταυτόχρονα να διατηρεί πολλά δεδομένα. Επίσης διατηρούμε μικρά τα μεγέθη τους ωστε να έχουμε μικρούς χρόνους hit time.
 - L1i_assoc = 4 Γενικώς η instruction cache ειχε μικρό miss rate οπότε δεν υπήρχε κάποιος λόγος για αύξηση του μεγέθους της και του associativity 
 - L1d_assoc = 8
 - L2_size = 4MB
 - L2_assoc = 16 H L2 cache καθώς βλέπαμε τα υψηλά ποσοστά σε misses προχωρήσαμε τόσο στην αύξηση του associativity όσο και την αύξηση του μεγέθους της.
 - cache_line_size = 128 Eπειδή χρησιμοπιούμε DDR3_1600_8X8 dual-channel μνήμη είδαμε πως είναι χρήσιμο να αυξήσουμε το cache line size από 64(default τιμή) σε 128, ώστε σε ένα κύκλο ρολογιού να λαμβάνουμε 128 byte κι όχι σε 2 κύκλους αν μέναμε στην default τιμή -> Aύξηση του bandwidth της μνήμης


### Ερώτημα 2
Γενικά για την απόδοση της μνήμης cache ισχύει ο τύπος:  
```Average memory-access time = Hit time + (Miss rate * Miss penalty)```  
Όσο μειώνεται αυτός ο αριθμός βελτιώνεται και η τιμή του cpi. Άρα η μείωση του cpi επιτυγχάνεται με μείωση του miss rate, του miss penalty  του hit time.

Παρακάτω φαίνονται τα διαγράμματα του cpi σε σχέση με το L1 instruction size και το L1 instruction associativity αντίστοιχα:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_2/charts/images/L1i_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_2/charts/images/L1i_associativity.png" width="49%" height="49%">

Παρακάτω φαίνονται τα διαγράμματα του cpi σε σχέση με το L1 data size και το L1 data associativity αντίστοιχα:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_2/charts/images/L1d_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_2/charts/images/L1d_associativity.png" width="49%" height="49%">

Παρακάτω φαίνονται τα διαγράμματα του cpi σε σχέση με το L2 size και το L2 associativity αντίστοιχα:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_2/charts/images/L2_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_2/charts/images/L2_associativity.png" width="49%" height="49%">

Τρέξαμε τα benchmarks για τις τιμές που φαίνονται στα διαγράμματα. Πιο συγκεκριμένα γίνεται αλλαγή των παραγόντων L1 icache size, L1 dcache size, L1 icache associativity, L1 dcache associativity, L2 cache size και L2 cache associativity. Παρατηρούμε ότι οι αλλαγές των τιμών του κάθε παράγοντα έχουν αρκετά μικρή επίδραση στην απόδοση των brnchmark και σε κάποιες περιπτώσεις δεν επηρεάζουν καθόλου την απόδοση των benchmark. Αυτό συμβαίνει επειδή αλλάζουμε κάθε τιμή ξεχωριστά. Όπως αναφέρθηκε στο προηγούμενο ερώτημα η αύξηση του μεγέθους της μνήμης cache μειώνει τα capacity και conflict misses όμως αυτή η αύξηση του μεγέθους της μνήμης έχει ως αποτέλεσμα την αύξηση του access time και άρα την αύξηση του hit time. Επίσης η αύξηση του associativity βοηθάει στην μείωση των conflict misses όμως η αύξηση του associativity οδηγεί στην ανάγκη για μεγλο όγκο συνδυασμών και αυτό μπορεί να αυξήσει το hit time.
Συνεπώς από τα παραπάνω βλέπουμε ότι χρειάζονται να γίνουν κάποιοι συνδυασμοί των παραπάνω παραγόντων ώστε να υπάρξουν καλύτερα αποτελέσματα στην απόδοση των benchmark.

Παρακάτω φαίνεται το διάγραμμα του cpi σε σχέση με το cache line size:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_2/charts/images/cache_line_size.png" width="85%" height="85%">  
Βλέπουμε ότι η αύξηση του cache line size στα benchmarks είχε σαν αποτέλεσμα την μείωση της τιμής του cpi σε άλλες περιπτώσεις περισσότερο και σε άλλες λιγότερο. Στα benchmark 458.sjeng και 470.lbm βλέπουμε σημαντική μείωση του cpi. Επίσης στο benchmark 429.mcf παρατηρούμε ότι για 32B, 64B, 128B η τιμή του cpi είναι 1.250269, 1.109419 και 1.085983 όπου είναι μια τιμή αρκετά κοντά στο 1. Όπως αναφέρθηκε στο προηγούμενο ερώτημα η αύξηση του cache line size είναι ένας τρόπος να μειωθεί το miss rate καθώς μειώνονται τα compulsory misses. Η αύξηση του cache line size ομως γίνεται μέσα κάποια όρια γιατί όταν το μέγεθος των block είναι μεγαλύτερο μπορεί να αυξηθεί το miss penalty και το hit time. Συνήθως επιλέγονται τιμές 16-128 bytes.


### Βήμα 3
Η ταχύτητα και το κόστος της μνήμης αυξάνονται όταν η μνήμη βρίσκεται σε υψηλό επίπεδο. Συνεπώς η L1 cache η οποία βρίσκεται πιο κοντά στον επεξεργαστή έχει μεγαλύτερη ταχύτητα και μεγαλύτερο κόστος. Επίσης η L1 cache έχει και μικρότερο μέγεθος. Η L2 cache η οποία βρίσκεται σε χαμηλότερο επίπεδο έχει μικρότερη ταχύτητα και μικρότερο κόστος από την L1. Επίσης η L2 cache έχει μεγαλύτερο μέγεθος από την L1 cache. Ακόμη η L2 cache έχει μεγαλύτερο access time από την L1 cache. Έτσι βλέπουμε ότι το μέγεθος της μνήμης αποτελέι παράγοντα ο οποίος επηρεάζει το κόστος.  
Στη συνέχεια το associativity της μνήμης είναι άλλος παράγοντας ο οποίος επηρεάζει το κόστος. Ένα N-way associativity χρειάζεται N parallel comparators κάτι το οποίο αυξάνει το κόστος και μειώνει την ταχύτητα. Άρα όσο μεγαλύτερο είναι το associativity τόσο αυξάνεται το κόστος και η πολυπλοκότητα. Αφού η L1 cache είναι σε υψηλότερο level το κόστος είναι μεγαλύτερο σε σχέση με την L2 cache.  

Αυξάνοντας την ταχύτητα της μνήμης(μειώνοντας το latency) αυξάνουμε ουσιαστικά το μέγεθος του bit cell. Για παράδειγμα σε μία SRAM αυξάνοντας το μέγεθος του τρανζίστορ και του πυκνωτή στο bit cell επιτρέπει γρηγορότερο access αλλά μειώνει τον αριθμό των bit cells που μπορούν να χωρέσουν σε ένα ολοκληρωμένο. Έχουμε υψηλή πυκνότητα ολοκλήρωσης. Αντιθέτως αυξανόμενου του μεγέθους της μνήμης έχουμε πιο χαμηλή πυκνότητα ολοκλήρωσης και συνεπώς μειωμένο κόστος per bit.

Η L1 cache είναι περιπου 4 φορές πιο γρήγορη απ την L2 cache. Άρα αν S1, S2 είναι η ταχύτητα της L1, L2 αντίστοιχα τότε S1 = 4 * S2. Το κόστος εξαρτάται απ την τεχνολογία κατασκευής η οποία σχετίζεται με τις ταχύτητες S1, S2. Όπως αναφέρθηκε το κόστος εξαρτάται από το associativty ενώ εξαρτάται και από το cache line.  
Έτσι μια συνάρτηση υπολογισμο του κόστους θα μπορούσε να είναι η παρακάτω:  

<pre>
Cost = a*S1 + b*S2 + (L1i_size/32 - 1) + (L1d_size/128 - 1) + (L1i_assoc/4 - 1) + (L1d_assoc/8 - 1)  + 
(L2_size/L2_size_optimal - 1) + (L2_assoc/16 - 1) + (cache_line/128 - 1)
</pre>

Οι μνήμες λειτουργούν με clock 2GHz που ισοδυναμεί με περίοδο 0.5ns. Από την βιβλιογραφία βρήκαμε κατα προσέγγιση ότι ένα hit στην L1 cache διαρκεί περίπου 4 κύκλους που ισοδυναμεί σε χρόνο t1=2ns ενώ ένα hit στην L2 cache διαρκεί περίπου 10 κύκλους που ισοδυναμεί σε 5ns. Οπότε S1=1/t1 και S2=1/t2. Τα a και b είναι ένας πολλαπλασιαστικός παράγοντας που δίνει μεγαλύτερη βαρύτητα στην ανάπτυξη μιας cache υψηλότερου επιπέδου από μια cache χαμηλότερου επιπέδου. Έτσι επιλέγουμε a=10 και b=2 κατά προσέγγιση.
