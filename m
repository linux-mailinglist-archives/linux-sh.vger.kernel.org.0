Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384EB257A36
	for <lists+linux-sh@lfdr.de>; Mon, 31 Aug 2020 15:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbgHaNQ4 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 31 Aug 2020 09:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgHaNQp (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 31 Aug 2020 09:16:45 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F80C061573
        for <linux-sh@vger.kernel.org>; Mon, 31 Aug 2020 06:16:45 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y17so3458381lfa.8
        for <linux-sh@vger.kernel.org>; Mon, 31 Aug 2020 06:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UQoI1GeQhVK5+wMgW0TP/WghvzBAWuVFG8q6FGoAyEw=;
        b=mDVAQkQ4nwJalyxEi62enizY/JY4FUg76of5iT2j26oB8IYHKuIH0RQKSkJMimjeYj
         0S5G5EZYatzFkdiTnmlS8MwYw0MPgHU41vlt6+++tl0KCq/GGznPC/W9y65RmVXYTRc4
         VDICi+t+zpxh+MpHqK+4I7aEZCf7KqDyrTQ+6+7BKTcoMbTatXvzKZ3CiEA7TX+PsaAr
         hqaIH3zCSVXnfdWcPx7ZICi+56VMHe/BOromwtM+N268RTyEgRFZaQXWHIs5sxx8WWgd
         qP1cecE9ppABFVqGBmxsEW3AFkH96rRNsGH3nbtQTSRgtztLSZANcdoU34bj7OnSMIQf
         cKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UQoI1GeQhVK5+wMgW0TP/WghvzBAWuVFG8q6FGoAyEw=;
        b=c4QqaUGye2wlrKoVLeIOKx3p+OEnOgrjrlpBsfVhDM5cKNVNQDkvacvvZLTjhgrPTc
         PkyUR5SCRozATz6090UAtjxMR/h3brhqQCUNBuAEM6fkFDqIqj1PEUyyL/NEphH7wSW+
         c6hXgRaoLxA1bw05Cb36g0qXEHsAYMID7A2Wy87SLHUD6I47qvHDVVDfPPi5NAxxVJxL
         7/f9AKPXke11G5leL7pR3wOL2iSm/SPME1vtr9XRjU4sDVdu5VsF7T36EZhfY2qLSk+f
         PSxiHWE1JEIU3GJuYEL45ZFEcvCdJMy8GHzgyWbJE7qinnVAMgwlH6+Xor2Q6XiwC1jo
         h0kA==
X-Gm-Message-State: AOAM5304dANJPMApWEuhgDU/wmAtkNfNW404tMI/OTLGrgIvmSpzSupU
        QaeMJ7JA+mBwRw4ThNWQ/9FTFA==
X-Google-Smtp-Source: ABdhPJzVp5g4TmXGKFKys+cMStMUrOj5V3tjfDh8btgvQtHcZhUz4HTK0Qot13w8qV/lgiSFnoaSzA==
X-Received: by 2002:ac2:4253:: with SMTP id m19mr696212lfl.81.1598879803345;
        Mon, 31 Aug 2020 06:16:43 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-180-79.NA.cust.bahnhof.se. [98.128.180.79])
        by smtp.gmail.com with ESMTPSA id b16sm1570435ljk.24.2020.08.31.06.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 06:16:42 -0700 (PDT)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Rich Felker <dalias@libc.org>, Christoph Hellwig <hch@lst.de>
Cc:     Mark Brown <broonie@kernel.org>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: mmc_spi: Don't use dma mappings unless CONFIG_HAS_DMA is set
Date:   Mon, 31 Aug 2020 15:16:36 +0200
Message-Id: <20200831131636.51502-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

The commit cd57d07b1e4e ("sh: don't allow non-coherent DMA for NOMMU") made
CONFIG_NO_DMA to be set for some platforms, for good reasons.
Consequentially, CONFIG_HAS_DMA doesn't get set, which makes the DMA
mapping interface to be built as stub functions.

For weird reasons this causes the mmc_spi driver to fail to ->probe(), as
it relies on the dma mappings APIs, no matter of CONFIG_HAS_DMA is set or
not. This is wrong, so let's fix this.

Fixes: cd57d07b1e4e ("sh: don't allow non-coherent DMA for NOMMU")
Reported-by: Rich Felker <dalias@libc.org>
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/mmc_spi.c | 86 +++++++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 34 deletions(-)

diff --git a/drivers/mmc/host/mmc_spi.c b/drivers/mmc/host/mmc_spi.c
index 39bb1e30c2d7..5055a7eb134a 100644
--- a/drivers/mmc/host/mmc_spi.c
+++ b/drivers/mmc/host/mmc_spi.c
@@ -1278,6 +1278,52 @@ mmc_spi_detect_irq(int irq, void *mmc)
 	return IRQ_HANDLED;
 }
 
