# Workflow Setup and Testing Guide

## Overview

This guide covers setup and testing for the complete Triple-Threat Content Strategy Agent workflows with integrated industry templates.

## Workflows Included

1. **industry-template-selector.json** - Template selection and loading
2. **enhanced-content-workflow-with-templates.json** - Main content generation with industry awareness
3. **main-content-workflow.json** - Original workflow (Stages 1 & 2)
4. **refinement-workflow.json** - Performance analysis (Stage 3)

## Prerequisites

### 1. n8n Installation

**Option A: n8n Cloud (Recommended for Quick Start)**
```bash
# Sign up at https://n8n.io/cloud
# No installation needed
```

**Option B: Self-Hosted Docker**
```bash
docker run -it --rm \
  --name n8n \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  n8nio/n8n
```

**Option C: npm**
```bash
npm install n8n -g
n8n start
```

Access n8n at: `http://localhost:5678`

### 2. Anthropic API Setup

1. Get API key from: https://console.anthropic.com/
2. In n8n:
   - Go to **Settings** → **Credentials**
   - Click **Add Credential**
   - Select **Anthropic API**
   - Name: `Anthropic API` (must match workflow)
   - Enter your API key
   - Click **Save**

## Workflow Import

### Import All Workflows

1. In n8n, go to **Workflows** → **Import Workflow**
2. Import in this order:
   - `industry-template-selector.json`
   - `enhanced-content-workflow-with-templates.json`
   - `main-content-workflow.json`
   - `refinement-workflow.json`

### Activate Workflows

1. Open each workflow
2. Click **Active** toggle in top-right
3. Workflow will now respond to webhook requests

## Testing

### Test 1: Enhanced Workflow with Industry Templates

**Endpoint:**
```
POST http://localhost:5678/webhook/content-strategy-with-template
```

**Test B2B SaaS:**
```bash
curl -X POST http://localhost:5678/webhook/content-strategy-with-template \
  -H "Content-Type: application/json" \
  -d '{
    "industry": "b2b-saas",
    "business_name": "CloudMetrics Analytics",
    "target_customer": "Sales leaders at B2B companies with 50-500 employees",
    "unique_value_prop": "Real-time sales pipeline analytics that integrates with any CRM",
    "competitor_urls": ["https://www.gong.io", "https://www.clari.com"],
    "business_goal": "Generate 200 qualified demo requests per month"
  }'
```

**Test E-commerce:**
```bash
curl -X POST http://localhost:5678/webhook/content-strategy-with-template \
  -H "Content-Type: application/json" \
  -d '{
    "industry": "ecommerce",
    "business_name": "EcoThreads Sustainable Fashion",
    "target_customer": "Eco-conscious millennials, 25-40",
    "unique_value_prop": "Carbon-neutral fashion from recycled ocean plastics",
    "competitor_urls": ["https://www.reformation.com", "https://www.patagonia.com"],
    "business_goal": "30% MoM revenue growth, 50K Instagram followers"
  }'
```

**Test Restaurant:**
```bash
curl -X POST http://localhost:5678/webhook/content-strategy-with-template \
  -H "Content-Type: application/json" \
  -d '{
    "industry": "restaurant",
    "business_name": "Bella Vita Italian Kitchen",
    "target_customer": "Date night couples and families, 30-60 years old",
    "unique_value_prop": "Authentic Northern Italian in family-owned atmosphere",
    "competitor_urls": ["https://www.instagram.com/italianrestaurant"],
    "business_goal": "Fill tables Thu-Sat, build catering business"
  }'
```

**Test Healthcare:**
```bash
curl -X POST http://localhost:5678/webhook/content-strategy-with-template \
  -H "Content-Type: application/json" \
  -d '{
    "industry": "healthcare",
    "business_name": "Family Health Partners",
    "target_customer": "Families with children in North Dallas suburbs",
    "unique_value_prop": "Same-day appointments and online visit options",
    "competitor_urls": ["https://www.facebook.com/localfamilydoc"],
    "business_goal": "100 new patient families per quarter"
  }'
```

**Test Legal Services:**
```bash
curl -X POST http://localhost:5678/webhook/content-strategy-with-template \
  -H "Content-Type: application/json" \
  -d '{
    "industry": "legal-services",
    "business_name": "Garcia Personal Injury Law",
    "target_customer": "Individuals injured in serious car accidents",
    "unique_value_prop": "Former insurance defense attorney, bilingual",
    "competitor_urls": ["https://www.youtube.com/c/caraccidentlawyer"],
    "business_goal": "100 qualified consultations/month, 30% case acceptance"
  }'
```

