Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A11072C918
	for <lists+linux-sh@lfdr.de>; Mon, 12 Jun 2023 16:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238444AbjFLO7s (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Mon, 12 Jun 2023 10:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238415AbjFLO7q (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Mon, 12 Jun 2023 10:59:46 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C34BC;
        Mon, 12 Jun 2023 07:59:46 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id BE6252032C;
        Mon, 12 Jun 2023 14:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1686581984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=g0NEHiB2+gppGTQZNaSQTMkMYimyPagaOAaEeB4Kmck=;
        b=ciVHjH06TmW0IGnDdIOeSsHOMkiiuUARzJVIpji1XIJU4NDtcChlR5wctf1tvGyRcLU7Cq
        S0+OV2DwXyyqEwtTFNky4kqgSlwzkU5jk5y3c/GfhVzeHKAjYDzbiM5vQ1vloc8rpyqF/k
        xPOqF/PDN1lbKdzS8GLuXf6CgYJunrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1686581984;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=g0NEHiB2+gppGTQZNaSQTMkMYimyPagaOAaEeB4Kmck=;
        b=cJI2BfiNi38ygWE4ucYoAlK01X+Te3+7JNWxgyX33kvrg4xXZ5vYqvzt4kftsOaWX6WYpj
        cRvIhZYz3/hCmgCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9CDCE138EC;
        Mon, 12 Jun 2023 14:59:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 58hBJeAyh2SBLgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 12 Jun 2023 14:59:44 +0000
Message-ID: <0794cfd5-b36d-e0c4-d824-56beb1a6da07@suse.de>
Date:   Mon, 12 Jun 2023 16:59:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 0/3] fbdev/hitfb: Various fixes
Content-Language: en-US
To:     deller@gmx.de, David.Laight@ACULAB.COM
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org
References: <20230606104056.29553-1-tzimmermann@suse.de>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230606104056.29553-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HTGjxZ0QUQ7XEqqlJrN00Y2B"
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HTGjxZ0QUQ7XEqqlJrN00Y2B
Content-Type: multipart/mixed; boundary="------------W9Bn0svwDci80RHzNR30zh1E";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, David.Laight@ACULAB.COM
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org
Message-ID: <0794cfd5-b36d-e0c4-d824-56beb1a6da07@suse.de>
Subject: Re: [PATCH 0/3] fbdev/hitfb: Various fixes
References: <20230606104056.29553-1-tzimmermann@suse.de>
In-Reply-To: <20230606104056.29553-1-tzimmermann@suse.de>

--------------W9Bn0svwDci80RHzNR30zh1E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsZ2UsIGRvIHlvdSB0YWtlIHRoZXNlIHBhdGNoZXM/DQoNCkFtIDA2LjA2LjIzIHVtIDEy
OjQwIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+IEZpeCBhIG51bWJlciBvZiBtaW5v
ciB3YXJuaW5ncyBpbiB0aGUgaGl0ZmIgZHJpdmVyLiBJIGRpc2NvdmVyZWQNCj4gdGhlbSB3
aGlsZSB3b3JraW5nIG9uIGJiNDdmMjE4ZmQwMSAoImZiZGV2L2hpdGZiOiBDYXN0IEkvTyBv
ZmZzZXQNCj4gdG8gYWRkcmVzcyIpLg0KPiANCj4gVGhvbWFzIFppbW1lcm1hbm4gKDMpOg0K
PiAgICBmYmRldi9oaXRmYjogRGVjbGFyZSBoaXRmYl9ibGFuaygpIGFzIHN0YXRpYw0KPiAg
ICBmYmRldi9oaXRmYjogRml4IGludGVnZXItdG8tcG9pbnRlciBjYXN0DQo+ICAgIGZiZGV2
L2hpdGZiOiBVc2UgTlVMTCBmb3IgcG9pbnRlcnMNCj4gDQo+ICAgZHJpdmVycy92aWRlby9m
YmRldi9oaXRmYi5jIHwgOCArKysrLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiANCj4gYmFzZS1jb21taXQ6IDI5YzBm
MzY5ZTE3YmEwYWJmMDhjNjVjYTA2NTQxN2FlYmFiMjA4YzYNCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVy
ZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25h
bGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------W9Bn0svwDci80RHzNR30zh1E--

--------------HTGjxZ0QUQ7XEqqlJrN00Y2B
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSHMt8FAwAAAAAACgkQlh/E3EQov+Cf
Rg/9EnYieBW7THpiPGH4s1+aoiS36nzGo/gH/mBTGAXkKTnheENZv/dtkM9wE+Ixi3nI0bJfFZz4
qrXjx+dEcJJ8YbcMfxjDkr5rLNDuTb05vMieBq6P78pDD3Kl4T7s1sneEMCCLf1rpa7yaQ062iq0
g8dZCL7E275E406A6KVtVEA80iZ1JK5YrpEgLqA2H7QxtN/07RC+d8cl8GTrgh9Yd3I/dI+7V+Dy
ezv5Ou0Odax7E2TJzBZE28xBB60dW12a4UJEHk4FM/LpRuS61V6Jx5kmBGqzJzGFDvDPb3adWdiT
UWuRrTecdK9j9/XPQRNXa+e65ugbhMX/5vEFMl9k6mcxoIU0ZYydpDTflSRcxekHQy37DxUSo546
KhomKHcwWiDQPrOWpcFzy+vkj8RnpBn3l3+Pk63bFp8xvW3GR0RkRpHGPwicD7N7xEOlJedqWp/W
oXZZr7HOeDx67RhWMsF4LrHwUIVgtaNu7nxSNKm/wAqu3ZlpBfXcCl6AdDj6iRW21liL6wxRObwn
SEd7M4saz2UqSjp8WswTQybyQ9VwY63rHHgnNUGe2ogryj8utfJKPG14trPuX/G/tKa+nt24mtOj
bd9hM2zqcGkL9COtZwRt1Hv7gwG4Y/5+Gc97ZSt76e9QTQ4kotF4lHCMfoVtZk4WEB95IavF89bX
Ibk=
=8e5w
-----END PGP SIGNATURE-----

--------------HTGjxZ0QUQ7XEqqlJrN00Y2B--
