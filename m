Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F07CD122595
	for <lists+linux-sh@lfdr.de>; Tue, 17 Dec 2019 08:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfLQHgI (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 17 Dec 2019 02:36:08 -0500
Received: from sonic314-22.consmr.mail.ne1.yahoo.com ([66.163.189.148]:42103
        "EHLO sonic314-22.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726494AbfLQHgI (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 17 Dec 2019 02:36:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1576568167; bh=TP9iOlUtQ6WIsPCt8pPaNWudkSrGSrIM1vj1jKb/GgE=; h=Date:From:To:Cc:Subject:References:From:Subject; b=LVQPNc/mXy4ig/dzlxCBzfAxfq97qMHmS2f+zWafn1XHlHbURx1OwFJIJgAPkEFv2hW1kAvZtbu2B7gfMwU8Hymruzkg8CAhdA1s5HbnYxblksE+iIJc1kDj+6wK8wQemmbH+wHuOz9CBGOvlEi0QAzdANMTVjOrRb3OwON+NH3PPUYMV17sIUBCkTQI5G00LpZb1tqzGL76YSDPMZHTeD9hxdGwNh3iouYhUWsVb0CPf3j+pI7049pukPMtkiAQJ+D6f3ejDHwMYBBMx8XccXthZdDRJd7Eu/z3lj7LTRtaLwP5R6BkafTTCZJSypM7EWOeQAauo29NchfpKbZw2Q==
X-YMail-OSG: sOmVIqIVM1l1YT7twxigVEqXrHpafPIYNxCzqYMPd8cUycnzLqs_7ZWl_qScgxo
 jOa5bP27vRFUIfbTk3_B7RfsIIq0KvqOtvqZQrgPtNdxfICOiIbD7tQjCjcDczFVf0V1KqGkVN36
 vZ2lE5eIj946updCH54hL5fhTndcD5VzE0Apc9Wkip8JladaVfXl_ZgzDFhVTGOXdwVQ6y_5fTLQ
 yq_3yXMKBS6ggYe6Ee8KplTeCBqSBOYXzWtHbyE18glno2.ZbYgoutURvrZo5rTzuYJmspsd8FE4
 9B8N6FmYHMw_E71MvooA3x5AK.ggVpk.t64DfBmmr2InNyPRuPKBSerwafJrd.VPtOm5zpkrJA65
 K_D3QF8BDUYFdogNmaJz_dFx57NjKI3_IckShK3P65bD8WpAU.wl3ADIN7Q9N2ul0dahf1ORGRhO
 ynHuFQBKogtpH_5zbT6JzzqfPEdleNAOcjBg25MSFtvI1TPB04cRujWuy84C0J39Z9ZS38_8fAIz
 1xRDH9mZeIpNMdV_MKSdjk88GjvNO3X7F84Y6xU2TCO1zez8yCuOiZ3UsKSecJLsA_QaeP5RvK_5
 _DqsVNDGynjABkKSQGtlBeaJVzdcjgEzEw8YXl1O6EbmQpZn6g5vGFKsSGaecBmpUGNoA4Xg6x9m
 KJt1NE0YGBTLTQiHyBuQdjG.qshPgCg7SlNvSxqaBcQ6L7rwr8zLtTxR.C.chd2HagRe7eQybD1g
 Jis4Jx6QsOU5V_4qv9XddOjEGiw.__wrDp2aW1QHLwCWNdMJM4AcKePTB4lJfpTO7p_5bsCNxVXQ
 uAQQJfql3RU4kSJfQ_Uy.Q.JsfT8PS8ku390KJeMrHEG6q.J8RDqmFOO9aKybxRJqWD5Njs1GcKu
 PT4JqLfFRVnwLIeU0jOIucQLZ7Y4GYrBo53TQE2YmMawl0WGB8SMnJkblidAWdPNX8dspqeLaEAG
 50R21fEgtXp74s9X8KhP7mGMqFh81FO0tl3A80usdsXLiq4K_yCMKuXlZDAByGC3W0UJF35gEcKr
 bppgxSux.wT0l1VAYmj1g_ZD1kOeYx4NPVrjocd0gdiDWZhfxv4.cFkAwoRJEkIxyEBWJ4IweyZE
 .PIobrLvkfW2teb.2hMHm7AzPWC6gwzzNTNKdtyW3TVivwJEmsT0N.1R1lMgyA8vt4k3piyLSo6.
 j9z5MA4OalK5MRRC7MoX3ysHNSuOwAIYCMQzxe6rJvcKW65Jb5AfbekvpkC2EhCeX612YUaYtM7J
 Ewz_9JZpUMzrQdvC4x3vbEY.K2k22fycTmnlDYKPh18z7xxFSFQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Dec 2019 07:36:07 +0000
Date:   Tue, 17 Dec 2019 07:36:06 +0000 (UTC)
From:   Karl Nasrallah <knnspeed@aol.com>
To:     kuninori.morimoto.gx@renesas.com
Cc:     linux-sh@vger.kernel.org
Message-ID: <2131872019.198149.1576568166106@mail.yahoo.com>
Subject: Re: can someone solve string_32.h issue for SH ?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <2131872019.198149.1576568166106.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.14873 aolwebmail Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Hello,

This appears to be your culprit:

char vub_name[3 + (9 * 8) + 4 + 1];

in struct vub300_mmc_host on line 302 of the file /drivers/mmc/host/vub300.c.

This is the exact line triggering your warning, also in vub300.c:

515 strncpy(vub300->vub_name, "EMPTY Processing Disabled", sizeof(vub300->vub_name));

And the fix would be to probably fix vub300.c, do a sizeof() on the string or hardcode the string size to 26 characters since the string is already hardcoded in as it stands.

The asm doesn't look wrong.

Hope this helps!
(Sorry I can't do any pretty formatting: mail client and majordomo don't play very well together and html gets generated at even the slightest provocation, despite having disabled it...)