**Test Coaching:**
```bash
curl -X POST http://localhost:5678/webhook/content-strategy-with-template \
  -H "Content-Type: application/json" \
  -d '{
    "industry": "coaching",
    "business_name": "Executive Edge Leadership Coaching",
    "target_customer": "Mid-level managers transitioning to senior leadership",
    "unique_value_prop": "Former VP of Engineering at Google",
    "competitor_urls": ["https://www.linkedin.com/in/executivecoach"],
    "business_goal": "Maintain 12 active clients at $3K/month"
  }'
```

**Test Automotive:**
```bash
curl -X POST http://localhost:5678/webhook/content-strategy-with-template \
  -H "Content-Type: application/json" \
  -d '{
    "industry": "automotive",
    "business_name": "Precision Auto Repair",
    "target_customer": "Honda/Toyota owners seeking dealership quality at lower prices",
    "unique_value_prop": "ASE Master Certified, video inspections, transparent pricing",
    "competitor_urls": ["https://www.facebook.com/localautorepair"],
    "business_goal": "50 new customers/month, 70% retention"
  }'
```

**Test Beauty Salon:**
```bash
curl -X POST http://localhost:5678/webhook/content-strategy-with-template \
  -H "Content-Type: application/json" \
  -d '{
    "industry": "beauty-salon",
    "business_name": "Luxe Hair Studio",
    "target_customer": "Women 25-50, professionals willing to invest in hair",
    "unique_value_prop": "Balayage specialists with extensions expertise",
    "competitor_urls": ["https://www.instagram.com/balayagespecialist"],
    "business_goal": "Book out 3-4 weeks, 2 extension clients/week"
  }'
```

**Test Hospitality:**
```bash
curl -X POST http://localhost:5678/webhook/content-strategy-with-template \
  -H "Content-Type: application/json" \
  -d '{
    "industry": "hospitality",
    "business_name": "Coastal Haven Boutique Hotel",
    "target_customer": "Couples seeking authentic local experience",
    "unique_value_prop": "Only boutique hotel on East Beach, sustainable",
    "competitor_urls": ["https://www.instagram.com/chainhotel"],
    "business_goal": "60% direct bookings, 70% year-round occupancy"
  }'
```

**Test Tech Startup:**
```bash
curl -X POST http://localhost:5678/webhook/content-strategy-with-template \
  -H "Content-Type: application/json" \
  -d '{
    "industry": "tech-startup",
    "business_name": "FlowState",
    "target_customer": "Engineering managers at remote-first startups",
    "unique_value_prop": "AI auto-organizes tasks from actual work patterns",
    "competitor_urls": ["https://www.linear.app", "https://www.height.app"],
    "business_goal": "100 team signups/month, attract Series A investors"
  }'
```

### Test 2: Original Main Workflow

**Endpoint:**
```
POST http://localhost:5678/webhook/content-strategy-agent
```

**Test Request:**
```bash
curl -X POST http://localhost:5678/webhook/content-strategy-agent \
  -H "Content-Type: application/json" \
  -d '{
    "business_name": "TechFlow Solutions",
    "industry": "B2B SaaS",
    "target_customer": "Operations managers at mid-market companies",
    "unique_value_prop": "Process automation without coding",
    "competitor_urls": ["https://zapier.com", "https://make.com"],
    "business_goal": "1000 trial signups per month"
  }'
```

### Test 3: Performance Refinement Workflow

**Endpoint:**
```
POST http://localhost:5678/webhook/refine-content
```

**Test Request:**
```bash
curl -X POST http://localhost:5678/webhook/refine-content \
  -H "Content-Type: application/json" \
  -d '{
    "original_content": {
      "platform": "LinkedIn",
      "content": "Excited to announce our new feature...",
      "posted_date": "2024-11-20"
    },
    "performance_metrics": {
      "impressions": 500,
      "engagement_rate": 0.021,
      "clicks": 8,
      "expected_engagement_rate": 0.055
    },
    "content_goal": "Drive demo requests",
    "target_audience": "Sales leaders at B2B companies"
  }'
```

## Expected Results

### Enhanced Workflow Output

```json
{
  "stage1_analysis": {
    "industry": "b2b-saas",
    "competitive_analysis": { ... },
    "content_gaps": [ ... ],
    "strategic_opportunities": [ ... ],
    "platform_recommendations": {
      "primary": "LinkedIn",
      "secondary": "YouTube",
      "optional": ["Twitter/X", "Medium"],
      "avoid": ["TikTok", "Pinterest"]
    },
    "content_themes": [ ... ]
  },
  "stage2_content": "# Content Piece 1: LinkedIn Post...",
  "industry": "b2b-saas",
  "business_name": "CloudMetrics Analytics",
  "timestamp": "2024-11-23T...",
  "processing_time_seconds": 85
}
```

### Validation Checklist

