#!/usr/bin/env bash

echo " "
echo " Pet Clinic Benchmark"
echo " "

if [ $# -eq 0 ]; then
  echo "No data model file name supplied"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Data model file name is empty"
  exit 1
fi

echo "Initial memory usage"

./show-mem.sh $1


echo " "
echo "Starting benchmark..."
echo " "

echo "Step 1"
curl -s http://localhost:8080/owners/find >/dev/null
sleep 1

echo "Step 2"
curl -s http://localhost:8080/owners?lastName= >/dev/null
sleep 1

echo "Step 3"
curl -s http://localhost:8080/owners/1002 >/dev/null
sleep 1

echo "Step 4"
curl -s http://localhost:8080/owners?lastName= >/dev/null
sleep 1

echo "Step 5"
curl -s http://localhost:8080/owners/1005 >/dev/null
sleep 1

echo "Step 6"
curl -s http://localhost:8080/owners?lastName= >/dev/null
sleep 1

echo "Step 7"
curl -s http://localhost:8080/owners/1009 >/dev/null
sleep 1

echo "Step 8"
curl -s http://localhost:8080/vets.html >/dev/null
sleep 1

echo "Step 9"
curl -s http://localhost:8080/owners/1002/edit >/dev/null
sleep 1

echo "Step 10"
curl -s http://localhost:8080/owners/1002/pets/1002/edit >/dev/null
sleep 1

echo "Step 11"
curl -s http://localhost:8080/owners/1002/pets/1002/visits/new >/dev/null
sleep 1

echo "Step 12"
curl -s http://localhost:8080/oups >/dev/null
sleep 1


./show-mem.sh $1


echo " "
echo " Done with Pet Clinic Benchmark."
echo " "
