#!/bin/bash

# Triple-Threat Workflow Testing Script
# Tests all n8n workflows with sample industry data

echo "==================================="
echo "Triple-Threat Workflow Test Suite"
echo "==================================="
echo ""

# Colors for output
RED='\033[0:31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
N8N_URL="${N8N_URL:-http://localhost:5678}"
ENHANCED_WEBHOOK="/webhook/content-strategy-with-template"
ORIGINAL_WEBHOOK="/webhook/content-strategy-agent"
REFINEMENT_WEBHOOK="/webhook/refine-content"

echo "Testing against: $N8N_URL"
echo ""

# Function to test workflow
test_workflow() {
  local name="$1"
  local endpoint="$2"
  local data="$3"

  echo -n "Testing $name... "

  response=$(curl -s -w "\n%{http_code}" -X POST "$N8N_URL$endpoint" \
    -H "Content-Type: application/json" \
    -d "$data")

  http_code=$(echo "$response" | tail -n1)
  body=$(echo "$response" | sed '$d')

  if [ "$http_code" = "200" ]; then
    echo -e "${GREEN}✓ PASSED${NC} (HTTP $http_code)"
    return 0
  else
    echo -e "${RED}✗ FAILED${NC} (HTTP $http_code)"
    echo "Response: $body"
    return 1
  fi
}

# Test Counter
total_tests=0
passed_tests=0

echo "--- Enhanced Workflow with Industry Templates ---"
echo ""

# Test 1: B2B SaaS
total_tests=$((total_tests + 1))
if test_workflow "B2B SaaS Industry" "$ENHANCED_WEBHOOK" '{
  "industry": "b2b-saas",
  "business_name": "CloudMetrics Analytics",
  "target_customer": "Sales leaders at B2B companies",
  "unique_value_prop": "Real-time sales pipeline analytics",
  "competitor_urls": ["https://www.gong.io"],
  "business_goal": "Generate 200 demos per month"
}'; then
  passed_tests=$((passed_tests + 1))
fi

# Test 2: E-commerce
total_tests=$((total_tests + 1))
if test_workflow "E-commerce Industry" "$ENHANCED_WEBHOOK" '{
  "industry": "ecommerce",
  "business_name": "EcoThreads Fashion",
  "target_customer": "Eco-conscious millennials",
  "unique_value_prop": "Sustainable fashion from recycled materials",
  "competitor_urls": ["https://www.patagonia.com"],
  "business_goal": "30% MoM growth"
}'; then
  passed_tests=$((passed_tests + 1))
fi

# Test 3: Restaurant
total_tests=$((total_tests + 1))
if test_workflow "Restaurant Industry" "$ENHANCED_WEBHOOK" '{
  "industry": "restaurant",
  "business_name": "Bella Vita Kitchen",
  "target_customer": "Date night couples",
  "unique_value_prop": "Authentic Northern Italian cuisine",
  "competitor_urls": [],
  "business_goal": "Fill weekend tables"
}'; then
  passed_tests=$((passed_tests + 1))
fi

# Test 4: Healthcare
total_tests=$((total_tests + 1))
if test_workflow "Healthcare Industry" "$ENHANCED_WEBHOOK" '{
  "industry": "healthcare",
  "business_name": "Family Health Partners",
  "target_customer": "Families with children",
  "unique_value_prop": "Same-day appointments",
  "competitor_urls": [],
  "business_goal": "100 new families per quarter"
}'; then
  passed_tests=$((passed_tests + 1))
fi

# Test 5: Coaching
total_tests=$((total_tests + 1))
if test_workflow "Coaching Industry" "$ENHANCED_WEBHOOK" '{
  "industry": "coaching",
  "business_name": "Executive Edge Coaching",
  "target_customer": "Mid-level managers",
  "unique_value_prop": "Former Google VP helping tech leaders",
  "competitor_urls": [],
  "business_goal": "12 active clients at $3K/month"
}'; then
  passed_tests=$((passed_tests + 1))
fi

echo ""
echo "--- Original Workflow (Generic) ---"
echo ""

# Test 6: Original Workflow
total_tests=$((total_tests + 1))
if test_workflow "Original Workflow" "$ORIGINAL_WEBHOOK" '{
  "business_name": "TechFlow Solutions",
  "industry": "B2B SaaS",
  "target_customer": "Operations managers",
  "unique_value_prop": "Process automation without coding",
  "competitor_urls": ["https://zapier.com"],
  "business_goal": "1000 trial signups"
}'; then
  passed_tests=$((passed_tests + 1))
fi

echo ""
echo "==================================="
echo "Test Results:"
echo "==================================="
echo "Total Tests: $total_tests"
echo -e "Passed: ${GREEN}$passed_tests${NC}"
echo -e "Failed: ${RED}$((total_tests - passed_tests))${NC}"
echo ""

if [ $passed_tests -eq $total_tests ]; then
  echo -e "${GREEN}✓ All tests passed!${NC}"
  exit 0
else
  echo -e "${RED}✗ Some tests failed${NC}"
  exit 1
fi
