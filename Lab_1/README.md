## Αρχιτεκτονική Προηγμένων Υπολογιστών Εργαστήριο 1 - Αναφορά

**Ομάδα 6**

**Τοπαλίδης Ευθύμης  (8417)**

**Τσιαμήτας Γιώργος  (8742)**

### Ερώτημα 1
Στο αρχείο starter_se.py παρατηρούμε τις εξής παραμέτρους:
* ```parser.add_argument("--cpu", type=str, choices=list(cpu_types.keys()), default="atomic", help="CPU model to use")```  
   Ορίζεται ο τύπος του cpu. Ο default τύπος είναι "atomic". Αλλά στο παράδειγμα εκτέλεσης του hello ορίσαμε "minor" σαν τύπο cpu.

* ```parser.add_argument("--cpu-freq", type=str, default="4GHz")```  
   Ορίζεται η συχνότητα του cpu. Είναι 4GHz σαν default επιλογή.

* ```parser.add_argument("--num-cores", type=int, default=1, help="Number of CPU cores")```  
   Ο αριθμός των cores είναι 1 και αυτή είναι η default επιλογή.

* ```parser.add_argument("--mem-type", default="DDR3_1600_8x8", choices=ObjectList.mem_list.get_names(), help = "type of memory to use")```  
   Ο τύπος της μνήμης είναι DDR3_1600_8x8 και είναι η default επιλογή.

* ```parser.add_argument("--mem-channels", type=int, default=2, help = "number of memory channels")```  
   Ο αριθμός των memory channels είναι 2 (default επιλογή), δηλαδή έχουμε 2 κανάλια για την μεταφορά δεδομένων. Ορίζουν το data rate μεταξύ κύριας μνήμης και των 2 memory controllers.

* ```parser.add_argument("--mem-ranks", type=int, default=None, help = "number of memory ranks per channel")```  
   Τα memory ranks per channel είναι "None" (default επιλογή).

* ```parser.add_argument("--mem-size", action="store", type=str, default="2GB", help="Specify the physical memory size")```  
   Το μέγεθος της μνήμης είναι 2GB (default επιλογή).

* ```cache_line_size = 64```  
   Το μέγεθος της κάθε γραμμής της cache είναι 64 bytes. Αυτό είναι και το μέγεθος του block της μνήμης που μπορεί να αποθηκευτεί στην cache.

* ```self.voltage_domain = VoltageDomain(voltage="3.3V")```  
   Η τάση του συστήματος είναι 3.3V.

* ```self.clk_domain = SrcClockDomain(clock="1GHz", voltage_domain=self.voltage_domain)```  
   Η συχνότητα λειτουργίας του συστήματος είναι 1GHz.

* ```self.cpu_cluster = devices.CpuCluster(self, args.num_cores, args.cpu_freq, "1.2V", *cpu_types[args.cpu])```  
   Η τάση λειτουργίας cpu είναι 1.2V.

* ```root = Root(full_system=False)```  
   Χρησιμοποιείται Syscall Emulation (SE) mode αντί για Full System (FS) mode. Από εκεί ξεκινάει η δενδρική δομή του config file του συστήματος που προσομοιώνουμε.

* ```"minor" : (MinorCPU, devices.L1I, devices.L1D, devices.WalkCache, devices.L2)```  
   Ορίζονται 2 επίπεδα cache L1, L2. Το L1 επίπεδο αποτελείται από ένα data cache και ένα instruction cache.

* ```self.membus = SystemXBar()```  
   Γίνεται instantiate το memory bus του συστήματος.
   
### Ερώτημα 2

**Ερώτημα 2a**

Επαλήθευση πληροφοριών του ερωτήματος 1 από το config.ini αρχείο.

* ```full_system=false (line 5)```  
Δεν χρησιμοποιείται Full System (FS) mode.

