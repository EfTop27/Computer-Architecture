# Αρχιτεκτονική Προηγμένων Υπολογιστών
## Εργαστήριο 3 - Αναφορά

**Εργαστήριο Β - Ομάδα 6**

**Τοπαλίδης Ευθύμης  (8417)**

**Τσιαμήτας Γιώργος  (8742)**

### Βήμα 1
### Ερώτημα 1

Dynamic Power: Είναι η δυναμική ισχύς που καταναλώνεται κατά τη διαδικασία φόρτισης και εκφόρτισης του χωρητικού φορτίου μίας πύλης καθώς μεταγάγει η πύλη αυτή. Δίνεται από τον τύπο: Pswitching = α*C * (Vdd^2) * f,  
όπου α είναι ο παράγοντας δραστηριότητας μεταγωγωγής. Αν ένα κύκλωμα αλλάζει κατάσταση 2 φορές στον κύκλο τότε έχει α=1, αν αλλάζει μία φορά στον κύκλο εχει α=0.5 κι αν αλλαζει μία φορά κάθε δεύτερο κύκλο εχει α=0.25. C είναι η χωρητικότητα του φορτίου (χωρητικότητα πύλης, διάχυσης και αγωγών διασύνδεσης), Vdd είναι η τάση τροφοδοσίας και f η συχνότητα του ρολογιού. Αν θέλουμε να μειώσουμε την ισχύ σε έναν κόμβο του κυκλώματος μειώνοντας τον παράγοντα μεταγωγής α, μπορούμε να εφαρμόσουμε την τεχνικη clock gating για να απενεργοποιούμε όποτε ειναι επιτρεπτό κάποιο block του κυκλώματος. Επίσης μπορούμε να μειώσουμε τη συχνότητα λειτουργίας-που εξαρτάται από την τάση τροφοδοσίας- μειώνοτας έτσι το μέγεθος των τρανζίστορ ή την τάση τροφοδοσίας(αν το επιτρέπει και η τεχνολογία ολοκλήρωσης του κυκλώματος μας).

Leakage: Ένα άλλο μεγάλο κομμάτι της συνολικής ισχύς αφορά την στατική ισχύ. Υπάρχει κατανάλωση στατικής ισχύος ακόμη κι όταν το ολοκληρωμένο μας δεν αλλάζει κατάσταση. Δίνεται από τον τύπο Pstatic = Ileakage * Vdd, Ileakage = Isub + Igate.  
Το ρεύμα διαρροής υποκατωφλίου Isub ρέει όταν ένα τρανζίστορ είναι OFF. To ρεύμα διαρροής πύλης Isub αναφέρεται στους φορείς που καταφέρνουν να περάσουν από το διηλεκτρικό πύλης όταν εφαρμόζεται τάση στα άκρα της πύλης. Η ποσότητα αυτού του ρεύματος εξαρτάται από το πάχος του διηλεκτρικού και την τάση στα άκρα της πύλης. Επίσης το leakage δεν αφορά μόνο τα τρανζίστορ των πυλών αλλά αφορά και τις γραμμές διασύνδεσης των πυλών όπου υπάρχει και εκεί κατανάλωση ισχύος.

Αν τρέξουμε διαφορετικά προγράμματα σε έναν επεξεργαστή καταλαβαίνουμε έυκολα ότι θα επηρεαστεί η δυναμική ισχύς επειδή για κάθε πρόγραμμα θα έχουμε διαφορετικές συχνότητες μεταγωγής των κυκλωμάτων λόγω των διαφορετικών χρήσεων του υλικού που κάνει το κάθε πρόγραμμα ενώ η στατική ισχύς είναι ανεπηρέαστη από το ποιο προγράμμα εκτελείται κάθε φορά καθώς εξαρτάται απολειστικά από το layout των τρανζίστορ και την τάση τροφοδοσίας που είναι κατάλληλη για την λειτουργία τους.


### Ερώτημα 2