+#ifdef CONFIG_HAS_DMA
+static int mmc_spi_dma_alloc(struct mmc_spi_host *host)
+{
+	struct spi_device *spi = host->spi;
+	struct device *dev;
+
+	if (!spi->master->dev.parent->dma_mask)
+		return 0;
+
+	dev = spi->master->dev.parent;
+
+	host->ones_dma = dma_map_single(dev, host->ones, MMC_SPI_BLOCKSIZE,
+					DMA_TO_DEVICE);
+	if (dma_mapping_error(dev, host->ones_dma))
+		return -ENOMEM;
+
+	host->data_dma = dma_map_single(dev, host->data, sizeof(*host->data),
+					DMA_BIDIRECTIONAL);
+	if (dma_mapping_error(dev, host->data_dma)) {
+		dma_unmap_single(dev, host->ones_dma, MMC_SPI_BLOCKSIZE,
+				 DMA_TO_DEVICE);
+		return -ENOMEM;
+	}
+
+	dma_sync_single_for_cpu(dev, host->data_dma, sizeof(*host->data),
+				DMA_BIDIRECTIONAL);
+
+	host->dma_dev = dev;
+	return 0;
+}
+
+static void mmc_spi_dma_free(struct mmc_spi_host *host)
+{
+	if (!host->dma_dev)
+		return;
+
+	dma_unmap_single(host->dma_dev, host->ones_dma, MMC_SPI_BLOCKSIZE,
+			 DMA_TO_DEVICE);
+	dma_unmap_single(host->dma_dev, host->data_dma,	sizeof(*host->data),
+			 DMA_BIDIRECTIONAL);
+}
+#else
+static inline mmc_spi_dma_alloc(struct mmc_spi_host *host) { return 0; }
+static inline void mmc_spi_dma_free(struct mmc_spi_host *host) {}
+#endif
+
 static int mmc_spi_probe(struct spi_device *spi)
 {
 	void			*ones;
@@ -1374,23 +1420,9 @@ static int mmc_spi_probe(struct spi_device *spi)
 	if (!host->data)
 		goto fail_nobuf1;
 
-	if (spi->master->dev.parent->dma_mask) {
-		struct device	*dev = spi->master->dev.parent;
-
-		host->dma_dev = dev;
-		host->ones_dma = dma_map_single(dev, ones,
-				MMC_SPI_BLOCKSIZE, DMA_TO_DEVICE);
-		if (dma_mapping_error(dev, host->ones_dma))
-			goto fail_ones_dma;
-		host->data_dma = dma_map_single(dev, host->data,
-				sizeof(*host->data), DMA_BIDIRECTIONAL);
-		if (dma_mapping_error(dev, host->data_dma))
-			goto fail_data_dma;
-
-		dma_sync_single_for_cpu(host->dma_dev,
-				host->data_dma, sizeof(*host->data),
-				DMA_BIDIRECTIONAL);
-	}
+	status = mmc_spi_dma_alloc(host);
+	if (status)
+		goto fail_dma;
 
 	/* setup message for status/busy readback */
 	spi_message_init(&host->readback);
@@ -1458,20 +1490,12 @@ static int mmc_spi_probe(struct spi_device *spi)
 fail_add_host:
 	mmc_remove_host(mmc);
 fail_glue_init:
-	if (host->dma_dev)
-		dma_unmap_single(host->dma_dev, host->data_dma,
-				sizeof(*host->data), DMA_BIDIRECTIONAL);
-fail_data_dma:
-	if (host->dma_dev)
-		dma_unmap_single(host->dma_dev, host->ones_dma,
-				MMC_SPI_BLOCKSIZE, DMA_TO_DEVICE);
-fail_ones_dma:
+	mmc_spi_dma_free(host);
+fail_dma:
 	kfree(host->data);
-
 fail_nobuf1:
 	mmc_free_host(mmc);
 	mmc_spi_put_pdata(spi);
-
 nomem:
 	kfree(ones);
 	return status;
@@ -1489,13 +1513,7 @@ static int mmc_spi_remove(struct spi_device *spi)
 
 	mmc_remove_host(mmc);
 
-	if (host->dma_dev) {
-		dma_unmap_single(host->dma_dev, host->ones_dma,
-			MMC_SPI_BLOCKSIZE, DMA_TO_DEVICE);
-		dma_unmap_single(host->dma_dev, host->data_dma,
-			sizeof(*host->data), DMA_BIDIRECTIONAL);
-	}
-
+	mmc_spi_dma_free(host);
 	kfree(host->data);
 	kfree(host->ones);
 
-- 
2.25.1

