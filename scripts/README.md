# Test Scripts

This directory contains test and validation scripts for the Triple-Threat Content Strategy Agent.

---

## Available Scripts

### 1. test-content-generation.sh

**Purpose**: Test the main content generation workflow (Stages 1 & 2)

**Requirements**:
- `curl` command
- `jq` for JSON parsing (optional but recommended)

**Usage**:
```bash
./test-content-generation.sh <webhook_url> [api_key]
```

**Examples**:
```bash
# Without authentication
./test-content-generation.sh https://your-n8n.com/webhook/content-strategy-agent

# With API key authentication
./test-content-generation.sh https://your-n8n.com/webhook/content-strategy-agent your_api_key_here
```

**What it tests**:
- ✓ Webhook accessibility
- ✓ Request/response flow
- ✓ JSON response validation
- ✓ Required field presence
- ✓ API authentication (if provided)

**Output**:
- Success/failure status with color-coded messages
- Response structure validation
- Saves full response to timestamped JSON file

---

### 2. test-performance-analysis.sh

**Purpose**: Test the performance analysis workflow (Stage 3)

**Requirements**:
- `curl` command
- `jq` for JSON parsing (optional but recommended)

**Usage**:
```bash
./test-performance-analysis.sh <webhook_url> [api_key]
```

**Examples**:
```bash
# Without authentication
./test-performance-analysis.sh https://your-n8n.com/webhook/content-performance-analysis

# With API key authentication
./test-performance-analysis.sh https://your-n8n.com/webhook/content-performance-analysis your_api_key_here
```

**What it tests**:
- ✓ Performance analysis endpoint accessibility
- ✓ Diagnostic report generation
- ✓ Response structure validation
- ✓ Analysis content quality (length check)

**Output**:
- Success/failure status
- Analysis preview (first 500 characters)
- Saves full response to timestamped JSON file

---

### 3. test-workflow.py

**Purpose**: Comprehensive test suite for both workflows

**Requirements**:
- Python 3.7+
- `requests` library: `pip install requests`

**Usage**:
```bash
python3 test-workflow.py <base_url> [api_key]
```

**Examples**:
```bash
# Without authentication
python3 test-workflow.py https://your-n8n.com/webhook

# With API key authentication
python3 test-workflow.py https://your-n8n.com/webhook your_api_key_here
```

**What it tests**:
- ✓ Content generation workflow (full validation)
- ✓ Performance analysis workflow (full validation)
- ✓ Response timing and performance metrics
- ✓ Error handling and status codes
- ✓ JSON structure compliance

**Output**:
- Detailed test results for each workflow
- Color-coded pass/fail indicators
- Response time metrics
- Saves responses to timestamped JSON files
- Overall test summary

**Exit Codes**:
- `0`: All tests passed
- `1`: One or more tests failed

---

## Quick Start

### First Time Setup

1. **Make scripts executable** (Linux/macOS):
   ```bash
   chmod +x test-content-generation.sh
   chmod +x test-performance-analysis.sh
   chmod +x test-workflow.py
   ```

2. **Install Python dependencies** (for test-workflow.py):
   ```bash
   pip install requests
   ```

### Run All Tests

```bash
# Option 1: Bash scripts (sequential)
./test-content-generation.sh YOUR_URL YOUR_KEY
./test-performance-analysis.sh YOUR_URL YOUR_KEY

# Option 2: Python script (automated suite)
python3 test-workflow.py YOUR_URL YOUR_KEY
```

---

## Test Data

All scripts use predefined test data optimized for validation:

### Content Generation Test Data
- **Industry**: B2B SaaS Marketing
- **Topic**: Product-Led Growth Strategies
- **Competitor URLs**: Real PLG content sites
- **Expected Duration**: 60-120 seconds

### Performance Analysis Test Data
- **Platform**: LinkedIn
- **Scenario**: Underperforming post (2% vs 5.5% engagement)
- **Expected Duration**: 30-60 seconds

---

## Interpreting Results

### Success Indicators

```bash
✓ Success! Status code 200
✓ Valid JSON response
✓ full_content field present
✓ linkedin_content field present
✓ stage1_report field present
```

### Common Failures