* ```[system.clk_domain] (line 42)```  
```type=SrcClockDomain (line 43)```  
```clock=1000 (line 44)```  
Το clock είναι 1000 ticks άρα η συχνότητα του συστήματος είναι 1GHz. Τα ticks είναι σε picosecond άρα 1000 ticks είναι 1000*10^(-12)=10^(-9) sec. Άρα η συχνότητα είναι 1/10^(-9)=1GHz.
* ```[system.cpu_cluster.clk_domain] (line 56)```  
```type=SrcClockDomain (line 57)```  
```clock=250 (line 58)```  
Όπως παραπάνω προκύπτει ότι η συχνότητα cpu είναι 4GHz.
* ```type=MinorCPU (line 65)```  
Ο τύπος cpu είναι minor.
* ```numThreads=1 (line 113)```  
Τα threads είναι ο αριθμός των virtual cores μέσα στα physical cores. Αφού ο αριθμός είναι 1 έχουμε 1 core.
* ```cache_line_size=64 (line 15)```  
Μέγεθος γραμμής cache 64 bytes.
* ```[system.voltage_domain] (line 1649)```  
```voltage=3.3 (line 1652)```  
Η τάση του συστήματος είναι 3.3V.
* ```[system.cpu_cluster.voltage_domain] (line 1336)```  
```voltage=1.2 (line 1339)```  
Η τάση cpu έιναι 1.2V.
* ```[system.mem_ctrls0.dram] (line 1375)```  
```[system.mem_ctrls1.dram] (line 1505)```  
Υπάρχουν 2 memory controllers. Κάθε memory controller αντιστοιχίζεται σε ένα memory channel άρα το σύστημα έχει 2 memory channels.
* ```[system.mem_ctrls0.dram] (line 1375)```  
```ranks_per_channel=2 (line 1427)```  
```[system.mem_ctrls1.dram] (line 1505)```  
```ranks_per_channel=2 (line 1557)```  
Υπάρχουν 2 ranks per channel. Επειδή η μνήμη είναι DDR3_1600_8x8 εξάγονται 64 bits σε κάθε rank. Αφού έχουμε 2 ranks per channel τα memory channels έχουν 128 bit width.
* ```[system] (line 11)```  
```mem_ranges=0:2147483648 (line 21)```  
Το μέγεθος της μνήμης είναι 2GB = 2147483648 bytes.

**Ερώτημα 2b**

Από το αρχείο stats.txt παρατηρούμε:

```sim_insts    5028    # Number of instructions simulated (line 10)```  
```system.cpu_cluster.cpus.committedInsts    5028    # Number of instructions committed (line 14)```

Ο αριθμός των committed εντολών είναι 5028.

**Ερώτημα 2c**

Από το αρχείο stats.txt παρατηρούμε:

```system.cpu_cluster.l2.overall_accesses::total    479    # number of overall (read+write) accesses (line 493)```

Η L2 cache προσπελάστηκε 479 φορές.

Εναλλακτικά για να βρούμε πόσες φορές προσπελάστηκε η L2 βρίσκουμε πόσες φορές έγινε miss η icache και η dcache του L1 επιπέδου. Αυτή η πληροφορία παρέχεται από τον MSHR(miss status hold register).

Από το αρχείο stats.txt παρατηρούμε:

```system.cpu_cluster.cpus.icache.demand_mshr_misses::total    332    # number of demand (read+write) MSHR misses```  
```system.cpu_cluster.cpus.dcache.demand_mshr_misses::total    147    # number of demand (read+write) MSHR misses```

Το άθροισμα των πσραπάνω είναι 332+147=479 όπου είναι ο αριθμός των l2 accesses.

### Ερώτημα 3
Πληροφορίες για τα διαφορετικά μοντέλα in-order CPUs που χρησιμοποιεί ο gem5:

Το SimpleCPU είναι ένα in-order μοντέλο το οποίο χρησιμοποιείται σε περιπτώσεις όπου ένα detailed model δεν είναι απαραίτητο. Έχει χωριστεί σε 3 κλάσεις: BaseSimpleCPU, AtomicSimpleCPU, TimingSimpleCPU.

