Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB3A47EAB32
	for <lists+linux-sh@lfdr.de>; Tue, 14 Nov 2023 09:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbjKNIBB (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 14 Nov 2023 03:01:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232298AbjKNIBA (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 14 Nov 2023 03:01:00 -0500
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CE59919B
        for <linux-sh@vger.kernel.org>; Tue, 14 Nov 2023 00:00:56 -0800 (PST)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
        by sakura.ysato.name (Postfix) with ESMTPSA id 5D2351C04FB;
        Tue, 14 Nov 2023 17:00:56 +0900 (JST)
From:   Yoshinori Sato <ysato@users.sourceforge.jp>
To:     linux-sh@vger.kernel.org
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 15/37] clk: Compatible with narrow registers
Date:   Tue, 14 Nov 2023 17:00:06 +0900
Message-Id: <5fb31a1370d34bb8a3a1a881fbbb1d2f80483734.1699856600.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1699856600.git.ysato@users.sourceforge.jp>
References: <cover.1699856600.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

divider and gate only support 32-bit registers.
Older hardware uses narrower registers, so I want to be able to handle
8-bit and 16-bit wide registers.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 drivers/clk/clk-divider.c    | 56 ++++++++++++++++++++++++------------
 drivers/clk/clk-gate.c       | 56 +++++++++++++++++++++++++++---------
 include/linux/clk-provider.h | 22 ++++++++++----
 3 files changed, 97 insertions(+), 37 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index a2c2b5203b0a..a1b5187cd63d 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -26,20 +26,38 @@
  * parent - fixed parent.  No clk_set_parent support
  */
 
-static inline u32 clk_div_readl(struct clk_divider *divider)
-{
-	if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
-		return ioread32be(divider->reg);
-
-	return readl(divider->reg);
+static inline u32 clk_div_read(struct clk_divider *divider)
+{
+	if (divider->flags & CLK_DIVIDER_REG_8BIT)
+		return readb(divider->reg);
+	else if (divider->flags & CLK_DIVIDER_REG_16BIT) {
+		if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
+			return ioread16be(divider->reg);
+		else
+			return readw(divider->reg);
+	} else {
+		if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
+			return ioread32be(divider->reg);
+		else
+			return readl(divider->reg);
+	}
 }
 
-static inline void clk_div_writel(struct clk_divider *divider, u32 val)
+static inline void clk_div_write(struct clk_divider *divider, u32 val)
 {
-	if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
-		iowrite32be(val, divider->reg);
-	else
-		writel(val, divider->reg);
+	if (divider->flags & CLK_DIVIDER_REG_8BIT)
+		writeb(val, divider->reg);
+	else if (divider->flags & CLK_DIVIDER_REG_16BIT) {
+		if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
+			iowrite16be(val, divider->reg);
+		else
+			writew(val, divider->reg);
+	} else {
+		if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
+			iowrite32be(val, divider->reg);
+		else
+			writel(val, divider->reg);
+	}
 }
 
 static unsigned int _get_table_maxdiv(const struct clk_div_table *table,
@@ -152,7 +170,7 @@ static unsigned long clk_divider_recalc_rate(struct clk_hw *hw,
 	struct clk_divider *divider = to_clk_divider(hw);
 	unsigned int val;
 
-	val = clk_div_readl(divider) >> divider->shift;
+	val = clk_div_read(divider) >> divider->shift;
 	val &= clk_div_mask(divider->width);
 
 	return divider_recalc_rate(hw, parent_rate, val, divider->table,
@@ -434,7 +452,7 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
 		u32 val;
 
-		val = clk_div_readl(divider) >> divider->shift;
+		val = clk_div_read(divider) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
 		return divider_ro_round_rate(hw, rate, prate, divider->table,
@@ -455,7 +473,7 @@ static int clk_divider_determine_rate(struct clk_hw *hw,
 	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
 		u32 val;
 
-		val = clk_div_readl(divider) >> divider->shift;
+		val = clk_div_read(divider) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
 		return divider_ro_determine_rate(hw, req, divider->table,
@@ -505,11 +523,11 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
 		val = clk_div_mask(divider->width) << (divider->shift + 16);
 	} else {
-		val = clk_div_readl(divider);
+		val = clk_div_read(divider);
 		val &= ~(clk_div_mask(divider->width) << divider->shift);
 	}
 	val |= (u32)value << divider->shift;
-	clk_div_writel(divider, val);
+	clk_div_write(divider, val);
 
 	if (divider->lock)
 		spin_unlock_irqrestore(divider->lock, flags);
@@ -538,7 +556,7 @@ struct clk_hw *__clk_hw_register_divider(struct device *dev,
 		struct device_node *np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
-		void __iomem *reg, u8 shift, u8 width, u8 clk_divider_flags,
+		void __iomem *reg, u8 shift, u8 width, u32 clk_divider_flags,
 		const struct clk_div_table *table, spinlock_t *lock)
 {
 	struct clk_divider *div;
@@ -610,7 +628,7 @@ EXPORT_SYMBOL_GPL(__clk_hw_register_divider);
 struct clk *clk_register_divider_table(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		void __iomem *reg, u8 shift, u8 width,
-		u8 clk_divider_flags, const struct clk_div_table *table,
+		u32 clk_divider_flags, const struct clk_div_table *table,
 		spinlock_t *lock)
 {
 	struct clk_hw *hw;
@@ -664,7 +682,7 @@ struct clk_hw *__devm_clk_hw_register_divider(struct device *dev,
 		struct device_node *np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
-		void __iomem *reg, u8 shift, u8 width, u8 clk_divider_flags,
+		void __iomem *reg, u8 shift, u8 width, u32 clk_divider_flags,
 		const struct clk_div_table *table, spinlock_t *lock)
 {
 	struct clk_hw **ptr, *hw;
diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 68e585a02fd9..8a7e97e8dc73 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -24,20 +24,38 @@
  * parent - fixed parent.  No clk_set_parent support
  */
 
-static inline u32 clk_gate_readl(struct clk_gate *gate)
+static inline u32 clk_gate_read(struct clk_gate *gate)
 {
-	if (gate->flags & CLK_GATE_BIG_ENDIAN)
-		return ioread32be(gate->reg);
-
-	return readl(gate->reg);
+	if (gate->flags & CLK_GATE_REG_8BIT)
+		return readb(gate->reg);
+	else if (gate->flags & CLK_GATE_REG_16BIT) {
+		if (gate->flags & CLK_GATE_BIG_ENDIAN)
+			return ioread16be(gate->reg);
+		else
+			return readw(gate->reg);
+	} else {
+		if (gate->flags & CLK_GATE_BIG_ENDIAN)
+			return ioread32be(gate->reg);
+		else
+			return readl(gate->reg);
+	}
 }
 
-static inline void clk_gate_writel(struct clk_gate *gate, u32 val)
+static inline void clk_gate_write(struct clk_gate *gate, u32 val)
 {
-	if (gate->flags & CLK_GATE_BIG_ENDIAN)
-		iowrite32be(val, gate->reg);
-	else
-		writel(val, gate->reg);
+	if (gate->flags & CLK_GATE_REG_8BIT)
+		writeb(val, gate->reg);
+	else if (gate->flags & CLK_GATE_REG_16BIT) {
+		if (gate->flags & CLK_GATE_BIG_ENDIAN)
+			iowrite16be(val, gate->reg);
+		else
+			writew(val, gate->reg);
+	} else {
+		if (gate->flags & CLK_GATE_BIG_ENDIAN)
+			iowrite32be(val, gate->reg);
+		else
+			writel(val, gate->reg);
+	}
 }
 
 /*
@@ -72,7 +90,7 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
 		if (set)
 			reg |= BIT(gate->bit_idx);
 	} else {
-		reg = clk_gate_readl(gate);
+		reg = clk_gate_read(gate);
 
 		if (set)
 			reg |= BIT(gate->bit_idx);
@@ -80,7 +98,7 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
 			reg &= ~BIT(gate->bit_idx);
 	}
 
-	clk_gate_writel(gate, reg);
+	clk_gate_write(gate, reg);
 
 	if (gate->lock)
 		spin_unlock_irqrestore(gate->lock, flags);
@@ -105,7 +123,7 @@ int clk_gate_is_enabled(struct clk_hw *hw)
 	u32 reg;
 	struct clk_gate *gate = to_clk_gate(hw);
 
-	reg = clk_gate_readl(gate);
+	reg = clk_gate_read(gate);
 
 	/* if a set bit disables this clk, flip it before masking */
 	if (gate->flags & CLK_GATE_SET_TO_DISABLE)
@@ -143,6 +161,18 @@ struct clk_hw *__clk_hw_register_gate(struct device *dev,
 			return ERR_PTR(-EINVAL);
 		}
 	}
+	if (clk_gate_flags & CLK_GATE_REG_16BIT) {
+		if (bit_idx > 15) {
+			pr_err("gate bit exceeds 16 bits\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+	if (clk_gate_flags & CLK_GATE_REG_8BIT) {
+		if (bit_idx > 7) {
+			pr_err("gate bit exceeds 8 bits\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
 
 	/* allocate the gate */
 	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index ace3a4ce2fc9..d9ae66caa3b7 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -508,12 +508,16 @@ void of_fixed_clk_setup(struct device_node *np);
  * CLK_GATE_BIG_ENDIAN - by default little endian register accesses are used for
  *	the gate register.  Setting this flag makes the register accesses big
  *	endian.
+ * CLK_GATE_REG_8BIT - by default 32bit register accesses are used for
+ *	the gate register.  Setting this flag makes the register accesses 8bit.
+ * CLK_GATE_REG_16BIT - by default 32bit register accesses are used for
+ *	the gate register.  Setting this flag makes the register accesses 16bit.
  */
 struct clk_gate {
 	struct clk_hw hw;
 	void __iomem	*reg;
 	u8		bit_idx;
-	u8		flags;
+	u32		flags;
 	spinlock_t	*lock;
 };
 
@@ -522,6 +526,8 @@ struct clk_gate {
 #define CLK_GATE_SET_TO_DISABLE		BIT(0)
 #define CLK_GATE_HIWORD_MASK		BIT(1)
 #define CLK_GATE_BIG_ENDIAN		BIT(2)
+#define CLK_GATE_REG_8BIT		BIT(3)
+#define CLK_GATE_REG_16BIT		BIT(4)
 
 extern const struct clk_ops clk_gate_ops;
 struct clk_hw *__clk_hw_register_gate(struct device *dev,
@@ -675,13 +681,17 @@ struct clk_div_table {
  * CLK_DIVIDER_BIG_ENDIAN - By default little endian register accesses are used
  *	for the divider register.  Setting this flag makes the register accesses
  *	big endian.
+ * CLK_DIVIDER_REG_8BIT - by default 32bit register accesses are used for
+ *	the gate register.  Setting this flag makes the register accesses 8bit.
+ * CLK_DIVIDER_REG_16BIT - by default 32bit register accesses are used for
+ *	the gate register.  Setting this flag makes the register accesses 16bit.
  */
 struct clk_divider {
 	struct clk_hw	hw;
 	void __iomem	*reg;
 	u8		shift;
 	u8		width;
-	u8		flags;
+	u32		flags;
 	const struct clk_div_table	*table;
 	spinlock_t	*lock;
 };
@@ -697,6 +707,8 @@ struct clk_divider {
 #define CLK_DIVIDER_READ_ONLY		BIT(5)
 #define CLK_DIVIDER_MAX_AT_ZERO		BIT(6)
 #define CLK_DIVIDER_BIG_ENDIAN		BIT(7)
+#define CLK_DIVIDER_REG_8BIT		BIT(8)
+#define CLK_DIVIDER_REG_16BIT		BIT(9)
 
 extern const struct clk_ops clk_divider_ops;
 extern const struct clk_ops clk_divider_ro_ops;
@@ -726,18 +738,18 @@ struct clk_hw *__clk_hw_register_divider(struct device *dev,
 		struct device_node *np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
-		void __iomem *reg, u8 shift, u8 width, u8 clk_divider_flags,
+		void __iomem *reg, u8 shift, u8 width, u32 clk_divider_flags,
 		const struct clk_div_table *table, spinlock_t *lock);
 struct clk_hw *__devm_clk_hw_register_divider(struct device *dev,
 		struct device_node *np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
 		const struct clk_parent_data *parent_data, unsigned long flags,
-		void __iomem *reg, u8 shift, u8 width, u8 clk_divider_flags,
+		void __iomem *reg, u8 shift, u8 width, u32 clk_divider_flags,
 		const struct clk_div_table *table, spinlock_t *lock);
 struct clk *clk_register_divider_table(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
 		void __iomem *reg, u8 shift, u8 width,
-		u8 clk_divider_flags, const struct clk_div_table *table,
+		u32 clk_divider_flags, const struct clk_div_table *table,
 		spinlock_t *lock);
 /**
  * clk_register_divider - register a divider clock with the clock framework
-- 
2.39.2