#### ✗ Authentication Failed (401)
**Cause**: Missing or invalid API key
**Fix**: Check your API key or remove authentication from webhook

#### ✗ Bad Request (400)
**Cause**: Invalid input data
**Fix**: Check test data matches expected schema

#### ✗ Server Error (500)
**Cause**: Workflow or API error
**Fix**: Check n8n execution logs and Anthropic API status

#### ✗ Timeout
**Cause**: Workflow taking too long (>180s)
**Fix**: Check Anthropic API status, verify workflow configuration

---

## Advanced Usage

### Custom Test Data

To test with your own data, modify the scripts:

**For Bash scripts:**
```bash
# Edit the TEST_DATA variable in the script
TEST_DATA='{
  "TARGET_INDUSTRY": "Your Industry",
  "CORE_TOPIC": "Your Topic",
  ...
}'
```

**For Python script:**
```python
# Edit the payload dictionary in test_content_generation() function
payload = {
    "TARGET_INDUSTRY": "Your Industry",
    "CORE_TOPIC": "Your Topic",
    ...
}
```

### Integration with CI/CD

```yaml
# Example: GitHub Actions
name: Test Workflows
on: [push]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Install dependencies
        run: pip install requests
      - name: Run tests
        env:
          WEBHOOK_URL: ${{ secrets.N8N_WEBHOOK_URL }}
          API_KEY: ${{ secrets.API_KEY }}
        run: |
          python3 scripts/test-workflow.py $WEBHOOK_URL $API_KEY
```

### Automated Monitoring

```bash
# Run tests every hour and log results
*/60 * * * * cd /path/to/Triple-Threat-Prompts && \
  ./scripts/test-workflow.py YOUR_URL YOUR_KEY >> logs/monitoring.log 2>&1
```

---

## Debugging Test Failures

### Enable Verbose Output

**Bash scripts:**
```bash
# Add -v flag to curl commands
curl -v -X POST ...
```

**Python script:**
```python
# Run with Python in verbose mode
python3 -v test-workflow.py YOUR_URL YOUR_KEY
```

### Check Response Files

All scripts save responses to JSON files:
- `response_YYYYMMDD_HHMMSS.json` (content generation)
- `analysis_YYYYMMDD_HHMMSS.json` (performance analysis)

Inspect these for detailed error information.

### Manual Testing

```bash
# Test webhook manually with curl
curl -X POST "YOUR_WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -H "X-API-Key: YOUR_KEY" \
  -d @../examples/sample-input.json \
  | jq '.'
```

---

## Script Maintenance

### Updating Test Data

When updating test data:
1. Update the JSON payloads in scripts
2. Update corresponding files in `/examples/`
3. Test all scripts to verify compatibility
4. Document any breaking changes

### Adding New Tests

To add a new test script:
1. Follow existing naming convention: `test-*.sh` or `test-*.py`
2. Include clear usage instructions in comments
3. Use color-coded output for readability
4. Save responses to timestamped files
5. Update this README with documentation

---

## Troubleshooting

### "Permission denied" Error

```bash
chmod +x test-*.sh test-*.py
```

### "jq: command not found"

```bash
# macOS
brew install jq

# Ubuntu/Debian
sudo apt-get install jq

# Or run scripts without jq (less validation)
```

### "requests module not found"

```bash
pip install requests
# or
pip3 install requests
```

### Tests Pass Locally But Fail in CI

- Ensure environment variables are properly set
- Check network access to n8n instance
- Verify API keys are in CI secrets
- Increase timeout values if needed

---

## Performance Benchmarks

Expected execution times on typical setup:

| Test | Min | Average | Max |
|------|-----|---------|-----|
| Content Generation | 60s | 90s | 150s |
| Performance Analysis | 20s | 40s | 70s |
| Full Suite | 90s | 140s | 230s |

Significantly longer times indicate:
- Anthropic API slowness (check status.anthropic.com)
- Network latency issues
- Workflow configuration problems

---

## Support

For issues with test scripts:
1. Check `/docs/troubleshooting.md` for common problems
2. Verify your n8n workflow is active and configured
3. Test Anthropic API connectivity directly
4. Open an issue with test output and error messages

---

**Happy Testing!** 🚀

These scripts ensure your Content Strategy Agent workflows are functioning correctly before production use.
