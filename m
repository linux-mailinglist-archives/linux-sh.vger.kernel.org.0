Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8919715FE45
	for <lists+linux-sh@lfdr.de>; Sat, 15 Feb 2020 12:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgBOL6M (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sat, 15 Feb 2020 06:58:12 -0500
Received: from sonic316-13.consmr.mail.bf2.yahoo.com ([74.6.130.123]:35495
        "EHLO sonic316-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725937AbgBOL6M (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sat, 15 Feb 2020 06:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1581767891; bh=6u3qDl6yXWBH9oVBF6VmNFaXPPfmaUEmS0LDo6+oXlw=; h=Date:From:Reply-To:Subject:References:From:Subject; b=giaga7WIICHqGi2vXAeO3tXNLrPB2lkmbb2fzUqw+8Xi4OBIrnZ1/f6UTZgPg9Hc31y2BlESb9YH6+987YmVIHw6MnvoHsdphNse6H+pho3ASbQDXKHgFjv+dcl3nosJLlcWeVP4fQDDj5K5WnOKhDtyIyC31QE6ECcyfFrpXwJ6OcixS9A6B1QzWymkdDfsggyUD854TLDDxL5vgOcXM0DNa6BGfYNxRvNSzNLZHANIWoc9kVdnq7TyYi5yIkabsvlXbN7aZnsWn8wFTV9ZClgqd7D16XpVI6mgzJzfqwGZE5xzOfy+KaXsXpyouIVVgKNCZnrbMJIhVsgF9TRerQ==
X-YMail-OSG: SF7J_2oVM1kmuE.7hVevZJHVy6TmFuT.vRMuBW_5dMRg1oSGX0_S5SfoNjx301G
 NqDl_eKpuj64OBVraWglrCOMGONBl3icGd8jFyjOxAzuJQtTyCyt8UnUxO3UKSD9ein48cgCozqs
 1dNKzdUmfjbVFWIy6nz6CzyX7er9ikROHnzsXREyE3AxtuuUkSgns.kRj1couJSkjh1k_svx8sMD
 2guuhoNbkKS6k1PL__cSddl_5zzqE0gXjcLBgfaG2HVtdlfSXMegRxUDCJwfHqE.W6nvL.TrbDe6
 ysJqbhqc3257rOxKobw75oizO_B6a.n7b.o7H6IEr3pY0NxjXSroqGAd4Tkdd.tONe40J6G5Jpvy
 oBMrj7.nqKgzsuQaJ6Dl9nWj82yt3Qz8KSyBQWJm9Ws49dd3lcTner_iOAMZJUowcOu.y4Z9aec.
 TjtsRyAGRe69UgKsZPGcrjrXvpwNbAQq3saE1zt7_D_B4I4XAozxvNk3rx1mQGyiWNGNNYMOEPEx
 IoTvM5intklouS95e9PZH_gZoruwzqZ8zjoiRUrDFn1bqfsHhcYTNuSAOtkNcj76JBJiJTm4xepK
 rcTUUTZQiFNM3unqf5zIIQO2w45TUqWeT77_GYEzosGa4z_KsWZ2mxzf6OkP0Q_nXWnLXvPzG2JH
 EbUzp2uPk9LfeL9b2UEv7n1yr4mCNETUxqTvbrDv3RkieU027ww49dmNNCovXuFfBHHsgGvlmJ4C
 1L4zsY3F9myzgNEETcLBP8t85v6Vmg3YxzABw7sV2KTHaLExhd8Jti89fDieyJAo6qrmPjQSFxiD
 UY5YTCbf7RDoW2Ei5WCw5PXfhbp9mBgMUl9MOUFFd7TWQPRQYxumr_.Yys4gkrTBkLiXK9UQjkc7
 1bKguT5ml9KWsgurzAMyNOK3mEwHK8FPOFFSaKhQBpnMQyP.e0ACFAA5RsB.Tq7hoah.hiK5gZZq
 DCp91EsKO3jnESkyuPUMMnIynrmAuAclcftJWPolVLgC6SYZP_UnX0C9vFB0IOdlyj4Xpdo9bYHb
 LzypzB3w5XxBebSSDOP_56iyDoLQDCqMNjCCcn.SUTASbh3UdVq22bAYOlIfjX32QpudGQUZJzv6
 6xgPqkLD7.LGAGi2iBxQnFf4zIF5g5MqyW_R9aXTbARzhC6JzTm8bsrGwzLsDuFThsflJG25gy0k
 eITcrpKl7Y5uDR1mYS5fkUOit4We.XMoL9Y3Qy6pbqrOh0ujg2n4Zli0dEFpfbVvU4zjjNHC4oHZ
 DtQTCAOr7UsCZqIpqpWqnnTa.e1AqeTosyr2t83.W3H36gs_mNmGVdwTFtJZcuniTdOq.gil4Mq4
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.bf2.yahoo.com with HTTP; Sat, 15 Feb 2020 11:58:11 +0000
Date:   Sat, 15 Feb 2020 11:58:10 +0000 (UTC)
From:   Ms Lisa Hugh <lisa.hugh222@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1738191078.2425958.1581767890681@mail.yahoo.com>
Subject: BUSINESS TRANSFER CO-OPERATION.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1738191078.2425958.1581767890681.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15199 YMailNodin Mozilla/5.0 (Windows NT 6.1; rv:73.0) Gecko/20100101 Firefox/73.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-sh-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org



Dear Friend,

I am Ms Lisa Hugh work with the department of Audit and accounting manager here in the Bank(B.O.A).

Please i need your assistance for the transferring of thIs fund to your bank account for both of us benefit for life time investment and the amount is (US$4.5M DOLLARS).

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me after success.

Note/ 50% for you why 50% for me after success of the transfer to your bank account.

Below information is what i need from you so will can be reaching each other .

1)Full name ...
2)Private telephone number...
3)Age...
4)Nationality...
5)Occupation ...


Thanks.

Ms Lisa Hugh
