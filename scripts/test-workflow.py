#!/usr/bin/env python3
"""
Test script for Triple-Threat Content Strategy Agent
Tests both content generation and performance analysis endpoints
"""

import json
import sys
import time
from datetime import datetime
from typing import Dict, Optional
import requests


class Colors:
    """ANSI color codes for terminal output"""
    GREEN = '\033[0;32m'
    RED = '\033[0;31m'
    YELLOW = '\033[1;33m'
    BLUE = '\033[0;34m'
    NC = '\033[0m'  # No Color


def print_success(message: str):
    print(f"{Colors.GREEN}✓ {message}{Colors.NC}")


def print_error(message: str):
    print(f"{Colors.RED}✗ {message}{Colors.NC}")


def print_warning(message: str):
    print(f"{Colors.YELLOW}⚠ {message}{Colors.NC}")


def print_info(message: str):
    print(f"{Colors.BLUE}ℹ {message}{Colors.NC}")


def test_content_generation(base_url: str, api_key: Optional[str] = None) -> bool:
    """Test the content generation endpoint (Stages 1 & 2)"""

    print(f"\n{Colors.YELLOW}🚀 Testing Content Generation Endpoint{Colors.NC}")
    print(f"URL: {base_url}/content-strategy-agent\n")

    # Prepare headers
    headers = {"Content-Type": "application/json"}
    if api_key:
        headers["X-API-Key"] = api_key
        print_success("Using API key authentication")
    else:
        print_warning("No API key provided")

    # Test payload
    payload = {
        "TARGET_INDUSTRY": "B2B SaaS Marketing",
        "CORE_TOPIC": "Product-Led Growth Strategies",
        "BRAND_VOICE": "authoritative yet approachable, data-driven",
        "TARGET_AUDIENCE": "Marketing Directors at mid-market SaaS companies, 30-45 years old",
        "COMPETITOR_URLS": "https://www.pendo.io/blog/, https://openviewpartners.com/blog/",
        "UNIQUE_ANGLE": "We focus on PLG strategies for companies WITHOUT a freemium model",
        "BUSINESS_GOAL": "increase newsletter signups by 25%"
    }

    try:
        print_info("Sending request...")
        start_time = time.time()

        response = requests.post(
            f"{base_url}/content-strategy-agent",
            json=payload,
            headers=headers,
            timeout=180  # 3 minutes
        )

        elapsed_time = time.time() - start_time
        print_info(f"Response received in {elapsed_time:.2f} seconds")

        # Check status code
        if response.status_code == 200:
            print_success(f"Status code: {response.status_code}")

            # Parse JSON
            try:
                data = response.json()
                print_success("Valid JSON response")

                # Check required fields
                required_fields = ["full_content", "stage1_report", "timestamp"]
                optional_fields = ["linkedin_content", "instagram_content", "tiktok_content"]

                print_info("\nChecking response structure:")
                for field in required_fields:
                    if field in data:
                        print_success(f"Required field '{field}' present")
                    else:
                        print_error(f"Missing required field '{field}'")
                        return False

                for field in optional_fields:
                    if field in data:
                        print_success(f"Optional field '{field}' present")
                    else:
                        print_warning(f"Optional field '{field}' not present")

                # Save response
                filename = f"content_response_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
                with open(filename, 'w') as f:
                    json.dump(data, f, indent=2)
                print_success(f"\nResponse saved to: {filename}")

                return True

            except json.JSONDecodeError as e:
                print_error(f"Invalid JSON response: {e}")
                print(response.text[:500])
                return False

        elif response.status_code == 401:
            print_error("Authentication failed (401)")
            print("Check your API key")
            return False

        elif response.status_code == 400:
            print_error("Bad request (400)")
            print(response.text)
            return False

        else:
            print_error(f"Unexpected status code: {response.status_code}")
            print(response.text[:500])
            return False

    except requests.exceptions.Timeout:
        print_error("Request timed out (>180 seconds)")
        print("This may indicate an issue with the workflow or Anthropic API")
        return False

    except requests.exceptions.RequestException as e:
        print_error(f"Request failed: {e}")
        return False


