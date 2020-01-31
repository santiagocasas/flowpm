#!/bin/bash
#SBATCH --nodes=8
#SBATCH -q gpu_preempt
#SBATCH --ntasks-per-node=1
#SBATCH --constraint=gpu
#SBATCH --time=120
#SBATCH --gres=gpu:8
#SBATCH --exclusive -A m1759
 
module purge && module load  esslurm gcc/7.3.0 python3 cuda/10.1.243



#for nc in 128 256 512 1024 2048; do 
for nc in 2048 1024 512 256 128; do 
    nx=64
    ny=1
    echo
    echo Starting $nx $ny
    if [[ $(find ./timelogs/log_$nc-b1$nx-b2$ny -type f -size +1000c 2>/dev/null) ]]
       then
	   echo ./timelogs/log_$nc-b1$nx-b2$ny exists
    else
	time srun python fft_benchmark.py --cube_size=$nc --batch_size=1 --mesh_shape="b1:$nx;b2:$ny" --layout="nx:b1;ny:b2" --output_file="timeline-b1$nx-b2$ny" > ./timelogs/log_$nc-b1$nx-b2$ny
    fi

    nx=32
    ny=2
    echo
    echo Starting $nx $ny
    if [[ $(find ./timelogs/log_$nc-b1$nx-b2$ny -type f -size +1000c 2>/dev/null) ]]
       then
	   echo ./timelogs/log_$nc-b1$nx-b2$ny exists
    else
	time srun python fft_benchmark.py --cube_size=$nc --batch_size=1 --mesh_shape="b1:$nx;b2:$ny" --layout="nx:b1;ny:b2" --output_file="timeline-b1$nx-b2$ny" > ./timelogs/log_$nc-b1$nx-b2$ny
    fi

    nx=16
    ny=4
    echo
    echo Starting $nx $ny
    if [[ $(find ./timelogs/log_$nc-b1$nx-b2$ny -type f -size +1000c 2>/dev/null) ]]
       then
	   echo ./timelogs/log_$nc-b1$nx-b2$ny exists
    else
	time srun python fft_benchmark.py --cube_size=$nc --batch_size=1 --mesh_shape="b1:$nx;b2:$ny" --layout="nx:b1;ny:b2" --output_file="timeline-b1$nx-b2$ny" > ./timelogs/log_$nc-b1$nx-b2$ny
    fi


    nx=8
    ny=8
    echo
    echo Starting $nx $ny
    if [[ $(find ./timelogs/log_$nc-b1$nx-b2$ny -type f -size +1000c 2>/dev/null) ]]
       then
	   echo ./timelogs/log_$nc-b1$nx-b2$ny exists
    else
	time srun python fft_benchmark.py --cube_size=$nc --batch_size=1 --mesh_shape="b1:$nx;b2:$ny" --layout="nx:b1;ny:b2" --output_file="timeline-b1$nx-b2$ny" > ./timelogs/log_$nc-b1$nx-b2$ny
    fi


    nx=4
    ny=16
    echo
    echo Starting $nx $ny
    if [[ $(find ./timelogs/log_$nc-b1$nx-b2$ny -type f -size +1000c 2>/dev/null) ]]
       then
	   echo ./timelogs/log_$nc-b1$nx-b2$ny exists
    else
	time srun python fft_benchmark.py --cube_size=$nc --batch_size=1 --mesh_shape="b1:$nx;b2:$ny" --layout="nx:b1;ny:b2" --output_file="timeline-b1$nx-b2$ny" > ./timelogs/log_$nc-b1$nx-b2$ny
    fi



    nx=2
    ny=32
    echo
    echo Starting $nx $ny
    if [[ $(find ./timelogs/log_$nc-b1$nx-b2$ny -type f -size +1000c 2>/dev/null) ]]
       then
	   echo ./timelogs/log_$nc-b1$nx-b2$ny exists
    else
	time srun python fft_benchmark.py --cube_size=$nc --batch_size=1 --mesh_shape="b1:$nx;b2:$ny" --layout="nx:b1;ny:b2" --output_file="timeline-b1$nx-b2$ny" > ./timelogs/log_$nc-b1$nx-b2$ny
    fi

    nx=1
    ny=64
    echo
    echo Starting $nx $ny
    if [[ $(find ./timelogs/log_$nc-b1$nx-b2$ny -type f -size +1000c 2>/dev/null) ]]
       then
	   echo ./timelogs/log_$nc-b1$nx-b2$ny exists
    else
	time srun python fft_benchmark.py --cube_size=$nc --batch_size=1 --mesh_shape="b1:$nx;b2:$ny" --layout="nx:b1;ny:b2" --output_file="timeline-b1$nx-b2$ny" > ./timelogs/log_$nc-b1$nx-b2$ny
    fi


done
