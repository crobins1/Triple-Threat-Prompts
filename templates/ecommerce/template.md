# E-Commerce Content Strategy Template

## Industry: E-Commerce / Online Retail

This template is designed for direct-to-consumer (DTC) and B2C e-commerce brands selling physical or digital products online. Optimized for short buying cycles, impulse purchases, and visual storytelling.

---

## Template Variables

```json
{
  "BRAND_NAME": "Your brand name",
  "PRODUCT_CATEGORY": "Specific product type (e.g., 'sustainable activewear', 'organic skincare', 'smart home devices')",
  "PRICE_POINT": "Average product price or range (e.g., '$25-75', 'luxury $200+', 'budget under $30')",
  "TARGET_CUSTOMER_DEMO": "Age, gender, lifestyle (e.g., '25-40 year old eco-conscious women', '18-25 gaming enthusiasts')",
  "PURCHASE_MOTIVATION": "Primary buying driver (e.g., 'self-expression', 'problem-solving', 'status', 'convenience')",
  "SHOPPING_BEHAVIOR": "How they discover/buy (e.g., 'Instagram discovery to website', 'Amazon search-first', 'influencer recommendations')",
  "UNIQUE_SELLING_PROPOSITION": "What makes your products different (materials, design, values, quality, etc.)",
  "SUSTAINABILITY_ETHICS": "Any ethical/sustainable practices worth highlighting",
  "USER_GENERATED_CONTENT": "Do customers share photos/reviews? Describe community",
  "RETURN_CUSTOMERS_RATE": "Percentage of repeat purchasers if known, or 'building' if new",
  "SEASONAL_PATTERNS": "Any seasonal spikes (e.g., 'holiday gift-giving', 'summer swimwear', 'back-to-school')",
  "COMPETITOR_URLS": "3-5 competitor Instagram accounts or websites",
  "BUSINESS_GOAL": "Primary goal (e.g., 'increase AOV by 30%', 'reduce cart abandonment to <60%', 'scale to $1M/month')"
}
```

---

## Stage 1: E-Commerce Competitive Analysis

### System Prompt Enhancement

