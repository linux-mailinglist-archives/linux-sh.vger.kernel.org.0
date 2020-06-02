Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2E11EB779
	for <lists+linux-sh@lfdr.de>; Tue,  2 Jun 2020 10:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgFBIfW (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 2 Jun 2020 04:35:22 -0400
Received: from sonic309-13.consmr.mail.bf2.yahoo.com ([74.6.129.123]:40958
        "EHLO sonic309-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725835AbgFBIfV (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 2 Jun 2020 04:35:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1591086920; bh=V09D8a1N75lUFkJxVR9aVpVPFU2IfPbM8afoyzXI9EQ=; h=Date:From:Reply-To:Subject:References:From:Subject; b=GfwuZ/YOGSf76XVuNowbeu9e0HpUBJhYgBrSjLlP7AWNEZT08SOaes1ZkwX1Vq7q4RuDVYgng+2r8uBfk1kXmN8eLJlqqZ6YgGw/OeqHmNsG2h2JqST2h4d0Lxi8yjkceCRoyicTuunRDtGi3tn8SIIFle+PGbO5c/s5jfwE0wOFHWpO69LWtayg5sv/N0CYrCVCJVnK++K+TQSIdh9GHBy4Nr3v54k1hs/J9ij+9iAtUuIsAjDd5qkUd9JRzYXg0vhdkOLQ2ImHWfwZBjZI/jWB5Q8vF0IQoeA8881rgK5zb8DSdnQgSoj2B2GCPnYHgw3wAm2EngjsyRJJ3tdFxQ==
X-YMail-OSG: cNuxTIwVM1ktlcHGcoTacO4hU86YQRDsMajp0h21rtZzGpKxpaRx15YVxO_Fjj4
 bU3Z7Rg9oclQFzY6BhJeyvYvzOVk6wd_luT5a84JkUoJGkDgIBO3b_F4Y.m7eHeCFMM.cdREhfrw
 xNd.NzsYxDi01Ahc3ztUUpsPg1ODsNBJvymCOdG1HCpWEfLGFxJiIq8YJrL7P9jNwdSAN5eRpaui
 ucCjJgJ57u.H3DdNTAAedb8lGPGXDamCEk9wpVZOM5om.Io0mGTs8E03ULyhPE0igS3l5uMd6ieD
 6DeDB8OM1_8TOMvhYmUArxkNx0vZEXn5zAZ1VnleBcDFtMHnhnsXObeTosNnoJ9IcTCdLyjVdAl8
 WJlxGJnfB3TCPRsIRHT0bokpNXT.w.uctWpq3XzD_EMpYgZpYChXA_zzmlCc6krw0_06CfSrNcSZ
 fPUfRL9.lGVG.CqIQWAOpFwIYi57jT.hLZwPrq6iMk9mTvDdwIp33bP7xUAO8eR0fGpwY4NxQo6O
 jKLst4jn2fmKKVCwHoxNfBpufxVlKEISY9bImoykHxV3qPkD0GmHJV9MiA2F0radCo9oVyx2YMV1
 8Gz94OO2D8ngxhhOWy5SBP1gzZ90sjze8OgQRcWZOA6HSiZ2oLk3QywmeTt5cNNo7_ehuAoXq.s8
 XqLbTf6PHcxNZwFsOlrn4fDvE8flH6Fg635lLTHaTLqQCQuS0iNZJj2XRbfv9Ar45PR.59E1haM2
 BZEGt5LFsiY31aYNbdalqgm0BOf.H3ur5M0dUAfz90qSO5qlBiMDx6jp8D5V2VosHw.5Lvgg.pIK
 bITR60FuJYu3fEfL25KzqqY.3Lsbh1nT.E3CbTxkbUyctbVlq4zoUgpTnSRPIKXgMYqB3Cm2CrFi
 Yhw4kMZ5bMNTlqU.C9mS9akNQhBJ_7Fn_DS3PDZxbayx2Wwr4v2tMBOvH_qSCGhjsnAAZRuA2IRb
 zqRhgcR8O._ycC1nEtSijE.Gk.oboRQYeeo5a_ph4H6sRqc1z.ZCgETr0TkXMVw5lrz7yAgNBGKj
 Cl4zW6clLNA9p0Pi_AiImJvT_XC_7LxbL1enqWKgkGshMxaO61WPEYTAWwclV.6cDfHPb0KV_LSE
 OagUkbK0QeW_jhpkTQ85QyGVdBRcRjxCivF_uzFS7gTkaP0WUKKCODtAKASoRe1QB83YUkv.f.Fv
 pgxAfJPF.JVQnpAzy77KZ6040BsrKy7lInFRaX97tjdHllCbgjCjWvODlWuVbH9JvFYcKEugMQOa
 9M_8N.5xFT8jSPVltUNnnVGpOYIIKuBADZ1LZMfOfSyFCWmBRnM4Vvv9u_OgKMX84i1NRFUjinCv
 .wCA-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.bf2.yahoo.com with HTTP; Tue, 2 Jun 2020 08:35:20 +0000
Date:   Tue, 2 Jun 2020 08:35:19 +0000 (UTC)
From:   Ahmed <ouedraogo.2.3.4.5@gmail.com>
Reply-To: ouedraogoahmed@outlook.com
Message-ID: <1969385350.905223.1591086919784@mail.yahoo.com>
Subject: Hello
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1969385350.905223.1591086919784.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16037 YMailNodin Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



Dear Friend,

I know that this mail will come to you as a surprise as we have never met before, but need not to worry as I am contacting you independently of my investigation and no one is informed of this communication. I need your urgent assistance in transferring the sum of $11.3million immediately to your private account.The money has been here in our Bank lying dormant for years now without anybody coming for the claim of it.

I want to release the money to you as the relative to our deceased customer (the account owner) who died a long with his supposed Next Of Kin since 16th October 2005. The Banking laws here does not allow such money to stay more than 15 years, because the money will be recalled to the Bank treasury account as unclaimed fund.

By indicating your interest I will send you the full details on how the business will be executed.

Please respond urgently and delete if you are not interested.

Best Regards,
Ahmed Ouedraogo.
