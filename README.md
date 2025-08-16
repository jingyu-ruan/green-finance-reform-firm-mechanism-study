# 🌱 Green Finance Pilot Policies and Corporate Green Transformation: Evidence from Chinese Listed Firms

This repository contains the empirical analysis for evaluating the policy impact of **China's Green Finance Reform and Innovation Pilot Zones** on corporate green transformation. The project applies econometric methods (multi-period DID, mediation, moderation) using firm-level panel data.



## 📖 Introduction

Green finance has emerged as a critical instrument to promote sustainable development. In 2017, China launched **Green Finance Reform and Innovation Pilot Zones**, aiming to integrate environmental objectives into financial systems.  

This project investigates whether and how these pilot zone policies promote firms’ **green transformation**. The study provides evidence on the policy's effectiveness, explores the **mechanisms of influence** (such as R&D investment), and analyzes **heterogeneity across ownership types, industries, and regions**.  

The findings contribute to the understanding of how financial reforms can accelerate corporate sustainability in emerging markets.



## ⚙️ Methodology

The empirical strategy is built on a **multi-period Difference-in-Differences (DID)** framework, exploiting the staggered rollout of pilot zones as a quasi-natural experiment.  

- **Baseline analysis**: Multi-period DID with firm and time fixed effects to capture the net policy effect.  
- **Mediation analysis**: Tests whether increased R&D investment serves as a transmission channel.  
- **Moderation analysis**: Explores how digitalization and financing constraints shape the policy’s effectiveness.  
- **Robustness checks**: Parallel trend test, placebo test, lag structure, PSM-DID, and alternative dependent variables.  

This combination ensures rigorous identification of causal effects and robustness of results.



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



## 🏗️ Research Design

### 1. Model Construction

To scientifically evaluate the impact of the Green Finance Reform and Innovation Pilot Zone policy on firms’ green transformation and its underlying mechanisms, this section constructs a series of econometric models.  

First, a multi-period Difference-in-Differences (DID) model is adopted as the baseline specification to capture the net policy effect. Second, a mediation model is employed to explore the transmission channel. Finally, moderation models are introduced to test the boundary conditions under different firm characteristics.  



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

#### 2.1 Variable Selection

The research sample consists of Chinese A-share listed firms from 2009 to 2023.  

The **core dependent variable** is the *Green Transformation Index*. Following existing studies, green transformation is considered a multidimensional concept that cannot be captured by a single measure. Therefore, a composite index is constructed from five dimensions—technological innovation, production efficiency, pollution reduction, environmental protection, and social evaluation—using the entropy weight method.  

**Table 1. Construction of the Green Transformation Index**

| Dimension            | Sub-Indicator         | Definition                                                                 |
| Technological Innovation | Green innovation output | Annual number of green patent applications filed by the firm                |
| Production Level     | Total factor productivity | Firm-level TFP estimated via the LP method                                  |
|                      | Labor productivity    | Ratio of total revenue to number of employees                               |
| Pollution Reduction  | Pollution treatment   | Disclosure on wastewater, waste gas, and solid waste management             |
|                      | Clean production      | Disclosure on clean production facilities                                   |
| Environmental Protection | Environmental management | Disclosure on environmental information, management systems, emergency mechanisms, and the Three Simultaneous System (design, construction, and operation of environmental protection facilities simultaneously with the main project)  |
|                      | Environmental supervision | Inclusion in key pollution monitoring list, environmental accidents, violations, complaints, ISO certification |
| Social Evaluation    | ESG rating            | Huazheng ESG rating scores (mapped from 9 = highest to 1 = lowest)          |

The **core explanatory variable** is the *policy dummy* of the Green Finance Reform and Innovation Pilot Zone, defined as the interaction between the treatment group dummy and the policy implementation time dummy.  

The **mediating variable** is *R&D investment*, reflecting whether the policy promotes green transformation by incentivizing long-term innovation.  

The **moderating variables** are:  
- *Digitalization level*: capturing firms’ internal information processing and resource allocation capabilities.  
- *Financing constraints*: measured using the SA index, reflecting the extent of financial frictions faced by firms.  

To minimize omitted variable bias, a set of firm-level controls is included.  

**Table 2. Control Variables**

| Variable Name        | Symbol    | Definition                                                                 |
| Leverage ratio       | lev       | Total liabilities / total assets                                           |
| Asset turnover       | ato       | Operating revenue / average total assets                                   |
| Cash flow ratio      | cashflow  | Net cash flow from operations / total assets                               |
| Inventory ratio      | inv       | Inventory / total assets                                                   |
| Revenue growth       | growth    | Current year revenue / previous year revenue − 1                           |
| Board size           | board     | Natural log of board members                                               |
| Independent director ratio | indep | Number of independent directors / total directors                         |
| Firm age             | firmage   | Natural log of (current year − founding year + 1)                          |

#### 2.2 Data Sources

- **Green patent applications**: CNRDS and National Intellectual Property Administration (NIPA)  
- **ESG ratings**: Huazheng ESG Rating System  
- **Annual reports**: used for digitalization, pollution reduction, and environmental protection indicators  
- **Financial and governance data**: CSMAR and Wind databases  
- **Interpolation**: applied to fill missing values where appropriate  



## 📊 Empirical Results and Analysis



