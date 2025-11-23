# B2B SaaS Content Strategy Template

## Industry: B2B Software-as-a-Service

This template is specifically designed for B2B SaaS companies selling software solutions to business customers. It addresses the unique challenges of long sales cycles, multiple decision-makers, and technical audiences.

---

## Template Variables

### Required Variables

```json
{
  "COMPANY_NAME": "Your SaaS Company Name",
  "PRODUCT_CATEGORY": "Specific software category (e.g., 'Project Management', 'CRM', 'Analytics Platform')",
  "TARGET_COMPANY_SIZE": "Company size range (e.g., 'Series A-B startups (10-100 employees)', 'Mid-market (100-1000 employees)', 'Enterprise (1000+ employees)')",
  "PRIMARY_USER_PERSONA": "Job title and role (e.g., 'VP of Sales', 'Marketing Operations Manager', 'Engineering Director')",
  "USER_PAIN_POINTS": "Top 3 specific problems your software solves (comma-separated)",
  "KEY_FEATURE_DIFFERENTIATION": "What makes your solution unique vs. competitors",
  "PRICING_MODEL": "How you charge (e.g., 'per-user/month', 'usage-based', 'enterprise annual contracts')",
  "SALES_CYCLE_LENGTH": "Typical time from first touch to close (e.g., '30-60 days', '3-6 months')",
  "INTEGRATION_ECOSYSTEM": "Key integrations your product offers (e.g., 'Salesforce, HubSpot, Slack')",
  "COMPLIANCE_CERTIFICATIONS": "Security/compliance (e.g., 'SOC 2, GDPR, HIPAA' or 'N/A')",
  "FREE_TRIAL_OFFERED": "Yes/No and duration if applicable",
  "COMPETITOR_URLS": "3-5 direct competitor websites or LinkedIn pages",
  "BUSINESS_GOAL": "Primary goal (e.g., 'increase demo bookings by 40%', 'reduce CAC by 25%', 'expand into enterprise market')"
}
```

---

## Stage 1: Research & Competitive Intelligence

### System Prompt Enhancement

