# Αρχιτεκτονική Προηγμένων Υπολογιστών Εργαστήριο 1 - Αναφορά

**Ομάδα 6**

**Τοπαλίδης Ευθύμης (8417)**

**Τσιαμήτας Γιώργος (8742)**

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
