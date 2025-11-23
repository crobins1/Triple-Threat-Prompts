#!/bin/bash

# Test script for Content Generation endpoint (Stages 1 & 2)
# Usage: ./test-content-generation.sh <webhook_url> [api_key]

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
    echo "Example: $0 https://your-n8n.com/webhook/content-strategy-agent your_api_key"
    exit 1
fi

WEBHOOK_URL="$1"
API_KEY="${2:-}"

echo -e "${YELLOW}🚀 Testing Content Strategy Agent - Content Generation${NC}"
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
  "TARGET_INDUSTRY": "B2B SaaS Marketing",
  "CORE_TOPIC": "Product-Led Growth Strategies",
  "BRAND_VOICE": "authoritative yet approachable, data-driven",
  "TARGET_AUDIENCE": "Marketing Directors at mid-market SaaS companies, 30-45 years old",
  "COMPETITOR_URLS": "https://www.pendo.io/blog/, https://openviewpartners.com/blog/",
  "UNIQUE_ANGLE": "We focus on PLG strategies for companies WITHOUT a freemium model",
  "BUSINESS_GOAL": "increase newsletter signups by 25%"
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

        if echo "$BODY" | jq -e '.full_content' > /dev/null 2>&1; then
            echo -e "${GREEN}✓ full_content field present${NC}"
        else
            echo -e "${RED}✗ Missing full_content field${NC}"
        fi

        if echo "$BODY" | jq -e '.linkedin_content' > /dev/null 2>&1; then
            echo -e "${GREEN}✓ linkedin_content field present${NC}"
        else
            echo -e "${YELLOW}⚠ Missing linkedin_content field (may be optional)${NC}"
        fi

        if echo "$BODY" | jq -e '.instagram_content' > /dev/null 2>&1; then
            echo -e "${GREEN}✓ instagram_content field present${NC}"
        else
            echo -e "${YELLOW}⚠ Missing instagram_content field (may be optional)${NC}"
        fi

        if echo "$BODY" | jq -e '.tiktok_content' > /dev/null 2>&1; then
            echo -e "${GREEN}✓ tiktok_content field present${NC}"
        else
            echo -e "${YELLOW}⚠ Missing tiktok_content field (may be optional)${NC}"
        fi

        if echo "$BODY" | jq -e '.stage1_report' > /dev/null 2>&1; then
            echo -e "${GREEN}✓ stage1_report field present${NC}"
        else
            echo -e "${RED}✗ Missing stage1_report field${NC}"
        fi

        if echo "$BODY" | jq -e '.timestamp' > /dev/null 2>&1; then
            echo -e "${GREEN}✓ timestamp field present${NC}"
        else
            echo -e "${YELLOW}⚠ Missing timestamp field${NC}"
        fi

        echo ""
        echo -e "${GREEN}✅ Test completed successfully!${NC}"
        echo ""
        echo "Full response saved to: response_$(date +%Y%m%d_%H%M%S).json"
        echo "$BODY" | jq '.' > "response_$(date +%Y%m%d_%H%M%S).json"

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