```markdown
# INDUSTRY CONTEXT: B2B SaaS
You are analyzing the competitive landscape for a B2B SaaS company in the {{PRODUCT_CATEGORY}} space.

## B2B SaaS-Specific Analysis Framework

### 1. Competitive Positioning Analysis

For each competitor in {{COMPETITOR_URLS}}, analyze:

**Product Positioning:**
- How do they position their solution? (Incumbent/disruptor/niche specialist)
- What buyer persona do they emphasize? (End-user vs. executive buyer)
- Do they lead with features, outcomes, or ROI?

**Content Strategy Patterns:**
- **Thought Leadership Topics:** What industry trends/challenges do they discuss?
- **Educational Content:** Product tutorials, best practices, frameworks
- **Social Proof Formats:** Case studies, customer logos, testimonials, review sites
- **Buying Stage Focus:** Awareness vs. consideration vs. decision content ratio

**Engagement Tactics:**
- Gated content strategy (whitepapers, reports, tools)
- Interactive content (calculators, assessments, tools)
- Community building (Slack groups, user forums, events)
- Product-led growth content (free tools, freemium positioning)

### 2. Content Gap Identification

**CRITICAL GAPS TO IDENTIFY:**

1. **Feature Comparison Gaps:**
   - Are competitors avoiding direct feature comparisons?
   - Opportunity: Create honest "vs. [Competitor]" content

2. **Use Case Coverage:**
   - Which specific use cases/industries are underserved?
   - {{TARGET_COMPANY_SIZE}} companies have unique needs - are they addressed?

3. **Buying Committee Content:**
   - Do competitors speak to multiple stakeholders (user, manager, executive, IT/security)?
   - Gap: Create role-specific content for each decision-maker

4. **Implementation/Onboarding:**
   - Is "what happens after purchase" content missing?
   - Opportunity: Reduce perceived risk with transparent onboarding content

5. **ROI/Business Case:**
   - Are competitors providing concrete ROI frameworks?
   - Gap: Quantifiable value propositions for {{PRIMARY_USER_PERSONA}}

### 3. SaaS-Specific Platform Strategies

**LinkedIn (PRIMARY PLATFORM for B2B SaaS):**
- **Content Pillar:** Thought leadership from founders/executives on industry evolution
- **Hook Strategy:** Data-driven insights, contrarian takes on industry "best practices"
- **Value Proposition:** Frameworks and mental models for {{PRIMARY_USER_PERSONA}}
- **CTA Strategy:** Demo bookings, high-value content downloads, waitlist signups
- **Posting Cadence:** 3-5x per week, mix of company + executive personal brands

**Twitter/X (for Developer/Technical Tools):**
- **Content Pillar:** Product updates, technical insights, integration announcements
- **Hook Strategy:** "We just shipped..." updates, technical deep-dives, API tips
- **Value Proposition:** Stay current on product evolution, technical community building
- **CTA Strategy:** Link to changelog, documentation, beta programs

**YouTube (for Complex Products):**
- **Content Pillar:** Product demos, customer success stories, implementation tutorials
- **Hook Strategy:** "How [Company X] achieved [Outcome] with [Your Product]"
- **Value Proposition:** See the product in action, reduce perceived complexity
- **CTA Strategy:** Free trial, demo booking, product tour

**Industry-Specific Platforms:**
- ProductHunt (for launches)
- G2/Capterra (for review generation campaigns)
- Industry Slack communities, Subreddits (for authentic participation)

### 4. SaaS Content Themes That Convert

Prioritize these high-converting themes:

1. **Problem Agitation:** "Why [common solution] is failing {{TARGET_COMPANY_SIZE}} companies"
2. **Category Creation:** "Introducing [new category] - why [old category] isn't enough anymore"
3. **Quantified Outcomes:** "How we helped [Company] reduce [pain point] by [%] in [timeframe]"
4. **Transparent Pricing:** "Why we charge [PRICING_MODEL] (and what you actually pay)"
5. **Feature Education:** "5 ways to use [feature] that 90% of users miss"
6. **Competitive Alternatives:** "Migrating from [competitor]? Here's what to expect"
7. **Implementation Speed:** "From signup to value in [timeframe]: Our onboarding process"
8. **Security/Compliance:** "How we earned [COMPLIANCE_CERTIFICATIONS] and what it means for you"

### 5. Strategic Opportunity Scoring

For each identified opportunity, score based on:
- **Deal Size Impact:** Will this content appeal to high ACV customers? (High/Medium/Low)
- **Sales Cycle Reduction:** Will this content accelerate buying decisions? (High/Medium/Low)
- **Differentiation Strength:** Is this unique to {{KEY_FEATURE_DIFFERENTIATION}}? (High/Medium/Low)
- **Search Intent Alignment:** Does this match how {{PRIMARY_USER_PERSONA}} researches solutions? (High/Medium/Low)

## OUTPUT REQUIREMENTS

Your JSON output must include these SaaS-specific sections:

```json
{
  "saas_competitive_intelligence": {
    "market_maturity": "Emerging/Growing/Mature",
    "dominant_narrative": "What story are market leaders telling?",
    "narrative_opportunity": "What counter-narrative can {{COMPANY_NAME}} own?",
    "buyer_journey_gaps": {
      "awareness_stage": ["Gap 1", "Gap 2"],
      "consideration_stage": ["Gap 1", "Gap 2"],
      "decision_stage": ["Gap 1", "Gap 2"]
    },
    "content_format_gaps": ["Missing format 1", "Missing format 2"]
  },
  "stakeholder_strategies": {
    "end_user": {
      "persona": "{{PRIMARY_USER_PERSONA}}",
      "pain_points": "{{USER_PAIN_POINTS}}",
      "content_themes": ["Theme 1", "Theme 2", "Theme 3"],
      "objection_handling": ["Objection 1 and how to address", "Objection 2 and how to address"]
    },
    "economic_buyer": {
      "typical_title": "Who signs the contract?",
      "key_concerns": ["Concern 1", "Concern 2"],
      "roi_focus": "What metrics matter to them?"
    },
    "technical_buyer": {
      "typical_title": "IT/Security stakeholder",
      "key_concerns": ["Security", "Integration", "Scalability"],
      "content_needs": ["Technical documentation", "Security whitepapers", "API docs"]
    }
  },
  "strategic_opportunities": [
    {
      "opportunity_title": "Specific content angle",
      "target_stakeholder": "end_user/economic_buyer/technical_buyer",
      "buyer_stage": "awareness/consideration/decision",
      "competitive_advantage": "Why this differentiates vs {{COMPETITOR_URLS}}",
      "estimated_impact": "HIGH/MEDIUM/LOW",
      "recommended_format": "LinkedIn post/YouTube video/Blog post/Webinar/etc",
      "cta_type": "Demo/Free trial/Content download/etc"
    }
  ],
  "pricing_messaging_strategy": {
    "transparency_level": "Should you discuss pricing publicly? Yes/No/Ranges only",
    "value_framing": "How to frame {{PRICING_MODEL}} as investment, not cost",
    "comparison_strategy": "How to compare to {{COMPETITOR_URLS}} pricing"
  }
}
```

## STRATEGIC IMPERATIVES FOR B2B SAAS

1. **Multi-Threading:** Content must speak to multiple stakeholders simultaneously
2. **Trust Building:** Longer sales cycles require consistent, valuable touchpoints
3. **Category Education:** If emerging category, must educate market on problem AND solution
4. **Social Proof:** Case studies, testimonials, and customer logos are non-negotiable
5. **Product Transparency:** Show, don't just tell - demos, screenshots, walkthroughs
6. **Thought Leadership:** Executive team must be visible, credible industry voices
```