Δεν μπορούμε να βγάλουμε ασφαλή συμπεράσματα για το ποιος από τους 2 επεξέργαστές δίνει τη μεγαλύτερη διάρκεια ζωής στη μπαταρία καθώς θα ήταν λάθος αν προτρέχαμε και λέγαμε ότι ο επεξεργαστής με τα 40 watt κατανάλωση θα εξαντλήσει γρηγορότερα την μπαταρία καθώς δεν έχουμε καμία πληροφορία για τον χρόνο λειτουργίας των 2 επεξεργαστών ή των προγραμμάτων που καλούνται να εκτελέσουν. Έτσι, το ΜcPAT ενώ μας δίνει πληροφορία του Peak Power των δύο επεξεργαστών, δεν μας δίνει την πληροφορία του Runtime Dynamic Power για να απαντήσουμε σωστά στο ερώτημα. Συγκεκριμένα, κατά την κλήση του McPAT από τον performance simulator(στην περίπτωσή μας ο GEM5), o τελευταίος πρέπει να παρέχει στον πρώτο στατιστικά και συγκεκριμένα τους παράγοντες μεταγωγής για κάθε κύκλωμα του επεξεργαστή μέσω του XML interface file. O παράγοντας μεταγωγής δίνεται από τον παρακάτω τύπο:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/activity_factor.png" width="50%" height="50%">

AccessCount: Είναι ο αριθμός των προσβάσεων που γίνεται στο συγκεκριμένο κύκλωμα επί το μέσο όρο του HammingDistance(αριθμός των bits που αλλάζουν κατάσταση) στο χρονικό διάστημα που θέλουμε να βλέπουμε το runtime power consumption. Γίνεται πιο ακριβής η προσομοίωσή μας καθώς μειώνουμε το χρονικό διάστημα π.χ. στον έναν κύκλο ρολογιού, δηλαδή επιλέγουμε να παίρνουμε δεδομένα για την ισχύ σε κάθε κύκλο ρολογιού. Ακόμη αν δεν έχουμε τους activity factors για κάθε component, μπορούμε να δώσουμε γενικά στοιχεία απόδοσης του συστήματός μας όπως π.χ. το πόσες φορές προσπεάστηκε η L1 cache(overall access times).  
Έχοντας στη διάθεση μας τις παραπάνω στατιστικές πληροφορίες, μόνο τότε ο McPAT θα μπορέσει να μας δώσει ασφαλή απάντηση για το ποιον από τους 2 επεξεργαστές να χρησιμοποιήσουμε για το σύστημά μας ώστε να επεκτείνουμε όσο γίνεται περισσότερο τη χρονική διάρκεια ζωής της μπαταρίας.


### Ερώτημα 3

Τρέχουμε το McPAT για τον Xeon (Xeon.xml) και για τον ARM A9 (ARM_A9_2GHz.xml) και παίρνουμε τα παρακάτω αποτελέσματα:

Xeon:
<pre>
McPAT (version 1.3 of Feb, 2015) is computing the target processor...
 

McPAT (version 1.3 of Feb, 2015) results (current print level is 1, please increase print level to see the details in components): 
*****************************************************************************************
  Technology 65 nm
  Using Long Channel Devices When Appropriate
  Interconnect metal projection= aggressive interconnect technology projection
  Core clock Rate(MHz) 3400