This chapter constitutes the empirical core of the study, testing the effect of the Green Finance Reform and Innovation Pilot Zone policy on corporate green transformation using econometric models. The analysis begins with descriptive statistics, followed by correlation and multicollinearity checks. Then, benchmark regressions are conducted, accompanied by robustness tests to ensure the reliability of findings. Finally, heterogeneity and mechanism analyses are carried out to explore the pathways and conditions under which the policy operates.  

### 1. Descriptive Statistics  

Before conducting regressions, we summarize the main variables to understand their distributional characteristics.  

**Table 3. Descriptive Statistics of Main Variables**  

| Variable   | Obs   | Mean  | SD    | Min   | Median | Max   |
| index      | 22877 | 0.088 | 0.105 | 0.000 | 0.053  | 0.628 |
| did        | 22877 | 0.211 | 0.408 | 0.000 | 0.000  | 1.000 |
| lev        | 21877 | 0.417 | 0.208 | 0.051 | 0.405  | 0.950 |
| ato        | 21877 | 0.639 | 0.434 | 0.078 | 0.541  | 2.630 |
| cashflow   | 21877 | 0.046 | 0.069 | -0.161| 0.044  | 0.248 |
| inv        | 21877 | 0.136 | 0.116 | 0.000 | 0.111  | 0.658 |
| growth     | 21877 | 0.165 | 0.415 | -0.579| 0.103  | 2.601 |
| board      | 21877 | 2.108 | 0.193 | 1.609 | 2.197  | 2.565 |
| indep      | 21877 | 37.700| 5.419 | 33.330| 36.360 | 57.140|
| firmage    | 21877 | 2.894 | 0.366 | 1.099 | 2.944  | 4.043 |


### 2. Correlation Analysis  

Pearson correlation analysis is conducted to evaluate linear relationships among variables and detect potential multicollinearity.  

**Table 4. Correlation Matrix**  

|        | index | did   | lev   | ato   | cashflow | inv   | growth | board | indep | firmage |
| index  | 1     | 0.12*** | 0.10*** | 0.10*** | 0.14*** | -0.03***| -0.04***| 0.10***| -0.02***| 0.21*** |
| did    |       | 1     | 0.06*** | 0.01** | 0.03*** | -0.03***| -0.04***| -0.08***| 0.04*** | 0.21*** |
| lev    |       |       | 1     | 0.16***| -0.17***| 0.26***| 0.01** | 0.11***| -0.02** | 0.17*** |
| ato    |       |       |       | 1     | 0.14*** | 0.09*** | 0.14*** | 0.05***| -0.04***| -0.04***|
| cashflow |     |       |       |       | 1       | -0.16***| 0.03*** | 0.05***| -0.01   | 0       |
| inv    |       |       |       |       |          | 1     | 0.02***| 0.01*  | 0       | 0.02*** |
| growth |       |       |       |       |          |       | 1      | 0.02***| -0.01* | -0.08***|
| board  |       |       |       |       |          |       |        | 1      | -0.58***| -0.01** |
| indep  |       |       |       |       |          |       |        |        | 1      | 0.04*** |
| firmage|       |       |       |       |          |       |        |        |        | 1       |

*Notes: \*, \*\*, \*\*\* denote significance at the 10%, 5%, and 1% levels, respectively.*



### 3. Multicollinearity Analysis  

Variance Inflation Factor (VIF) tests further ensure that no severe multicollinearity exists among independent variables.  

**Table 5. VIF Test Results**  

| Variable | VIF  | 1/VIF |
| board    | 1.54 | 0.651 |
| indep    | 1.51 | 0.664 |
| lev      | 1.18 | 0.846 |
| inv      | 1.10 | 0.913 |
| ato      | 1.09 | 0.916 |
| cashflow | 1.09 | 0.917 |
| firmage  | 1.09 | 0.918 |
| did      | 1.06 | 0.943 |
| growth   | 1.03 | 0.972 |
| **Mean VIF** | **1.19** |   |

All VIF values are well below the common threshold of 10, confirming that multicollinearity is not a concern.  


### 4. Benchmark Regression Analysis  

We next estimate the baseline multi-period DID model to test Hypothesis H1:  
*“The Green Finance Reform and Innovation Pilot Zone policy promotes corporate green transformation.”*  

**Table 6. Benchmark Regression Results**  

| VARIABLES | (1) index | (2) index | (3) index |
| did       | 0.006**   | 0.015***  | 0.007***  |
|           | (2.37)    | (5.83)    | (2.60)    |
| lev       |           | -0.020*** | -0.019*** |
|           |           | (-3.36)   | (-3.25)   |
| ato       |           | 0.005     | 0.006**   |
|           |           | (1.59)    | (2.06)    |
| cashflow  |           | 0.023**   | 0.031***  |
|           |           | (1.98)    | (2.71)    |
| inv       |           | 0.023*    | 0.024**   |
|           |           | (1.94)    | (2.06)    |
| growth    |           | -0.002    | -0.001    |
|           |           | (-0.97)   | (-0.47)   |
| board     |           | 0.007     | 0.001     |
|           |           | (0.93)    | (0.12)    |
| indep     |           | 0.000     | 0.000     |
|           |           | (1.37)    | (0.35)    |
| firmage   |           | 0.145***  | 0.008     |
|           |           | (44.71)   | (0.92)    |
| Constant  | 0.089***  | -0.358*** | 0.060*    |
|           | (107.44)  | (-15.15)  | (1.85)    |
| Time FE   | YES       | NO        | YES       |
| Firm FE   | YES       | YES       | YES       |
| Observations      | 22,877    | 22,877    | 22,877    |
| R-squared | 0.683     | 0.659     | 0.683     |

