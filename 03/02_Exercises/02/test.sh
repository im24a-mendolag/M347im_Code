#!/bin/bash
#
PORT=5000
BASE_URL="http://localhost:${PORT}"

echo "=== Testing Flask App on ${BASE_URL} ==="

echo ""
echo "--- GET / ---"
curl -s "${BASE_URL}/"

echo ""
echo "--- GET /api/termine ---"
curl -s "${BASE_URL}/api/termine"

echo ""
echo "--- POST /api/termin ---"
curl -s -X POST "${BASE_URL}/api/termin"

echo ""
echo ""
curl -X POST -H "Content-Type application/json" \
    -d '{"salutation": "Mister","firstname":"John", "lastname":"Doe", "appointment": "2023-06=23T14:25"}' \
    http://localhost:5000/api/termin