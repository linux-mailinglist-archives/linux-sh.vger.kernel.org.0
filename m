Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F40943BC32
	for <lists+linux-sh@lfdr.de>; Tue, 26 Oct 2021 23:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239483AbhJZVT5 (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 26 Oct 2021 17:19:57 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:35255 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239474AbhJZVTz (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 26 Oct 2021 17:19:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hf4Qx6j6Qz4xbW;
        Wed, 27 Oct 2021 08:17:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635283050;
        bh=TFo3mzXV8wml/3Q3pUquoF0+zubLRBZHkfTWZ3rcX5A=;
        h=Date:From:To:Cc:Subject:From;
        b=RszvCpC7GKeVP5F/Npur3jA+7Ko/REi27xmbeP+9t5biFV/AFadSA7aiDT07Zg+ha
         qmJiAsfwGCKONLcr5w8ywnFIO4TSUkKS/GIxpWfLr4SSMHcICwJ+h5LzdsWbnzP443
         SMFtUMltL/3PadmZAZmQ1gV7e9V2nww5sVIwMAf1ryInOIRgcYpOxW4CUxMJEmI95m
         SVopYMvsI4iv6l4f5UqkcTo6HfxN6DQN2qAZhufKS+f05shq1Pjs1HM5CbL89JRlI3
         3S1UYWn83nuUYCPu6c/W9C7KK8d/oaAI9vHm9HcZG2hTwLr4rI84UQxKoke15xpGtF
         0keKb1f+ZPRMw==
Date:   Wed, 27 Oct 2021 08:17:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ftrace tree
Message-ID: <20211027081728.1ff488bf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OEi=q6+oHN=46abOCGMIfrO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

--Sig_/OEi=q6+oHN=46abOCGMIfrO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  7a335f11747c ("ftrace/sh: Add arch_ftrace_ops_list_func stub to have comp=
ressed image still link")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/OEi=q6+oHN=46abOCGMIfrO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF4cGgACgkQAVBC80lX
0GyKOwf+IvisQpCP/hujJPMpaTZKK0JpH7GQzeEo9jpGvFErIhrJDtcFixz/bd5I
DkoQLsGhK4dTTlU3GamBi5YBSw5PIpxAnYR1TgKnEx8KjXZiXSwOYXZ1eXOc4qyK
SvYPOEvmgOQX0mh9DDbiJaGOG48WQacVf7l1tiELNCxuK9XX+HRpzfULLGI5YXO2
LSoEadUAmcU+FSbhaqLWdiY3khgSBzw2KjLIhewL2d5M8AmILB8PBnrdB3ofeWuo
SDwYLhjkQSdE0A684dFG46spJU4Mau2x8UxCZxozgulA8XjPHmrG+33G92oCZ8uf
PPU+9EcoyI3eUJ4jbumlZ1nL5sx9ng==
=iU+5
-----END PGP SIGNATURE-----

--Sig_/OEi=q6+oHN=46abOCGMIfrO--
