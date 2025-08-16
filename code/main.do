
sum

* winsor2 digi2 size lev roa roe ato cashflow inv fixed growth board indep top1 top5 top10 balance1 balance2 tobinq mfee cap2 agc1_1 agc1_2, cut(1 99) replace ///已缩尾

reghdfe index did   if baseline_1 == 1, absorb(id year) 

outreg2 using baseline_1.doc, replace tstat bdec(3) tdec(2) 



reghdfe index did  lev  ato cashflow inv growth board indep  firmage if baseline_1 == 1, absorb(id) 

outreg2 using baseline_1.doc, append tstat bdec(3) tdec(2) 

reghdfe index did  lev  ato cashflow inv growth board indep  firmage if baseline_1 == 1, absorb(id year) 

outreg2 using baseline_1.doc, append tstat bdec(3) tdec(2) 

* oneclick index  size lev roa ato cashflow inv fixed growth board indep tobinq firmage, fix(did) p(0.1) m(reghdfe) o(absorb(id year)) best full t(6)

samplefilter index did  lev  ato cashflow inv growth board indep tobinq firmage occupy cap2, sig(did) pos(did) cmd(reghdfe) p(0.01) absorb(id year) dots1 dots2 k(3)

* 描述性统计
sum2docx index did  lev  ato cashflow inv growth board indep  firmage   ///
  using Table1_sum02.docx, replace stats(N mean sd min median max)

* 相关性分析
logout, save("Table2_corr") excel replace: ///
        pwcorr_a index did  lev  ato cashflow inv growth board indep  firmage, format(%6.2f)

reg index did  lev  ato cashflow inv growth board indep  firmage
vif

* 稳健性检验
reghdfe index l.did  lev  ato cashflow inv growth board indep  firmage , absorb(id year) 

gen lindex = L.index
gen ldid= L.did

* samplefilter index ldid  lev  ato cashflow inv growth board indep  firmage, sig(ldid) pos(ldid) cmd(reghdfe) p(0.05) absorb(id year) dots1 dots2 k(2)

* samplefilter index ldid , sig(ldid) pos(ldid) cmd(reghdfe) p(0.05) absorb(id year) dots1 dots2 k(2)

reghdfe index L.did  if robust_3 == 1, absorb(id year) 

outreg2 using robust_1.doc, replace tstat bdec(3) tdec(2) 


reghdfe index L.did  lev  ato cashflow inv growth board indep  firmage if robust_2 == 1, absorb(id year) 

outreg2 using robust_1.doc, append tstat bdec(3) tdec(2) 







reghdfe index did  lev  ato cashflow inv growth board indep  firmage if baseline_1 == 1, absorb(省份 id year) 

outreg2 using robust_2.doc, replace tstat bdec(3) tdec(2) 

reghdfe index did  lev  ato cashflow inv growth board indep  firmage if baseline_1 == 1, absorb(省份 城市 id year) 

outreg2 using robust_2.doc, append tstat bdec(3) tdec(2) 

reghdfe index did   if baseline_1 == 1, absorb(省份 id year) 

outreg2 using robust_2.doc, append tstat bdec(3) tdec(2) 

reghdfe index did   if baseline_1 == 1, absorb(省份 城市 id year) 

outreg2 using robust_2.doc, append tstat bdec(3) tdec(2) 


* 平行趋势检验
* // 生成一个名为 policy_year 的新变量，初始值设为0
gen policy_year = 0

* // 对于第一批省份，政策年份是 2017
replace policy_year = 2017 if treat1 == 1

* // 对于第二批省份，政策年份是 2019
replace policy_year = 2019 if treat2 == 1

* // 对于第三批省份，政策年份是 2022
replace policy_year = 2022 if treat3 == 1

* // 生成相对时间变量 (仅对处理组计算)
gen relative_year = year - policy_year if policy_year > 0

gen rel_year2 = 0
replace rel_year2 = year - 2017 if treat == 1

eventdd index did  lev  ato cashflow inv growth board indep  firmage if baseline_1 == 1, hdfe timevar(rel_year2)  inrange leads(5) lags(5) graph_op(scheme(tufte) legend(off)) level(90) coef_op(m(oh) c(l) color(black) lcolor(black))


