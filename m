Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5E77E1740
	for <lists+linux-sh@lfdr.de>; Sun,  5 Nov 2023 23:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjKEWBM (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Sun, 5 Nov 2023 17:01:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjKEWBM (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Sun, 5 Nov 2023 17:01:12 -0500
X-Greylist: delayed 5221 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Nov 2023 14:01:09 PST
Received: from SMTP-HCRC-200.brggroup.vn (unknown [42.112.212.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3159BF
        for <linux-sh@vger.kernel.org>; Sun,  5 Nov 2023 14:01:09 -0800 (PST)
Received: from SMTP-HCRC-200.brggroup.vn (localhost [127.0.0.1])
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTP id BB40C19B1A;
        Mon,  6 Nov 2023 01:58:25 +0700 (+07)
Received: from zimbra.hcrc.vn (unknown [192.168.200.66])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTPS id B2F7919868;
        Mon,  6 Nov 2023 01:58:25 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 4E4BA1B8250D;
        Mon,  6 Nov 2023 01:58:27 +0700 (+07)
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id qIFhgTmp-7eQ; Mon,  6 Nov 2023 01:58:27 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 18EF81B8253C;
        Mon,  6 Nov 2023 01:58:27 +0700 (+07)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.hcrc.vn 18EF81B8253C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hcrc.vn;
        s=64D43D38-C7D6-11ED-8EFE-0027945F1BFA; t=1699210707;
        bh=WOZURJ77pkiMUL2pPLC14ifVPRvyTQIBEQmxuN1ezAA=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=DKD48+E3H88qWxYILNJggtPr+P99ZzbbrwR+/GWckgOdWnQzw7nHZ0pQcq/tWNTAd
         CnmOtPtXmt4ifGhDLkq2Mtg0+3JjMB4l83dE3ujvmtYZBfU6AFi9V2RD+5LJLxA4T8
         ph8wzZ1sKUiWR4z+E++bt0QNA8IJBdjUFANEGn+TbRtXKOIMoXW4BeCncK2DBj+xPs
         Trt4Erl4mph5SMojlN8Ftp/LrpXd+QpyiBefcjbb1pCAiontwX9Gqpkyx7kcvUDBih
         lCgVpkrnpfDJ+gwVo3jiOFtuCwTppmn/pEJaOe1nPevn3Q+Vg6PCyTgpjuX0Zs7IdC
         G2jrTbgYSEteQ==
X-Virus-Scanned: amavisd-new at hcrc.vn
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id B1a-R_4AzTlU; Mon,  6 Nov 2023 01:58:27 +0700 (+07)
Received: from [192.168.1.152] (unknown [51.179.100.52])
        by zimbra.hcrc.vn (Postfix) with ESMTPSA id B3CB81B8250D;
        Mon,  6 Nov 2023 01:58:20 +0700 (+07)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?b?4oKsIDEwMC4wMDAuMDAwPw==?=
To:     Recipients <ch.31hamnghi@hcrc.vn>
From:   ch.31hamnghi@hcrc.vn
Date:   Sun, 05 Nov 2023 19:58:10 +0100
Reply-To: joliushk@gmail.com
Message-Id: <20231105185820.B3CB81B8250D@zimbra.hcrc.vn>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Goededag,
Ik ben mevrouw Joanna Liu en een medewerker van Citi Bank Hong Kong.
Kan ik =E2=82=AC 100.000.000 aan u overmaken? Kan ik je vertrouwen


Ik wacht op jullie reacties
Met vriendelijke groeten
mevrouw Joanna Liu