*Notes: Robust t-statistics in parentheses. \*, \*\*, \*\*\* denote significance at the 10%, 5%, and 1% levels, respectively.*





## 🔍 Robustness Checks


To ensure the reliability of the baseline regression results, this section conducts a series of robustness checks, including lagging the core explanatory variable, adding regional fixed effects, parallel trend tests, placebo tests, applying PSM-DID, excluding other concurrent policies, and replacing the dependent variable.  

### 1. Lagging the Core Explanatory Variable  

Table 7 reports the regression results when the policy variable is lagged by one period. The coefficient of `L.did` remains significantly positive at the 5% level, confirming the persistence and robustness of the policy effect.  

**Table 7. Regression Results with One-period Lag of Core Explanatory Variable**

| VARIABLES | (1) index | (2) index |
| L.did     | 0.006**   | 0.006**   |
|           | (1.96)    | (1.97)    |
| lev       |           | -0.019*** |
|           |           | (-3.15)   |
| ato       |           | 0.006*    |
|           |           | (1.80)    |
| cashflow  |           | 0.018     |
|           |           | (1.48)    |
| inv       |           | 0.030**   |
|           |           | (2.44)    |
| growth    |           | 0.002     |
|           |           | (0.97)    |
| board     |           | 0.017**   |
|           |           | (2.36)    |
| indep     |           | 0.000**   |
|           |           | (2.17)    |
| firmage   |           | 0.015     |
|           |           | (1.40)    |
| Constant  | 0.090***  | -0.008    |
|           | (111.14)  | (-0.20)   |
| Time FE   | YES       | YES       |
| Firm FE   | YES       | YES       |
| Observations | 19,862 | 19,862    |
| R-squared | 0.689     | 0.699     |




### 2. Adding Regional Fixed Effects  

Table 8 shows regression results with province- and city-level fixed effects. The coefficient of `did` remains 0.008 and highly significant at the 1% level across specifications, confirming robustness against regional unobservables.  

**Table 8. Regression Results with Additional Regional Fixed Effects**

| VARIABLES | (1) index | (2) index | (3) index | (4) index |
| did       | 0.008***  | 0.008***  | 0.008***  | 0.008***  |
|           | (2.78)    | (2.80)    | (2.96)    | (3.01)    |
| lev       |           |           | -0.016*** | -0.019*** |
|           |           |           | (-2.79)   | (-3.24)   |
| ato       |           |           | 0.007**   | 0.008**   |
|           |           |           | (2.13)    | (2.39)    |
| cashflow  |           |           | 0.030***  | 0.027**   |
|           |           |           | (2.60)    | (2.38)    |
| inv       |           |           | 0.022*    | 0.027**   |
|           |           |           | (1.89)    | (2.32)    |
| growth    |           |           | -0.001    | -0.001    |
|           |           |           | (-0.39)   | (-0.56)   |
| board     |           |           | -0.001    | -0.001    |
|           |           |           | (-0.12)   | (-0.14)   |
| indep     |           |           | 0.000     | 0.000     |
|           |           |           | (0.21)    | (0.44)    |
| firmage   |           |           | 0.008     | 0.005     |
|           |           |           | (0.93)    | (0.57)    |
| Constant  |           |           | 0.064**   | 0.071**   |
|           |           |           | (1.96)    | (2.18)    |
| Time FE   | YES       | YES       | YES       | YES       |
| Firm FE   | YES       | YES       | YES       | YES       |
| Province FE | NO      | YES       | NO        | YES       |
| City FE   | YES       | YES       | YES       | YES       |
| Observations | 22,877 | 11,868    | 22,877    | 11,868    |
| R-squared | 0.685     | 0.691     | 0.686     | 0.692     |

### 3. Parallel Trend Test  

A key prerequisite for the Difference-in-Differences (DID) model is the **parallel trend assumption**, which requires that the treatment group and the control group follow a similar trend before the policy intervention. If this assumption does not hold, the post-policy differences in firms’ green transition outcomes may simply reflect inherent trend differences rather than the true policy effect.  

To verify this assumption, we employ an **event study specification**:  

$$
Y_{it} = \alpha + \sum_k \beta_k D_{it}^k + \sum Controls_{it} + \mu_i + \lambda_t + \varepsilon_{it}
$$  

where $D_{it}^k$ is a set of dummy variables representing the relative year $k$ with respect to the policy implementation (with $k=0$ being the implementation year). The coefficients of interest are those with $k < 0$. If these coefficients are not significantly different from zero, it indicates no pre-trend differences, thereby supporting the validity of the parallel trend assumption.  

The figure below plots the estimated coefficients for $k \in [-5, +5]$:  

![Parallel Trend Test](output/figures/平行趋势检验.svg)  
**Figure 1. Parallel Trend Test**

The coefficients before policy implementation are statistically indistinguishable from zero, validating the parallel trend assumption. Post-policy coefficients turn significantly positive, indicating that the effect emerges gradually after the policy intervention.  


### 4. Placebo Test  

