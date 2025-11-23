# Real Estate Content Strategy Template

## Industry: Real Estate (Agents, Teams, Brokerages)

This template is designed for real estate professionals - individual agents, team leaders, and brokerages - to establish local authority and generate qualified buyer/seller leads through strategic content.

---

## Template Variables

```json
{
  "AGENT_OR_TEAM_NAME": "Your name or team name",
  "BROKERAGE": "Your brokerage affiliation",
  "GEOGRAPHIC_MARKET": "Specific area (e.g., 'North Austin suburbs', 'Downtown Seattle condos', 'Orange County luxury homes')",
  "PROPERTY_SPECIALTY": "Focus area (e.g., 'first-time homebuyers', 'luxury estates $2M+', 'investment properties', 'relocations')",
  "YEARS_EXPERIENCE": "Years in real estate",
  "ANNUAL_TRANSACTION_VOLUME": "Number of homes sold per year or total volume",
  "AVERAGE_PRICE_POINT": "Typical listing price range",
  "TARGET_CLIENT_PROFILE": "Demographics (e.g., 'young families moving to suburbs', 'executives relocating', 'empty nesters downsizing')",
  "LOCAL_MARKET_CONDITIONS": "Current state (e.g., 'sellers market with low inventory', 'cooling market with rising rates', 'balanced')",
  "UNIQUE_VALUE_PROPOSITION": "What differentiates you (e.g., 'hyper-local market data', 'staging included', 'investor network', 'bilingual services')",
  "PAST_CLIENT_TESTIMONIALS": "Do you have strong testimonials? Y/N and brief summary",
  "VIDEO_COMFORT_LEVEL": "Comfort with video content (High/Medium/Low)",
  "COMPETITOR_AGENTS": "3-5 top local competitor social media accounts or websites",
  "BUSINESS_GOAL": "Primary goal (e.g., 'generate 15 qualified buyer leads per month', 'list 3 luxury properties per quarter', 'build personal brand for team expansion')"
}
```

---

## Stage 1: Real Estate Market Intelligence

### System Prompt Enhancement

