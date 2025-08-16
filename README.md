# 🌱 Green Finance Reform and Corporate Green Transformation

This repository contains the empirical analysis for evaluating the policy impact of **China's Green Finance Reform and Innovation Pilot Zones** on corporate green transformation. The project applies econometric methods (multi-period DID, mediation, moderation) using firm-level panel data.

---

## 📖 Introduction

Green finance has emerged as a critical instrument to promote sustainable development. In 2017, China launched **Green Finance Reform and Innovation Pilot Zones**, aiming to integrate environmental objectives into financial systems.  

This project investigates whether and how these pilot zone policies promote firms’ **green transformation**. The study provides evidence on the policy's effectiveness, explores the **mechanisms of influence** (such as R&D investment), and analyzes **heterogeneity across ownership types, industries, and regions**.  

The findings contribute to the understanding of how financial reforms can accelerate corporate sustainability in emerging markets.

---

## ⚙️ Methodology

The empirical strategy is built on a **multi-period Difference-in-Differences (DID)** framework, exploiting the staggered rollout of pilot zones as a quasi-natural experiment.  

- **Baseline analysis**: Multi-period DID with firm and time fixed effects to capture the net policy effect.  
- **Mediation analysis**: Tests whether increased R&D investment serves as a transmission channel.  
- **Moderation analysis**: Explores how digitalization and financing constraints shape the policy’s effectiveness.  
- **Robustness checks**: Parallel trend test, placebo test, lag structure, PSM-DID, and alternative dependent variables.  

This combination ensures rigorous identification of causal effects and robustness of results.

---

## 🔑 Key Findings

1. **Policy Effectiveness**: The pilot zone policy significantly promotes corporate green transformation, improving firms’ green innovation, environmental performance, and sustainability indicators.  
2. **Mediation Mechanism**: The effect is transmitted primarily through **increased R&D investment**, suggesting that financial support enables firms to pursue long-term innovation strategies.  
3. **Moderation Effects**:  
   - Firms with higher financing constraints benefit more (policy as “relief support”).  
   - Surprisingly, firms with higher digitalization levels experience weaker marginal benefits, as they already enjoy stronger financing and operational efficiency.  
4. **Heterogeneity**:  
   - Stronger impacts for **private firms** and **high-pollution firms**.  
   - Effects concentrated in **eastern regions** and **growth-stage firms**.  
   - Policy effectiveness increased across successive pilot zone batches, showing a “learning effect” of policy implementation.  

Overall, the evidence highlights the role of green finance in **alleviating financing frictions** and **guiding firms toward sustainable transformation**.

---

## 🏗️ Research Design

### 1. Model Construction

To scientifically evaluate the impact of the Green Finance Reform and Innovation Pilot Zone policy on firms’ green transformation and its underlying mechanisms, this section constructs a series of econometric models.  

First, a multi-period Difference-in-Differences (DID) model is adopted as the baseline specification to capture the net policy effect. Second, a mediation model is employed to explore the transmission channel. Finally, moderation models are introduced to test the boundary conditions under different firm characteristics.  

---

#### 1.1 Baseline DID Model

The core of this study is to assess the effectiveness of the Green Finance Reform and Innovation Pilot Zone policy. Since the pilot zones were established in batches, this setting provides a quasi-natural experiment for multi-period DID estimation.  

The specification is:

$$
Y_{it} = \beta_0 + \beta_1 (Treat_i \times Post_t) + \sum Controls_{it} + \mu_i + \lambda_t + \varepsilon_{it}
$$

Where:  
- $Y_{it}$ is the green transformation index of firm $i$ in year $t$, constructed via the entropy weight method.  
- $Treat_i$ equals 1 if firm $i$ is registered in a province with a pilot zone, and 0 otherwise.  
- $Post_t$ equals 1 for years after policy implementation, and 0 otherwise.  
- $\beta_1$ measures the net policy effect.  
- $\mu_i$ are firm fixed effects, $\lambda_t$ are year fixed effects, and $\varepsilon_{it}$ is the error term.  

#### 1.2 Mediation Model

To explore the mechanism, we test whether R&D investment mediates the effect of the policy on green transformation. Following the stepwise regression procedure, the mediation model is specified as:

$$
Y_{it} = c \cdot (Treat_i \times Post_t) + \sum Controls + \varepsilon_1
$$

$$
M_{it} = a \cdot (Treat_i \times Post_t) + \sum Controls + \varepsilon_2
$$

$$
Y_{it} = c' \cdot (Treat_i \times Post_t) + b \cdot M_{it} + \sum Controls + \varepsilon_3
$$

Where $M_{it}$ is the mediator (R&D investment). Mediation exists if $a$ and $b$ are significant. If $c'$ remains significant, the effect is partial mediation; if $c'$ becomes insignificant, it is full mediation.  

#### 1.3 Moderation Model

To examine boundary conditions, we introduce moderators such as firms’ digitalization level and financing constraints. The moderation model is:

$$
Y_{it} = \beta_0 + \beta_1 (Treat_i \times Post_t) + \beta_2 Mod_{it} + \beta_3 (Treat_i \times Post_t \times Mod_{it}) + \sum Controls_{it} + \mu_i + \lambda_t + \varepsilon_{it}
$$

Where $Mod_{it}$ is the moderator. The key parameter is $\beta_3$:  
- If $\beta_3 > 0$ and significant, the moderator strengthens the policy effect.  
- If $\beta_3 < 0$ and significant, the moderator weakens the policy effect.  

### 2. Variable Selection and Data Sources
1. Variable Selection  
2. Data Sources  

---

## 📊 Empirical Results and Analysis

### 1. Descriptive Statistics  
*(to be completed)*  

### 2. Correlation Analysis  
*(to be completed)*  

### 3. Multicollinearity Test  
*(to be completed)*  

### 4. Baseline Regression  
*(to be completed)*  

---

## 🔍 Robustness Checks

1. Lagged Policy Variable  
2. Adding Regional Fixed Effects  
3. Parallel Trend Test  
4. Placebo Test  
5. PSM-DID  
6. Controlling for Other Policies  
7. Alternative Dependent Variables  

---

## 🧩 Heterogeneity Analysis

1. Policy Batch Heterogeneity  
2. Ownership Heterogeneity  
3. Pollution Intensity Heterogeneity  
4. Firm Life Cycle  
5. Regional Heterogeneity  

---

## 🔗 Mechanism Analysis

1. Mediation Effect: R&D Investment  
2. Moderation Effect: Digitalization and Financing Constraints  

---