To rule out spurious correlations, a placebo test is conducted by randomly assigning firms to treatment groups 500 times.  


![Placebo Test - Density](output/figures/安慰剂1.svg)  
**Figure 2. Kernel Density of Placebo Estimates**  


![Placebo Test - P-values](output/figures/安慰剂2.svg)  
**Figure 3. Distribution of Placebo P-values**  

The placebo estimates are centered around zero and insignificant, while the true DID estimate lies at the far right tail, supporting the robustness of the baseline findings.  



### 5. PSM-DID  

To mitigate sample selection bias, PSM-DID is applied with three matching strategies (1:3 nearest neighbor, caliper, and kernel matching).  

![PSM-DID Matching Graph](output/figures/近邻匹配psgraph.svg)  

Table 9 reports consistent positive and significant coefficients of `did` across all matching methods, further confirming the policy’s effect.  

**Table 9. PSM-DID Regression Results**

| VARIABLES   | (1) 1:3 Nearest Neighbor Matching | (2) Radius Caliper Matching | (3) Kernel Matching |
| did         | 0.007**                          | 0.006*                      | 0.005*              |
|             | (2.13)                           | (1.82)                      | (1.81)              |
| lev         | -0.016**                         | -0.020***                   | -0.021***           |
|             | (-2.27)                          | (-2.93)                     | (-3.41)             |
| ato         | 0.006                            | 0.005                       | 0.006*              |
|             | (1.53)                           | (1.44)                      | (1.67)              |
| cashflow    | 0.026**                          | 0.032**                     | 0.029**             |
|             | (2.04)                           | (2.50)                      | (2.52)              |
| inv         | 0.019                            | 0.025*                      | 0.026**             |
|             | (1.34)                           | (1.76)                      | (2.03)              |
| growth      | -0.000                           | 0.001                       | -0.000              |
|             | (-0.21)                          | (0.42)                      | (-0.11)             |
| board       | 0.002                            | 0.001                       | -0.000              |
|             | (0.27)                           | (0.15)                      | (-0.06)             |
| indep       | 0.000                            | 0.000                       | 0.000               |
|             | (0.24)                           | (0.23)                      | (0.17)              |
| firmage     | 0.012                            | 0.013                       | 0.010               |
|             | (1.07)                           | (1.15)                      | (0.99)              |
| Constant    | 0.046                            | 0.046                       | 0.060               |
|             | (1.06)                           | (1.06)                      | (1.53)              |
| Observations| 10,073                           | 10,073                      | 10,073              |
| R-squared   | 0.702                            | 0.693                       | 0.686               |



### 6. Excluding Other Concurrent Policies  

Table 10 incorporates concurrent regional policies such as Low-Carbon City pilots, ETS pilots, and Smart City pilots as controls. The coefficient of `did` remains positive and significant, indicating the effect is independent of these policies.  

**Table 10. Regression Results after Excluding Other Policy Effects**

| VARIABLES   | (1) Low-Carbon Pilot | (2) Low-Carbon Pilot | (3) ETS Pilot | (4) ETS Pilot | (5) Smart-City Pilot | (6) Smart-City Pilot | (7) All Policies | (8) All Policies |
| did         | 0.006**              | 0.007***             | 0.007***      | 0.008***      | 0.006**               | 0.007**              | 0.008***         | 0.008***         |
|             | (2.40)               | (2.62)               | (2.70)        | (2.92)        | (2.34)                | (2.57)               | (2.73)           | (2.96)           |
| didcarbon   | 0.001                | 0.001                |               |               | 0.002                 | 0.002                |                  |                  |
|             | (0.37)               | (0.36)               |               |               | (0.63)                | (0.61)               |                  |                  |
| didets      |                      |                      | -0.008**      | -0.008**      |                       |                       | -0.008**         | -0.008**         |
|             |                      |                      | (-2.21)       | (-2.20)       |                       |                       | (-2.25)          | (-2.25)          |
| didsmart    |                      |                      |               |               | -0.001                | -0.000               | -0.001           | -0.000           |
|             |                      |                      |               |               | (-0.20)               | (-0.12)              | (-0.15)          | (-0.07)          |
| lev         |                      | -0.019***            |               | -0.018***     |                       | -0.019***            |                  | -0.018***        |
|             |                      | (-3.25)              |               | (-3.14)       |                       | (-3.24)              |                  | (-3.14)          |
| ato         |                      | 0.006**              |               | 0.007**       |                       | 0.006**              |                  | 0.007**          |
|             |                      | (2.05)               |               | (2.13)        |                       | (2.05)               |                  | (2.12)           |
| cashflow    |                      | 0.031***             |               | 0.031***      |                       | 0.031***             |                  | 0.031***         |
|             |                      | (2.71)               |               | (2.70)        |                       | (2.72)               |                  | (2.70)           |
| inv         |                      | 0.024**              |               | 0.025**       |                       | 0.024**              |                  | 0.025**          |
|             |                      | (2.07)               |               | (2.14)        |                       | (2.06)               |                  | (2.14)           |
| growth      |                      | -0.001               |               | -0.001        |                       | -0.001               |                  | -0.001           |
|             |                      | (-0.47)              |               | (-0.49)       |                       | (-0.47)              |                  | (-0.49)          |
| board       |                      | 0.001                |               | 0.001         |                       | 0.001                |                  | 0.001            |
|             |                      | (0.13)               |               | (0.10)        |                       | (0.13)               |                  | (0.12)           |
| indep       |                      | 0.000                |               | 0.000         |                       | 0.000                |                  | 0.000            |
|             |                      | (0.36)               |               | (0.36)        |                       | (0.36)               |                  | (0.37)           |
| firmage     |                      | 0.008                |               | 0.008         |                       | 0.008                |                  | 0.008            |
|             |                      | (0.92)               |               | (0.89)        |                       | (0.92)               |                  | (0.87)           |
| Constant    | 0.088***             | 0.060*               | 0.091***      | 0.063*        | 0.089***              | 0.060*               | 0.090***         | 0.062*           |
|             | (41.96)              | (1.83)               | (69.39)       | (1.94)        | (59.96)               | (1.86)               | (36.25)          | (1.91)           |
| Observations| 11,909               | 11,909               | 11,909        | 11,909        | 11,909                | 11,909               | 11,909           | 11,909           |
| R-squared   | 0.683                | 0.683                | 0.683         | 0.684         | 0.683                 | 0.683                | 0.683            | 0.684            |