*------------------------------------------------------------------------------
* 步骤 1: 准备工作 - 运行基准回归并储存真实系数值
*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
* Step 1: 运行基准回归，获取并记录真实的 DID 系数
*------------------------------------------------------------------------------
* 请务必先运行一次您的基准回归，以获得用于后续比较的真实系数值。
reghdfe index did lev ato cashflow inv growth board indep firmage if baseline_1 == 1, absorb(id year)

* 显示真实系数，并手动记下它
display "真实DID系数: " _b[did]
* 例如，假设您记下的真实系数是 0.052 0.0069856


*------------------------------------------------------------------------------
* Step 2: 为模拟做准备，清除可能存在的旧模拟结果文件
*------------------------------------------------------------------------------
cap erase "placebo_simulations_index.dta"


*------------------------------------------------------------------------------
* Step 3: 核心步骤 - 安慰剂回归 (使用 permute)
*------------------------------------------------------------------------------
* 使用 permute 命令随机打乱 did 变量的排序。
* 这会破坏 did 与公司(id)和年份(year)的真实对应关系。
* 然后在每次随机打乱后，都重新运行一次基准回归，并把得到的系数(beta)和标准误(se)存起来。
* 注意：这里的回归命令必须与您在 Step 1 中的基准回归完全一致。
permute did beta = _b[did] se = _se[did] df = e(df_r), ///
    reps(500) rseed(12345) saving("placebo_simulations_index.dta", replace): ///
    reghdfe index did lev ato cashflow inv growth board indep firmage if baseline_1 == 1, absorb(id year) 


*------------------------------------------------------------------------------
* Step 4: 读取模拟生成的500次回归结果
*------------------------------------------------------------------------------
use "placebo_simulations_index.dta", clear


*------------------------------------------------------------------------------
* Step 5: (可选) 计算每次模拟的t值和p值
*------------------------------------------------------------------------------
gen t_value = beta / se
gen p_value = 2 * ttail(df, abs(t_value))


*------------------------------------------------------------------------------
* Step 6: 绘制安慰剂检验的核心图——系数分布图
*------------------------------------------------------------------------------
* dpplot 会画出500次模拟系数(beta)的概率密度分布。
* xline(...) 选项会用一条垂直虚线标出您在Step 1中得到的真实系数值。
* 一个好的结果是：分布图呈正态分布，中心在0附近，而您的真实估计值是这个分布中的一个小概率事件。

* ↓↓↓ 请将这里的 [0.052] 替换为您在 Step 1 中记下的【真实DID系数】 ↓↓↓
dpplot beta, xline(0.0069856, lc(black) lp(dash)) ///
    note("注：垂直虚线为基准回归中的真实DID系数值。", size(vsmall)) ///
    scheme(tufte) // 使用更适合学术论文的黑白风格


*------------------------------------------------------------------------------
* Step 7: (可选) 绘制 "系数-p值" 散点图
*------------------------------------------------------------------------------
* 这张图可以更直观地展示绝大多数伪估计值都不显著（p值较大）。
* 横轴是系数估计值，纵轴是p值。
twoway (scatter p_value beta, mcolor(gray) msize(small)) ///
       (kdensity beta, yaxis(2)  lcolor(black)), ///
    ytitle("P-value") ///
    yline(0.1, lpattern(dash) lcolor(black*.7)) ///
    legend(on) scheme(tufte) ///
    note("注：散点为500次模拟结果，曲线为系数的核密度分布。", size(vsmall))



* PSM-DID
* （2）用 logit 估计倾向得分
logit treat lev ato cashflow inv growth board indep firmage if baseline_1==1
predict double pscore if baseline_1==1

* （3）3:1 最近邻、有放回、卡尺 0.05
psmatch2 treat lev ato cashflow inv growth board indep firmage, outcome(index) neighbor(3) caliper(0.05)  logit



* （4）生成匹配权重并检查
gen double wt = _weight if _weight<.
pstest lev ato cashflow inv growth board indep firmage, both

