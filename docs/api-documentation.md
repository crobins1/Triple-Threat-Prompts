# API Documentation: Triple-Threat Content Strategy Agent

Complete API reference for the Content Strategy Agent workflows.

---

## Base URL

```
https://your-n8n-instance.com/webhook/
```

Replace `your-n8n-instance.com` with your actual n8n domain.

---

## Authentication

### Header Authentication (Recommended for Production)

Include your API key in the request header:

```http
X-API-Key: your_secret_api_key_here
```

### Example with cURL
```bash
curl -X POST "https://your-n8n-instance.com/webhook/content-strategy-agent" \
  -H "X-API-Key: your_secret_api_key_here" \
  -H "Content-Type: application/json" \
  -d @request.json
```

---

## Endpoints

### 1. Content Generation (Stages 1 & 2)

**Endpoint**: `/content-strategy-agent`

**Method**: `POST`

**Description**: Performs competitive analysis and generates platform-optimized content for LinkedIn, Instagram/Threads, and TikTok/YouTube Shorts.

#### Request Body

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `TARGET_INDUSTRY` | string | Yes | The specific industry or niche to analyze (e.g., "B2B SaaS Marketing") |
| `CORE_TOPIC` | string | Yes | The central subject matter or theme (e.g., "Content Marketing ROI") |
| `BRAND_VOICE` | string | Yes | Desired brand personality (e.g., "authoritative yet approachable, data-driven") |
| `TARGET_AUDIENCE` | string | Yes | Detailed demographics and psychographics (e.g., "Marketing Directors at Series A startups, 30-40 years old") |
| `COMPETITOR_URLS` | string | Yes | Comma-separated list of 3-5 competitor websites or social accounts |
| `UNIQUE_ANGLE` | string | Yes | Brand's unique value proposition or differentiator |
| `BUSINESS_GOAL` | string | Yes | Primary objective (e.g., "increase newsletter signups by 25%") |

#### Example Request

```json
{
  "TARGET_INDUSTRY": "B2B SaaS Marketing",
  "CORE_TOPIC": "Product-Led Growth Strategies",
  "BRAND_VOICE": "authoritative yet approachable, data-driven",
  "TARGET_AUDIENCE": "Marketing Directors at mid-market SaaS companies, 30-45 years old",
  "COMPETITOR_URLS": "https://www.pendo.io/blog/, https://openviewpartners.com/blog/, https://www.productled.com/blog/",
  "UNIQUE_ANGLE": "We focus on PLG strategies for companies WITHOUT a freemium model",
  "BUSINESS_GOAL": "increase newsletter signups by 25%"
}
```

#### Response Format

**Status Code**: `200 OK`

**Content-Type**: `application/json`

```json
{
  "full_content": "Complete markdown content suite with all three platform posts and strategic notes",
  "linkedin_content": "Extracted LinkedIn post section with copy, rationale, and benchmarks",
  "instagram_content": "Extracted Instagram post section with copy, visual guidance, and benchmarks",
  "tiktok_content": "Extracted TikTok script section with video script, visual notes, and benchmarks",
  "stage1_report": {
    "analysis_metadata": {
      "industry": "B2B SaaS Marketing",
      "core_topic": "Product-Led Growth Strategies",
      "analysis_timestamp": "2025-01-23",
      "analyst_confidence": "HIGH"
    },
    "competitive_landscape": {
      "competitor_summaries": [...],
      "market_saturation_score": "7",
      "overall_gap_assessment": "..."
    },
    "strategic_opportunities": [...],
    "platform_strategies": {
      "linkedin_authority_builder": {...},
      "instagram_engagement_driver": {...},
      "tiktok_conversion_closer": {...}
    },
    "execution_priorities": {
      "quick_wins": [...],
      "long_term_pillars": [...],
      "risk_mitigation": [...]
    }
  },
  "timestamp": "2025-01-23T15:30:45.123Z"
}
```

#### Response Fields

| Field | Type | Description |
|-------|------|-------------|
| `full_content` | string | Complete markdown document with all content and strategic notes |
| `linkedin_content` | string | LinkedIn-specific content section (markdown) |
| `instagram_content` | string | Instagram-specific content section (markdown) |
| `tiktok_content` | string | TikTok video script section (markdown) |
| `stage1_report` | object | Complete strategic analysis JSON from Stage 1 |
| `timestamp` | string | ISO 8601 timestamp of content generation |

