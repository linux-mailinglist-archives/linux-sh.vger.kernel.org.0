Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19D451259F3
	for <lists+linux-sh@lfdr.de>; Thu, 19 Dec 2019 04:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbfLSDUB (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Wed, 18 Dec 2019 22:20:01 -0500
Received: from sonic310-25.consmr.mail.ne1.yahoo.com ([66.163.186.206]:46134
        "EHLO sonic310-25.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726777AbfLSDUB (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Wed, 18 Dec 2019 22:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1576725600; bh=HN6sUa5MvvQUtXRgrFv23skx0VbBY+cyACtuTZ0M3hs=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=WR28oo4+XPFGBmtR54KVeS8Gq8wGAP5o0DHL5HtPBcG3rN8Pi26CcaTQEWzroLS9yIWb7HElVebD79DeCPGG6Yz7JOkTOR/OEEXoSBCnQmIqLezD2LKvg9GT4374KCtg0x2ohKlaOUjyw47YPaUAdxr2FK9d8dWOUqYWNadmBuxdPGc3MsOZ/7tTjU4bBRHIiYgRHAfQtnFMXrDtuzR1HObCEPceoCBa3VoVjE7CmD2n8ObZCJLwXrzwSZ+YDp5llHFz0PVibkKSJkJRX2lUZu/NX07/sLNLjqc3Y0YKBrG1e42lE3EIPQ5xl9ajCTO4Lv+vlP5bQ6+Zxvn9ehVsSg==
X-YMail-OSG: zibaLPcVM1litE4mkB6uJKZdDDc0ZA8za6kRuCt6x4gstXQNdHU8VYh7FSmeNOn
 bpup5wjsdtwQCX8xLzCzfbEZ5WuZE1C6FdcRg4_WsvBvfAY7og53mK1uDey3sAN.m.ahiDuU9B2j
 FljnbK6RAE23agOzzG5pRWKK8tN9FOmp.9ETxVgkfdOEjlxOXu1pkqDjT1bY6AWFJwlU_i0teHFQ
 Us5aq8Rh3yiV9WPyhfsVNl5geTgTsO_cqccSs6z01q_.jFpE9g5GMhjV5mZU8PY1WtSZFWolnodY
 wRZhh7Bjx4eOMQZvv5DLazJ7.6tDlv.Scv27HnusYWQtrjK00L.BzUMwUFj92TEttC.qL_Fgujwr
 FtuZkf.dBgljvST6hM0O4ddfTH6sKDqhPr8.issZpbGpov4E.JkUxNtAx.VThngF2NJCQKDpydEJ
 qtfTNXYbQUNKA6RwkZa4Mhe7vd8KYjkJwjMEPBGKgezB9Tyx4BhtQGDMtT.QAZi9.NNM_ngnI.9N
 xwQrlk1VsifEdvl9RDBNppRVlne6q_2QLS0ZI5EX3kmDUhf.lZSlS9NtZ60EXN7XBXbcr8LAWK8X
 00_yYcVaNCHhAha9g1OYg7OH_p21fCe3guouFr3QIcPap.b7CTB.B0vVuiLcfH5a1DKB1.pNft2A
 .q6EQAsnw1HCcezYIvdfUgg7hgCOd8q02QV5LMXX9RHbuliyOcpN.c4XQ_21YFyNIFvnLs_SwaJG
 .CMMhLCPL2cN52PwgCtKty94HZR.lBAQTZQFoSIdQOqvMwouUEFHEPA8S.KrdZsv.uNcByEHpc7F
 lgX0wCIYHz443VEsomzJMsVaZAUk2e1JyffibPRK_HygGpoQtr9mnFdOjVBiaFn9Af6diffrxfXz
 YscDssTT49967d1q3eTbGkuUgyuk85VfaMSrE_YSLN4IyzUpXSbEvy5ox7gwpRpeUC7mGNxg9esp
 X15Jp8ouKsaXrHZ0YYuepva7SsxOPWr77739jVMBWH80stSOuKG2_BtZF62gqB6O8ZLrAdb6ckDB
 DRpX29_fzdJqadmSug62LosAaiF51iljKRT5TZVLgXwJByPAYW2WP_.T59Dy5doZ3ry4yNn.lpqw
 VfBKMXUloUf4zZoqTQ3J7BgHKt0D1BaNrvl6YfkABVqrVt8jncbUjxTghwA.n2Uw0tQN2APyO9Lo
 9F15aBMD6QpK.b0am3AsLGn_FgCr_MRCXX.PPQcWZMr7fTb5ynz4xchf6BRYNDpW4LXW0VK2DrK6
 3MenBV0T.sMGzW4wV9YyY_4nEFVUnu02lTb3uIqtv9eNAec8U3fZkX3n8OOzuMp4iqlqxBVKAyYA
 uZx3K.MEwxbjaPPD5BL.6pZ_pNUoXF4sGi1y6IKcxMRTgFB8u95jrFCcHUJA5CGIV7fSrv7eK0A1
 n8i6H
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Thu, 19 Dec 2019 03:20:00 +0000
Received: by smtp406.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 4958f685b2f448392444604b75d4d9af;
          Thu, 19 Dec 2019 03:19:56 +0000 (UTC)
From:   Karl Nasrallah <knnspeed@aol.com>
To:     ysato@users.sourceforge.jp, dalias@libc.org,
        linux-sh@vger.kernel.org
Cc:     knnspeed@aol.com, kuninori.morimoto.gx@renesas.com,
        geert+renesas@glider.be
Subject: [PATCH v3] sh: fix inline asm strncpy()
Date:   Wed, 18 Dec 2019 22:19:14 -0500
Message-Id: <20191219031914.20457-1-knnspeed@aol.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <87v9qdyups.wl-kuninori.morimoto.gx@renesas.com>
References: <87v9qdyups.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

The SH asm strncpy() implementation does not pad arrays with null bytes
when the size passed in is larger than than the size of the input string
(e.g. if the size of a larger destination array is passed in). Under
certain targets, it also generates 'array boundary exceeded' warnings.
This patch updates the extended asm function to address both of those
issues, and allows strncpy() to behave as described by the strncpy()
manual page.

Signed-off-by: Karl Nasrallah <knnspeed@aol.com>
---

Please note: This is an improved version of my prior code, tested
standalone with sh4-elf-gcc 9.2.0 and a Sega Dreamcast (SH7750/R-like).

If anyone is interested in an easier-to-read version of the assembly that
does not match the in-kernel style, it is included in this note:

static inline char *strncpy(char *__dest, const char *__src, size_t __n)
{
	char * retval = __dest;
	const char * __dest_end = __dest + __n - 1;

	if(__n == 0)
	{
		return retval;
	}

	__asm__ __volatile__(
	"strncpy_start:\n\t"
		"mov.b @%[src]+,r0\n\t"
		"mov.b r0,@%[dest]\n\t"
		"cmp/eq %[dest],%[dest_end]\n\t"
		"bt.s strncpy_end\n\t"
		"cmp/eq #0,r0\n\t"
		"bf.s strncpy_start\n\t"
		"add #1,%[dest]\n\t"
	"strncpy_pad:\n\t"
		"mov.b r0,@%[dest]\n\t"
		"cmp/eq %[dest],%[dest_end]\n\t"
		"bf.s strncpy_pad\n\t"
		"add #1,%[dest]\n\t"
	"strncpy_end:\n\t"
		: [dest] "+r" (__dest), [src] "+r" (__src)
		: [dest_end] "r" (__dest_end)
		: "r0","t","memory");

	return retval;
}

(In maintaining the spirit of the original work, consider this piece of
code public domain.)

 arch/sh/include/asm/string_32.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/sh/include/asm/string_32.h b/arch/sh/include/asm/string_32.h
index 3558b1d7123e..7f83eaea987a 100644
--- a/arch/sh/include/asm/string_32.h
+++ b/arch/sh/include/asm/string_32.h
@@ -32,6 +32,7 @@ static inline char *strcpy(char *__dest, const char *__src)
 static inline char *strncpy(char *__dest, const char *__src, size_t __n)
 {
 	register char *__xdest = __dest;
+	const char *__dest_end = __dest + __n - 1;
 	unsigned long __dummy;
 
 	if (__n == 0)
@@ -41,14 +42,19 @@ static inline char *strncpy(char *__dest, const char *__src, size_t __n)
 		"1:\n"
 		"mov.b	@%1+, %2\n\t"
 		"mov.b	%2, @%0\n\t"
-		"cmp/eq	#0, %2\n\t"
-		"bt/s	2f\n\t"
-		" cmp/eq	%5,%1\n\t"
-		"bf/s	1b\n\t"
+		"cmp/eq	%0, %5\n\t"
+		"bt.s	3f\n\t"
+		" cmp/eq	#0, %2\n\t"
+		"bf.s	1b\n\t"
 		" add	#1, %0\n"
-		"2:"
+		"2:\n\t"
+		"mov.b	%2,	@%0\n\t"
+		"cmp/eq	%0,	%5\n\t"
+		"bf.s 2b\n\t"
+		" add	#1,	%0\n"
+		"3:"
 		: "=r" (__dest), "=r" (__src), "=&z" (__dummy)
-		: "0" (__dest), "1" (__src), "r" (__src+__n)
+		: "0" (__dest), "1" (__src), "r" (__dest_end)
 		: "memory", "t");
 
 	return __xdest;
-- 
2.17.1

