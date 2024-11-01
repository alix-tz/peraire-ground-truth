#!/bin/bash

source /home/ROCQ/almanach/achague/anaconda3/etc/profile.d/conda.sh # for conda envs

echo "Stage 1 of 4: Identifying the datasets"

#playground=$(pwd)/playground
echo "Building playground if necessary"
#mkdir -p $playground

# test if the playground directory exists
#if [ ! -d "$playground" ]; then
#    echo "The playground directory does not exist. Please run step 1 of the workflow first."
#    exit 1
#fi

ls -d $PWD/../data/train/*.xml > "$PWD/train.files"
ls -d $PWD/../data/test/*.xml > "$PWD/test.files"

echo "Stage 1 of 4: Identifying the datasets - DONE"

# -------------------------------------------

echo "Stage 2 of 4: Compiling the datasets into arrow files"
echo "This may take a while."

n_workers=16 
batch_size=2 # the greater the number, the more general the models will be

echo "Activating Kraken conda environment"
conda activate kraken

# if "kraken --version" does not work, stop the script
if ! kraken --version; then
    echo "Couldn't find kraken. Please check that the conda environment is activated."
    exit 1
fi

echo "Working with $(kraken --version)"

echo "Compiling the datasets into arrow files"

echo "Compiling the train and dev files into arrow files"
cat $PWD/train.files | xargs ketos compile --workers $n_workers -o "$PWD/train.arrow" --random-split .9 .1 .0 --save-splits -f alto

echo "Compiling the test files into arrow files"
cat $PWD/test.files | xargs ketos compile --workers $n_workers -o "$PWD/test.arrow" --random-split .0 .0 1.0 --save-splits -f alto

#for file in $PWD/*.files
#do
#    base=$(basename $file .files)
#    #cat $file | xargs ketos compile --workers $n_workers -o "$playground/$base.arrow" --random-split .9 .1 .0 --save-splits -f alto 
#    if [[ $base != *"test" ]]
#    then
#        echo "Compiling the train and dev files into arrow files"
#        cat $file | xargs ketos compile --workers $n_workers -o "$PWD/$base.arrow" --random-split .9 .1 .0 --save-splits -f alto 
#    fi
#    if [[ $base == *"test" ]]
#    then
#        echo "Compiling the test files into arrow files"
#        cat $file | xargs ketos compile --workers $n_workers -o "$PWD/$base.arrow" --random-split .0 .0 1.0 --save-splits -f alto 
#    fi
#done

echo "Making a list of dev and train arrow files for each datasets" # cf. issue #397 of kraken
ls -d $PWD/*.arrow > "arrow.files"

echo "Stage 2 of 4: Compiling the datasets into arrow files - DONE"

# -------------------------------------------

echo "Stage 3 of 4: Training Kraken models"
echo "This may take a while."


n_workers=16 
#n_epochs=50 # 4 for test purposes, 50 for real
batch_size=2 # the greater the number, the more general the models will be
#seeds="42 123 456 789 1011"


echo "Start training the models"

#cat $file | xargs ketos -s $seed train -o $playground/$base/models/$seed-$base -f binary --device cuda:0 -u NFC -s '[1,120,0,1 Cr3,13,32 Do0.1,2 Mp2,2 Cr3,13,32 Do0.1,2 Mp2,2 Cr3,9,64 Do0.1,2 Mp2,2 Cr3,9,64 Do0.1,2 S1(1x0)1,3 Lbx200 Do0.1,2 Lbx200 Do.1,2 Lbx200 Do]' -r 0.0001 -B $batch_size --augment --workers $n_workers --epochs $n_epochs -q dumb --logger tensorboard --log-dir $playground/$base > "$playground/$base/logs/$seed-$base.log"
#ls "$PWD/train.arrow" | xargs ketos train -o $PWD/peraire2_ft_MMCFR -f binary --device cuda:0 -u NFC -s '[1,120,0,1 Cr3,13,32 Do0.1,2 Mp2,2 Cr3,13,32 Do0.1,2 Mp2,2 Cr3,9,64 Do0.1,2 Mp2,2 Cr3,9,64 Do0.1,2 S1(1x0)1,3 Lbx200 Do0.1,2 Lbx200 Do.1,2 Lbx200 Do]' -r 0.0001 -B $batch_size --augment --workers $n_workers > "$PWD/kraken.log"
ls "$PWD/train.arrow" | xargs ketos train -o $PWD/peraire2_ft_MMCFR --load HTR-United-Manu_McFrench.mlmodel --resize add  -f binary --device cuda:0 -u NFC -s '[1,120,0,1 Cr3,13,32 Do0.1,2 Mp2,2 Cr3,13,32 Do0.1,2 Mp2,2 Cr3,9,64 Do0.1,2 Mp2,2 Cr3,9,64 Do0.1,2 S1(1x0)1,3 Lbx200 Do0.1,2 Lbx200 Do.1,2 Lbx200 Do]' -r 0.0001 -B $batch_size --augment --workers $n_workers --lag 15 > "$PWD/kraken.log"

conda deactivate

echo "Stage 3 of 4: Training Kraken models - DONE"

# -------------------------------------------

echo "Stage 4 of 4: Testing the models"

for model in $PWD/*.mlmodel
do
    basemodel=$(basename $model .mlmodel)
    echo "Testing $model"
    #ketos test -m $model -e "$playground/test_files.txt" -f alto --device cuda:0 -u NFC -B $batch_size --workers $n_workers > "$folder/tests/model_$basemodel.test"
    ls "$PWD/test.arrow" | xargs ketos test -m $model -f binary --device cuda:0 -u NFC -B $batch_size --workers $n_workers > "$PWD/model_$basemodel.test"
done