*****************************************************************************************
Processor: 
  Area = 410.507 mm^2
  Peak Power = 134.938 W
  Total Leakage = 36.8319 W
  Peak Dynamic = 98.1063 W
  Subthreshold Leakage = 35.1632 W
  Subthreshold Leakage with power gating = 16.3977 W
  Gate Leakage = 1.66871 W
  Runtime Dynamic = 72.9199 W

  Total Cores: 2 cores 
  Device Type= ITRS high performance device type
    Area = 111.713 mm^2
    Peak Dynamic = 78.5978 W
    Subthreshold Leakage = 24.1131 W
    Subthreshold Leakage with power gating = 10.3006 W
    Gate Leakage = 1.49026 W
    Runtime Dynamic = 55.7891 W

  Total L3s: 
  Device Type= ITRS high performance device type
    Area = 293.281 mm^2
    Peak Dynamic = 6.70159 W
    Subthreshold Leakage = 10.9824 W
    Subthreshold Leakage with power gating = 6.06659 W
    Gate Leakage = 0.165767 W
    Runtime Dynamic = 4.32382 W

  Total NoCs (Network/Bus): 
  Device Type= ITRS high performance device type
    Area = 5.51364 mm^2
    Peak Dynamic = 12.807 W
    Subthreshold Leakage = 0.0678232 W
    Subthreshold Leakage with power gating = 0.0305204 W
    Gate Leakage = 0.0126787 W
    Runtime Dynamic = 12.807 W

*****************************************************************************************
</pre>


ARM_A9_2GHz:
<pre>
McPAT (version 1.3 of Feb, 2015) is computing the target processor...
 

McPAT (version 1.3 of Feb, 2015) results (current print level is 1, please increase print level to see the details in components): 
*****************************************************************************************
  Technology 40 nm
  Using Long Channel Devices When Appropriate
  Interconnect metal projection= conservative interconnect technology projection
  Core clock Rate(MHz) 2000

*****************************************************************************************
Processor: 
  Area = 5.39698 mm^2
  Peak Power = 1.74189 W
  Total Leakage = 0.108687 W
  Peak Dynamic = 1.6332 W
  Subthreshold Leakage = 0.0523094 W
  Gate Leakage = 0.0563774 W
  Runtime Dynamic = 2.96053 W

  Total Cores: 2 cores 
  Device Type= ITRS low operating power device type
    Area = 4.84735 mm^2
    Peak Dynamic = 1.57159 W
    Subthreshold Leakage = 0.0484486 W
    Gate Leakage = 0.0501375 W
    Runtime Dynamic = 1.06575 W

  Total First Level Directory: 
  Device Type= ITRS low operating power device type
    Area = 0.535391 mm^2
    Peak Dynamic = 0.045212 W
    Subthreshold Leakage = 0.00370577 W
    Gate Leakage = 0.0060234 W
    Runtime Dynamic = 1.81276 W

  Total NoCs (Network/Bus): 
  Device Type= ITRS low operating power device type
    Area = 0.014239 mm^2
    Peak Dynamic = 0.0164048 W
    Subthreshold Leakage = 0.000155022 W
    Gate Leakage = 0.000216526 W
    Runtime Dynamic = 0.0820239 W

*****************************************************************************************
</pre>

Στην εκφώνηση γίνεται η υπόθεση ότι ο Xeon μπορεί την ίδια εφαρμογή με τον A9 40 φορές γρηγορότερα. Έτσι αν ο Xeon τρέχει ένα πρόγραμμα σε χρόνο t τότε ο A9 θα τρέχει το ίδιο πρόγραμμα σε χρόνο 40*t.

Το energy efficiency πρόκειται για τον ρυθμό στον οποίο καταναλώνεται η ισχύς στον χρόνο.
Άρα για την ενέργεια έχουμε E = Runtime_Dynamic * time

Xeon:  E = 72.9199 * t = 72.9190*t

ARM_A9_2GHz:  2.96053 * 40*t = 118.4212*t