---

## Stage 2: Content Generation Specifications

### Platform-Specific Guidelines for B2B SaaS

**LinkedIn Post Template:**
```
Structure:
1. Hook: Contrarian insight or data point (first 2 lines)
2. Personal story/case study (3-4 short paragraphs)
3. Framework or actionable takeaway (numbered list or bullets)
4. Credibility signal (results, customers, credentials)
5. Specific CTA with low friction

Voice: Professional but personal, data-driven, helpful without being salesy

Length: 1,200-1,800 characters

Engagement drivers:
- Ask polarizing question in comments
- Tag relevant thought leaders (sparingly)
- Include 1-2 relevant hashtags (e.g., #SaaS #B2B[Industry])
```

**YouTube Video Script Template:**
```
Structure:
1. Hook (0-5 sec): Problem statement or bold claim
2. Intro (5-15 sec): Who you are, what you'll cover
3. Problem deep-dive (15-60 sec): Agitate the pain
4. Solution introduction (60-90 sec): Your approach
5. Demo/walkthrough (90-240 sec): Show product in action
6. Results/social proof (240-270 sec): Customer outcome
7. CTA (270-300 sec): Clear next step

Visual style: Screen recordings + talking head, professional but approachable

On-screen text: Key stats, feature callouts, CTA information
```

**Twitter/X Thread Template:**
```
Structure:
1. Hook tweet: Numeric promise or surprising claim
2. Context tweet: Why this matters now
3. Framework tweets (3-5): Core insights, one per tweet
4. Social proof tweet: Results or testimonial
5. CTA tweet: Link to resource

Voice: Concise, direct, one idea per tweet

Thread length: 6-8 tweets, use line breaks for readability
```

---

## Sample Input (Ready to Use)

```json
{
  "COMPANY_NAME": "SalesBoost",
  "PRODUCT_CATEGORY": "Sales Engagement Platform",
  "TARGET_COMPANY_SIZE": "Series A-B SaaS companies (50-250 employees)",
  "PRIMARY_USER_PERSONA": "VP of Sales or Sales Development Manager, 32-45 years old, managing 5-20 person SDR/AE teams",
  "USER_PAIN_POINTS": "Manual outbound processes limiting team capacity, inability to prove which sequences actually convert, sales and marketing using disconnected tools creating attribution nightmares",
  "KEY_FEATURE_DIFFERENTIATION": "AI-powered sequence optimization that learns from your team's conversations and automatically A/B tests messaging - not just automation, but intelligent iteration",
  "PRICING_MODEL": "Per-seat per month ($89/user) with annual commitment discounts",
  "SALES_CYCLE_LENGTH": "45-75 days (involves Sales Leader + Revenue Ops + sometimes CRO)",
  "INTEGRATION_ECOSYSTEM": "Salesforce, HubSpot, Outreach, SalesLoft, Gong, Apollo",
  "COMPLIANCE_CERTIFICATIONS": "SOC 2 Type II, GDPR compliant",
  "FREE_TRIAL_OFFERED": "Yes, 14-day trial with full feature access",
  "COMPETITOR_URLS": "https://www.outreach.io/, https://salesloft.com/, https://www.apollo.io/",
  "BUSINESS_GOAL": "Increase qualified demo bookings from inbound by 50% and reduce CAC by positioning against enterprise incumbents"
}
```

---

## Expected Output Quality

✅ **Strategic depth:** Identifies 8-12 specific content opportunities
✅ **Stakeholder coverage:** Addresses end-user, economic buyer, and technical buyer
✅ **Competitive differentiation:** Clear positioning against {{COMPETITOR_URLS}}
✅ **Conversion focus:** Every content piece ladders to {{BUSINESS_GOAL}}
✅ **Format variety:** Mix of LinkedIn, YouTube, Twitter, blog, email
✅ **Measurable:** Clear success metrics for each content piece

---

## Pricing for This Template

**Standalone Template:** $497
**Includes:**
- Complete variable mapping
- Sample inputs for 5 SaaS subcategories
- Expected output examples
- Monthly content calendar template
- Competitor analysis worksheet

**Template + Implementation:** $1,997
**Includes everything above plus:**
- 1:1 setup call to customize for your SaaS
- First content suite generated and reviewed
- Quarterly prompt optimization based on performance

---

## Use Cases

✅ **Early-stage SaaS:** Building initial content engine
✅ **Growth-stage SaaS:** Scaling content without scaling headcount
✅ **Pivot/repositioning:** Launching new messaging strategy
✅ **Competitive battlecard content:** Differentiate against incumbents
✅ **Founder-led content:** Executive thought leadership at scale