### 7. Alternative Dependent Variables  

To ensure robustness, we replace the main dependent variable with two alternative measures of green transformation:  

- **Carbon performance (cperf):** Measures how well firms reduce carbon emissions relative to their operations.  
- **Green investment ratio (epi):** Captures the share of firm resources allocated to environmental protection and green projects.  

Table 11 shows that the policy variable (`did`) significantly improves both indicators, confirming that the results are not driven by the choice of a single measure of green transformation.  

**Table 11. Regression Results after Replacing Dependent Variables**

| VARIABLES   | (1) cperf | (2) cperf | (3) epi | (4) epi |
| did         | 0.055***  | 0.054***  | 0.116** | 0.111** |
|             | (2.69)    | (2.59)    | (2.09)  | (2.01)  |
| lev         |           | 0.171***  |         | 0.425***|
|             |           | (3.72)    |         | (3.35)  |
| ato         |           | 0.047*    |         | -0.063  |
|             |           | (1.71)    |         | (-0.90) |
| cashflow    |           | -0.020    |         | -0.498**|
|             |           | (-0.23)   |         | (-2.07) |
| inv         |           | -0.073    |         | -0.562**|
|             |           | (-0.76)   |         | (-2.23) |
| growth      |           | 0.025*    |         | 0.044   |
|             |           | (1.76)    |         | (1.25)  |
| board       |           | -0.018    |         | -0.112  |
|             |           | (-0.32)   |         | (-0.72) |
| indep       |           | 0.000     |         | 0.000   |
|             |           | (0.15)    |         | (0.01)  |
| firmage     |           | -0.051    |         | -0.499**|
|             |           | (-0.76)   |         | (-2.55) |
| Constant    | 0.628***  | 0.711***  | 0.253***| 1.901***|
|             | (97.37)   | (2.82)    | (14.39) | (2.61)  |
| Observations| 9,610     | 9,610     | 9,561   | 9,561   |
| R-squared   | 0.787     | 0.788     | 0.448   | 0.450   |





## 🧩 Heterogeneity Analysis
The baseline and robustness regressions confirm that the Green Finance Reform and Innovation Pilot Zone (GFRIPZ) policy promotes corporate green transformation on average. However, this average effect may mask differences across firms and contexts. To better understand the mechanism and scope of the policy’s impact, we conduct heterogeneity analysis along five dimensions: **policy batches, ownership, pollution intensity, life cycle stage, and geographic location**.  

### 1. Policy Batch Heterogeneity

 Since the GFRIPZ policy was rolled out in multiple batches, differences in timing, macroeconomic conditions, and policy design may have led to varying impacts. Table 12 reports results across the first, second, and third batches.  

- Column (1): The first batch (`did1`) shows a significant positive coefficient (0.007, 5% level).  
- Column (2): The second batch (`did2`) shows a much larger positive effect (0.044, 5% level).  
- Column (3): The full sample of three batches produces results consistent with the baseline.  

These findings suggest a **“gradual and strengthening” policy effect**: later batches benefited from accumulated experience and more precise design, enhancing overall effectiveness.  

**Table 12. Policy Batch Heterogeneity Regression Results**

| VARIABLES   | (1) First Batch | (2) First + Second Batch | (3) First + Second + Third Batch |
| did1        | 0.007**         |                          |                                  |
|             | (2.57)          |                          |                                  |
| did2        |                 | 0.044**                  |                                  |
|             |                 | (1.97)                   |                                  |
| did         |                 |                          | 0.007***                         |
|             |                 |                          | (2.60)                           |
| lev         | -0.019***       | -0.020**                 | -0.019***                        |
|             | (-3.25)         | (-2.48)                  | (-3.25)                          |
| ato         | 0.007**         | 0.009*                   | 0.006**                          |
|             | (2.06)          | (1.93)                   | (2.06)                           |
| cashflow    | 0.031***        | 0.036**                  | 0.031***                         |
|             | (2.72)          | (2.23)                   | (2.71)                           |
| inv         | 0.024**         | 0.026                    | 0.024**                          |
|             | (2.05)          | (1.62)                   | (2.06)                           |
| growth      | -0.001          | -0.001                   | -0.001                           |
|             | (-0.47)         | (-0.48)                  | (-0.47)                          |
| board       | 0.001           | 0.002                    | 0.001                            |
|             | (0.13)          | (0.21)                   | (0.12)                           |
| indep       | 0.000           | 0.000                    | 0.000                            |
|             | (0.36)          | (0.45)                   | (0.35)                           |
| firmage     | 0.008           | 0.014                    | 0.008                            |
|             | (0.91)          | (1.18)                   | (0.92)                           |
| Constant    | 0.060*          | 0.037                    | 0.060*                           |
|             | (1.86)          | (0.81)                   | (1.85)                           |
| Observations| 11,909          | 11,909                   | 11,909                           |
| R-squared   | 0.683           | 0.705                    | 0.683                            |