Βλέπουμε ότι ο Xeon καταναλώνει λιγότερη ενέργεια από τον A9. Όμως σύμφωνα με την εκφώνηση δεν διακόπτεται η λειτουργία του συστήματος μόλις ολοκληρωθεί η εκτέλεση της εφαρμογής. Η ενέργεια που υπολογίστηκε παραπάνω αφορά την ενέργεια κατα την διαδικασία εκτέλεσης του προγράμματος. Αλλά όταν τα transistor είναι σε off state υπάρχει leakage. Βλέπουμε ότι για τον Xeon έχουμε total leakage 36.8319 W ενώ για τον ARM_A9_2GHz έχουμε total leakage 0.108687 W. Ο λόγος των τιμών των leakage είναι 36.8319/0.108687=338.8804. Συνεπώς αφού το leakage του xeon είναι περίπου 338 φορές μεγαλύτερο από το leakage του A9 και οι χρόνοι εκτέλεσης είναι αντίστοιχα t και 40*t αντίστοιχα η ενέργεια η οποία τελικά καταναλώνει ο Xeon είναι περισσότερη καθώς βρίσκεται για αρκετό χρονικό διάστημα κατάσταση όπου υπάρχει leakage. Έτσι ο ARM_A9_2GHz είναι πιο energy efficient από τον Xeon.


### Βήμα 2

Για το βήμα 2 με το αρχείο GEM5ToMcPAT.py και έχοντας ως είσοδο τα αρχεα config.json και stats.txt από τα benchmarks του προηγούμενου εργαστηρίου δημιουργούμε τα xml αρχεα τα οποία αποτελούν είσοδο για το McPAT.  
Στη συνέχεια τρέχουμε το McPAT με print_level 5 για όλες τις περιπτώσεις των benchmarks του προηγούμενου εργαστηρίου.

Στα παρακάτω ερωτήματα τα στοιχεία για την αρχική προσομοίωση (default) και τις συνδυαστικές προσομοιώσεις(first, second, third, fourth, fifth) φαίνονται παρακάτω:  
default: iL1_size = 32k, dL1_size = 64k, iL1_assoc = 2, dL1_assoc = 2, L2_size = 2MB, L2_assoc = 8, cache_line_size = 64B  
fisrt: iL1_size = 64kB, dL1_size = 128kB, iL1_assoc = 4, dL1_assoc = 4, L2_size = 1MB, L2_assoc = 8, cache_line = 64  
second: iL1_size = 64kB, dL1_size = 128kB, iL1_assoc = 4, dL1_assoc = 4, L2_size = 256kB, L2_assoc = 8, cache_line = 64  
third: iL1_size = 32kB, dL1_size = 128kB, iL1_assoc = 4, dL1_assoc = 8, L2_size = 512kB, L2_assoc = 8, cache_line = 64  
fourth: iL1_size = 16kB, dL1_size = 64kB, iL1_assoc = 4, dL1_assoc = 4, L2_size = 2MB, L2_assoc = 16, cache_line = 64  
fifth: iL1_size = 32kB, dL1_size = 128kB, iL1_assoc = 4, dL1_assoc = 8, L2_size = 4MB, L2_assoc = 16, cache_line = 128

Επίσης τρέχουμε τον McPAT και τις προσομοιώσεις του πορηγούμενου εργαστηρίου όπου αλλάζουμε μεμονωμένα κάθε παράμετρο.

### Ερώτημα 1

Χρησιμοποιούμε τα αποτελέσματα για το core και για την L2 αθροιστικά και υπολογίζουμε την κατανάλωση ενέργειας για όλες τις περιπτώσεις.  
Ο υπολογισμός την ενέργειας έγινε με τον τύπο:  
energy_sum = (subthreshold_leakage_core + gate_leakage_core + runtime_dynamic_core + subthreshold_leakage_l2 + gate_leakage_l2 + runtime_dynamic_l2)*runtime  
Το runtime είναι τα simulation seconds που προκύπτουν από το αρχεο stats.txt.  
Παρακάτω φαίνονται τα αντίστοιχα γραφήματα:

Ενέργεια αθροιστικά για το core και την L2 σχετικά με τις συνδυαστικς προσομοιώσεις:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_sum/energy_sum_simulations.png" width="60%" height="60%">

Ενέργεια αθροιστικά για το core και την L2 σχετικά με L1 icache size και L1 icache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_sum/energy_sum_l1i_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_sum/energy_sum_l1i_assoc.png" width="49%" height="49%">

