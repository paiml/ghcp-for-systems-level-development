#!/bin/bash
# Simple test script for bash scripts

echo "Running bashrs cleanup example tests..."
echo ""

SCRIPTS_DIR="$(cd "$(dirname "$0")/../scripts" && pwd)"
PASSED=0
FAILED=0

# Test 1: Scripts exist
if [[ -f "${SCRIPTS_DIR}/messy-deploy.sh" ]] && [[ -f "${SCRIPTS_DIR}/clean-deploy.sh" ]]; then
    echo "✓ Scripts exist"
    ((PASSED++))
else
    echo "✗ Scripts exist"
    ((FAILED++))
fi

# Test 2: Scripts are executable
if [[ -x "${SCRIPTS_DIR}/messy-deploy.sh" ]] && [[ -x "${SCRIPTS_DIR}/clean-deploy.sh" ]]; then
    echo "✓ Scripts are executable"
    ((PASSED++))
else
    echo "✗ Scripts are executable"
    ((FAILED++))
fi

# Test 3: Scripts have valid syntax
if bash -n "${SCRIPTS_DIR}/messy-deploy.sh" 2>/dev/null && bash -n "${SCRIPTS_DIR}/clean-deploy.sh" 2>/dev/null; then
    echo "✓ Scripts have valid syntax"
    ((PASSED++))
else
    echo "✗ Scripts have valid syntax"
    ((FAILED++))
fi

# Summary
echo ""
echo "================================"
echo "Passed: ${PASSED}"
echo "Failed: ${FAILED}"
echo "================================"

[[ ${FAILED} -eq 0 ]] && echo "All tests passed!" && exit 0
echo "Some tests failed!" && exit 1