### 2. Ownership Heterogeneity

Firms with different ownership structures face distinct financing conditions and policy sensitivities. Private firms often encounter stronger credit constraints and respond more quickly to incentives, while state-owned enterprises (SOEs) — especially central SOEs — enjoy easier access to finance but may rely more on top-down directives.  

- Private firms: `did` is positive and significant at 5%.  
- Local SOEs: `did` is positive and significant at 10%.  
- Central SOEs: coefficient positive but statistically insignificant.  

This shows that the **policy effect is strongest for private firms**, consistent with their greater financing needs and responsiveness.  

**Table 13. Ownership Heterogeneity Regression Results**  
| VARIABLES   | (1) Private Enterprises | (2) Local SOEs | (3) Central SOEs |
| did         | 0.007**                 | 0.012*         | 0.017            |
|             | (2.33)                  | (1.83)         | (1.42)           |
| lev         | -0.018***               | 0.011          | -0.037           |
|             | (-2.69)                 | (0.72)         | (-1.52)          |
| ato         | 0.004                   | 0.001          | 0.017            |
|             | (1.16)                  | (0.11)         | (1.64)           |
| cashflow    | 0.044***                | 0.022          | -0.036           |
|             | (3.31)                  | (0.84)         | (-0.86)          |
| inv         | 0.037***                | -0.020         | 0.001            |
|             | (2.75)                  | (-0.65)        | (0.02)           |
| growth      | 0.000                   | -0.005         | -0.002           |
|             | (0.15)                  | (-1.23)        | (-0.37)          |
| board       | -0.005                  | -0.006         | 0.061**          |
|             | (-0.63)                 | (-0.35)        | (2.09)           |
| indep       | 0.000                   | -0.001         | 0.002**          |
|             | (0.43)                  | (-1.63)        | (2.01)           |
| firmage     | 0.027***                | 0.092***       | -0.086*          |
|             | (2.81)                  | (3.41)         | (-1.74)          |
| Constant    | 0.006                   | -0.134         | 0.194            |
|             | (0.16)                  | (-1.38)        | (1.13)           |
| Observations| 8,355                   | 2,598          | 865              |
| R-squared   | 0.685                   | 0.711          | 0.775            |

### 3. Pollution Intensity Heterogeneity
We use carbon intensity (emissions per revenue) to classify firms into low-, medium-, and high-pollution groups.  

- High-pollution firms: `did` is significantly positive at 5%, confirming strong policy support for costly green upgrades.  
- Low-pollution firms: `did` positive and significant at 10%, but weaker.  
- Medium-pollution firms: `did` significantly negative at 10%, possibly reflecting **short-term adjustment costs or transitional frictions**.  

Overall, the policy has the **most powerful impact on highly polluting firms**, which face greater regulatory pressure and transformation needs.  

**Table 14. Pollution Intensity Heterogeneity Regression Results**
| VARIABLES   | (1) Low Carbon Intensity | (2) Medium Carbon Intensity | (3) High Carbon Intensity |
| did         | 0.014*                   | -0.019*                     | 0.020**                   |
|             | (1.75)                   | (-1.83)                     | (2.13)                    |
| lev         | -0.015                   | -0.018                      | 0.005                     |
|             | (-0.84)                  | (-0.77)                     | (0.25)                    |
| ato         | 0.012                    | -0.002                      | 0.006                     |
|             | (1.15)                   | (-0.17)                     | (0.48)                    |
| cashflow    | 0.021                    | -0.002                      | 0.029                     |
|             | (0.64)                   | (-0.05)                     | (0.71)                    |
| inv         | 0.050                    | -0.058                      | 0.069                     |
|             | (1.26)                   | (-1.11)                     | (1.47)                    |
| growth      | -0.001                   | 0.005                       | -0.000                    |
|             | (-0.22)                  | (0.74)                      | (-0.08)                   |
| board       | 0.045**                  | 0.008                       | 0.006                     |
|             | (2.12)                   | (0.29)                      | (0.27)                    |
| indep       | 0.001*                   | 0.001                       | 0.000                     |
|             | (1.82)                   | (0.84)                      | (0.46)                    |
| firmage     | 0.005                    | 0.093***                    | 0.030                     |
|             | (0.19)                   | (3.24)                      | (1.02)                    |
| Constant    | -0.041                   | -0.189*                     | -0.042                    |
|             | (-0.40)                  | (-1.72)                     | (-0.39)                   |
| Observations| 2,587                    | 1,337                       | 1,239                     |
| R-squared   | 0.781                    | 0.770                       | 0.787                     |