Ενέργεια αθροιστικά για το core και την L2 σχετικά με L1 dcache size και L1 dcache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_sum/energy_sum_l1d_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_sum/energy_sum_l1d_assoc.png" width="49%" height="49%">

Ενέργεια αθροιστικά για το core και την L2 σχετικά με L2 cache size και L2 cache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_sum/energy_sum_l2_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_sum/energy_sum_l2_assoc.png" width="49%" height="49%">

Ενέργεια αθροιστικά για το core και την L2 σχετικά με cache line size:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_sum/energy_sum_cache_line_size.png" width="49%" height="49%">


Επίσης με χρήση του αρχείου print_energy.py υπολογίσαμε την συνολική ενέργεια για κάθε benchmark.  
Εδώ γίνεται χρησιμοποιείται ο τύπος: Energy = (Total Leakage + Runtime Dynamic) * Runtime  
Το Runtime είναι τα simulation seconds που προκύπτουν από το αρχεο stats.txt.  
Παρακάτω φαίνονται τα αντίστοιχα γραφήματα:

Ενέργεια σχετικά με τις συνδυαστικς προσομοιώσεις:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy/energy_simulations.png" width="60%" height="60%">

Ενέργεια σχετικά με L1 icache size και L1 icache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy/energy_l1i_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy/energy_l1i_assoc.png" width="49%" height="49%">

Ενέργεια σχετικά με L1 dcache size και L1 dcache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy/energy_l1d_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy/energy_l1d_assoc.png" width="49%" height="49%">

Ενέργεια σχετικά με L2 cache size και L2 cache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy/energy_l2_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy/energy_l2_assoc.png" width="49%" height="49%">

Ενέργεια σχετικά με cache line size:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy/energy_cache_line_size.png" width="49%" height="49%">


### Ερώτημα 2

Στη συνέχεια δείχνουμε την επίδραση κάθε παραμέτρου σε σχέση με το peak power.  
Τα σχετικά γραφήματα φαίνονται παρακάτω:

Peak power σχετικά με τις συνδυαστικς προσομοιώσεις:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/peak_power/peak_power_simulations.png" width="60%" height="60%">

Peak power σχετικά με L1 icache size και L1 icache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/peak_power/peak_power_l1i_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/peak_power/peak_power_l1i_assoc.png" width="49%" height="49%">

Peak power σχετικά με L1 dcache size και L1 dcache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/peak_power/peak_power_l1d_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/peak_power/peak_power_l1d_assoc.png" width="49%" height="49%">

Peak power σχετικά με L2 cache size και L2 cache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/peak_power/peak_power_l2_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/peak_power/peak_power_l2_assoc.png" width="49%" height="49%">

Peak power σχετικά με cache line size:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/peak_power/peak_power_cache_line_size.png" width="49%" height="49%">


#### Energy - Delay (EDP)
Πρωτού προχωρήσουμε σε οποιαδήποτε βελτιστοποίηση energy και area πρώτα θέοτουμε τα time constraints που πρέπει να πληρούνται.

Το Energy-Delay (EDP) υπολογίζεται από τον τύπο EDP = Energy * Runtime. Το Runtime προκύπτει από το αρχεο stats.txt και πιο συγκεκριμένα από το sim_seconds.  
Παρακάτω φαίνονται τα διαγράμματα του EDP για όλες τις περιπτώσεις.

EDP σχετικά με τις συνδυαστικς προσομοιώσεις:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_delay_edp/energy_delay_edp_simulations.png" width="60%" height="60%">

EDP σχετικά με L1 icache size και L1 icache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_delay_edp/energy_delay_edp_l1i_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_delay_edp/energy_delay_edp_l1i_assoc.png" width="49%" height="49%">

EDP σχετικά με L1 dcache size και L1 dcache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_delay_edp/energy_delay_edp_l1d_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_delay_edp/energy_delay_edp_l1d_assoc.png" width="49%" height="49%">

EDP σχετικά με L2 cache size και L2 cache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_delay_edp/energy_delay_edp_l2_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_delay_edp/energy_delay_edp_l2_assoc.png" width="49%" height="49%">

