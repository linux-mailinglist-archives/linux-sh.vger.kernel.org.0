Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDFC6F0253
	for <lists+linux-sh@lfdr.de>; Thu, 27 Apr 2023 10:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbjD0II0 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 27 Apr 2023 04:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbjD0IIZ (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 27 Apr 2023 04:08:25 -0400
Received: from mail.loanfly.pl (mail.loanfly.pl [141.94.250.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E5672D71
        for <linux-sh@vger.kernel.org>; Thu, 27 Apr 2023 01:08:24 -0700 (PDT)
Received: by mail.loanfly.pl (Postfix, from userid 1002)
        id 49529A77B5; Thu, 27 Apr 2023 08:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=loanfly.pl; s=mail;
        t=1682582808; bh=flSgn4+IJB03yMaHNopPnR0v50wun3P5Hd/CkHJx2Bc=;
        h=Date:From:To:Subject:From;
        b=bmDeUevjQHnPL+6fP+32DZBkH1HEegKvRczmkEipQ7LFP2N/LVIVkirJ47HocPpQQ
         WE+VPdd4Zb0l6NvSnaWM5IjpVU/9zhuTvIPmhaQL0CPjylSs0M05iqhZ4HwCiVJM3R
         d6RLC8Hkgwo6ACOtc0S4dfEveBXJACnkeV15h8MULrv/aYuqrfGQNrUNx50OLY4NiC
         IGYAVPXQK48vL1FNSkDqC6O5apA8syc+/vgdkPJJgQqVu8NgVlL51PTdG5JxpdY2Vz
         iowwM7RzZbd1yGKdHJITbikPv4Jc27yHBtvHEpvcOLx5zBSEEJwgOAGCB8oEWBSNRq
         ONk0/+TgLfBAA==
Received: by mail.loanfly.pl for <linux-sh@vger.kernel.org>; Thu, 27 Apr 2023 08:05:41 GMT
Message-ID: <20230427064432-0.1.9t.16lao.0.gk4940opml@loanfly.pl>
Date:   Thu, 27 Apr 2023 08:05:41 GMT
From:   "Damian Cichocki" <damian.cichocki@loanfly.pl>
To:     <linux-sh@vger.kernel.org>
Subject: Prezentacja
X-Mailer: mail.loanfly.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_ABUSE_SURBL,URIBL_CSS_A,
        URIBL_DBL_SPAM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  2.5 URIBL_DBL_SPAM Contains a spam URL listed in the Spamhaus DBL
        *      blocklist
        *      [URIs: loanfly.pl]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [141.94.250.68 listed in zen.spamhaus.org]
        *  0.1 URIBL_CSS_A Contains URL's A record listed in the Spamhaus CSS
        *      blocklist
        *      [URIs: loanfly.pl]
        *  1.2 URIBL_ABUSE_SURBL Contains an URL listed in the ABUSE SURBL
        *      blocklist
        *      [URIs: loanfly.pl]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

Dzie=C5=84 dobry!

Czy m=C3=B3g=C5=82bym przedstawi=C4=87 rozwi=C4=85zanie, kt=C3=B3re umo=C5=
=BCliwia monitoring ka=C5=BCdego auta w czasie rzeczywistym w tym jego po=
zycj=C4=99, zu=C5=BCycie paliwa i przebieg?

Dodatkowo nasze narz=C4=99dzie minimalizuje koszty utrzymania samochod=C3=
=B3w, skraca czas przejazd=C3=B3w, a tak=C5=BCe tworzenie planu tras czy =
dostaw.

Z naszej wiedzy i do=C5=9Bwiadczenia korzysta ju=C5=BC ponad 49 tys. Klie=
nt=C3=B3w. Monitorujemy 809 000 pojazd=C3=B3w na ca=C5=82ym =C5=9Bwiecie,=
 co jest nasz=C4=85 najlepsz=C4=85 wizyt=C3=B3wk=C4=85.

Bardzo prosz=C4=99 o e-maila zwrotnego, je=C5=9Bli mogliby=C5=9Bmy wsp=C3=
=B3lnie om=C3=B3wi=C4=87 potencja=C5=82 wykorzystania takiego rozwi=C4=85=
zania w Pa=C5=84stwa firmie.


Pozdrawiam,
Damian Cichocki