```markdown
# INDUSTRY CONTEXT: Real Estate

## Real Estate Content Analysis Framework

### 1. Local Competitor Content Audit

For each agent/team in {{COMPETITOR_AGENTS}}, analyze:

**Content Strategy Type:**
- **Listing-Focused:** Primarily posting properties for sale
- **Educational:** Market updates, buying/selling tips, process education
- **Lifestyle-Focused:** Neighborhood guides, local business features, community content
- **Personal Brand:** Behind-the-scenes, daily life, personality-driven
- **Data-Driven:** Market stats, price trends, investment analysis

**Engagement Analysis:**
- What content gets most comments? (Listings vs. educational vs. personal)
- Do they use video? (Property tours, talking head, both)
- Community engagement: Do they feature local businesses, events, residents?
- Consistency: Posting frequency and regularity

**Lead Generation Tactics:**
- Gated content (home valuations, neighborhood reports, buyer guides)
- Open house promotions
- Free consultation/strategy session offers
- Market report subscriptions

### 2. Real Estate Content Gap Identification

**Market Education Gaps:**
- Are competitors explaining current {{LOCAL_MARKET_CONDITIONS}} clearly?
- Opportunity: Weekly market updates with specific data for {{GEOGRAPHIC_MARKET}}

**Neighborhood Expertise:**
- Do competitors showcase deep local knowledge beyond MLS listings?
- Gap: Neighborhood deep-dives, school district info, hidden gems, development news

**Process Transparency:**
- Are competitors demystifying the buying/selling process?
- Gap: Step-by-step guides, timeline explanations, cost breakdowns, what to expect

**Client Success Stories:**
- Do competitors share testimonials and case studies?
- Gap: Before/after transformations, challenging deal stories, client wins

**Hyperlocal Value:**
- Are competitors providing neighborhood-specific insights?
- Gap: Walkability scores, commute times, upcoming developments, local business spotlights

### 3. Platform-Specific Real Estate Strategies

**Instagram (Visual Showcase + Local Authority):**
```json
{
  "content_mix": {
    "property_listings": "30% - Just listed, open houses, virtual tours",
    "neighborhood_features": "25% - Local spots, hidden gems, community events",
    "market_education": "20% - Tips, market updates, process guides",
    "personal_brand": "15% - Behind-the-scenes, client testimonials, day-in-life",
    "client_results": "10% - Sold signs, happy clients, success stories"
  },
  "reels_strategy": {
    "property_tours": "Fast-paced walk-throughs with key features highlighted",
    "neighborhood_guides": "Day in [Neighborhood], best coffee shops, dog parks",
    "market_tips": "3 things to know before buying in [Market]",
    "trending_formats": "Participate in trends with local real estate spin"
  },
  "stories_strategy": {
    "daily_posting": "Market updates, new listings, open house reminders, Q&A",
    "engagement_tactics": "Polls (which house?), quizzes (neighborhood knowledge), question stickers"
  }
}
```

**Facebook (Community Building + Local Events):**
```json
{
  "content_focus": "Neighborhood news, local business features, community events, market updates",
  "group_strategy": "Create/manage local neighborhood groups for hyperlocal authority",
  "live_video": "Virtual open houses, market update Q&As, neighborhood tours",
  "ad_strategy": "Boosted posts for listings, lead magnet ads (free home valuation)"
}
```

**YouTube (SEO + Long-Form Education):**
```json
{
  "content_types": [
    "Neighborhood guides (15-20 min)",
    "Full property tours (5-10 min)",
    "Market update series (monthly, 8-12 min)",
    "Buying/selling process playlists (series of 5-7 min videos)",
    "Client testimonial interviews (3-5 min)"
  ],
  "seo_strategy": "Target keywords: '[City] real estate', 'moving to [City]', '[Neighborhood] homes for sale'",
  "cta_approach": "Free neighborhood guide download, schedule consultation"
}
```

**TikTok (Personality + Virality):**
```json
{
  "content_angles": [
    "Things you didn't know about [Neighborhood]",
    "What $[Price] gets you in [City]",
    "Real estate agent reacts to [trend]",
    "Behind-the-scenes of open houses/showings",
    "Home buying mistakes to avoid"
  ],
  "voice": "Authentic, educational, entertaining - less polished, more personal"
}
```

**LinkedIn (Networking + Referral Partners):**
```json
{
  "audience": "Lenders, title companies, inspectors, relocation managers, HR professionals",
  "content_focus": "Market insights, transaction stories, professional partnerships, industry trends",
  "goal": "B2B referrals from relocation companies, lenders, attorneys"
}
```

### 4. Real Estate Content Themes That Generate Leads

**High-Performing Content Types:**

1. **Market Insider Knowledge:** "Why {{GEOGRAPHIC_MARKET}} inventory is at historic lows and what it means for buyers"
2. **Neighborhood Spotlights:** "Complete guide to [Neighborhood]: Schools, dining, commute, hidden gems"
3. **Price Point Showcases:** "What $[Price] gets you in {{GEOGRAPHIC_MARKET}} right now"
4. **Process Education:** "Timeline: From offer to close - what to expect each week"
5. **Common Mistakes:** "5 mistakes that cost first-time homebuyers thousands"
6. **Success Stories:** "How we helped [Client] find their dream home in a bidding war"
7. **Local Predictions:** "My predictions for {{GEOGRAPHIC_MARKET}} in Q[X] based on [data]"
8. **Transparent Pricing:** "Exactly what it costs to sell your home (with real numbers)"
9. **Development News:** "New [development/business/school] coming to [Area] - impact on property values"
10. **Comparative Market Analysis:** "[Neighborhood A] vs. [Neighborhood B]: Which is right for you?"

### 5. Lead Quality Scoring

Prioritize content opportunities by lead quality:
- **High Intent:** Property inquiries, home valuation requests, consultation bookings
- **Medium Intent:** Neighborhood guide downloads, market report subscriptions, open house RSVPs
- **Low Intent (Nurture):** Social media follows, content engagement, email newsletter signups

## OUTPUT REQUIREMENTS

```json
{
  "market_positioning": {
    "local_authority_angle": "How {{AGENT_OR_TEAM_NAME}} can own a specific niche in {{GEOGRAPHIC_MARKET}}",
    "competitor_differentiation": "What competitors are missing that you can own",
    "content_moat": "Sustainable competitive advantage through content"
  },
  "geographic_content_strategy": {
    "tier_1_neighborhoods": ["Primary focus areas where you want most listings"],
    "tier_2_neighborhoods": ["Secondary areas for SEO and market coverage"],
    "hyperlocal_tactics": "Specific local knowledge to showcase (businesses, parks, schools, developments)"
  },
  "buyer_seller_strategies": {
    "buyer_focused_content": {
      "themes": ["Education theme 1", "Theme 2", "Theme 3"],
      "lead_magnets": ["Free resource 1", "Free resource 2"],
      "typical_questions": ["Address objection 1", "Objection 2"]
    },
    "seller_focused_content": {
      "themes": ["Positioning theme 1", "Theme 2"],
      "lead_magnets": ["Home valuation", "Pricing guide"],
      "typical_concerns": ["Pricing concerns", "Timeline concerns"]
    }
  },
  "strategic_opportunities": [
    {
      "opportunity_title": "Content angle",
      "target_audience": "Buyers/Sellers/Investors/Relocators",
      "platform": "Instagram/Facebook/YouTube/TikTok",
      "content_format": "Reel/Video tour/Educational post/Story series",
      "lead_generation_mechanism": "How this converts to leads",
      "production_requirements": "What's needed",
      "estimated_impact": "HIGH/MEDIUM/LOW",
      "frequency": "How often to post this type"
    }
  ],
  "video_content_roadmap": {
    "comfort_level": "{{VIDEO_COMFORT_LEVEL}}",
    "starter_video_types": "Recommended first videos based on comfort level",
    "equipment_needs": "Phone vs. professional",
    "editing_requirements": "DIY vs. editor needed"
  }
}
```

## REAL ESTATE CONTENT SUCCESS FACTORS

1. **Hyperlocal Authority:** Own your specific market through deep knowledge
2. **Consistency:** Regular posting builds top-of-mind awareness for referrals
3. **Personality:** People hire people they know, like, trust - show who you are
4. **Social Proof:** Client testimonials and success stories are non-negotiable
5. **Educational Value:** Help first, sell second - provide genuine utility
6. **Multi-Platform:** Meet your audience where they are (Facebook for older buyers, TikTok for first-timers, LinkedIn for relocations)
```

