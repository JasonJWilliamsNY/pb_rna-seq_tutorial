#!/bin/sh

cd /sra_files
vdb-validate *.sra 2>&1 |tee vdb-validation.txt