### 4. Firm Life Cycle
Firm responses to policy may differ across life cycle stages (growth, maturity, decline).  

- Growth-stage firms: `did` highly positive (0.023, 1% level), showing strong responsiveness.  
- Mature firms: no significant effect.  
- Declining firms: no significant effect.  

The results indicate that **growth-stage firms capture the largest policy benefits**, as they are more investment-driven and opportunity-seeking, while mature and declining firms show weaker incentives.  

**Table 15. Life Cycle Heterogeneity Regression Results**
| VARIABLES   | (1) Growth Stage | (2) Maturity Stage | (3) Decline Stage |
| did         | 0.023***         | -0.000             | -0.021            |
|             | (5.22)           | (-0.10)            | (-1.21)           |
| lev         | -0.029***        | -0.008             | -0.026            |
|             | (-2.91)          | (-0.87)            | (-0.45)           |
| ato         | 0.009*           | 0.001              | 0.011             |
|             | (1.78)           | (0.27)             | (0.35)            |
| cashflow    | 0.055***         | 0.022              | -0.015            |
|             | (2.81)           | (1.30)             | (-0.26)           |
| inv         | 0.026            | 0.025              | -0.007            |
|             | (1.15)           | (1.57)             | (-0.09)           |
| growth      | -0.003           | 0.004              | 0.006             |
|             | (-1.19)          | (1.34)             | (0.21)            |
| board       | -0.020*          | 0.009              | 0.014             |
|             | (-1.66)          | (0.89)             | (0.22)            |
| indep       | -0.000           | -0.000             | 0.002             |
|             | (-1.33)          | (-0.09)            | (1.01)            |
| firmage     | 0.004            | -0.029*            | -0.178            |
|             | (0.29)           | (-1.70)            | (-0.76)           |
| Constant    | 0.132**          | 0.159***           | 0.576             |
|             | (2.54)           | (2.67)             | (0.75)            |
| Observations| 5,059            | 5,792              | 319               |
| R-squared   | 0.724            | 0.722              | 0.859             |


### 5. Regional Heterogeneity
China’s eastern, central, and western regions differ in market development, industrial structure, and regulatory enforcement.  

- Eastern region: `did` significantly positive at 5%, indicating strong policy effectiveness.  
- Central and western regions: coefficients positive but insignificant.  

Thus, **policy effects concentrate in the eastern region**, where market mechanisms, institutions, and resources allow firms to better translate financial support into green actions.  

**Table 16. Geographic Heterogeneity Regression Results**  
| VARIABLES   | (1) Western Region | (2) Central Region | (3) Eastern Region |
| did         | 0.011              | 0.017              | 0.007**            |
|             | (1.34)             | (1.58)             | (2.25)             |
| lev         | -0.025             | -0.007             | -0.020***          |
|             | (-1.61)            | (-0.48)            | (-2.89)            |
| ato         | 0.014              | -0.004             | 0.009**            |
|             | (1.52)             | (-0.56)            | (2.32)             |
| cashflow    | 0.052              | 0.041              | 0.026*             |
|             | (1.55)             | (1.42)             | (1.95)             |
| inv         | 0.090***           | -0.068**           | 0.031**            |
|             | (2.69)             | (-2.06)            | (2.29)             |
| growth      | -0.002             | 0.000              | -0.001             |
|             | (-0.55)            | (0.05)             | (-0.57)            |
| board       | 0.086***           | -0.003             | -0.012             |
|             | (3.97)             | (-0.15)            | (-1.48)            |
| indep       | 0.001**            | -0.001             | -0.000             |
|             | (2.43)             | (-1.12)            | (-0.19)            |
| firmage     | 0.044              | 0.011              | 0.004              |
|             | (1.45)             | (0.45)             | (0.45)             |
| Constant    | -0.277***          | 0.102              | 0.099***           |
|             | (-2.60)            | (1.14)             | (2.65)             |
| Observations| 1,392              | 1,999              | 8,518              |
| R-squared   | 0.718              | 0.655              | 0.686              |



## 🔗 Mechanism Analysis

### 1. Mediation Effect: R&D Investment

The previous regressions confirm that the GFRIPZ policy significantly promotes corporate green transformation. This section explores **how** the policy works by testing two channels: (i) a **mediating effect** through R&D investment, and (ii) **moderating effects** of digitalization and financing constraints.  

According to Hypothesis H2, green finance alleviates financing pressure and guides resources into innovation, thereby increasing R&D investment and enhancing green transformation. Following the three-step procedure, we test whether R&D investment (`lnrd`) serves as a mediator.  

- **Step 1 (total effect):** Column (1) shows `did` is positive and significant at the 1% level, consistent with baseline results.  
- **Step 2 (policy → mediator):** Column (2) shows `did` significantly increases R&D investment (`lnrd`), with a coefficient of 0.372 (5% level).  
- **Step 3 (policy + mediator):** Column (3) shows `lnrd` is positive and significant at the 1% level. Meanwhile, the coefficient of `did` falls to insignificance.  

These results confirm a **full mediation effect**: the policy promotes green transformation primarily by stimulating R&D investment.  

