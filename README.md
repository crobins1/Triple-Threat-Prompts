# Triple-Threat Content Strategy Agent

## 🎯 Overview

The **Triple-Threat Content Strategy Agent** is a production-ready n8n workflow system that transforms competitive analysis into platform-optimized social media content using Claude AI. This three-stage architecture delivers:

1. **Stage 1: Strategic Analysis** - Deep competitive reconnaissance and content gap identification
2. **Stage 2: Content Generation** - Platform-specific, publish-ready content (LinkedIn, Instagram, TikTok)
3. **Stage 3: Performance Optimization** - Data-driven refinement and A/B test recommendations

This system is designed for content creators, marketers, and agencies who need to systematically produce high-performing content that exploits competitive weaknesses and drives measurable business results.

---

## ✨ Key Features

### 🔍 Competitive Intelligence
- Automated analysis of 3-5 competitor accounts
- Pattern recognition for high-performing content themes
- Gap identification for underserved topics and angles
- Strategic opportunity mapping across platforms

### 📝 Platform-Optimized Content
- **LinkedIn**: Authority-building thought leadership (1,200-1,800 chars)
- **Instagram/Threads**: Engagement-driving visual posts (600-1,000 chars)
- **TikTok/YouTube Shorts**: Conversion-focused video scripts (60-90 seconds)

### 📊 Performance Refinement
- Root cause analysis for underperforming content
- Hypothesis-driven A/B test variations
- Clear success metrics and testing protocols
- Continuous learning from performance data

---

## 🚀 Quick Start

### Prerequisites
- n8n instance (cloud or self-hosted)
- Anthropic API key (Claude 3.5 Sonnet recommended)
- Basic understanding of JSON and webhooks

### Installation

1. **Clone this repository**
   ```bash
   git clone https://github.com/yourusername/Triple-Threat-Prompts.git
   cd Triple-Threat-Prompts
   ```

2. **Import workflows into n8n**
   - Open n8n
   - Go to Workflows → Import from File
   - Import `workflows/main-content-workflow.json`
   - Import `workflows/refinement-workflow.json`

3. **Configure Anthropic credentials**
   - In n8n, go to Credentials
   - Add new credential: Anthropic API
   - Enter your API key

4. **Activate workflows**
   - Enable both workflows
   - Note the webhook URLs for API calls

### Basic Usage

#### Generate Content (Stages 1 & 2)

```bash
curl -X POST https://your-n8n-instance.com/webhook/content-strategy-agent \
  -H "Content-Type: application/json" \
  -d '{
    "TARGET_INDUSTRY": "B2B SaaS Marketing",
    "CORE_TOPIC": "Product-Led Growth Strategies",
    "BRAND_VOICE": "authoritative yet approachable, data-driven",
    "TARGET_AUDIENCE": "Marketing Directors at mid-market SaaS companies, 30-45 years old",
    "COMPETITOR_URLS": "https://competitor1.com, https://competitor2.com, https://competitor3.com",
    "UNIQUE_ANGLE": "We focus on PLG for companies WITHOUT a freemium model",
    "BUSINESS_GOAL": "increase newsletter signups by 25%"
  }'
```

#### Analyze Performance (Stage 3)

```bash
curl -X POST https://your-n8n-instance.com/webhook/content-performance-analysis \
  -H "Content-Type: application/json" \
  -d '{
    "ORIGINAL_POST_COPY": "Your published LinkedIn post copy here...",
    "PLATFORM": "LinkedIn",
    "ACTUAL_ENGAGEMENT_METRICS": "Impressions: 3,200, Engagement Rate: 2.1%, CTR: 0.8%",
    "PERFORMANCE_BENCHMARK": "Expected Engagement Rate: 4.5%, Expected CTR: 2.0%",
    "BUSINESS_GOAL": "increase newsletter signups",
    "TARGET_AUDIENCE": "Marketing Directors at mid-market SaaS companies"
  }'
```

---

## 📁 Project Structure

```
Triple-Threat-Prompts/
├── prompts/                           # System prompts for each stage
│   ├── stage1-research-analyst.md     # Competitive analysis prompt
│   ├── stage2-content-generator.md    # Content generation prompt
│   └── stage3-performance-evaluator.md # Performance analysis prompt
│
├── workflows/                         # n8n workflow JSON files
│   ├── main-content-workflow.json     # Stages 1 & 2 workflow
│   └── refinement-workflow.json       # Stage 3 workflow
│
├── docs/                              # Documentation
│   ├── setup-guide.md                 # Detailed installation guide
│   ├── api-documentation.md           # API reference
│   └── monetization-guide.md          # How to productize this system
│
├── examples/                          # Example inputs and outputs
│   ├── sample-input.json              # Example API request
│   └── sample-output.json             # Example API response
│
└── README.md                          # This file
```

---

## 🏗️ Architecture