#### Processing Time
- **Typical**: 60-120 seconds
- **Max**: 180 seconds

#### Error Responses

**400 Bad Request**
```json
{
  "error": "Missing required field: TARGET_INDUSTRY",
  "code": "VALIDATION_ERROR"
}
```

**401 Unauthorized**
```json
{
  "error": "Invalid or missing API key",
  "code": "AUTH_ERROR"
}
```

**500 Internal Server Error**
```json
{
  "error": "Failed to generate content",
  "code": "GENERATION_ERROR",
  "details": "Anthropic API timeout"
}
```

---

### 2. Performance Analysis (Stage 3)

**Endpoint**: `/content-performance-analysis`

**Method**: `POST`

**Description**: Analyzes underperforming content, diagnoses root causes, and generates A/B test variations with clear hypotheses.

#### Request Body

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `ORIGINAL_POST_COPY` | string | Yes | Exact text/script of the published content |
| `PLATFORM` | string | Yes | Platform where it was published (LinkedIn, Instagram, TikTok, etc.) |
| `ACTUAL_ENGAGEMENT_METRICS` | string | Yes | Real performance data (e.g., "Impressions: 3,200, Engagement Rate: 2.1%") |
| `PERFORMANCE_BENCHMARK` | string | Yes | Expected metrics or historical average |
| `BUSINESS_GOAL` | string | Yes | Original objective from content generation |
| `TARGET_AUDIENCE` | string | Yes | Demographics/psychographics for relevance check |

#### Example Request

```json
{
  "ORIGINAL_POST_COPY": "Most SaaS companies think they can't do PLG without freemium.\n\nThey're wrong.\n\nI've helped 12 companies implement PLG with paid-only products.\n\nHere's what matters:\n→ Self-service onboarding\n→ Value in <15 min\n→ Usage-based expansion\n\nFreemium is ONE way. Not the ONLY way.\n\nComment PLG for our framework.",
  "PLATFORM": "LinkedIn",
  "ACTUAL_ENGAGEMENT_METRICS": "Impressions: 4,200, Likes: 68, Comments: 12, Shares: 3, Engagement Rate: 2.0%, CTR: 0.43%",
  "PERFORMANCE_BENCHMARK": "Expected Engagement Rate: 5.5%, Expected CTR: 2.5%, Expected Comments: 40+",
  "BUSINESS_GOAL": "increase newsletter signups by 25%",
  "TARGET_AUDIENCE": "Marketing Directors at mid-market SaaS companies, 30-45 years old"
}
```

#### Response Format

**Status Code**: `200 OK`

**Content-Type**: `application/json`

```json
{
  "performance_analysis": "Complete markdown diagnostic report with root cause analysis and 3 A/B test variations",
  "timestamp": "2025-01-23T15:35:20.456Z",
  "original_metrics": {
    "ORIGINAL_POST_COPY": "...",
    "PLATFORM": "LinkedIn",
    "ACTUAL_ENGAGEMENT_METRICS": "...",
    "PERFORMANCE_BENCHMARK": "...",
    "BUSINESS_GOAL": "...",
    "TARGET_AUDIENCE": "..."
  }
}
```

#### Response Fields

| Field | Type | Description |
|-------|------|-------------|
| `performance_analysis` | string | Complete diagnostic report in markdown format with:<br>- Performance summary table<br>- Root cause analysis<br>- 3 A/B test variations<br>- Testing protocol<br>- Strategic insights |
| `timestamp` | string | ISO 8601 timestamp of analysis |
| `original_metrics` | object | Echo of input data for reference |

#### Processing Time
- **Typical**: 30-60 seconds
- **Max**: 90 seconds

---

## Rate Limits

### Recommended Limits (Self-Hosted)
- **Content Generation**: 10 requests per hour per API key
- **Performance Analysis**: 20 requests per hour per API key

### n8n Cloud Limits
- Depends on your plan tier
- Check executions quota in your n8n dashboard

---

## Best Practices

### 1. Input Quality
- **Be Specific**: Vague inputs produce generic outputs
  - ❌ Bad: "TARGET_AUDIENCE: marketers"
  - ✅ Good: "TARGET_AUDIENCE: Marketing Directors at Series A SaaS startups, 30-40 years old, managing teams of 3-8"

