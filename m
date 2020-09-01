Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C147259229
	for <lists+linux-sh@lfdr.de>; Tue,  1 Sep 2020 17:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgIAPEu (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 1 Sep 2020 11:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgIAPEq (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 1 Sep 2020 11:04:46 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1824C061244
        for <linux-sh@vger.kernel.org>; Tue,  1 Sep 2020 08:04:45 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w3so1943279ljo.5
        for <linux-sh@vger.kernel.org>; Tue, 01 Sep 2020 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Hb7r+KvjTn1fI1bbdwQosrAVf1D62HZ/qglZn6BY0k=;
        b=m+/3w5yOKIp+/HPKm5IajyrPUsIvE8lLsvQ79OvZJQRYCtuwvb4+uKOHzhkZdtyDvG
         8ytnhGluUZyOvgxu7tBXHoYaVE9LR0jS3S0zPuFPezUVejN04RwSEU2O+4r62XT72rWJ
         rxi9/tfvaeJjuJsMEHLb1miKfjis8nxWHP2IvstsP/ztWqEwa+uQGI3FlyX4hLHBFibM
         QmyTL9G5958Aur90NMzdNQBJyHz7Pjgb66D9VqpyoTM2HP+78fY/eTDuw38p6aCMx/uS
         vsRngVRRVu4LsGmIvOs7lQaPVULqD6iAGAoa4Ivt1ar8HEb6G0kzZWdQRC9QtZmd+stx
         u5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Hb7r+KvjTn1fI1bbdwQosrAVf1D62HZ/qglZn6BY0k=;
        b=O1vycwgxxjuQfJrgGcJ0kmQmdoy+KbvImXNTMwTQcBYuLc8BQB9QLppwFzgp4ubd6q
         NBIiDO0JjAFT5TQbMZ0VuZZRRl7jGtGEUHGSmK0K+UvlzH/PZ/unC2/0bO99PnmVMaON
         8zN1CaYad2xQFyOYHCDxHUv8yxE9G5EEfKS47vmbOGZUIL9I+C1CLkBA6SDpd7p2satc
         M3/7SF4Y4mckO518J+KR+itMU2ebAV89EEgDEOtWDEXY3jGaNADE7B9mHydOIOLlRHhR
         pBPpnFZ2ENHmP4SdvE9GyfRYw6GDUFATPwZKchsybr0z2KMWIJ3QeEr6AmDoaP3PQABk
         I0Pw==
X-Gm-Message-State: AOAM530QKFmgSUt6BjPJjW1hTwqkhRNM+ohA0gK9YyQzsjSH3o05nx+j
        zHbQnUzAgVlkLxxOvTk1byPonA==
X-Google-Smtp-Source: ABdhPJyPDO/atWKWL3yuF/BeRjbDONzlDxLqDuMjYm7EAhe/rsnhsSpu+ZmNGswu0PCPqQG6Q7AOVg==
X-Received: by 2002:a05:651c:1122:: with SMTP id e2mr834205ljo.36.1598972683228;
        Tue, 01 Sep 2020 08:04:43 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-180-79.NA.cust.bahnhof.se. [98.128.180.79])
        by smtp.gmail.com with ESMTPSA id u11sm328651ljh.17.2020.09.01.08.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 08:04:42 -0700 (PDT)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Rich Felker <dalias@libc.org>, Christoph Hellwig <hch@lst.de>
Cc:     Mark Brown <broonie@kernel.org>, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] mmc: mmc_spi: Allow the driver to be built when CONFIG_HAS_DMA is unset
Date:   Tue,  1 Sep 2020 17:04:38 +0200
Message-Id: <20200901150438.228887-1-ulf.hansson@linaro.org>
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
mapping interface to be built as stub functions, but also prevent the
mmc_spi driver from being built as it depends on CONFIG_HAS_DMA.

It turns out that for some odd cases, the driver still relied on the DMA
mapping interface, even if the DMA was not actively being used.

To fixup the behaviour, let's drop the build dependency for CONFIG_HAS_DMA.
Moreover, as to allow the driver to succeed probing, let's move the DMA
initializations behind "#ifdef CONFIG_HAS_DMA".

Fixes: cd57d07b1e4e ("sh: don't allow non-coherent DMA for NOMMU")
Reported-by: Rich Felker <dalias@libc.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- Drop build dependency to CONFIG_HAS_DMA.
	- Rephrase commit message and its header, to reflect the updated change.

---
 drivers/mmc/host/Kconfig   |  2 +-
 drivers/mmc/host/mmc_spi.c | 86 +++++++++++++++++++++++---------------
 2 files changed, 53 insertions(+), 35 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 9c89a5b780e8..9a34c827c96e 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -602,7 +602,7 @@ config MMC_GOLDFISH
 
 config MMC_SPI
 	tristate "MMC/SD/SDIO over SPI"
-	depends on SPI_MASTER && HAS_DMA
+	depends on SPI_MASTER
 	select CRC7
 	select CRC_ITU_T
 	help
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