**Table 17. Mediation Analysis: R&D Investment** 
| VARIABLES   | (1) index | (2) lnrd | (3) index |
| lnrd        |           |          | 0.001***  |
|             |           |          | (2.82)    |
| did         | 0.007***  | 0.372**  | 0.007     |
|             | (2.60)    | (1.96)   | (1.61)    |
| lev         | -0.019*** | -0.550   | -0.019**  |
|             | (-3.25)   | (-1.36)  | (-2.45)   |
| ato         | 0.006**   | 0.422*   | 0.006     |
|             | (2.06)    | (1.88)   | (1.43)    |
| cashflow    | 0.031***  | 0.633    | 0.032***  |
|             | (2.71)    | (0.79)   | (2.77)    |
| inv         | 0.024**   | -2.629***| 0.026     |
|             | (2.06)    | (-3.26)  | (1.57)    |
| growth      | -0.001    | 0.171    | -0.001    |
|             | (-0.47)   | (1.43)   | (-0.51)   |
| board       | 0.001     | 0.004    | 0.000     |
|             | (0.12)    | (0.01)   | (0.04)    |
| indep       | 0.000     | -0.019   | 0.000     |
|             | (0.35)    | (-1.24)  | (0.26)    |
| firmage     | 0.008     | -5.492***| 0.012     |
|             | (0.92)    | (-9.15)  | (0.85)    |
| Constant    | 0.060*    | 32.254***| 0.038     |
|             | (1.85)    | (14.40)  | (0.77)    |
| Observations| 11,909    | 11,909   | 11,909    |
| R-squared   | 0.683     | 0.766    | 0.684     |

### 2. Moderation Effect: Digitalization and Financing Constraints  

We next examine whether firm characteristics affect the strength of the policy impact, focusing on **digitalization** and **financing constraints**.  

#### (a) Digitalization
Hypothesis H3 posits that digitalization may alter firms’ responsiveness. Results in Table 18 show the interaction term (`did × digi1`) is significantly negative at the 5% level.  

- Interpretation: Higher digitalization weakens the marginal impact of green finance, since highly digital firms already enjoy better transparency, efficiency, and financing access.  
- Conclusion: Digitalization plays a **negative moderating role**. The policy is most effective for firms with low digitalization.  

**Table 18. Moderation Analysis: Digitalization**  

| VARIABLES     | (1) index | (2) index |
| did           | 0.007***  | 0.013***  |
|               | (2.60)    | (3.36)    |
| digi1         |           | 0.003***  |
|               |           | (2.88)    |
| c.did#c.digi1 |           | -0.003**  |
|               |           | (-2.25)   |
| lev           | -0.019*** | -0.019*** |
|               | (-3.25)   | (-3.25)   |
| ato           | 0.006**   | 0.007**   |
|               | (2.06)    | (2.13)    |
| cashflow      | 0.031***  | 0.031***  |
|               | (2.71)    | (2.70)    |
| inv           | 0.024**   | 0.024**   |
|               | (2.06)    | (2.09)    |
| growth        | -0.001    | -0.001    |
|               | (-0.47)   | (-0.58)   |
| board         | 0.001     | -0.000    |
|               | (0.12)    | (-0.02)   |
| indep         | 0.000     | 0.000     |
|               | (0.35)    | (0.37)    |
| firmage       | 0.008     | 0.008     |
|               | (0.92)    | (0.90)    |
| Constant      | 0.060*    | 0.059*    |
|               | (1.85)    | (1.80)    |
| Observations  | 11,909    | 11,909    |
| R-squared     | 0.683     | 0.684     |

#### (b) Financing Constraints
Hypothesis H4 suggests that financing constraints enhance the marginal benefit of green finance. Using the SA index as a proxy, results in Table 19 show the interaction term (`did × sa`) is significantly positive at the 1% level.  

- Interpretation: For firms facing stronger financing constraints, the policy has a larger effect in facilitating green transformation.  
- Conclusion: Financing constraints serve as a **positive moderator**, magnifying the policy’s impact where firms most need external support.  

**Table 19. Moderation Analysis: Financing Constraints**  
| VARIABLES     | (1) index | (2) index |
| did           | 0.007***  | 0.090***  |
|               | (2.60)    | (3.09)    |
| sa            |           | 0.067***  |
|               |           | (7.08)    |
| c.did#c.sa    |           | 0.021***  |
|               |           | (2.90)    |
| lev           | -0.019*** | -0.018*** |
|               | (-3.25)   | (-3.12)   |
| ato           | 0.006**   | 0.006*    |
|               | (2.06)    | (1.78)    |
| cashflow      | 0.031***  | 0.030***  |
|               | (2.71)    | (2.61)    |
| inv           | 0.024**   | 0.027**   |
|               | (2.06)    | (2.32)    |
| growth        | -0.001    | 0.000     |
|               | (-0.47)   | (0.01)    |
| board         | 0.001     | 0.002     |
|               | (0.12)    | (0.33)    |
| indep         | 0.000     | 0.000     |
|               | (0.35)    | (0.32)    |
| firmage       | 0.008     | 0.003     |
|               | (0.92)    | (0.37)    |
| Constant      | 0.060*    | 0.327***  |
|               | (1.85)    | (6.99)    |
| Observations  | 11,909    | 11,909    |
| R-squared     | 0.683     | 0.686     |

### 3. Summary of Mechanism  

The mechanism analysis highlights two key findings:  
1. **R&D investment fully mediates** the policy’s effect, providing a clear transmission channel.  
2. **Digitalization weakens** the policy effect, while **financing constraints strengthen** it.  