### Stage 1: Research & Competitive Analyst
**Input**: Industry, topic, competitors, brand parameters
**Process**:
- Competitive content audit
- Strategic opportunity identification
- Platform-specific strategy recommendations

**Output**: Structured JSON with competitive landscape, opportunities, and platform strategies

### Stage 2: Brand Voice Content Generator
**Input**: Stage 1 JSON + brand voice + audience
**Process**:
- Transform strategic insights into platform-optimized copy
- Apply voice/tone guidelines
- Include visual and delivery notes

**Output**: Markdown document with 3 publish-ready content pieces + strategic rationale

### Stage 3: Performance Evaluator & Refiner
**Input**: Original post + actual metrics + benchmarks
**Process**:
- Root cause analysis (hook, content, CTA)
- Hypothesis generation
- A/B test variation creation

**Output**: Diagnostic report + 3 testable variations with success criteria

---

## 💡 Use Cases

### For Content Creators
- Generate 3 platform-specific posts from a single strategic brief
- Systematically improve content based on performance data
- Build a repeatable content production system

### For Marketing Agencies
- Scale content production for multiple clients
- Deliver data-driven content recommendations
- Provide strategic analysis as a premium service

### For SaaS Companies
- Automate thought leadership content creation
- Optimize conversion-focused content
- Build predictable content performance

---

## 🔧 Customization

### Modify System Prompts
The prompts in `/prompts/` can be customized for:
- Different content formats (blog posts, email, ads)
- Industry-specific requirements
- Alternative platform strategies
- Custom quality standards

### Extend Workflows
The n8n workflows can be enhanced with:
- **Database Integration**: Store outputs in Airtable, Notion, or Google Sheets
- **Scheduling**: Auto-post content to social platforms
- **Notifications**: Send alerts via Slack, email, or SMS
- **Analytics**: Connect to Google Analytics or platform APIs for automatic metric collection

### API Wrapper
Monetize by wrapping the webhook in an API management platform:
- **RapidAPI**: List as a paid API service
- **Spinstack**: Build a no-code API product
- **Custom Frontend**: Create a UI with payment integration

---

## 📊 Performance Expectations

### Stage 1 Analysis
- **Processing Time**: 30-60 seconds
- **API Cost**: ~$0.15 per analysis (Claude 3.5 Sonnet)
- **Output Quality**: High specificity requires quality competitor URLs

### Stage 2 Content Generation
- **Processing Time**: 45-90 seconds
- **API Cost**: ~$0.20 per content suite
- **Output Quality**: Immediately publishable with minimal editing

### Stage 3 Performance Analysis
- **Processing Time**: 20-40 seconds
- **API Cost**: ~$0.10 per analysis
- **Output Quality**: Actionable A/B tests with clear hypotheses

---

## 🛠️ Troubleshooting

### Common Issues

**Issue**: Anthropic node returns error
**Solution**: Verify API key is valid and has sufficient credits

**Issue**: JSON parsing fails in Stage 1
**Solution**: Check that Claude output doesn't include markdown code blocks (prompt enforces raw JSON)

**Issue**: Content is too generic
**Solution**: Provide more specific UNIQUE_ANGLE and detailed competitor URLs

**Issue**: A/B tests aren't significantly different
**Solution**: Check that ACTUAL_ENGAGEMENT_METRICS clearly shows underperformance vs benchmark

---

## 🚀 Monetization Options

### 1. API-as-a-Service
Wrap the webhook endpoints and charge per API call:
- **Pricing Model**: $5-10 per content suite generation
- **Target Market**: Small agencies, solopreneurs, content creators

### 2. White-Label Solution
Customize and resell the workflow:
- **Pricing Model**: $500-2,000 setup fee + $99-299/month
- **Target Market**: Marketing agencies, consultants

### 3. Template + Training
Sell the workflow template with video tutorials:
- **Pricing Model**: $197-497 one-time purchase
- **Target Market**: n8n users, marketing automation enthusiasts

See `docs/monetization-guide.md` for detailed strategies.

---

## 📚 Resources

- [n8n Documentation](https://docs.n8n.io/)
- [Anthropic API Reference](https://docs.anthropic.com/)
- [Claude Prompt Engineering Guide](https://docs.anthropic.com/claude/docs/prompt-engineering)

---

## 🤝 Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Submit a pull request with clear description of changes

---

## 📄 License

This project is licensed under the MIT License - see LICENSE file for details.

---

## 💬 Support

For questions, issues, or feature requests:
- Open an issue on GitHub
- Email: [your-email@domain.com]

---

## 🎓 Credits

Created by [Your Name/Company]
Powered by Claude AI (Anthropic) and n8n workflow automation

---

**Ready to transform your content strategy?** Start with the Quick Start guide above, or dive into the detailed setup documentation in `/docs/setup-guide.md`.