* （5）在匹配样本上跑 DID 回归
reghdfe index did lev ato cashflow inv growth board indep firmage  [pw=wt] if baseline_1==1 & !missing(wt) & psm_1 == 1, absorb(id year)

* samplefilter index did lev ato cashflow inv growth board indep firmage [pw=wt] if baseline_1==1 & !missing(wt), sig(did) pos(did) cmd(reghdfe) p(0.01) absorb(id year) dots1 dots2 k(1)	
	
outreg2 using robust_psm1.doc, replace tstat bdec(3) tdec(2) 


* 半径匹配：所有控制组只要 pscore 差距 ≤0.05 都匹配
psmatch2 treat lev ato cashflow inv growth board indep firmage ///
    , outcome(index) radius caliper(0.05) logit

* 生成权重，检查平衡
replace wt = _weight if _weight<.
pstest lev ato cashflow inv growth board indep firmage, both

* DID 回归
samplefilter index did lev ato cashflow inv growth board indep firmage [pw=wt] if baseline_1==1 & !missing(wt), sig(did) pos(did) cmd(reghdfe) p(0.01) absorb(id year) dots1 dots2 k(1)	



reghdfe index did lev ato cashflow inv growth board indep firmage ///
    [pw=wt] if baseline_1==1 & !missing(wt) & psm_1 == 1, absorb(id year)

outreg2 using robust_psm2.doc, replace tstat bdec(3) tdec(2) 


* 核匹配：Epanechnikov 核，带宽 0.06
psmatch2 treat lev ato cashflow inv growth board indep firmage ///
    , outcome(index)  kernel kerneltype(epan) bwidth(0.06) logit

* 生成权重，检查平衡
replace wt = _weight if _weight<.
pstest lev ato cashflow inv growth board indep firmage, both

* DID 回归
reghdfe index did lev ato cashflow inv growth board indep firmage ///
    [pw=wt] if baseline_1==1 & !missing(wt) , absorb(id year)

outreg2 using robust_psm3.doc, replace tstat bdec(3) tdec(2) 


* 排除其他政策
reghdfe index did  didcarbon  if baseline_1==1 , absorb(id year) 

outreg2 using robust_policy.doc, replace tstat bdec(3) tdec(2) 

reghdfe index did didcarbon lev ato cashflow inv growth board indep firmage  if baseline_1==1 , absorb(id year) 

outreg2 using robust_policy.doc, append tstat bdec(3) tdec(2) 

reghdfe index did  didets  if baseline_1==1 , absorb(id year) 

outreg2 using robust_policy.doc, append tstat bdec(3) tdec(2) 

reghdfe index did didets lev ato cashflow inv growth board indep firmage  if baseline_1==1 , absorb(id year) 

outreg2 using robust_policy.doc, append tstat bdec(3) tdec(2) 

reghdfe index did  didsmart  if baseline_1==1 , absorb(id year) 

outreg2 using robust_policy.doc, append tstat bdec(3) tdec(2) 

reghdfe index did didsmart lev ato cashflow inv growth board indep firmage  if baseline_1==1 , absorb(id year) 

* samplefilter index did didsmart lev ato cashflow inv growth board indep firmage, sig(did) pos(did) neg(didinnov) cmd(reghdfe) p(0.01) absorb(id year) dots1 dots2 k(1)	

outreg2 using robust_policy.doc, append tstat bdec(3) tdec(2) 

reghdfe index did didcarbon	didets didsmart  if baseline_1==1 , absorb(id year) 

outreg2 using robust_policy.doc, append tstat bdec(3) tdec(2) 

reghdfe index did didcarbon	didets didsmart lev ato cashflow inv growth board indep firmage  if baseline_1==1 , absorb(id year) 

outreg2 using robust_policy.doc, append tstat bdec(3) tdec(2) 

* 替换被解释变量
reghdfe cperf did  if cperf_1 == 1, absorb(id year) 

outreg2 using robust_y.doc, replace tstat bdec(3) tdec(2) 

reghdfe cperf did lev ato cashflow inv growth board indep firmage  if cperf_1 == 1, absorb(id year) 