✅ **Stage 1 Analysis includes:**
- Industry-specific competitive insights
- Platform recommendations appropriate for industry
- Content gaps relevant to industry niche
- Strategic opportunities aligned with industry best practices

✅ **Stage 2 Content includes:**
- Platform-specific formatting (LinkedIn line breaks, Instagram hashtags, etc.)
- Industry-appropriate tone and messaging
- Compliance considerations (HIPAA for healthcare, bar rules for legal, etc.)
- Strategic CTAs aligned with business goal

✅ **Processing Time:**
- Enhanced workflow: 60-120 seconds
- Original workflow: 80-150 seconds
- Refinement workflow: 30-60 seconds

## Supported Industries (All 20)

1. `b2b-saas` - B2B Software as a Service
2. `ecommerce` - Online Retail & E-commerce
3. `real-estate` - Real Estate Agents & Agencies
4. `healthcare` - Medical Practices & Healthcare Providers
5. `financial-services` - Financial Advisors & Wealth Management
6. `fitness-wellness` - Gyms, Personal Trainers, Wellness
7. `professional-services` - Consultants, Accountants, Attorneys
8. `restaurant` - Restaurants & Food Service
9. `education` - Online Courses, Tutoring, Training
10. `manufacturing` - B2B Industrial & Manufacturing
11. `nonprofit` - Nonprofits & Charities
12. `marketing-agency` - Digital Marketing Agencies
13. `coaching` - Business & Life Coaching
14. `legal-services` - Law Firms & Attorneys
15. `automotive` - Auto Repair & Services
16. `beauty-salon` - Hair Salons, Spas, Beauty Services
17. `hospitality` - Hotels, B&Bs, Vacation Rentals
18. `tech-startup` - Early-Stage Tech Startups
19. `retail` - Local Retail & Brick-and-Mortar
20. `creator-economy` - Content Creators & Influencers

## Troubleshooting

### Error: "Anthropic API credentials not found"

**Solution:**
1. Go to Settings → Credentials
2. Add Anthropic API credential
3. Name it exactly: `Anthropic API`
4. Save and reactivate workflow

### Error: "Webhook not found"

**Solution:**
1. Open workflow in n8n editor
2. Click **Active** toggle OFF then ON
3. Webhook URL will regenerate
4. Use new webhook URL

### Processing Takes Too Long (>3 minutes)

**Solution:**
- This is normal for complex industries with detailed analysis
- Stage 1 (research): 40-80 seconds
- Stage 2 (content): 40-80 seconds
- Total: 80-160 seconds typical

### JSON Parsing Errors

**Solution:**
- Anthropic sometimes adds text before/after JSON
- "Parse JSON Output" node handles this
- If errors persist, check Anthropic API response in execution log

### Industry Not Recognized

**Solution:**
- Use exact industry slug from supported list above
- Case-sensitive: use `b2b-saas` not `B2B-SaaS`
- Check for typos in industry parameter

## Production Deployment

### Environment Variables

Create `.env` file:
```env
ANTHROPIC_API_KEY=your_key_here
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=your_secure_password
```

### Docker Compose Production Setup

```yaml
version: '3.8'
services:
  n8n:
    image: n8nio/n8n
    restart: always
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=${N8N_BASIC_AUTH_USER}
      - N8N_BASIC_AUTH_PASSWORD=${N8N_BASIC_AUTH_PASSWORD}
      - ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
    volumes:
      - n8n_data:/home/node/.n8n
volumes:
  n8n_data:
```

### Rate Limiting

Anthropic API limits:
- Claude 3.5 Sonnet: 50 requests/minute (tier 1)
- Recommend: 1 request per 2 seconds max
- Use n8n's built-in rate limiting if needed

## Cost Estimation

### Anthropic API Costs (Claude 3.5 Sonnet)

- Input: $3 per million tokens
- Output: $15 per million tokens

**Per Workflow Execution:**
- Stage 1: ~3,000 input + 1,500 output = $0.03
- Stage 2: ~4,000 input + 2,000 output = $0.04
- **Total per run: ~$0.07**

**Monthly Costs:**
- 100 executions/month: $7
- 500 executions/month: $35
- 1,000 executions/month: $70

## Support & Documentation

- n8n Documentation: https://docs.n8n.io
- Anthropic API Docs: https://docs.anthropic.com
- Workflow Issues: Check execution logs in n8n UI
- Template Issues: See `/templates/README.md`

## Next Steps

1. ✅ Import all workflows
2. ✅ Configure Anthropic API credentials
3. ✅ Test with sample data for your industry
4. ✅ Validate output quality
5. ✅ Customize for your use case
6. ✅ Deploy to production
7. ✅ Monitor usage and costs

---

**Workflow Version:** 2.0 with Industry Templates
**Last Updated:** 2024-11-23
**Status:** Production Ready
