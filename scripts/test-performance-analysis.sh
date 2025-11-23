#!/bin/bash

# Test script for Performance Analysis endpoint (Stage 3)
# Usage: ./test-performance-analysis.sh <webhook_url> [api_key]

set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check arguments
if [ -z "$1" ]; then
    echo -e "${RED}Error: Webhook URL required${NC}"
    echo "Usage: $0 <webhook_url> [api_key]"
    echo "Example: $0 https://your-n8n.com/webhook/content-performance-analysis your_api_key"
    exit 1
fi

WEBHOOK_URL="$1"
API_KEY="${2:-}"

echo -e "${YELLOW}🚀 Testing Content Strategy Agent - Performance Analysis${NC}"
echo "Endpoint: $WEBHOOK_URL"
echo ""

# Prepare headers
if [ -n "$API_KEY" ]; then
    HEADERS=(-H "Content-Type: application/json" -H "X-API-Key: $API_KEY")
    echo -e "${GREEN}✓ Using API key authentication${NC}"
else
    HEADERS=(-H "Content-Type: application/json")
    echo -e "${YELLOW}⚠ No API key provided (not recommended for production)${NC}"
fi

# Test data
TEST_DATA='{
  "ORIGINAL_POST_COPY": "Most SaaS companies think PLG requires freemium.\\n\\nThey are wrong.\\n\\nI have helped 12 B2B companies implement PLG with paid-only products.\\n\\nHere is what matters:\\n→ Self-service onboarding\\n→ Value in <15 min\\n→ Usage-based expansion\\n\\nFreemium is ONE way. Not the ONLY way.\\n\\nComment PLG for our framework.",
  "PLATFORM": "LinkedIn",
  "ACTUAL_ENGAGEMENT_METRICS": "Impressions: 4,200, Likes: 68, Comments: 12, Shares: 3, Engagement Rate: 2.0%, CTR: 0.43%",
  "PERFORMANCE_BENCHMARK": "Expected Engagement Rate: 5.5%, Expected CTR: 2.5%, Expected Comments: 40+",
  "BUSINESS_GOAL": "increase newsletter signups by 25%",
  "TARGET_AUDIENCE": "Marketing Directors at mid-market SaaS companies, 30-45 years old"
}'

echo -e "${YELLOW}📤 Sending request...${NC}"
echo ""

# Make request and capture response
RESPONSE=$(curl -s -w "\n%{http_code}" \
    "${HEADERS[@]}" \
    -d "$TEST_DATA" \
    "$WEBHOOK_URL")

# Extract HTTP code and body
HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
BODY=$(echo "$RESPONSE" | sed '$d')

echo -e "${YELLOW}📥 Response received${NC}"
echo "HTTP Status: $HTTP_CODE"
echo ""

# Check status code
if [ "$HTTP_CODE" -eq 200 ]; then
    echo -e "${GREEN}✓ Success! Status code 200${NC}"
    echo ""

    # Validate JSON response
    if echo "$BODY" | jq empty 2>/dev/null; then
        echo -e "${GREEN}✓ Valid JSON response${NC}"
        echo ""

        # Check for required fields
        echo -e "${YELLOW}Checking response structure...${NC}"

        if echo "$BODY" | jq -e '.performance_analysis' > /dev/null 2>&1; then
            echo -e "${GREEN}✓ performance_analysis field present${NC}"

            # Check if it contains markdown content
            ANALYSIS_LENGTH=$(echo "$BODY" | jq -r '.performance_analysis' | wc -c)
            if [ "$ANALYSIS_LENGTH" -gt 100 ]; then
                echo -e "${GREEN}✓ Analysis content appears substantial ($ANALYSIS_LENGTH characters)${NC}"
            else
                echo -e "${YELLOW}⚠ Analysis content seems short ($ANALYSIS_LENGTH characters)${NC}"
            fi
        else
            echo -e "${RED}✗ Missing performance_analysis field${NC}"
        fi

        if echo "$BODY" | jq -e '.timestamp' > /dev/null 2>&1; then
            echo -e "${GREEN}✓ timestamp field present${NC}"
        else
            echo -e "${YELLOW}⚠ Missing timestamp field${NC}"
        fi

        if echo "$BODY" | jq -e '.original_metrics' > /dev/null 2>&1; then
            echo -e "${GREEN}✓ original_metrics field present${NC}"
        else
            echo -e "${YELLOW}⚠ Missing original_metrics field${NC}"
        fi

        echo ""
        echo -e "${GREEN}✅ Test completed successfully!${NC}"
        echo ""
        echo "Full response saved to: analysis_$(date +%Y%m%d_%H%M%S).json"
        echo "$BODY" | jq '.' > "analysis_$(date +%Y%m%d_%H%M%S).json"

        # Extract and preview analysis
        echo ""
        echo -e "${YELLOW}Preview of analysis (first 500 chars):${NC}"
        echo "$BODY" | jq -r '.performance_analysis' | head -c 500
        echo "..."

    else
        echo -e "${RED}✗ Invalid JSON response${NC}"
        echo "Response body:"
        echo "$BODY"
        exit 1
    fi

elif [ "$HTTP_CODE" -eq 401 ]; then
    echo -e "${RED}✗ Authentication failed (401)${NC}"
    echo "Check your API key"
    exit 1

elif [ "$HTTP_CODE" -eq 400 ]; then
    echo -e "${RED}✗ Bad request (400)${NC}"
    echo "Response:"
    echo "$BODY" | jq '.' 2>/dev/null || echo "$BODY"
    exit 1

elif [ "$HTTP_CODE" -eq 500 ]; then
    echo -e "${RED}✗ Server error (500)${NC}"
    echo "Check your n8n workflow and Anthropic API credentials"
    echo "Response:"
    echo "$BODY"
    exit 1

else
    echo -e "${RED}✗ Unexpected status code: $HTTP_CODE${NC}"
    echo "Response:"
    echo "$BODY"
    exit 1
fi