def test_performance_analysis(base_url: str, api_key: Optional[str] = None) -> bool:
    """Test the performance analysis endpoint (Stage 3)"""

    print(f"\n{Colors.YELLOW}🚀 Testing Performance Analysis Endpoint{Colors.NC}")
    print(f"URL: {base_url}/content-performance-analysis\n")

    # Prepare headers
    headers = {"Content-Type": "application/json"}
    if api_key:
        headers["X-API-Key"] = api_key
        print_success("Using API key authentication")
    else:
        print_warning("No API key provided")

    # Test payload
    payload = {
        "ORIGINAL_POST_COPY": "Most SaaS companies think PLG requires freemium.\n\nThey're wrong.\n\nI've helped 12 companies implement PLG with paid-only products.\n\nComment PLG for our framework.",
        "PLATFORM": "LinkedIn",
        "ACTUAL_ENGAGEMENT_METRICS": "Impressions: 4,200, Likes: 68, Comments: 12, Shares: 3, Engagement Rate: 2.0%, CTR: 0.43%",
        "PERFORMANCE_BENCHMARK": "Expected Engagement Rate: 5.5%, Expected CTR: 2.5%, Expected Comments: 40+",
        "BUSINESS_GOAL": "increase newsletter signups by 25%",
        "TARGET_AUDIENCE": "Marketing Directors at mid-market SaaS companies, 30-45 years old"
    }

    try:
        print_info("Sending request...")
        start_time = time.time()

        response = requests.post(
            f"{base_url}/content-performance-analysis",
            json=payload,
            headers=headers,
            timeout=90  # 90 seconds
        )

        elapsed_time = time.time() - start_time
        print_info(f"Response received in {elapsed_time:.2f} seconds")

        # Check status code
        if response.status_code == 200:
            print_success(f"Status code: {response.status_code}")

            # Parse JSON
            try:
                data = response.json()
                print_success("Valid JSON response")

                # Check required fields
                print_info("\nChecking response structure:")

                if "performance_analysis" in data:
                    print_success("Field 'performance_analysis' present")
                    analysis_len = len(data["performance_analysis"])
                    print_info(f"Analysis length: {analysis_len} characters")
                else:
                    print_error("Missing 'performance_analysis' field")
                    return False

                if "timestamp" in data:
                    print_success("Field 'timestamp' present")
                else:
                    print_warning("Missing 'timestamp' field")

                if "original_metrics" in data:
                    print_success("Field 'original_metrics' present")
                else:
                    print_warning("Missing 'original_metrics' field")

                # Save response
                filename = f"analysis_response_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
                with open(filename, 'w') as f:
                    json.dump(data, f, indent=2)
                print_success(f"\nResponse saved to: {filename}")

                # Preview analysis
                print(f"\n{Colors.YELLOW}Analysis preview (first 500 chars):{Colors.NC}")
                print(data["performance_analysis"][:500])
                print("...\n")

                return True

            except json.JSONDecodeError as e:
                print_error(f"Invalid JSON response: {e}")
                print(response.text[:500])
                return False

        else:
            print_error(f"Status code: {response.status_code}")
            print(response.text[:500])
            return False

    except requests.exceptions.Timeout:
        print_error("Request timed out (>90 seconds)")
        return False

    except requests.exceptions.RequestException as e:
        print_error(f"Request failed: {e}")
        return False


def main():
    """Main test runner"""

    if len(sys.argv) < 2:
        print(f"{Colors.RED}Error: Base URL required{Colors.NC}")
        print(f"\nUsage: {sys.argv[0]} <base_url> [api_key]")
        print(f"Example: {sys.argv[0]} https://your-n8n.com/webhook your_api_key")
        sys.exit(1)

    base_url = sys.argv[1].rstrip('/')
    api_key = sys.argv[2] if len(sys.argv) > 2 else None

    print(f"\n{Colors.BLUE}{'='*60}{Colors.NC}")
    print(f"{Colors.BLUE}  Triple-Threat Content Strategy Agent - Test Suite{Colors.NC}")
    print(f"{Colors.BLUE}{'='*60}{Colors.NC}")

    results = {}

    # Test content generation
    results['content_generation'] = test_content_generation(base_url, api_key)

    # Wait a bit before next test
    print(f"\n{Colors.YELLOW}Waiting 5 seconds before next test...{Colors.NC}")
    time.sleep(5)

    # Test performance analysis
    results['performance_analysis'] = test_performance_analysis(base_url, api_key)

    # Summary
    print(f"\n{Colors.BLUE}{'='*60}{Colors.NC}")
    print(f"{Colors.BLUE}  Test Summary{Colors.NC}")
    print(f"{Colors.BLUE}{'='*60}{Colors.NC}\n")

    for test_name, passed in results.items():
        status = f"{Colors.GREEN}PASSED{Colors.NC}" if passed else f"{Colors.RED}FAILED{Colors.NC}"
        print(f"  {test_name.replace('_', ' ').title()}: {status}")

    all_passed = all(results.values())

    print()
    if all_passed:
        print(f"{Colors.GREEN}✅ All tests passed!{Colors.NC}\n")
        sys.exit(0)
    else:
        print(f"{Colors.RED}❌ Some tests failed{Colors.NC}\n")
        sys.exit(1)


if __name__ == "__main__":
    main()