---

## Sample Input

```json
{
  "AGENT_OR_TEAM_NAME": "Sarah Martinez",
  "BROKERAGE": "Compass",
  "GEOGRAPHIC_MARKET": "East Austin neighborhoods - Govalle, MLK, Mueller, Windsor Park",
  "PROPERTY_SPECIALTY": "First-time homebuyers purchasing $350K-$550K starter homes and young families upgrading",
  "YEARS_EXPERIENCE": "7 years",
  "ANNUAL_TRANSACTION_VOLUME": "22-28 homes per year",
  "AVERAGE_PRICE_POINT": "$425K",
  "TARGET_CLIENT_PROFILE": "28-38 year old tech/creative professionals, many relocating from California, looking for Austin lifestyle with reasonable commute to downtown",
  "LOCAL_MARKET_CONDITIONS": "Cooling from 2021-2022 peak but still competitive, inventory slowly improving, rates affecting affordability",
  "UNIQUE_VALUE_PROPOSITION": "Native Austinite with deep neighborhood knowledge, bilingual (English/Spanish), first-time buyer specialist with lender partnerships for creative financing",
  "PAST_CLIENT_TESTIMONIALS": "Yes - strong reviews highlighting patience with first-timers and neighborhood expertise",
  "VIDEO_COMFORT_LEVEL": "Medium - comfortable with reels/stories, less comfortable with long-form talking head",
  "COMPETITOR_AGENTS": "https://www.instagram.com/austinhomegirl/, https://www.instagram.com/realtorjessicaknox/, https://www.facebook.com/groups/austinrealestate",
  "BUSINESS_GOAL": "Generate 20 qualified first-time buyer consultations per month and position as THE East Austin first-time buyer specialist"
}
```

---

## Expected Outcomes

✅ **Geographic authority:** Become known expert for specific neighborhoods
✅ **Lead generation:** Consistent flow of buyer/seller inquiries
✅ **Referral network:** Content that gets shared by past clients
✅ **Long-term SEO:** Video content ranking for local searches
✅ **Personal brand:** Differentiation from "just another agent"

---

## Pricing

**Template Only:** $297
**Template + Neighborhood Guide Template:** $597 (includes neighborhood deep-dive framework)
**Full Implementation Package:** $1,997 (includes 12-week content calendar, video shot lists, local business partnership outreach templates, lead magnet creation)
