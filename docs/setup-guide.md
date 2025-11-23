# Complete Setup Guide: Triple-Threat Content Strategy Agent

This guide will walk you through setting up the complete content strategy system, from n8n installation to your first API call.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Environment Setup](#environment-setup)
3. [n8n Installation](#n8n-installation)
4. [Workflow Import & Configuration](#workflow-import--configuration)
5. [API Credential Setup](#api-credential-setup)
6. [Testing & Validation](#testing--validation)
7. [Production Deployment](#production-deployment)
8. [Optional Enhancements](#optional-enhancements)

---

## Prerequisites

### Required Accounts
- **Anthropic API Account**: Sign up at [console.anthropic.com](https://console.anthropic.com)
  - Recommended: Add $50+ credits for testing
  - Recommended model: Claude 3.5 Sonnet
- **n8n Instance**: Choose one of:
  - n8n Cloud (easiest): [n8n.io](https://n8n.io)
  - Self-hosted Docker
  - Self-hosted npm

### Technical Requirements
- Basic understanding of JSON
- Ability to make HTTP requests (cURL, Postman, or similar)
- Text editor for viewing/editing JSON files

### Recommended Tools
- **Postman** or **Insomnia**: For testing webhook endpoints
- **jq**: For parsing JSON responses (optional)

---

## Environment Setup

### Option A: n8n Cloud (Recommended for Beginners)

1. **Sign up for n8n Cloud**
   - Go to [n8n.io](https://n8n.io)
   - Create an account (free tier available)
   - Verify your email

2. **Access your n8n instance**
   - Log in to your n8n dashboard
   - Note your instance URL (e.g., `https://yourname.app.n8n.cloud`)

### Option B: Self-Hosted Docker

1. **Install Docker**
   ```bash
   # Verify Docker installation
   docker --version
   ```

2. **Run n8n container**
   ```bash
   docker run -it --rm \
     --name n8n \
     -p 5678:5678 \
     -v ~/.n8n:/home/node/.n8n \
     n8nio/n8n
   ```

3. **Access n8n**
   - Open browser to `http://localhost:5678`
   - Create admin account

### Option C: Self-Hosted npm

1. **Install n8n globally**
   ```bash
   npm install n8n -g
   ```

2. **Start n8n**
   ```bash
   n8n start
   ```

3. **Access n8n**
   - Open browser to `http://localhost:5678`
   - Create admin account

---

## n8n Installation

### Initial Configuration

1. **Complete the setup wizard**
   - Set admin username and password
   - Configure timezone
   - Skip optional integrations for now

2. **Familiarize yourself with the interface**
   - Left sidebar: Workflows, Credentials, Executions
   - Main canvas: Where nodes are placed
   - Right panel: Node settings

---

## Workflow Import & Configuration

### Import Main Content Workflow (Stages 1 & 2)

1. **Download the workflow file**
   - Locate `workflows/main-content-workflow.json` in this repository

2. **Import into n8n**
   - In n8n, click **Workflows** in the left sidebar
   - Click **Import from File**
   - Select `main-content-workflow.json`
   - Click **Import**

3. **Review the workflow**
   - You should see 7 nodes:
     1. Webhook Trigger
     2. Set User Variables
     3. Anthropic - Stage 1 Analysis
     4. Parse Stage 1 JSON
     5. Anthropic - Stage 2 Content Generation
     6. Format Output
     7. Webhook Response

4. **Configure the Webhook node**
   - Click on **Webhook Trigger** node
   - Note the **Webhook URLs** (Production and Test)
   - Keep **HTTP Method** as POST
   - Keep **Path** as `content-strategy-agent`

5. **Save the workflow**
   - Click **Save** in the top right
   - Name it "Content Strategy Agent - Main"

### Import Refinement Workflow (Stage 3)

1. **Import the refinement workflow**
   - Click **Workflows** → **Import from File**
   - Select `workflows/refinement-workflow.json`
   - Click **Import**

2. **Review the workflow**
   - You should see 5 nodes:
     1. Webhook Trigger - Performance Data
     2. Set Performance Variables
     3. Anthropic - Stage 3 Performance Analysis
     4. Format Analysis Output
     5. Webhook Response

3. **Configure the Webhook node**
   - Click on **Webhook Trigger - Performance Data** node
   - Note the **Webhook URLs**
   - Keep **Path** as `content-performance-analysis`

4. **Save the workflow**
   - Click **Save**
   - Name it "Content Strategy Agent - Performance Refinement"

---

## API Credential Setup

### Configure Anthropic API Credentials

1. **Get your Anthropic API key**
   - Log in to [console.anthropic.com](https://console.anthropic.com)
   - Navigate to **API Keys**
   - Click **Create Key**
   - Copy the key (starts with `sk-ant-`)
   - **Important**: Save this key securely - you won't see it again

2. **Add credentials to n8n**
   - In n8n, click **Credentials** in the left sidebar
   - Click **Add Credential**
   - Search for "Anthropic"
   - Select **Anthropic API**

3. **Configure the credential**
   - **Name**: "Anthropic API" (or any descriptive name)
   - **API Key**: Paste your Anthropic API key
   - Click **Save**

4. **Link credentials to workflow nodes**
   - Go back to **Content Strategy Agent - Main** workflow
   - Click on **Anthropic - Stage 1 Analysis** node
   - In the **Credentials** dropdown, select your Anthropic credential
   - Click on **Anthropic - Stage 2 Content Generation** node
   - Select the same credential
   - Click **Save** workflow

5. **Repeat for refinement workflow**
   - Go to **Content Strategy Agent - Performance Refinement** workflow
   - Click on **Anthropic - Stage 3 Performance Analysis** node
   - Select your Anthropic credential
   - Click **Save**

---

## Testing & Validation

### Test the Main Workflow (Stages 1 & 2)

1. **Activate the workflow**
   - Open **Content Strategy Agent - Main** workflow
   - Toggle the **Active** switch in the top right (should turn green)

2. **Get the webhook URL**
   - Click on **Webhook Trigger** node
   - Copy the **Production URL** (e.g., `https://yourname.app.n8n.cloud/webhook/content-strategy-agent`)

3. **Prepare test data**
   - Create a file `test-request.json`:
   ```json
   {
     "TARGET_INDUSTRY": "B2B SaaS Marketing",
     "CORE_TOPIC": "Content Marketing ROI",
     "BRAND_VOICE": "data-driven, authoritative yet approachable",
     "TARGET_AUDIENCE": "Marketing Directors at Series A-B startups, 30-40 years old, managing teams of 3-8 people",
     "COMPETITOR_URLS": "https://contentmarketinginstitute.com, https://blog.hubspot.com, https://www.semrush.com/blog/",
     "UNIQUE_ANGLE": "We focus on ROI measurement for teams WITHOUT dedicated analytics resources",
     "BUSINESS_GOAL": "increase demo bookings by 30%"
   }
   ```

4. **Make the API call**
   ```bash
   curl -X POST "https://yourname.app.n8n.cloud/webhook/content-strategy-agent" \
     -H "Content-Type: application/json" \
     -d @test-request.json
   ```

5. **Verify the response**
   - You should receive a JSON response with:
     - `full_content`: Complete markdown content suite
     - `linkedin_content`: Extracted LinkedIn post section
     - `instagram_content`: Extracted Instagram post section
     - `tiktok_content`: Extracted TikTok script section
     - `stage1_report`: The strategic analysis JSON
     - `timestamp`: When the content was generated

6. **Check execution in n8n**
   - In n8n, click **Executions** in the left sidebar
   - You should see a successful execution
   - Click on it to see the data flow through each node

### Test the Refinement Workflow (Stage 3)

1. **Activate the workflow**
   - Open **Content Strategy Agent - Performance Refinement** workflow
   - Toggle **Active**

2. **Prepare performance test data**
   - Create a file `test-performance.json`:
   ```json
   {
     "ORIGINAL_POST_COPY": "Most marketers waste 60% of their content budget.\n\nHere's what they're missing:\n\nI spent 5 years analyzing content ROI across 200+ B2B companies.\n\nThe gap isn't creativity. It's measurement.\n\nHere's the framework we use:\n\n1. Set baseline metrics (current engagement rates)\n2. Define content-specific KPIs (not vanity metrics)\n3. Track attribution across the buyer journey\n4. Calculate true cost-per-acquisition\n\nMost teams stop at impressions.\n\nWinning teams measure business impact.\n\nComment ROI below and I'll send you our free calculator.",
     "PLATFORM": "LinkedIn",
     "ACTUAL_ENGAGEMENT_METRICS": "Impressions: 3,200, Likes: 45, Comments: 8, Shares: 2, Engagement Rate: 1.7%, Click-throughs: 12, CTR: 0.4%",
     "PERFORMANCE_BENCHMARK": "Expected Impressions: 5,000+, Expected Engagement Rate: 4.5%, Expected CTR: 2.0%, Expected Comments: 25+",
     "BUSINESS_GOAL": "increase demo bookings by 30%",
     "TARGET_AUDIENCE": "Marketing Directors at Series A-B startups, 30-40 years old"
   }
   ```

3. **Make the API call**
   ```bash
   curl -X POST "https://yourname.app.n8n.cloud/webhook/content-performance-analysis" \
     -H "Content-Type: application/json" \
     -d @test-performance.json
   ```

4. **Verify the response**
   - You should receive a JSON response with:
     - `performance_analysis`: Complete markdown diagnostic report with A/B test variations
     - `timestamp`: Analysis timestamp
     - `original_metrics`: The input data for reference

---

## Production Deployment

### Security Best Practices

1. **Enable webhook authentication** (n8n Cloud/Enterprise)
   - Edit **Webhook Trigger** node
   - Under **Authentication**, select **Header Auth**
   - Set header name: `X-API-Key`
   - Generate a secure random key: `openssl rand -hex 32`
   - Provide this key to authorized users

2. **Rate limiting** (if using self-hosted)
   - Configure nginx or similar reverse proxy
   - Set rate limits (e.g., 10 requests/minute per IP)

3. **Monitor API costs**
   - Track Anthropic API usage in console
   - Set up billing alerts
   - Average cost per full workflow run: ~$0.35

### Production Checklist

- [ ] Workflows are active
- [ ] Webhook authentication is enabled
- [ ] API credentials are secure (not shared in plain text)
- [ ] Billing alerts are set up on Anthropic account
- [ ] Webhook URLs are documented for users
- [ ] Error handling is tested (try invalid inputs)
- [ ] Backup workflow JSONs are saved externally

---

## Optional Enhancements

### 1. Database Integration for Content Storage

**Use Case**: Store generated content in Airtable, Notion, or Google Sheets for review and scheduling.

**Implementation**:
1. Add a new node after **Format Output** in the main workflow
2. Add **Airtable** / **Notion** / **Google Sheets** node
3. Map the output fields to database columns:
   - LinkedIn Content
   - Instagram Content
   - TikTok Content
   - Strategy Analysis
   - Generation Timestamp
   - Status (Draft/Review/Published)

### 2. Slack Notifications

**Use Case**: Alert team when new content is ready for review.

**Implementation**:
1. Add **Slack** node after **Format Output**
2. Configure Slack credential
3. Set message template:
   ```
   🎯 New Content Strategy Ready!

   Industry: {{$('Set User Variables').item.json.TARGET_INDUSTRY}}
   Topic: {{$('Set User Variables').item.json.CORE_TOPIC}}

   Review the content in [Database Link]
   ```

### 3. Scheduled Content Generation

**Use Case**: Automatically generate content on a recurring schedule.

**Implementation**:
1. Duplicate the main workflow
2. Replace **Webhook Trigger** with **Schedule Trigger**
3. Set recurrence (e.g., weekly)
4. Pre-configure input variables in a **Set** node
5. Send output to database or Slack

### 4. Multi-Language Support

**Use Case**: Generate content in multiple languages.

**Implementation**:
1. Add a new input variable: `TARGET_LANGUAGE`
2. Update system prompts to include:
   ```
   Generate all content in {{TARGET_LANGUAGE}}.
   Maintain cultural relevance and idiomatic expressions appropriate for native speakers.
   ```

### 5. Visual Content Generation

**Use Case**: Generate images or design suggestions for social posts.

**Implementation**:
1. Add **OpenAI DALL-E** or **Stability AI** node after content generation
2. Extract visual descriptions from Stage 2 output
3. Generate images based on descriptions
4. Return image URLs in final output

### 6. Content Calendar Integration

**Use Case**: Automatically schedule posts in Buffer, Hootsuite, or Later.

**Implementation**:
1. Add scheduling platform node (e.g., **Buffer**)
2. Map content to platform's required format
3. Set posting schedule based on platform best practices
4. Handle authentication and account selection

---

## Troubleshooting

### Common Issues & Solutions

#### Issue: "Workflow could not be activated"
**Cause**: Webhook path conflict or missing credentials
**Solution**:
- Ensure webhook paths are unique across workflows
- Verify all nodes have required credentials configured

#### Issue: "Anthropic API returned 401 Unauthorized"
**Cause**: Invalid or expired API key
**Solution**:
- Regenerate API key in Anthropic console
- Update credential in n8n
- Verify key has no extra spaces

#### Issue: "JSON parsing failed in Parse Stage 1 JSON node"
**Cause**: Claude returned markdown code blocks instead of raw JSON
**Solution**:
- The system prompt already instructs against this
- If it persists, update the parsing Code node to strip markdown:
```javascript
let jsonText = response;
if (jsonText.includes('```json')) {
  jsonText = jsonText.split('```json')[1].split('```')[0];
}
jsonOutput = JSON.parse(jsonText.trim());
```

#### Issue: "Content is too generic or not aligned with inputs"
**Cause**: Vague or incomplete input variables
**Solution**:
- Provide specific, detailed UNIQUE_ANGLE
- Include actual competitor URLs (not just domain names)
- Be explicit about TARGET_AUDIENCE demographics and pain points

#### Issue: "Workflow times out"
**Cause**: Claude API taking too long (rare)
**Solution**:
- Increase workflow timeout in n8n settings
- Consider using Claude 3 Haiku for faster (but lower quality) responses
- Split into separate workflow runs if needed

#### Issue: "High API costs"
**Cause**: Long prompts + long outputs
**Solution**:
- Monitor token usage in Anthropic console
- Consider using Claude 3.5 Haiku for Stage 3 (performance analysis)
- Implement caching for frequently used prompts (Anthropic Prompt Caching)

---

## Next Steps

Now that your system is set up and tested:

1. **Customize the prompts**: Edit `/prompts/*.md` files to match your specific needs
2. **Build a front-end**: Create a simple UI for non-technical users
3. **Monetize**: See `docs/monetization-guide.md` for productization strategies
4. **Scale**: Consider batch processing for multiple clients or topics

---

## Support Resources

- **n8n Documentation**: [docs.n8n.io](https://docs.n8n.io)
- **n8n Community Forum**: [community.n8n.io](https://community.n8n.io)
- **Anthropic API Docs**: [docs.anthropic.com](https://docs.anthropic.com)
- **Claude Prompt Engineering**: [docs.anthropic.com/claude/docs/prompt-engineering](https://docs.anthropic.com/claude/docs/prompt-engineering)

---

**Setup complete!** You now have a fully functional three-stage content strategy agent. Start generating your first content suite and iterating based on performance data.