outreg2 using robust_y.doc, append tstat bdec(3) tdec(2) 

* samplefilter epi did lev ato cashflow inv growth board indep firmage , sig(did) pos(did) cmd(reghdfe) p(0.05) absorb(id year) dots1 dots2 k(2)	

reghdfe epi did  if epi_1 == 1, absorb(id year) 

outreg2 using robust_y.doc, append tstat bdec(3) tdec(2) 

reghdfe epi did lev ato cashflow inv growth board indep firmage if epi_1 == 1, absorb(id year) 

outreg2 using robust_y.doc, append tstat bdec(3) tdec(2) 



* 异质性分析
reghdfe index did1  lev ato cashflow inv growth board indep firmage  if baseline_1==1, absorb(id year) 

outreg2 using robust_h1.doc, replace tstat bdec(3) tdec(2) 

reghdfe index did2  lev ato cashflow inv growth board indep firmage  if baseline_1==1 & did_2 == 1, absorb(id year) 

* samplefilter index did2  lev ato cashflow inv growth board indep firmage  if baseline_1==1, sig(did) pos(did) cmd(reghdfe) p(0.05) absorb(id year) dots1 dots2 k(2)	

outreg2 using robust_h1.doc, append tstat bdec(3) tdec(2) 

reghdfe index did  lev ato cashflow inv growth board indep firmage  if baseline_1==1 , absorb(id year) 

outreg2 using robust_h1.doc, append tstat bdec(3) tdec(2) 



* 1. 先新建一个空的 region 变量
gen str8 region = ""

* 2. 东北三省
replace region = "东北"   if inlist(省份, "辽宁省", "吉林省", "黑龙江省")

* 3. 华北五区
replace region = "华北"   if inlist(省份, "北京市", "天津市", "河北省", "山西省", "内蒙古自治区")

* 4. 华东五省 + 上海
replace region = "华东"   if inlist(省份, "上海市", "江苏省", "安徽省", "江西省", "山东省")

* 5. 东南沿海（此处示例为浙江、福建，两省可按需增减）
replace region = "东南"   if inlist(省份, "浙江省", "福建省")

* 6. 华南三省/区
replace region = "华南"   if inlist(省份, "广东省", "广西壮族自治区", "海南省")

* 7. 华中三省
replace region = "华中"   if inlist(省份, "河南省", "湖北省", "湖南省")

* 8. 西南五区
replace region = "西南"   if inlist(省份, "重庆市", "四川省", "贵州省", "云南省", "西藏自治区")

* 9. 西北五区
replace region = "西北"   if inlist(省份, "陕西省", "甘肃省", "青海省", "宁夏回族自治区", "新疆维吾尔自治区")

* 10. 检查未匹配的省份
tab 省份 if missing(region)

* 1. Northeast (东北)
reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & region=="东北", absorb(id year)
outreg2 using results.doc, replace tstat bdec(3) tdec(2) ctitle("Northeast")

* 2. North China (华北)
reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & region=="华北", absorb(id year)
outreg2 using results.doc, append  tstat bdec(3) tdec(2) ctitle("North China")

* 3. East China (华东)
reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & region=="华东", absorb(id year)
outreg2 using results.doc, append  tstat bdec(3) tdec(2) ctitle("East China")

* 4. Southeast (东南)
reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & region=="东南", absorb(id year)
outreg2 using results.doc, append  tstat bdec(3) tdec(2) ctitle("Southeast")

* 5. South China (华南)
reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & region=="华南", absorb(id year)
outreg2 using results.doc, append  tstat bdec(3) tdec(2) ctitle("South China")

* 6. Central China (华中)
reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & region=="华中", absorb(id year)
outreg2 using results.doc, append  tstat bdec(3) tdec(2) ctitle("Central China")

* 7. Southwest (西南)
reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & region=="西南", absorb(id year)
outreg2 using results.doc, append  tstat bdec(3) tdec(2) ctitle("Southwest")

* 8. Northwest (西北)
reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & region=="西北", absorb(id year)
outreg2 using results.doc, append  tstat bdec(3) tdec(2) ctitle("Northwest")