- **Real URLs**: Provide actual competitor URLs, not just domains
  - ❌ Bad: "COMPETITOR_URLS: competitor.com"
  - ✅ Good: "COMPETITOR_URLS: https://competitor.com/blog/, https://competitor.com/resources/"

### 2. Error Handling
Always implement retry logic with exponential backoff:

```javascript
async function generateContent(data, retries = 3) {
  for (let i = 0; i < retries; i++) {
    try {
      const response = await fetch(API_URL, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-API-Key': API_KEY
        },
        body: JSON.stringify(data)
      });

      if (response.ok) {
        return await response.json();
      }

      if (response.status === 429) {
        // Rate limited - wait before retry
        await new Promise(resolve =>
          setTimeout(resolve, Math.pow(2, i) * 1000)
        );
        continue;
      }

      throw new Error(`HTTP ${response.status}`);
    } catch (error) {
      if (i === retries - 1) throw error;
      await new Promise(resolve =>
        setTimeout(resolve, Math.pow(2, i) * 1000)
      );
    }
  }
}
```

### 3. Response Parsing
The `full_content` field contains markdown. To extract specific sections:

```javascript
function extractLinkedInContent(fullContent) {
  const match = fullContent.match(
    /## Authority Builder: LinkedIn Post([\s\S]*?)(?=##|$)/
  );
  return match ? match[1].trim() : null;
}
```

### 4. Caching
To reduce API costs, cache results for identical inputs:

```javascript
const crypto = require('crypto');

function getCacheKey(data) {
  return crypto
    .createHash('md5')
    .update(JSON.stringify(data))
    .digest('hex');
}

async function getCachedOrGenerate(data) {
  const cacheKey = getCacheKey(data);
  const cached = await cache.get(cacheKey);

  if (cached) {
    return cached;
  }

  const result = await generateContent(data);
  await cache.set(cacheKey, result, { ttl: 86400 }); // 24 hour cache
  return result;
}
```

---

## Code Examples

### Python

```python
import requests
import json

API_URL = "https://your-n8n-instance.com/webhook/content-strategy-agent"
API_KEY = "your_api_key_here"

def generate_content(data):
    headers = {
        "Content-Type": "application/json",
        "X-API-Key": API_KEY
    }

    response = requests.post(API_URL, json=data, headers=headers, timeout=180)
    response.raise_for_status()
    return response.json()

# Example usage
input_data = {
    "TARGET_INDUSTRY": "B2B SaaS Marketing",
    "CORE_TOPIC": "Product-Led Growth",
    "BRAND_VOICE": "authoritative yet approachable",
    "TARGET_AUDIENCE": "Marketing Directors at mid-market SaaS",
    "COMPETITOR_URLS": "https://competitor1.com, https://competitor2.com",
    "UNIQUE_ANGLE": "PLG without freemium",
    "BUSINESS_GOAL": "increase newsletter signups"
}

result = generate_content(input_data)
print(result["linkedin_content"])
```

### JavaScript/Node.js

```javascript
const axios = require('axios');

const API_URL = 'https://your-n8n-instance.com/webhook/content-strategy-agent';
const API_KEY = 'your_api_key_here';

async function generateContent(data) {
  try {
    const response = await axios.post(API_URL, data, {
      headers: {
        'Content-Type': 'application/json',
        'X-API-Key': API_KEY
      },
      timeout: 180000 // 3 minutes
    });

    return response.data;
  } catch (error) {
    console.error('Error generating content:', error.response?.data || error.message);
    throw error;
  }
}

// Example usage
const inputData = {
  TARGET_INDUSTRY: "B2B SaaS Marketing",
  CORE_TOPIC: "Product-Led Growth",
  BRAND_VOICE: "authoritative yet approachable",
  TARGET_AUDIENCE: "Marketing Directors at mid-market SaaS",
  COMPETITOR_URLS: "https://competitor1.com, https://competitor2.com",
  UNIQUE_ANGLE: "PLG without freemium",
  BUSINESS_GOAL: "increase newsletter signups"
};

generateContent(inputData)
  .then(result => console.log(result.linkedin_content))
  .catch(error => console.error(error));
```

### cURL