```markdown
# INDUSTRY CONTEXT: E-Commerce

## E-Commerce Content Analysis Framework

### 1. Visual Storytelling Audit

For each competitor in {{COMPETITOR_URLS}}, analyze:

**Instagram/TikTok Content Strategy:**
- **Product Showcase Approach:** Flat lays vs. lifestyle shots vs. action/use-case
- **Color Palette/Aesthetic:** Minimal/clean vs. bold/vibrant vs. earthy/organic
- **Model/Talent Strategy:** Professional models vs. real customers vs. founder-led
- **Content Mix Ratio:** Product features (%) vs. lifestyle/aspiration (%) vs. UGC (%) vs. educational (%)

**Engagement Patterns:**
- **High-performing posts:** What type of content gets most saves/shares?
- **Carousel effectiveness:** Do multi-image posts outperform single images?
- **Video vs. static:** Which format drives more engagement?
- **Reel hooks:** What first 3 seconds stop the scroll?

**Social Proof Integration:**
- Review highlights in posts
- Customer testimonials/before-after
- Influencer partnerships vs. micro-influencer UGC
- Community building (hashtag challenges, customer features)

### 2. E-Commerce Content Gaps

**Product Education Gaps:**
- Are competitors explaining HOW to use products or just showing them?
- Opportunity: Tutorial content, styling guides, use-case scenarios

**Values-Based Content:**
- Do competitors talk about brand values ({{SUSTAINABILITY_ETHICS}})?
- Gap: Behind-the-scenes, founder story, supply chain transparency

**Purchase Objection Handling:**
- Are common objections addressed in content? (quality, fit, returns, shipping)
- Gap: FAQ-style content, comparison posts, guarantee highlights

**Community Building:**
- Is there active customer community engagement?
- Gap: User-generated content campaigns, customer spotlight series

**Lifestyle Integration:**
- Do competitors show products in real-life context?
- Gap: Day-in-the-life content, "get ready with me", unboxing experiences

### 3. Platform-Specific Strategies

**Instagram (PRIMARY for Visual Products):**
```json
{
  "feed_strategy": {
    "content_pillar": "Lifestyle aspiration + product benefits",
    "posting_frequency": "4-7 posts per week",
    "aesthetic_consistency": "Cohesive color palette and editing style",
    "call_to_action": "Link in bio, swipe up (Stories), product tags"
  },
  "stories_strategy": {
    "content_types": ["Behind the scenes", "Polls/questions", "Product demos", "Customer features", "Flash sales"],
    "frequency": "Daily, 5-10 stories",
    "engagement_tactics": "Interactive stickers, countdowns for launches, quiz features"
  },
  "reels_strategy": {
    "hooks": ["Transformation shows", "Trend participation", "Product hacks", "Unboxing reactions"],
    "length": "7-15 seconds (for shares), 20-30 seconds (for education)",
    "music": "Trending audio for discovery, brand audio for awareness"
  }
}
```

**TikTok (for Viral Discovery):**
```json
{
  "content_pillar": "Entertainment + product integration",
  "hook_strategy": "Native-to-platform, trend-jacking, authentic/unpolished",
  "video_style": "POV videos, talking-to-camera, duets with customer videos",
  "hashtag_strategy": "#[ProductCategory]TikTok + trending sounds + brand hashtag",
  "cta_approach": "Casual mentions of 'link in bio', TikTok Shop tags"
}
```

**Pinterest (for High-Intent Browsers):**
```json
{
  "content_pillar": "Inspirational how-to and lifestyle boards",
  "pin_strategy": "Text overlays on images, before/after, step-by-step guides",
  "value_proposition": "Solve customer problems, inspire use cases",
  "seo_approach": "Keyword-rich descriptions matching search intent"
}
```

**YouTube (for High-Consideration Products):**
```json
{
  "content_pillar": "Detailed product reviews, comparison videos, tutorials",
  "video_types": ["Unboxing", "First impressions", "30-day review", "How to style/use", "vs. [Competitor]"],
  "cta_strategy": "Discount codes, limited offers in description"
}
```

### 4. E-Commerce Content Themes

**High-Converting Content Types:**

1. **Social Proof Overload:** "1,000+ 5-star reviews - here's what customers love most"
2. **Problem-Solution:** "Tired of [pain point]? This [product] changed everything"
3. **Transformation Stories:** Before/after, customer success stories, testimonials
4. **Scarcity/Urgency:** "Selling out fast", "Limited edition", "Restock alert"
5. **Educational:** How-to guides, styling tips, care instructions, maximize product value
6. **Behind-the-Scenes:** Production process, founder story, quality standards
7. **Comparison/Alternatives:** "Why we're better than [Amazon/fast fashion/competitor]"
8. **Bundle/Upsell:** "Complete the look", "Customers also bought", gift sets
9. **Seasonal/Timely:** Holiday gift guides, season prep, trend tie-ins
10. **Value Reinforcement:** Cost-per-wear, quality materials, warranty/guarantee

### 5. Strategic Opportunities Assessment

Score each opportunity by:
- **Conversion Potential:** Likelihood to drive sales (High/Medium/Low)
- **Shareability:** Will customers share this? (High/Medium/Low)
- **Brand Alignment:** Fits {{UNIQUE_SELLING_PROPOSITION}}? (High/Medium/Low)
- **Production Difficulty:** Easy to create consistently? (Easy/Medium/Hard)

## OUTPUT REQUIREMENTS

```json
{
  "ecommerce_intelligence": {
    "visual_trends": ["Trend 1 in competitor content", "Trend 2"],
    "untapped_formats": ["Format competitors aren't using"],
    "engagement_patterns": "What content drives saves vs. shares vs. comments",
    "influencer_strategy_gap": "How competitors use influencers vs. opportunity for {{BRAND_NAME}}"
  },
  "customer_journey_content": {
    "discovery_stage": {
      "primary_platforms": ["Instagram", "TikTok", "Pinterest"],
      "content_themes": ["Theme 1", "Theme 2"],
      "hook_strategies": ["Hook type 1", "Hook type 2"]
    },
    "consideration_stage": {
      "content_types": ["Product details", "Reviews", "Comparisons"],
      "objection_handling": ["Address concern 1", "Address concern 2"]
    },
    "purchase_stage": {
      "conversion_drivers": ["Urgency tactic", "Social proof", "Guarantee"],
      "cta_strategies": ["CTA 1", "CTA 2"]
    },
    "retention_stage": {
      "post_purchase_content": ["Unboxing experience", "Care tips", "Upsell content"],
      "community_building": "How to encourage UGC and repeat purchases"
    }
  },
  "strategic_opportunities": [
    {
      "opportunity_title": "Specific content angle",
      "target_platform": "Instagram/TikTok/Pinterest/YouTube",
      "content_format": "Reel/Carousel/Story/Video",
      "buying_stage": "discovery/consideration/purchase/retention",
      "competitive_advantage": "Gap this exploits",
      "estimated_impact": "HIGH/MEDIUM/LOW",
      "production_requirements": "What's needed to create this",
      "cta_type": "Shop now/Learn more/Save for later/Share"
    }
  ],
  "visual_content_strategy": {
    "brand_aesthetic": "Recommended visual style that differentiates",
    "content_mix": {
      "product_focused": "Percentage %",
      "lifestyle_aspirational": "Percentage %",
      "ugc_community": "Percentage %",
      "educational": "Percentage %",
      "behind_the_scenes": "Percentage %"
    },
    "photography_direction": "Specific visual recommendations"
  }
}
```

## CRITICAL SUCCESS FACTORS FOR E-COMMERCE

1. **Visual-First:** Every piece of content must be thumb-stopping
2. **Mobile-Optimized:** 80%+ of e-commerce content viewed on mobile
3. **Social Proof:** Reviews, UGC, testimonials must be prominent
4. **Urgency/Scarcity:** Limited stock, seasonal, FOMO messaging
5. **Seamless Purchase Path:** 2 clicks or less from content to checkout
6. **Community:** Turn customers into brand advocates who create content
```