Το BaseSimpleCPU διατηρεί την αρχιτεκτονική μεταξύ των SimpleCPU models. Επίσης ορίζει συναρτήσεις για να ελέγχουν εάν υπάρχουν interrupts και να δημιουργούν fetch request, διαχειρίζεται το pre-execute setup και post-execute actions και αυξάνει τον PC για την επόμενη εντολή. Δεν μπορεί να λειτουργήσει μόνο του. Πρέπει να χρησιμοποιηθεί μια από τις κλάσεις AtomicSimpleCPU ή TimingSimpleCPU οι οποίες το κληρονομούν.

To AtomicSimpleCPU χρησιμοποιεί atomic memory accesses. Χρησιμοποιεί τα latency estimates από τα atomic accesses για να κάνει εκτίμηση του συνολικού cache access time. Χρησιμοποιείται για συναρτήσεις για να κάνει read and write στην μνήμη, για να δημιουργούν το tick, το οποίο καθορίζει τι συμβαίνει σε κάθε CPU cycle. Επίσης καθορίζει το port που χρησιμοποιείται για να συνδεθεί στην μνήμη και συνδέει το CPU στην cache.

Το TimingSimpleCPU χρησιμοποιεί timing memory accesses. Σταματάει (stalls) στα cache accesses και περιμένει το σύστημα μνήμης να απαντήσει για να προχωρήσει. Ορίζει τις ίδιες συναρτήσεις με το AtomicSimpleCPU, καθορίζει το port που χρησιμοποιείται για να συνδεθεί στην μνήμη και συνδέει το CPU στην cache. Επίσης ορίζει τις απαραίτητες συναρτήσεις για να διαχειρίζονται τα responses από την μνήμη.

Το Minor είναι ένα in-order processor model με ένα καθορισμένο pipeline αλλά με διαμορφώσιμες δομές δεδομένων και τρόπους execute. Είναι προορισμένο για χρήση σε processors με strict in-order execution behaviour και επιτρέπει το visualisation την θέση ενός instruction στο pipeline. Περιλαμβάνει data και instruction interfaces για την σύνδεση σε σύστημα cache.

Το HPI πρόκειται για ένα αντιπροσωπευτικό in-order CPU μοντέλο. Το pipeline χρησιμοποιεί το ίδιο μοντέλο με το MinorCPU. Μια σημαντική λειτουργία του Memory Management Unit (MMU) είναι το σύστημα να τρέχει multiple tasks σαν ανεξάρτητα προγράμματα τα οποία τρέχουν στο δικό τους private virtual memory space.

Το πρόγραμμα το οποίο υλοποιήθηκε σε C φαινεται παρακάτω:
<pre>
#include <stdio.h>

int main(){
	int mul;

	mul = 1;

	for(int i=1; i<=10; i++){  //Multiplies i with mul in for loop
		mul = i * mul;
	}

	printf("Result of multiplication is: %d\n", mul);

	return 0;
}
</pre>

**Ερώτημα 3a**

Παρακάτω φαίνονται τα αποτελέσματα που προκύπτουν από το αρχείο stats.txt:

MinorCPU:
<pre>
final_tick		33965000	  # Number of ticks from beginning of simulation (restored from checkpoints and never reset)
host_inst_rate		50329             # Simulator instruction rate (inst/s)
host_mem_usage		712380            # Number of bytes of host memory used
host_op_rate		57322             # Simulator op (including micro ops) rate (op/s)
host_seconds            0.20              # Real time elapsed on the host
host_tick_rate          169834005         # Simulator tick rate (ticks/s)
sim_freq                1000000000000     # Frequency of simulated ticks
sim_insts               10056             # Number of instructions simulated
sim_ops                 11462             # Number of ops (including micro ops) simulated
sim_seconds             0.000034          # Number of seconds simulated
sim_ticks               33965000          # Number of ticks simulated
</pre>

