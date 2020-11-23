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