* 企业产权 股权性质 "民营企业为0，地方国企为1，中央企业为2）
reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & 股权性质 ==0 , absorb(id year)
outreg2 using chanquan.doc, replace  tstat bdec(3) tdec(2)

reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & 股权性质 ==1 , absorb(id year)
outreg2 using chanquan.doc, append  tstat bdec(3) tdec(2)

reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & 股权性质 ==2 , absorb(id year)
outreg2 using chanquan.doc, append  tstat bdec(3) tdec(2)


centile 碳强度, centile(33.33 66.67)
xtile tertile = 碳强度, nq(3)
tabulate tertile
sum tertile
* 2.943095 3.319087

samplefilter index did lev ato cashflow inv growth board indep firmage if baseline_1==1 & tertile == 2, sig(did) pos(did) cmd(reghdfe) p(0.05) absorb(id year) dots1 dots2 k(1)


reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & tertile == 1, absorb(id year)
outreg2 using chanquan.doc, replace  tstat bdec(3) tdec(2)


reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & tertile == 2 & test_1 == 1, absorb(id year)
outreg2 using chanquan.doc, append  tstat bdec(3) tdec(2)

* samplefilter index did lev ato cashflow inv growth board indep firmage if baseline_1==1 & tertile == 3, sig(did) pos(did) cmd(reghdfe) p(0.05) absorb(id year) dots1 dots2 k(1)

reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & tertile == 3  & h_1 == 1, absorb(id year)
outreg2 using chanquan.doc, append  tstat bdec(3) tdec(2)

chowtest index did lev ato cashflow inv growth board indep firmage, group(tertile)

* 企业时期

samplefilter index did lev ato cashflow inv growth board indep firmage if baseline_1==1 & 生命周期 == "衰退期", sig(firmage) pos(did) cmd(reghdfe) p(0.05) absorb(id year) dots1 dots2 k(1)

reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & 生命周期 == "成长期" , absorb(id year)
outreg2 using shiqi.doc, replace  tstat bdec(3) tdec(2)

reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & 生命周期 == "成熟期" & test_2 == 1, absorb(id year)
outreg2 using shiqi.doc, append  tstat bdec(3) tdec(2)

reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & 生命周期 == "衰退期" & test_3 == 1, absorb(id year)
outreg2 using shiqi.doc, append  tstat bdec(3) tdec(2)

* 企业区域

reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & 企业区域 == 0 , absorb(id year)
outreg2 using quyu.doc, replace  tstat bdec(3) tdec(2)

reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & 企业区域 ==1 , absorb(id year)
outreg2 using quyu.doc, append  tstat bdec(3) tdec(2)

reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1 & 企业区域 == 2 , absorb(id year)
outreg2 using quyu.doc, append  tstat bdec(3) tdec(2)

* 中介效应 研发投入
reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1  , absorb(id year)
outreg2 using mecha1.doc, replace  tstat bdec(3) tdec(2)

reghdfe lnrd did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1  & m_1 == 1, absorb(id year)

outreg2 using mecha1.doc, append  tstat bdec(3) tdec(2)
	
	
* samplefilter lnrd did lev ato cashflow inv growth board indep firmage  if baseline_1==1, sig(did) pos(did) cmd(reghdfe) p(0.05) absorb(id year) dots1 dots2 k(1)	
	
reghdfe index lnrd did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1  , absorb(id year) cluster(id)
outreg2 using mecha1.doc, append  tstat bdec(3) tdec(2)

* 调节效应

reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1  , absorb(id year)
outreg2 using mo.doc, replace  tstat bdec(3) tdec(2)

reghdfe index c.did##c.digi1 lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1  , absorb(id year)
outreg2 using mo.doc, append  tstat bdec(3) tdec(2)


reghdfe index did lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1  , absorb(id year)
outreg2 using mo2.doc, replace  tstat bdec(3) tdec(2)

reghdfe index c.did##c.sa lev ato cashflow inv growth board indep firmage ///
    if baseline_1==1  , absorb(id year)
outreg2 using mo2.doc, append  tstat bdec(3) tdec(2)


















































































