---

## Sample Input

```json
{
  "BRAND_NAME": "EcoThreads",
  "PRODUCT_CATEGORY": "Sustainable everyday basics (t-shirts, hoodies, joggers)",
  "PRICE_POINT": "$45-95 per item",
  "TARGET_CUSTOMER_DEMO": "25-40 year old environmentally conscious millennials and Gen Z, 60% female, urban/suburban, college-educated",
  "PURCHASE_MOTIVATION": "Align purchases with values (sustainability) while maintaining style and quality",
  "SHOPPING_BEHAVIOR": "Discover via Instagram, research reviews and sustainability claims, purchase direct from brand website",
  "UNIQUE_SELLING_PROPOSITION": "Carbon-negative production, organic cotton, transparent supply chain, lifetime quality guarantee, recycling program for old garments",
  "SUSTAINABILITY_ETHICS": "B-Corp certified, carbon-negative shipping, living wages for factory workers, fully transparent cost breakdown published",
  "USER_GENERATED_CONTENT": "Growing community sharing #EcoThreadsLife styling photos, strong repeat purchase rate",
  "RETURN_CUSTOMERS_RATE": "38% make second purchase within 6 months",
  "SEASONAL_PATTERNS": "Peak in January (New Year sustainability goals) and Earth Day (April)",
  "COMPETITOR_URLS": "https://www.instagram.com/everlane/, https://www.instagram.com/patagonia/, https://www.instagram.com/reformation/",
  "BUSINESS_GOAL": "Increase Instagram-driven sales by 60% and grow UGC community to drive social proof"
}
```

---

## Expected Outcomes

✅ **Platform-optimized content:** Specific to Instagram/TikTok/Pinterest best practices
✅ **Visual content direction:** Photography style, aesthetic guidelines
✅ **UGC strategy:** How to encourage and leverage customer content
✅ **Conversion-focused:** Every post includes strategic CTA
✅ **Community building:** Tactics to turn customers into brand advocates

---

## Pricing

**Template Only:** $397
**Template + Brand Photoshoot Guide:** $797 (includes shot list, styling guide, model direction)
**Full Implementation:** $2,497 (includes 90 days of content calendar + influencer outreach templates)
