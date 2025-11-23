# Troubleshooting Guide

Complete troubleshooting reference for the Triple-Threat Content Strategy Agent.

---

## Table of Contents

- [Quick Diagnostics](#quick-diagnostics)
- [Common Issues](#common-issues)
- [Error Messages](#error-messages)
- [Performance Problems](#performance-problems)
- [Integration Issues](#integration-issues)
- [Advanced Debugging](#advanced-debugging)

---

## Quick Diagnostics

### System Health Check

Run these commands to verify your setup:

```bash
# 1. Test webhook accessibility
curl -X POST "https://your-n8n.com/webhook/content-strategy-agent" \
  -H "Content-Type: application/json" \
  -d '{"test": "ping"}'

# Expected: Should return quickly (not 404)

# 2. Test with example data
./scripts/test-content-generation.sh YOUR_WEBHOOK_URL

# Expected: Should complete in 1-3 minutes with valid JSON

# 3. Check n8n workflow status
# In n8n: Go to Executions → Check for recent runs
```

### Common Symptoms & Quick Fixes

| Symptom | Likely Cause | Quick Fix |
|---------|--------------|-----------|
| 404 Not Found | Workflow not active | Activate workflow in n8n |
| 401 Unauthorized | Wrong/missing API key | Check X-API-Key header |
| Timeout (>180s) | Anthropic API slow | Retry; check API status |
| Empty response | Workflow error | Check n8n execution logs |
| Invalid JSON | Parsing error | Check Code node logic |

---

## Common Issues

### Issue 1: Workflow Won't Import

**Symptoms:**
- Error when importing JSON file to n8n
- Missing nodes after import
- Workflow appears but has errors

**Causes & Solutions:**

#### Cause 1: Incompatible n8n Version
```bash
# Check your n8n version
# In n8n: Settings → About

# Solution: Update n8n
docker pull n8nio/n8n:latest  # If using Docker
npm install -g n8n@latest     # If using npm
```

#### Cause 2: Missing Node Packages
```
Error: "Node type '@n8n/n8n-nodes-langchain.lmChatAnthropic' not found"

Solution:
1. In n8n, go to Settings → Community Nodes
2. Install: @n8n/n8n-nodes-langchain
3. Restart n8n
4. Re-import workflow
```

#### Cause 3: Corrupted JSON File
```bash
# Validate JSON structure
jq empty workflows/main-content-workflow.json

# If error, re-download from GitHub
curl -O https://raw.githubusercontent.com/.../main-content-workflow.json
```

---

### Issue 2: Anthropic API Errors

**Symptoms:**
- "401 Unauthorized" from Anthropic
- "429 Too Many Requests"
- "500 Server Error"

**Solutions:**

#### 401 Unauthorized
```
Problem: Invalid or missing Anthropic API key

Solution:
1. Go to https://console.anthropic.com
2. Generate new API key
3. In n8n: Credentials → Edit Anthropic API credential
4. Paste new key
5. Save and test
```

#### 429 Rate Limit Exceeded
```
Problem: Too many requests to Anthropic API

Solutions:
1. Check your usage tier at console.anthropic.com
2. Add delay between requests
3. Implement request queue
4. Upgrade Anthropic plan

Temporary fix:
# Add delay in n8n workflow
- Insert "Wait" node after Anthropic nodes
- Set to 2-5 seconds
```

#### 500 Server Error
```
Problem: Anthropic API having issues

Diagnosis:
1. Check https://status.anthropic.com
2. Try with different model (e.g., claude-3-haiku)
3. Reduce prompt length

If Anthropic status is OK:
- Check your prompt isn't causing errors
- Verify max_tokens setting (should be 4096)
- Test with minimal input data
```

---

### Issue 3: JSON Parsing Failures

**Symptoms:**
- "Parse Stage 1 JSON" node fails
- Error: "Unexpected token in JSON"
- Empty stage1_report in output

**Diagnostic Steps:**

```bash
# 1. Check the raw Anthropic output
# In n8n: Click on "Anthropic - Stage 1" node → View output

# 2. Look for these issues:
```

#### Issue: Claude returned markdown instead of JSON
```
# Output looks like:
```json
{
  "analysis_metadata": {...}
}
```

# Solution: Update parsing code
// In "Parse Stage 1 JSON" node:
let jsonText = textContent.text;

// Strip markdown code blocks
if (jsonText.includes('```json')) {
  jsonText = jsonText.split('```json')[1].split('```')[0];
} else if (jsonText.includes('```')) {
  jsonText = jsonText.split('```')[1].split('```')[0];
}

jsonOutput = JSON.parse(jsonText.trim());
```

#### Issue: Claude added explanatory text
```
# Output looks like:
"Here is the analysis:
{
  \"analysis_metadata\": {...}
}"

# Solution: Extract JSON with regex
const jsonMatch = textContent.text.match(/\{[\s\S]*\}/);
if (jsonMatch) {
  jsonOutput = JSON.parse(jsonMatch[0]);
}
```

---

### Issue 4: Content Quality Issues

**Symptoms:**
- Generic, low-quality output
- Content doesn't match brand voice
- Missing platform-specific optimization

**Solutions:**

#### Problem: Vague Input Variables
```
Bad:
{
  "TARGET_INDUSTRY": "marketing",
  "TARGET_AUDIENCE": "marketers"
}

Good:
{
  "TARGET_INDUSTRY": "B2B SaaS Content Marketing for Series A startups",
  "TARGET_AUDIENCE": "Content Marketing Managers, 28-38, managing 2-5 person teams, focused on demand generation, reading level: conversational professional"
}

Rule: More specific input = Better output
```

#### Problem: Weak Competitor URLs
```
Bad:
"COMPETITOR_URLS": "competitor.com, other-site.com"

Good:
"COMPETITOR_URLS": "https://competitor.com/blog/category/content-strategy, https://other-site.com/resources/guides"

Provide direct links to content sections, not just homepages
```

#### Problem: Generic Unique Angle
```
Bad:
"UNIQUE_ANGLE": "We're better"

Good:
"UNIQUE_ANGLE": "We focus exclusively on content strategies for technical audiences (developers, engineers) and emphasize code examples over generic marketing speak"
```

---

### Issue 5: Slow Response Times

**Symptoms:**
- Workflow takes >3 minutes
- Timeouts (>180 seconds)
- Inconsistent response times

**Diagnostic:**

```bash
# Check execution time breakdown in n8n
# Executions → Click on execution → View timeline

# Typical times:
# - Webhook/Set nodes: <1 second
# - Anthropic Stage 1: 30-60 seconds
# - Parse JSON: <1 second
# - Anthropic Stage 2: 45-90 seconds
# - Format Output: <1 second
```

**Optimizations:**

#### 1. Reduce Prompt Length
```markdown
Current Stage 1 prompt: ~3,500 tokens
Optimized version: ~2,000 tokens

How:
- Remove example explanations
- Simplify output format instructions
- Use more concise language
```

#### 2. Use Faster Model (Stage 3 only)
```javascript
// Change model in Stage 3 Anthropic node
"model": "claude-3-5-haiku-20241022"  // Faster, cheaper

// Keep Sonnet for Stages 1 & 2 (quality critical)
```

#### 3. Implement Prompt Caching
```
Anthropic's prompt caching (for system prompts >1024 tokens):

Benefits:
- 90% cost reduction on cached prompts
- Faster response times
- Requires API update (check Anthropic docs)
```

---

## Error Messages

### "Workflow could not be activated"

```
Full error: "Workflow could not be activated: Webhook path already exists"

Cause: Another workflow using same path

Solution:
1. Check other workflows for path conflicts
2. Change webhook path:
   - Edit Webhook Trigger node
   - Change "Path" field to unique value
   - Example: "content-strategy-agent-v2"
3. Update your API calls to use new path
```

### "Missing required field: [FIELD_NAME]"

```
Error from webhook response

Cause: Input JSON missing required field

Solution:
Check your request includes all 7 required fields:
{
  "TARGET_INDUSTRY": "...",      // Required
  "CORE_TOPIC": "...",           // Required
  "BRAND_VOICE": "...",          // Required
  "TARGET_AUDIENCE": "...",      // Required
  "COMPETITOR_URLS": "...",      // Required
  "UNIQUE_ANGLE": "...",         // Required
  "BUSINESS_GOAL": "..."         // Required
}

Validate with:
cat request.json | jq '.'
```

### "Cannot read property 'text' of undefined"

```
Error in Parse Stage 1 JSON node

Cause: Anthropic response structure changed or empty

Debugging:
1. Click on "Anthropic - Stage 1" node
2. Check output structure
3. Look for 'content' array

Fix:
Update parsing code to handle different formats:
if (response.content && Array.isArray(response.content)) {
  const textContent = response.content.find(item => item.type === 'text');
  if (textContent && textContent.text) {
    jsonOutput = JSON.parse(textContent.text);
  }
} else if (typeof response === 'string') {
  jsonOutput = JSON.parse(response);
} else {
  throw new Error('Unexpected response format');
}
```

---

## Performance Problems

### High API Costs

```
Problem: Anthropic costs are higher than expected

Diagnosis:
1. Check token usage: console.anthropic.com → Usage
2. Look for patterns:
   - Unusually long inputs
   - Repeated failed requests
   - Testing in production

Solutions:
1. Implement caching layer
   - Cache identical inputs for 24 hours
   - Use Redis or in-memory cache
   - Can reduce costs by 60-80%

2. Use appropriate models
   - Stage 1 & 2: Claude 3.5 Sonnet (quality critical)
   - Stage 3: Claude 3.5 Haiku (acceptable quality, 5x cheaper)

3. Optimize prompts
   - Remove redundant instructions
   - Use shorter examples
   - Compress without losing clarity

4. Set usage alerts
   - In Anthropic console: Set monthly spend alerts
   - Monitor via API: Track tokens per request
```

### Memory Issues (Self-Hosted)

```
Problem: n8n crashes or becomes unresponsive

Symptoms:
- Out of memory errors
- Slow workflow execution
- n8n container/process restarts

Solutions:

For Docker:
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  -e NODE_OPTIONS="--max-old-space-size=4096" \  # Increase from default
  n8nio/n8n

For npm/Node.js:
NODE_OPTIONS="--max-old-space-size=4096" n8n start

Monitoring:
# Check n8n memory usage
docker stats n8n  # If using Docker
top -p $(pgrep -f n8n)  # If using npm
```

---

## Integration Issues

### Webhook Not Accessible

```
Problem: Can't reach webhook from external systems

Diagnostic:
curl -X POST "https://your-n8n.com/webhook/content-strategy-agent" \
  -H "Content-Type: application/json" \
  -d '{"test": "ping"}'

# Expected: Some response (even if error)
# Actual: Connection refused / timeout

Solutions:

1. Check workflow is active
   - In n8n: Workflow should show green "Active" status

2. Check firewall/network
   - Self-hosted: Ensure port 5678 is open
   - Cloud: Check n8n Cloud status

3. Verify URL
   - Production URL vs Test URL
   - HTTP vs HTTPS
   - Check for typos

4. Test locally first
   # If self-hosted:
   curl -X POST "http://localhost:5678/webhook/content-strategy-agent" \
     -H "Content-Type: application/json" \
     -d @examples/sample-input.json
```

### CORS Errors (Browser-Based Calls)

```
Problem: "CORS policy: No 'Access-Control-Allow-Origin' header"

Cause: Calling webhook directly from browser JavaScript

Solution 1: Enable CORS in n8n
# In Webhook Response node:
Options → Response Headers
Add:
  Name: Access-Control-Allow-Origin
  Value: *  (or specific domain)

Solution 2: Use server-side proxy
# Don't call n8n directly from browser
# Instead: Browser → Your Backend → n8n
```

---

## Advanced Debugging

### Enable Detailed Logging

```bash
# For self-hosted n8n:
N8N_LOG_LEVEL=debug n8n start

# Or in Docker:
docker run -e N8N_LOG_LEVEL=debug n8nio/n8n

# Logs will show detailed execution info
```

### Inspect Workflow Data

```
In n8n UI:
1. Go to Executions
2. Click on failed execution
3. Click on each node to see input/output
4. Look for:
   - Unexpected null values
   - Malformed JSON
   - Missing fields
   - Type mismatches
```

### Test Individual Nodes

```
In n8n workflow editor:
1. Click on node to test
2. Click "Execute Node" (play button)
3. Provide test data manually
4. See immediate output

This isolates issues to specific nodes
```

### Raw API Testing

```bash
# Test Anthropic API directly (bypassing n8n)
curl https://api.anthropic.com/v1/messages \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -H "content-type: application/json" \
  -d '{
    "model": "claude-3-5-sonnet-20241022",
    "max_tokens": 1024,
    "messages": [
      {"role": "user", "content": "Say hello"}
    ]
  }'

# If this fails, issue is with Anthropic API/credentials
# If this works, issue is in n8n workflow configuration
```

---

## Getting Help

### Before Opening an Issue

Collect this information:

```
1. Environment:
   - n8n version:
   - Hosting: (Cloud / Self-hosted Docker / Self-hosted npm)
   - OS: (if self-hosted)

2. Issue details:
   - Expected behavior:
   - Actual behavior:
   - Error message (exact text):
   - When did it start:

3. Test results:
   - Does workflow import successfully? Y/N
   - Does test script work? Y/N
   - Anthropic API status: https://status.anthropic.com

4. Logs:
   - n8n execution ID:
   - Relevant error logs (redact API keys):

5. Configuration:
   - Using API key auth? Y/N
   - Modified prompts? Y/N
   - Custom integrations? Y/N
```

### Support Resources

- **GitHub Issues**: Report bugs and feature requests
- **Documentation**: Check `/docs/` folder for detailed guides
- **n8n Community**: [community.n8n.io](https://community.n8n.io)
- **Anthropic Docs**: [docs.anthropic.com](https://docs.anthropic.com)

---

## Preventive Maintenance

### Monthly Checklist

- [ ] Update n8n to latest version
- [ ] Review Anthropic API usage and costs
- [ ] Check for failed executions in n8n
- [ ] Test workflows with latest data
- [ ] Backup workflow JSONs
- [ ] Review and update system prompts if needed
- [ ] Check for n8n node updates

### Monitoring Best Practices

```yaml
Set up alerts for:
  - Error rate > 5% in last hour
  - Average response time > 2.5 minutes
  - Daily API cost > expected threshold
  - Workflow failures (any)
  - API key about to expire
```

---

**Remember**: Most issues are configuration-related, not code bugs. Double-check your setup before diving into deep debugging!