```bash
curl -X POST "https://your-n8n-instance.com/webhook/content-strategy-agent" \
  -H "Content-Type: application/json" \
  -H "X-API-Key: your_api_key_here" \
  -d '{
    "TARGET_INDUSTRY": "B2B SaaS Marketing",
    "CORE_TOPIC": "Product-Led Growth",
    "BRAND_VOICE": "authoritative yet approachable",
    "TARGET_AUDIENCE": "Marketing Directors at mid-market SaaS",
    "COMPETITOR_URLS": "https://competitor1.com, https://competitor2.com",
    "UNIQUE_ANGLE": "PLG without freemium",
    "BUSINESS_GOAL": "increase newsletter signups"
  }'
```

---

## Webhook Configuration

### Setting Up Authentication in n8n

1. Open your workflow in n8n
2. Click on the **Webhook Trigger** node
3. Under **Authentication**, select **Header Auth**
4. Configure:
   - **Header Name**: `X-API-Key`
   - **Header Value**: Generate a secure key (e.g., `openssl rand -hex 32`)
5. Save the workflow
6. Share the API key securely with authorized users

### Custom Response Headers (Optional)

To add custom headers to responses:

1. Click on the **Webhook Response** node
2. Under **Options** → **Response Headers**
3. Add entries:
   - `X-RateLimit-Remaining`: Track remaining requests
   - `X-Processing-Time`: Show execution duration

---

## Testing

### Postman Collection

Import this collection to test the API in Postman:

```json
{
  "info": {
    "name": "Content Strategy Agent API",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Generate Content",
      "request": {
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json"
          },
          {
            "key": "X-API-Key",
            "value": "{{api_key}}"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\n  \"TARGET_INDUSTRY\": \"B2B SaaS Marketing\",\n  \"CORE_TOPIC\": \"Product-Led Growth\",\n  \"BRAND_VOICE\": \"authoritative yet approachable\",\n  \"TARGET_AUDIENCE\": \"Marketing Directors\",\n  \"COMPETITOR_URLS\": \"https://competitor.com\",\n  \"UNIQUE_ANGLE\": \"PLG without freemium\",\n  \"BUSINESS_GOAL\": \"increase signups\"\n}"
        },
        "url": {
          "raw": "{{base_url}}/content-strategy-agent",
          "host": ["{{base_url}}"],
          "path": ["content-strategy-agent"]
        }
      }
    },
    {
      "name": "Analyze Performance",
      "request": {
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json"
          },
          {
            "key": "X-API-Key",
            "value": "{{api_key}}"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\n  \"ORIGINAL_POST_COPY\": \"Your post here\",\n  \"PLATFORM\": \"LinkedIn\",\n  \"ACTUAL_ENGAGEMENT_METRICS\": \"Impressions: 1000\",\n  \"PERFORMANCE_BENCHMARK\": \"Expected: 5000\",\n  \"BUSINESS_GOAL\": \"increase signups\",\n  \"TARGET_AUDIENCE\": \"Marketing Directors\"\n}"
        },
        "url": {
          "raw": "{{base_url}}/content-performance-analysis",
          "host": ["{{base_url}}"],
          "path": ["content-performance-analysis"]
        }
      }
    }
  ],
  "variable": [
    {
      "key": "base_url",
      "value": "https://your-n8n-instance.com/webhook"
    },
    {
      "key": "api_key",
      "value": "your_api_key_here"
    }
  ]
}
```

---

## Cost Estimation

### Per-Request Costs (using Claude 3.5 Sonnet)

| Endpoint | Avg Input Tokens | Avg Output Tokens | Anthropic Cost | Your Markup | Revenue |
|----------|------------------|-------------------|----------------|-------------|---------|
| Content Generation (Stages 1+2) | ~8,000 | ~6,000 | ~$0.35 | Varies | $5-10 |
| Performance Analysis (Stage 3) | ~4,000 | ~3,000 | ~$0.18 | Varies | $3-5 |

### Monthly Cost Examples

**100 content generations + 50 performance analyses**
- Anthropic costs: (100 × $0.35) + (50 × $0.18) = $44
- Your revenue at $8 avg: (100 × $8) + (50 × $4) = $1,000
- Net profit: $956

---

## Support

For API support or to report issues:
- Email: support@your-domain.com
- Documentation: [Link to this documentation]
- Status Page: [Your status monitoring page]

---

## Changelog

### Version 1.0 (January 2025)
- Initial release
- Content generation endpoint (Stages 1 & 2)
- Performance analysis endpoint (Stage 3)
- JSON and markdown output formats
