Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 602FA6A98FE
	for <lists+linux-sh@lfdr.de>; Fri,  3 Mar 2023 15:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbjCCOAy (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Fri, 3 Mar 2023 09:00:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbjCCOAv (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Fri, 3 Mar 2023 09:00:51 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83B65FEA5
        for <linux-sh@vger.kernel.org>; Fri,  3 Mar 2023 06:00:49 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id w23so2853210qtn.6
        for <linux-sh@vger.kernel.org>; Fri, 03 Mar 2023 06:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677852049;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+hr8eoKRthmUNyUaF1r41naK6g2Gey9LHHGZ7Hwoa34=;
        b=K30bHFUc8EGzAM3FgrusT0L0PRF0gDSkmeMBxUFtlZSEdD04i3ujUx/dBel1mfs9vd
         Nl0Tl1lYVAOhWx5uE/TfKw4wrMl9ehpV3dV0IdxGY3zi1BiGQKyxm9whCmlHAubeIMS2
         XOW2himMc0oA6RQN6X2QYimwVI/Gh+TIoQOAXNSC/ivbaDNLPBs+8G4mneS7HiEYrSDW
         jArbuWlSPzjm0vwj8BdoSDzFP0sH17VBo5e04tnCalKm3rC/ZiLXJ6kDA5do7spq5/SF
         Rv/JmWoseUgnFxREnLwj1DN7vKshH+W7iW58AyoObqo/itPgLcDRGs2reZVwwx+RLY/3
         SHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677852049;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hr8eoKRthmUNyUaF1r41naK6g2Gey9LHHGZ7Hwoa34=;
        b=QkwDjxZXHy4PosGCocXakxdgvoRexcHk+feWQf+1dx++1a8Q5veOG/q/cAg4RqdY5z
         NAS0k29Ws+dribBiOYY7D/Hn/3pTVerMF9FaYWZVYW9UTOQh5zySrUWIupLBQpsSOxyV
         jGfhBDMmKpvVWMG0CsyQVf3oDXpEYyE3uP8ScseZ3IRwbfQMX/J+UKO+R+a7w3TFgSuf
         JKZYKVcGlFNNMfHhgs+Uyvo9mUywgb/VquQzRb1yP/2cxPgnjrqkgFfKxv3gmv/an2HG
         5sOv+B4PXItURkHvkE3tQe8AvNahDyHZFruZdWwP2/dED4akz6qgO+kdzsdQdG1xSLIq
         iNaA==
X-Gm-Message-State: AO0yUKVHsBPQl3xQTS//VoSXBBiB67d3hoGsxgnDViiK2S8bahjqMQbU
        Wvr9B8/ecHzzzmT1xsjU5oMAI1atacScIF1e5KA=
X-Google-Smtp-Source: AK7set8uUklN/xmdihr1n3yKRd33J6LbbrdU2lQQgbXKDhzNNTk+UV01jH2qU8K4ky0oNyHAZV5xiR0NcOetP0XiN9Y=
X-Received: by 2002:aed:27ce:0:b0:3bf:c0d5:a6 with SMTP id m14-20020aed27ce000000b003bfc0d500a6mr617901qtg.4.1677852048452;
 Fri, 03 Mar 2023 06:00:48 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac8:764c:0:b0:3bf:e3ac:c651 with HTTP; Fri, 3 Mar 2023
 06:00:46 -0800 (PST)
Reply-To: MarkDossou@consultant.com
From:   "MR. MARK DOSSOU" <jimkimmeroun@gmail.com>
Date:   Fri, 3 Mar 2023 15:00:46 +0100
Message-ID: <CABH0-dqs1=HE9U=sJWpQ_gf+UisDWZmRzhxiKgdKz4AS55i+Yw@mail.gmail.com>
Subject: =?UTF-8?B?ccSrbifDoGkgZGUgUMOpbmd5x5J1LA==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        MIXED_ES,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:82c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4329]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jimkimmeroun[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  1.9 MIXED_ES Too many es are not es
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

TUFSSyBET1NTT1UmIExBV0ZJUk0mIEFzc29jaWF0ZXMNCmrDuiAwMSBCUCA3NTk0DQprxJMgdHXF
jSBux5QgMDIyOSBiw6hpIG7DrW5nIGfDsm5naMOpZ3XDsw0KDQpxxKtuJ8OgaSBkZSBQw6luZ3nH
knUsDQoNCm3Em2lox45vIGRlIHnEq3RpxIFuLCBux5AgaMeObyBtYT8gV8eSIHjEq3fDoG5nIGjE
m24gaMeOby4gSMSbbiBiw6BvcWnDoG4gemjDoG55w7JuZw0KbsOtbiBkZSBzaMOtamnEgW4geceQ
asOtIHTEgSBrxJtuw6luZyBodcOsIHLDoG5nIG7DrW4gc2jFjXUgZMOgbyB3x5IgZGUgeGnEgW94
xKsgw6lyDQpnx45uZMOgbyBqxKtuZ3nDoCwgemjDqCBqdcOpZHXDrCBzaMOsIHfHkiBjaMO6bGUg
emjDqCB6aMeSbmcgZsSBbmdmx44gemjEqyB3w6BpIG3DqWl5x5J1DQpyw6huaMOpIHHDrXTEgSBm
xIFuZ2bHjiBrxJt5x5AgamnEm2p1w6kgZGUgd8OobnTDrSwgZMOgbiB3x5IgaHXDrCB3w6hpIG7D
rW4gdMOtZ8WNbmcgZ8OobmcNCmR1xY0gc3XHkiB4xasgZGUgeMOsbnjEqywgc3XHknnHknUgd8eS
IHjFq3nDoG8gZGUgc2jDrCBuw61uIHpow61kw6kgeMOsbmzDoGkgZGUgaMOpenXDsiwNCnnHkCBx
dcOoYseObyB3x5IgYseOb2jDuSB5x5AgZ8O5IGvDqGjDuSBkZSB6aMOgbmdow7kgamnDoHpow60u
DQoNClfHkiBzaMOsIHnHkCBnw7kgZ8WNbmdjaMOpbmdzaMSrIGRlIEhvbiBCYXJyaXN0ZXIgTWFy
ayBEb3Nzb3Ugc8SrcsOpbiBsx5xzaMSrLg0KQWxleCwod8eSIHnHkCBnw7kgZGUga8OoaMO5KSBz
aMOsIHnEqyBtw61uZyBodcOgeHXDqSBnxY1uZ2Now6luZ3NoxKssIHTEgSB6w6BpIDIwMTMNCm5p
w6FuIHnHlCBqacSBcsOpbiB5xKtxx5Agc8eQIHnDuiBjaMSTaHXDsi4gVMSBIHrDoGkgeMSrZsST
aSBjw7NuZ3Now6wgeceUIHl1w6FuecOzdQ0KeGnEgW5nZ3XEgW4gZGUgecOod8O5LCBkw6BuIHpo
w7kgesOgaSB3x5IgZGUgZ3XDs2ppxIEsIHfHkiBjaMeUbMeQIHTEgSBkZSBzdceSeceSdQ0KZseO
bMecIHnDqHfDuS4NCg0KWcOzdXnDuiBsacOhbmjDqSB5w61uaMOhbmcgZMeSbmdzaMOsaHXDrCB6
w6BpIHTEgSBxw7lzaMOsIGjDsnUgemjHkHNow6wgd8eSIHjDum56aMeObw0KdMSBbWVuIHnHkCBn
w7kga8OoaMO5IGRlIGTDoCBxxKtuc2jHlCwgdMSBIGppxIFuZyB6dcOyd8OpaSB0xIEgemjDoG5n
aMO5IGppw6B6aMOtIDEwLjcNCk3Em2l5dcOhbiBkZSBzaMOydXnDrCByw6luLCB5xKtuY8eQIHfH
kiBxx5BuZ3Fpw7ogbsOtbiBkZSBow6l6dcOyIHnHkCBzaMWNdWh1w60gdMSBIGRlDQp6xKtqxKtu
IGLHjmkgd8OgbiBtxJtpeXXDoW4uIFLDumd1x5Igd8eSIGLDuW7DqW5nIGrHkG5rdcOgaSB6aMeQ
ZMOsbmcgcsOobmjDqSBzaMOydXnDrA0KcsOpbiwgZ8SBaSB6aMOgbmdow7kgamnEgW5nIGLDqGkg
bcOyc2jFjXUgd8OpaSB3w7ogcsOpbiByw6hubMeQbmcgZGUgesSrasSrbiwgecSrbnfDqGkNCnTE
gSB5x5BqxKtuZyB4acWrbWnDoW5sZSBqacSBbmdqw6xuIDEwIG5pw6FuLiBZxKtuY8eQLCB3x5Ig
eMSrd8OgbmcgbsOtbiBkZSBow6l6dcOyDQp0xY1uZ2d1w7IgaMOpZseOIHpox5Bkw6xuZyBuw61u
IHp1w7J3w6lpIHNow7J1ecOsIHLDqW4gbMOhaSBxdcOoYseObyBqxKtqxKtuIGRlIMSBbnF1w6Fu
LA0KecSrbnfDqGkgd8eSIGRlIGvDqGjDuSBxw7lzaMOsIHNow60gd8OoaSBsacO6IHhpw6AgecOt
emjHlCAodMSBIGRlIMOpcnppIGTDoCB3w6hpIHNow6wNCmrDrG5xxKtuKS4gV8eSIGppxIFuZyB3
w6hpIG7DrW4gdMOtZ8WNbmcgc2jHkCBjx5AgamnEgW95w6wgaMOpZseOIGLDrG5nIHNoxJNucceQ
bmcNCnrEq2rEq24gc2jDrGbDoG5nIHN1x5IgeMWrIGRlIHN1x5J5x5J1IHhpxIFuZ2d1xIFuIHjD
rG54xKsuDQoNCkbEgXPDsm5nIGfEm2kgd8eSIHhpw6BtacOgbiBkZSB4acOhbmd4w6wgeMOsbnjE
qywNCg0KbsOtbiBkZSBxdcOhbiBtw61uZzogLi4uLi4uLi4uLi4uLi4uLi4uLi4uDQpMacOhbnjD
rCBkw6x6aMeQOiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLg0KTmnDoW5sw61uZzogLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uDQpTaMeSdWrEqyBow6BvbceOOiAuLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uDQpaaMOtecOoOiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4NCg0KR8eObnhpw6ggbsOtbiBodcSBIHNow61qacSBbiB5dcOoZMO6LCByw7pndceS
IG7DrW4gbsOpbmcgY2jHlGzHkCBox45vLCB3x5IgamnEgW5nDQpkxJtuZ2TDoGkgbsOtbiBkZSBo
dcOtZsO5LiBaaMO5ecOsOiBRx5BuZyB0xY1uZ2d1w7Igd8eSIGRlIGRpw6BueseQIHnDs3VqacOg
biBkw6x6aMeQDQooTWFya0Rvc3NvdUBjb25zdWx0YW50LkNvbSkgeGnDoG5nIHfHkiB0w61nxY1u
ZyBzaMOgbmdzaMO5IHjDrG54xKssIHnHkCBodcOycceUDQpnw6huZyBkdcWNIHhpw6FuZ3jDrCB4
w6xueMSrIGjDqSBsx5BqacSbLg0KDQpDx5B6aMOsLA0KbceOa8OowrdkdcWNIHN1x5IgeGnEgW5z
aMSTbmcNCnDDrW5nZMSbbmcgeceUIGfFjW5ncMOtbmcgbMecc2jEqyBzaMOsd8O5IHN1x5INCg==