EDP σχετικά με cache line size:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/energy_delay_edp/energy_delay_edp_cache_line_size.png" width="49%" height="49%">


Για να εξηγήσουμε τα αποτελέσματα για το EDP βλέπουμε και τα διαγράμματα τα οποία προκύπτουν από την συνάρτηση κόστους για όλες τις περιπτώσεις.

Cost σχετικά με τις συνδυαστικς προσομοιώσεις:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/cost_function/cost_simulations.png" width="60%" height="60%">

Cost σχετικά με L1 icache size και L1 icache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/cost_function/cost_L1_icache_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/cost_function/cost_L1_icache_assoc.png" width="49%" height="49%">

Cost σχετικά με L1 dcache size και L1 dcache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/cost_function/cost_L1_dcache_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/cost_function/cost_L1_dcache_assoc.png" width="49%" height="49%">

Cost σχετικά με L2 cache size και L2 cache associativity:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/cost_function/cost_L2_cache_size.png" width="49%" height="49%"> <img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/cost_function/cost_L2_cache_assoc.png" width="49%" height="49%">

Cost σχετικά με cache line size:  
<img src="https://github.com/gtsiamit/Computer-Architecture/blob/main/Lab_3/charts/images/cost_function/cost_cache_line_size.png" width="49%" height="49%">


Υπάρχουν αποκλίσεις από την προσομοίωση σε σχέση με την πραγματικότητα διότι δε μπορούν να μοντελοποιηθούν με απόλυτη ακρίβεια οι activity factors και το switching activity των ψηφιακών κυκλωμάτων. Επίσης το McPAT εισάγει κάποιες αποκλίσεις στον υπολογισμό των ισχύων - μικρότερο σφάλμα στην average ισχύ - διότι υπάρχουν πολύπλοκα SoC(SystemOnChip) με διαφορετικά Ι/Οs, PCIe etc... Eπίσης εχουμε αποκλίσεις στο clock power και στο leakage power λόγω μη εύρεσης βέλτιστων μοντέλων που προσομοιώνουν σωστά τις CPUs.


### Κριτική
Σε αυτό το εργαστήριο είδαμε την σχέση της απόδοσης του συστήματος με την κατανάλωση ενέργειας και κατανοήσαμε τις παραμέτρους και τον τρόπο με τον οποίο επηρεάζουν την απόδοση του συστήματος. Επίσης είδαμε πως γίνεται κάποιος συμβιβασμός μεταξύ ενέργειας και χρόνου για την βελτίωση της απόδοσης του συστήματος. Γενικά αυτά τα εργαστήρια μας έδωσαν μια ξεκάθαρη εικόνα για τα δομικά στοιχεία τα οποία αποτελούν ένα υπολογιστικό σύστημα και πως συμβάλλει η αρχιτεκτονική στην βελτίωση των επιδόσεων καθώς η αύξηση του αριθμού των τρανζίστορ σε ένα ολοκληρωμένο έχει φτάσει σε κορεσμό. Για κάποιες προσομοιώσεις των εργαστηρίων απαιτήθηκε αρκετός χρόνος ώστε να ολοκληρωθούν. Επίσης μπήκαμε στην διαδικασία αναζήτησης κάποιων τεχνικών που χρησιμοποιούνται στην αρχιτεκτονική υπολογιστών.


### Βιβλιογραφία
https://www.hpl.hp.com/research/mcpat/  
https://www.hpl.hp.com/research/mcpat/micro09.pdf  
https://www.hpl.hp.com/research/mcpat/McPATAlpha_TechRep.pdf  
https://www.sciencedirect.com/topics/computer-science/dynamic-power-dissipation  
https://en.wikipedia.org/wiki/Performance_per_watt  
http://www.eecs.harvard.edu/~dbrooks/cs246/cs246-lecture2.pdf  
http://www.princeton.edu/~mrm/tutorial/hpca2001_tutorial.pdf


