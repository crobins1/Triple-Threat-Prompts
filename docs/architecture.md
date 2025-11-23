# Architecture: Triple-Threat Content Strategy Agent

This document provides a technical overview of the system architecture, data flow, and component interactions.

---

## Table of Contents

- [System Overview](#system-overview)
- [Main Workflow Architecture](#main-workflow-architecture)
- [Refinement Workflow Architecture](#refinement-workflow-architecture)
- [Data Flow](#data-flow)
- [Component Details](#component-details)
- [Integration Points](#integration-points)
- [Scalability Considerations](#scalability-considerations)

---

## System Overview

The Triple-Threat Content Strategy Agent consists of two primary n8n workflows orchestrating Claude AI API calls through a three-stage content strategy pipeline:

```
┌─────────────────────────────────────────────────────────────┐
│                   Content Strategy System                    │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  ┌──────────────────────────────────────────────────────┐  │
│  │         Main Workflow (Stages 1 & 2)                │   │
│  │  Research Analysis → Content Generation              │   │
│  └──────────────────────────────────────────────────────┘  │
│                                                               │
│  ┌──────────────────────────────────────────────────────┐  │
│  │         Refinement Workflow (Stage 3)                │   │
│  │  Performance Analysis → A/B Test Variations          │   │
│  └──────────────────────────────────────────────────────┘  │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

### Key Components

1. **n8n Workflow Engine**: Orchestrates the pipeline
2. **Anthropic Claude API**: Powers all AI analysis and generation
3. **Webhook Triggers**: HTTP endpoints for API access
4. **System Prompts**: Specialized prompt templates for each stage
5. **JSON/Markdown Processors**: Parse and format responses

---

## Main Workflow Architecture

### Visual Flow Diagram

```
User Request (JSON)
      │
      ▼
┌──────────────┐
│   Webhook    │  POST /content-strategy-agent
│   Trigger    │  Accepts JSON with 7 input variables
└──────┬───────┘
       │
       ▼
┌──────────────┐
│     Set      │  Extract and normalize input variables:
│  Variables   │  - TARGET_INDUSTRY
└──────┬───────┘  - CORE_TOPIC
       │          - BRAND_VOICE
       │          - TARGET_AUDIENCE
       │          - COMPETITOR_URLS
       │          - UNIQUE_ANGLE
       │          - BUSINESS_GOAL
       ▼
┌──────────────┐
│  Anthropic   │  System Prompt: Stage 1 Research Analyst
│   Stage 1    │  Input: All 7 variables
│   Analysis   │  Model: Claude 3.5 Sonnet
└──────┬───────┘  Output: Strict JSON
       │          Duration: ~30-60 seconds
       │
       ▼
┌──────────────┐
│  Parse JSON  │  Extract Claude's JSON response
│     Code     │  Handle different response formats
└──────┬───────┘  Validate structure
       │
       ▼
┌──────────────┐
│  Anthropic   │  System Prompt: Stage 2 Content Generator
│   Stage 2    │  Input: Stage 1 JSON + brand parameters
│   Content    │  Model: Claude 3.5 Sonnet
└──────┬───────┘  Output: Markdown content suite
       │          Duration: ~45-90 seconds
       │
       ▼
┌──────────────┐
│    Format    │  Extract platform-specific sections
│    Output    │  - LinkedIn content
└──────┬───────┘  - Instagram content
       │          - TikTok script
       │          - Full markdown document
       │
       ▼
┌──────────────┐
│   Webhook    │  Return JSON response to client
│   Response   │  Status: 200 OK
└──────────────┘  Content-Type: application/json
```

### Node Details

| Node | Type | Purpose | Processing Time |
|------|------|---------|----------------|
| Webhook Trigger | n8n-nodes-base.webhook | Accept HTTP POST requests | Instant |
| Set User Variables | n8n-nodes-base.set | Normalize input data | Instant |
| Anthropic - Stage 1 | @n8n/n8n-nodes-langchain.lmChatAnthropic | Competitive analysis | 30-60s |
| Parse Stage 1 JSON | n8n-nodes-base.code | Extract JSON from response | <1s |
| Anthropic - Stage 2 | @n8n/n8n-nodes-langchain.lmChatAnthropic | Content generation | 45-90s |
| Format Output | n8n-nodes-base.code | Structure final response | <1s |
| Webhook Response | n8n-nodes-base.respondToWebhook | Return to client | Instant |

**Total Processing Time:** 80-150 seconds (~1.5-2.5 minutes)

---

## Refinement Workflow Architecture

### Visual Flow Diagram

```
Performance Data (JSON)
      │
      ▼
┌──────────────┐
│   Webhook    │  POST /content-performance-analysis
│   Trigger    │  Accepts performance metrics
└──────┬───────┘
       │
       ▼
┌──────────────┐
│     Set      │  Extract input variables:
│ Performance  │  - ORIGINAL_POST_COPY
│  Variables   │  - PLATFORM
└──────┬───────┘  - ACTUAL_ENGAGEMENT_METRICS
       │          - PERFORMANCE_BENCHMARK
       │          - BUSINESS_GOAL
       │          - TARGET_AUDIENCE
       ▼
┌──────────────┐
│  Anthropic   │  System Prompt: Stage 3 Performance Evaluator
│   Stage 3    │  Input: Post + metrics
│  Analysis    │  Model: Claude 3.5 Sonnet
└──────┬───────┘  Output: Diagnostic markdown
       │          Duration: ~20-40 seconds
       │
       ▼
┌──────────────┐
│    Format    │  Extract analysis components:
│   Analysis   │  - Root cause diagnosis
└──────┬───────┘  - A/B test variations
       │          - Testing protocol
       │
       ▼
┌──────────────┐
│   Webhook    │  Return JSON with analysis
│   Response   │  Status: 200 OK
└──────────────┘
```

**Total Processing Time:** 30-60 seconds

---

## Data Flow

### Stage 1: Research & Analysis

```
Input Variables (7 fields)
        │
        ▼
┌──────────────────────────────────┐
│   Stage 1 System Prompt          │
│   - Competitive audit framework  │
│   - Gap analysis methodology     │
│   - Platform strategy templates  │
└───────────┬──────────────────────┘
            │
            ▼
      Claude API Call
            │
            ▼
┌──────────────────────────────────┐
│    Structured JSON Output         │
│  {                                │
│    "analysis_metadata": {...},   │
│    "competitive_landscape": {...},│
│    "strategic_opportunities": [...],│
│    "platform_strategies": {...}, │
│    "execution_priorities": {...} │
│  }                                │
└───────────┬──────────────────────┘
            │
            ▼
      Parsed & Validated
            │
            ▼
     Passed to Stage 2
```

### Stage 2: Content Generation

```
Stage 1 JSON + Brand Parameters
        │
        ▼
┌──────────────────────────────────┐
│   Stage 2 System Prompt          │
│   - Platform-specific templates  │
│   - Voice/tone guidelines        │
│   - Format specifications        │
└───────────┬──────────────────────┘
            │
            ▼
      Claude API Call
            │
            ▼
┌──────────────────────────────────┐
│   Markdown Content Suite          │
│   - LinkedIn post + metadata     │
│   - Instagram post + visuals     │
│   - TikTok script + directions   │
│   - Cross-platform strategy      │
└───────────┬──────────────────────┘
            │
            ▼
  Sectioned & Formatted
            │
            ▼
    Returned to Client
```

### Stage 3: Performance Analysis

```
Original Post + Metrics
        │
        ▼
┌──────────────────────────────────┐
│   Stage 3 System Prompt          │
│   - Diagnostic frameworks        │
│   - Hypothesis generation        │
│   - A/B test templates           │
└───────────┬──────────────────────┘
            │
            ▼
      Claude API Call
            │
            ▼
┌──────────────────────────────────┐
│  Diagnostic Report (Markdown)    │
│  - Performance summary table     │
│  - Root cause analysis           │
│  - 3 A/B test variations         │
│  - Testing protocol              │
└───────────┬──────────────────────┘
            │
            ▼
    Returned to Client
```

---

## Component Details

### System Prompts

Each stage uses a specialized system prompt stored in `/prompts/`:

**Stage 1: `stage1-research-analyst.md`**
- Role: Elite strategic analyst
- Input: 7 business/market variables
- Output: Strict JSON (enforced via prompt)
- Focus: Competitive gaps, strategic opportunities
- Token count: ~3,500 tokens

**Stage 2: `stage2-content-generator.md`**
- Role: World-class content creator
- Input: Stage 1 JSON + brand voice
- Output: Structured markdown
- Focus: Platform optimization, engagement
- Token count: ~4,000 tokens

**Stage 3: `stage3-performance-evaluator.md`**
- Role: Performance analyst
- Input: Post + actual vs. expected metrics
- Output: Diagnostic report
- Focus: Root causes, testable hypotheses
- Token count: ~4,500 tokens

### API Integration

All stages use Anthropic's Messages API:

```javascript
// Simplified API call structure
{
  "model": "claude-3-5-sonnet-20241022",
  "max_tokens": 4096,
  "system": "<system_prompt_content>",
  "messages": [
    {
      "role": "user",
      "content": "<user_input_with_variables>"
    }
  ]
}
```

**Response Handling:**
- Stage 1: Extract JSON from `response.content[0].text`
- Stage 2: Extract markdown from `response.content[0].text`
- Stage 3: Extract markdown from `response.content[0].text`

### Error Handling

Each workflow includes error handling for:

1. **Invalid Input**: Missing required fields → 400 Bad Request
2. **API Errors**: Anthropic API failures → 500 Internal Server Error
3. **Parsing Failures**: JSON/content extraction errors → Retry logic
4. **Timeouts**: Long-running requests → 180s timeout on main workflow

---

## Integration Points

### External Systems

The workflows can integrate with:

```
┌─────────────────────────────────────────────────────────┐
│              External Integration Options                │
├─────────────────────────────────────────────────────────┤
│                                                           │
│  Input Sources:              Output Destinations:        │
│  ├─ Web Forms                ├─ Airtable / Notion       │
│  ├─ Zapier                   ├─ Google Sheets           │
│  ├─ Make.com                 ├─ Slack / Email           │
│  ├─ Custom Apps              ├─ Content Calendars       │
│  └─ API Gateways             └─ Social Schedulers       │
│                                                           │
└─────────────────────────────────────────────────────────┘
```

### Extension Nodes

Can add these n8n nodes between stages:

1. **After Stage 1**:
   - Database storage (PostgreSQL, MongoDB)
   - Notification (Slack, email)
   - Data enrichment (web scraping, API calls)

2. **After Stage 2**:
   - Content storage (CMS, database)
   - Image generation (DALL-E, Midjourney)
   - Scheduling (Buffer, Hootsuite)

3. **After Stage 3**:
   - Task creation (Asana, Trello)
   - Report distribution (email, Slack)
   - Analytics tracking (Google Sheets)

---

## Scalability Considerations

### Current Capacity

- **Request Rate**: Limited by n8n plan and Anthropic rate limits
- **Concurrent Workflows**: n8n handles multiple simultaneous executions
- **Response Time**: 1.5-2.5 minutes for main workflow (inherent to AI processing)

### Scaling Strategies

#### Horizontal Scaling
```
Load Balancer
      │
      ├─── n8n Instance 1 ───┐
      ├─── n8n Instance 2 ───┤─── Shared Anthropic API
      └─── n8n Instance 3 ───┘
```

#### Caching Layer
```
Request → Cache Check → (Hit) → Return Cached Response
             │
             └─── (Miss) → Execute Workflow → Cache Result → Return Response
```

#### Queue-Based Processing
```
API Endpoint → Job Queue (Redis/RabbitMQ) → Worker Processes → Database → Status API
```

### Performance Optimization

1. **Prompt Caching**: Use Anthropic's prompt caching for system prompts (reduces cost & latency)
2. **Batch Processing**: Process multiple requests in batches during off-peak
3. **Model Selection**: Use Claude 3.5 Haiku for Stage 3 (faster, cheaper, sufficient quality)
4. **Response Streaming**: Implement streaming for real-time output (future enhancement)

---

## Security Architecture

### Authentication Flow

```
Client Request
      │
      ▼
┌──────────────┐
│   Validate   │  Check X-API-Key header
│   API Key    │  Compare against stored keys
└──────┬───────┘
       │ (Valid)
       ▼
┌──────────────┐
│   Execute    │  Process workflow
│   Workflow   │
└──────┬───────┘
       │
       ▼
    Return Response

    (Invalid)
       │
       ▼
    401 Unauthorized
```

### Data Privacy

- **Input Data**: Processed by Anthropic (subject to their privacy policy)
- **Storage**: Workflows don't store data by default (add nodes if needed)
- **Credentials**: Stored encrypted in n8n
- **API Keys**: Never logged or returned in responses

---

## Monitoring & Observability

### Recommended Metrics

```
┌─────────────────────────────────────────────────────────┐
│                    Monitoring Dashboard                  │
├─────────────────────────────────────────────────────────┤
│                                                           │
│  Performance Metrics:           Business Metrics:        │
│  ├─ Request count               ├─ API revenue           │
│  ├─ Response time (p50, p95)    ├─ User retention        │
│  ├─ Error rate                  ├─ Content generated     │
│  ├─ Anthropic API costs         └─ Conversion rate       │
│  └─ Cache hit rate                                       │
│                                                           │
│  Alert Conditions:                                       │
│  ├─ Error rate > 5%                                      │
│  ├─ Response time > 3 minutes                            │
│  ├─ API cost spike > 50%                                 │
│  └─ Workflow failure                                     │
│                                                           │
└─────────────────────────────────────────────────────────┘
```

### Logging Strategy

```javascript
// Key events to log:
{
  "timestamp": "2025-01-23T10:30:45Z",
  "workflow": "main-content-workflow",
  "stage": "stage_1_analysis",
  "duration_ms": 45230,
  "input_tokens": 8234,
  "output_tokens": 5621,
  "status": "success",
  "user_id": "client_123"
}
```

---

## Future Architecture Enhancements

### Planned Improvements

1. **Multi-Model Support**: Add support for GPT-4, Gemini as alternatives
2. **Streaming Responses**: Real-time content generation updates
3. **Workflow Templates**: Pre-configured variations for different industries
4. **Analytics Dashboard**: Built-in performance tracking and reporting
5. **Multi-Language**: Support for content generation in multiple languages

### Experimental Features

- **Voice Clone Integration**: Generate audio versions of content
- **Image Generation**: Auto-generate visuals for social posts
- **SEO Optimization**: Integrate keyword research and optimization
- **A/B Test Automation**: Auto-launch and track test variations

---

## Technical Specifications

### Requirements

- **n8n Version**: 1.0.0 or higher
- **Node.js**: 18.x or higher (for self-hosted)
- **Anthropic API**: Claude 3.5 Sonnet (or newer)
- **Memory**: Minimum 512MB per workflow execution
- **Storage**: Minimal (unless adding database nodes)

### API Limits

- **Input Size**: Max 100KB per request
- **Output Size**: ~50-100KB per response
- **Timeout**: 180 seconds (main), 90 seconds (refinement)
- **Rate Limit**: Depends on n8n plan and Anthropic tier

---

This architecture is designed for:
✅ **Reliability**: Graceful error handling, clear failure modes
✅ **Scalability**: Easy horizontal scaling, caching-ready
✅ **Extensibility**: Modular design, integration-friendly
✅ **Maintainability**: Clear separation of concerns, well-documented