TimingSimpleCPU:
<pre>
final_tick              40536000          # Number of ticks from beginning of simulation (restored from checkpoints and never reset)
host_inst_rate          205238            # Simulator instruction rate (inst/s)
host_mem_usage          710072            # Number of bytes of host memory used
host_op_rate            232326            # Simulator op (including micro ops) rate (op/s)
host_seconds            0.05              # Real time elapsed on the host
host_tick_rate          828830392         # Simulator tick rate (ticks/s)
sim_freq	        1000000000000     # Frequency of simulated ticks
sim_insts               10000             # Number of instructions simulated
sim_ops                 11355             # Number of ops (including micro ops) simulated
sim_seconds             0.000041          # Number of seconds simulated
sim_ticks               40536000          # Number of ticks simulated
</pre>

**Ερώτημα 3b**

Παρατηρούμε ότι το MinorCPU έχει 33965000 (Number of ticks simulated) ενώ το TimingSimpleCPU έχει 40536000 (Number of ticks simulated). Επίσης το MinorCPU και TimingSimpleCPU έχουν 0.000034 και 0.000041 (Number of seconds simulated) αντίστοιχα. Αυτό δείχνει ότι το MinorCPU είναι πιο γρήγορο από το TimingSimpleCPU καθώς όπως αναφέρθηκε παραπάνω το TimingSimpleCPU σταματάει (stalls) στα cache accesses και περιμένει το σύστημα μνήμης να απαντήσει για να προχωρήσει. Επίσης το MinorCPU λειτοργεί με pipeline κάτι που το κάνει πιο γρήγορο.

**Ερώτημα 3c**

Βλέπουμε στο se.py ότι οι επιλογές για τις παραμέτρους γίνονται από το αρχείο common/options.py.  
Σαν default --mem-type έχουμε DDR3_1600_8x8 και σαν default --cpu-clock έχουμε 2GHz.

Μειώνουμε την συχνότητα στα 10MHz (clock 100000).  
Τα αποτελέσματα τα οποία προκύπτουν από το αρχείο stats.txt φαίνονται παρακάτω:

MinorCPU:
<pre>
final_tick            173410000000         # Number of ticks from beginning of simulation (restored from checkpoints and never reset)
host_inst_rate        15663                # Simulator instruction rate (inst/s)
host_mem_usage        712120               # Number of bytes of host memory used
host_op_rate          17848                # Simulator op (including micro ops) rate (op/s)
host_seconds          0.64                 # Real time elapsed on the host
host_tick_rate        270010836962         # Simulator tick rate (ticks/s)
sim_freq              1000000000000        # Frequency of simulated ticks
sim_insts             10056                # Number of instructions simulated
sim_ops               11462                # Number of ops (including micro ops) simulated
sim_seconds           0.173410             # Number of seconds simulated
sim_ticks             173410000000         # Number of ticks simulated
</pre>

TimingSimpleCPU:
<pre>
final_tick            308900000000         # Number of ticks from beginning of simulation (restored from checkpoints and never reset)
host_inst_rate        11584                # Simulator instruction rate (inst/s)
host_mem_usage        710072               # Number of bytes of host memory used
host_op_rate          13151                # Simulator op (including micro ops) rate (op/s)
host_seconds          0.86                 # Real time elapsed on the host
host_tick_rate        357758125673         # Simulator tick rate (ticks/s)
sim_freq              1000000000000        # Frequency of simulated ticks
sim_insts             10000                # Number of instructions simulated
sim_ops               11355                # Number of ops (including micro ops) simulated
sim_seconds           0.308900             # Number of seconds simulated
sim_ticks             308900000000         # Number of ticks simulated
</pre>

Μειώσαμε το clock και για το MinorCPU βλέπουμε αύξηση των ticks σε 173410000000 και του χρόνου σε 0.173410 ενώ για το TimingSimpleCPU βλέπουμε αύξηση των ticks σε 308900000000 και του χρόνου σε 0.308900. Η αύξηση των ticks και του χρόνου είναι αναμενόμενη αφού μειώσαμε το clock του cpu.

Στη συνέχεια αλλάζουμε τον τύπου μνήμης σε LPDDR2_S4_1066_1x32.  
Τα αποτελέσματα τα οποία προκύπτουν από το αρχείο stats.txt φαίνονται παρακάτω:

