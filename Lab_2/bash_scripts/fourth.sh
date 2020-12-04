# fourth

./build/ARM/gem5.opt -d spec_results/vima_2_erotima_1/specbzip_fourth configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1i_size=16kB --l2_size=2MB --l1i_assoc=4 --l1d_assoc=4 --l2_assoc=16 --cacheline_size=64 -c spec_cpu2006/401.bzip2/src/specbzip -o "spec_cpu2006/401.bzip2/data/input.program 10" -I 100000000

./build/ARM/gem5.opt -d spec_results/vima_2_erotima_1/specmcf_fourth configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1i_size=16kB --l2_size=2MB --l1i_assoc=4 --l1d_assoc=4 --l2_assoc=16 --cacheline_size=64 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000

./build/ARM/gem5.opt -d spec_results/vima_2_erotima_1/spechmmer_fourth configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1i_size=16kB --l2_size=2MB --l1i_assoc=4 --l1d_assoc=4 --l2_assoc=16 --cacheline_size=64 -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

./build/ARM/gem5.opt -d spec_results/vima_2_erotima_1/specsjeng_fourth configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1i_size=16kB --l2_size=2MB --l1i_assoc=4 --l1d_assoc=4 --l2_assoc=16 --cacheline_size=64 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

./build/ARM/gem5.opt -d spec_results/vima_2_erotima_1/speclibm_fourth configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1d_size=64kB --l1i_size=16kB --l2_size=2MB --l1i_assoc=4 --l1d_assoc=4 --l2_assoc=16 --cacheline_size=64 -c spec_cpu2006/470.lbm/src/speclibm -o "20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" -I 100000000
