Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20717723FDD
	for <lists+linux-sh@lfdr.de>; Tue,  6 Jun 2023 12:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237261AbjFFKnH (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 6 Jun 2023 06:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234654AbjFFKmX (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 6 Jun 2023 06:42:23 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2805E67;
        Tue,  6 Jun 2023 03:41:00 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 619B821987;
        Tue,  6 Jun 2023 10:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1686048059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=RFRhA53OrpoRIGlRg0Wm+s0hzuLRv5C/FjeqAiv5RVQ=;
        b=YABc6428qBup7gTPDtzPNifRPArSt62oMEfrVrJ2VU5TjjDevAE+1JhW9+gD5n22aOMFXo
        32UXn1518IwtkNS3Z3BzKuZxIJR1o/D/RtHBW+lIB8+RumQ7yivryeIBwGb4rxLCYrDd5Q
        +5u7xw1Rjb2dqGet6aycRTox/jnslKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1686048059;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=RFRhA53OrpoRIGlRg0Wm+s0hzuLRv5C/FjeqAiv5RVQ=;
        b=GyggOgYwcALJa3UrrDCMIgv2T+a/C1kT1RrYl0u4da0+XmF5jk19ombO5XVtEvJqGveG3a
        e/5LPtozKSwOw2Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3640613776;
        Tue,  6 Jun 2023 10:40:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id MWdpDDsNf2SHewAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 06 Jun 2023 10:40:59 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, David.Laight@ACULAB.COM
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] fbdev/hitfb: Various fixes
Date:   Tue,  6 Jun 2023 12:40:53 +0200
Message-Id: <20230606104056.29553-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Fix a number of minor warnings in the hitfb driver. I discovered
them while working on bb47f218fd01 ("fbdev/hitfb: Cast I/O offset
to address").

Thomas Zimmermann (3):
  fbdev/hitfb: Declare hitfb_blank() as static
  fbdev/hitfb: Fix integer-to-pointer cast
  fbdev/hitfb: Use NULL for pointers

 drivers/video/fbdev/hitfb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: 29c0f369e17ba0abf08c65ca065417aebab208c6
-- 
2.40.1