MinorCPU:
<pre>
final_tick            173410000000         # Number of ticks from beginning of simulation (restored from checkpoints and never reset)
host_inst_rate        15663                # Simulator instruction rate (inst/s)
host_mem_usage        712120               # Number of bytes of host memory used
host_op_rate          17848                # Simulator op (including micro ops) rate (op/s)
host_seconds          0.64                 # Real time elapsed on the host
host_tick_rate        270010836962         # Simulator tick rate (ticks/s)
sim_freq              1000000000000        # Frequency of simulated ticks
sim_insts             10056                # Number of instructions simulated
sim_ops               11462                # Number of ops (including micro ops) simulated
sim_seconds           0.173410             # Number of seconds simulated
sim_ticks             173410000000         # Number of ticks simulated
</pre>

TimingSimpleCPU:
<pre>
final_tick            308900000000         # Number of ticks from beginning of simulation (restored from checkpoints and never reset)
host_inst_rate        11584                # Simulator instruction rate (inst/s)
host_mem_usage        710072               # Number of bytes of host memory used
host_op_rate          13151                # Simulator op (including micro ops) rate (op/s)
host_seconds          0.86                 # Real time elapsed on the host
host_tick_rate        357758125673         # Simulator tick rate (ticks/s)
sim_freq              1000000000000        # Frequency of simulated ticks
sim_insts             10000                # Number of instructions simulated
sim_ops               11355                # Number of ops (including micro ops) simulated
sim_seconds           0.308900             # Number of seconds simulated
sim_ticks             308900000000         # Number of ticks simulated
</pre>

Βλέπουμε αύξηση των ticks για το MinorCPU σε 42732000 και του χρόνου σε 0.000043 ενώ για το TimingSimpleCPU βλέπουμε αύξηση των ticks σε 47669000 και του χρόνου σε 0.000048.  
Για την DDR3_1600_8x8 ισχύει: 1.6*8*(8/8) = 12.8 GBps.  
Για την LPDDR2_S4_1066_1x32 ισχύει: 1.066*1*(32/8) = 4.3 GBps  
Άρα η LPDDR2_S4_1066_1x32 είναι πιο αργή. Συνεπώς η αύξηση των ticks και των χρόνων είναι αναμενόμενη.

### Κριτική
Ήταν ενδιαφέροντα τα όσα μάθαμε σε αυτήν την εργασία. Είδαμε από την θεωρία κάποια πράγματα πως ανταποκρόνονται στην πράξη. Συναντήσαμε κάποια προβλήματα κατά την εγκατάσταση των απαραίτητων λογισμικών καθώς και στην εγκατάσταση του λειτουργικού συστήματος αλλά λύθηκαν στην συνέχεια. Επίσης με την αλλαγή των παραμέτρων συχνότητας και μνήμης κατανοήσαμε πως αυτά επηρεαζουν την απόδοση του συστήματος. Μάθαμε για το git και την γλώσσα Markdown κάτι το οποίο βρήκαμε ενδιαφέρον και χρήσιμο.

### Βιβλιογραφία
http://www.gem5.org/  
https://www.gem5.org/documentation/general_docs/building  
http://learning.gem5.org/book/index.html  
http://learning.gem5.org/book/part1/example_configs.html  
http://www.gem5.org/documentation/learning_gem5/part1/simple_config/  
http://www.m5sim.org/InOrder  
http://www.gem5.org/documentation/general_docs/cpu_models/SimpleCPU  
http://www.gem5.org/documentation/general_docs/cpu_models/minor_cpu  
https://nitish2112.github.io/post/gem5-memory-model/  
http://www.gem5.org/documentation/learning_gem5/part1/gem5_stats/  
https://www.extremetech.com/extreme/188776-how-l1-and-l2-cpu-caches-work-and-why-theyre-an-essential-part-of-modern-chips  
https://nitish2112.github.io/post/gem5-minor-cpu/
