Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A536D57E6
	for <lists+linux-sh@lfdr.de>; Tue,  4 Apr 2023 07:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233280AbjDDFNt (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Tue, 4 Apr 2023 01:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjDDFNs (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Tue, 4 Apr 2023 01:13:48 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E541FEE
        for <linux-sh@vger.kernel.org>; Mon,  3 Apr 2023 22:13:46 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id z17so20757805vsf.4
        for <linux-sh@vger.kernel.org>; Mon, 03 Apr 2023 22:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680585225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TRl2Uqz/O7GLYtBo1DNGUo3NVBnje2uCeRXc5ekoa+U=;
        b=WMP2icHxGpUrSDDGf0T4r36MVlQZmhW5pg56/E6hTqlWsRyLqke2fTPFKZS4lm+1Bu
         m/Jrk+7WPfHOjOZ73fhlSkFzzTO6lAgoZX+VPKfn+K4uUVYB5DlUSy+SI30Un5z+yGc2
         D60rqPtb4slC/n3w2UZigpACXtAzspEQKlh6LGAHh5aC8EN0ld+hq1L/Zs0XS44lz9jp
         /yWOBnX5c/tnC9X+Zq8JabPwtvdDrX16zYl8OydNLtQ3EZm/61N6nXUudjwIwNqtuNav
         yrVQHQiDz6ezB0KdjCHMx8Npl/RkYw66yvsa+tCI3gb4Vc84g1NfAi80homvgq6UItxG
         wQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680585225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRl2Uqz/O7GLYtBo1DNGUo3NVBnje2uCeRXc5ekoa+U=;
        b=egldGTgQEYDkkFymH+7CnrEx3C+e0dJu0DYF3KowvO2msJ30RpYI5fcuaJ0MThey/W
         UPEJBsiMKCKLOWtLHROOcfdjw5GA/ciStJYWpHYhco2MFWJr/+f+5JukfEXu4Aggl95F
         qY3SM6tJj6j0dFIo/eqdHES8MkIaMQ+JjYZUN4WEUDoznJT5UV0R0L73wAm+sONwO/qY
         lYO5FlhlPCcFdy6i05issb3+oWGZdZZzQoy9kweW6O8hSLZyO4KJuKqu5DqoOnioq/cQ
         BcEY/Pmx/w5dtwPvm7kwyhL4wqyFmEpLrXfz+/yv9fVEQV6+D+zitd6UNM0RauHWUgI4
         oeBw==
X-Gm-Message-State: AAQBX9dXaf/1siBBSFnDi7NwQf2sVaGspd6q4deKLN20O0U/xpsDrixJ
        SbAaMBuNxhtHLY7c/ebfp2lW+VIRvQvbLh2h/HlJBg==
X-Google-Smtp-Source: AKy350bRiQUnXmt4B0hrBSKllxGHN0MEKhGLd1lj0axpGNgh3kdy9VcHpLO9rtm6oL/lW8K3WEikHG3Knv2WDLZOTbw=
X-Received: by 2002:a67:c20a:0:b0:416:f1ea:1001 with SMTP id
 i10-20020a67c20a000000b00416f1ea1001mr1270249vsj.5.1680585225111; Mon, 03 Apr
 2023 22:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1677579750.git.geert+renesas@glider.be> <CABVgOS=vXSuqrJ=6rbAZ1vT3Y=SR69T9EFikXKPY_hmv25riwQ@mail.gmail.com>
 <CAMuHMdX4_FBsSYMF3Yvw3v_g6tdS=WVJGeuPmH3XRUiyYNBPmQ@mail.gmail.com> <CABVgOSkFoDhu6y5ZfmetKnu5CXw3cOpBnpCAYmnS6ffANMNJ2g@mail.gmail.com>
In-Reply-To: <CABVgOSkFoDhu6y5ZfmetKnu5CXw3cOpBnpCAYmnS6ffANMNJ2g@mail.gmail.com>
From:   David Gow <davidgow@google.com>
Date:   Tue, 4 Apr 2023 13:13:32 +0800
Message-ID: <CABVgOSmgpkktiLkU-ic0xGitDOhep+3sb5X91hb8RNEzFauhAA@mail.gmail.com>
Subject: Re: [PATCH 0/2] kunit: tool: Add support for SH under QEMU
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Brendan Higgins <brendan.higgins@linux.dev>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-sh@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="00000000000060c1f105f87bbd44"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

--00000000000060c1f105f87bbd44
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 4 Mar 2023 at 13:33, David Gow <davidgow@google.com> wrote:
>
> On Fri, 3 Mar 2023 at 15:42, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
> >
> > Hi David,
> >
> > On Fri, Mar 3, 2023 at 8:26=E2=80=AFAM David Gow <davidgow@google.com> =
wrote:
> > > On Tue, 28 Feb 2023 at 18:31, Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > > This patch series adds support to run tests via kunit_tool on the
> > > > SuperH-based virtualized r2d platform.  As r2d uses the second seri=
al
> > > > port as the console, this needs a small modification of the core
> > > > infrastructure.
> > > >
> > > > Thanks for your comments!
> > >
> > > This series looks good to me, but I've not been able to successfully
> > > get qemu to boot anything on SuperH (it just seems to hang with no
> > > output).
> > >
> > > Is there anything like magic config or firmware images (I didn't thin=
k
> > > so for r2d: shix prints out an error, though) required to get this
> > > going?
> >
> > No idea. I thought it just works.
> >
>
> Strange: I'm not able to get anything to boot here, regardless of the
> versions I use.
>
> I'm definitely not convinced that it's a qemu issue, as opposed to a
> kernel issue, but either way I can't get anything to boot.
>
> > > The qemu command KUnit is using seems correct (and none of the obviou=
s
> > > permutations, particularly around the serial ports seem to help):
> > > qemu-system-sh4 -nodefaults -m 1024 -kernel .kunit/arch/sh/boot/zImag=
e
> > > -append 'kunit.enable=3D1 console=3DttySC1 kunit_shutdown=3Dreboot'
> > > -no-reboot -nographic -serial null -machine r2d -serial mon:stdio
> >
> > That works just fine for me.
> >
> > On plain v6.2 with this series applied:
> > $ ./tools/testing/kunit/kunit.py run --arch=3Dsh
> > --cross_compile=3Dsh4-linux-gnu- --raw_output=3Dall --kunitconfig
> > fs/ext4/.kunitconfig
> > [08:38:59] Configuring KUnit Kernel ...
> > Regenerating .config ...
> > Populating config with:
> > $ make ARCH=3Dsh O=3D.kunit olddefconfig CROSS_COMPILE=3Dsh4-linux-gnu-
> > [08:39:01] Building KUnit Kernel ...
> > Populating config with:
> > $ make ARCH=3Dsh O=3D.kunit olddefconfig CROSS_COMPILE=3Dsh4-linux-gnu-
> > Building with:
> > $ make ARCH=3Dsh O=3D.kunit --jobs=3D12 CROSS_COMPILE=3Dsh4-linux-gnu-
> > <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp=
]
> > [... more warnings ...]
> > [08:39:51] Starting KUnit Kernel (1/1)...
> > Running tests with:
> > $ qemu-system-sh4 -nodefaults -m 1024 -kernel
> > .kunit/arch/sh/boot/zImage -append 'kunit.enable=3D1 console=3DttySC1
> > kunit_shutdown=3Dreboot' -no-reboot -nographic -serial null -machine r2=
d
> > -serial mon:stdio
> > Linux version 6.2.0-00002-g5b394444bb0d (geert@rox) (sh4-linux-gnu-gcc
> > (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0, GNU ld (GNU Binutils for
> > Ubuntu) 2.38) #3 Fri Mar  3 08:39:50 CET 2023
> > ...
> >
>
> I see the same issue with a clean 6.2 and these patches, with both
> "sh4-linux-gnu-gcc (Debian 12.2.0-10) 12.2.0" and
> "sh4-linux-gnu-gcc-11 (Debian 11.3.0-8) 11.3.0".
>

Looks like this is an issue with the compiler in Debian testing.

Broken (Debian Testing):
sh4-linux-gnu-gcc (Debian 12.2.0-10) 12.2.0
Works (From https://mirrors.edge.kernel.org/pub/tools/crosstool/ ):
sh4-linux-gcc (GCC) 12.2.0
Works (Debian Stable):
sh4-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110

I'll leave debugging it here, as my SuperH knowledge is nonexistant,
but there's definitely something going wrong.

Cheers,
-- David

--00000000000060c1f105f87bbd44
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
64VRg2IjDI2fJVE9RD6aMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQA2lZLYRLu7foeR
cHo1VeNA974FZBiCm08Kd44/aCMEzdTJvxAE9xbUJf7hS1i6eW49qxuSp3/YLn6U7uatwAcmZcwp
Zma19ftf3LH+9Hvffk+X8fbPKe6uHkJhR2LktrhRzF159jj67NvXyGQv8J4n7UNeEVP0d5ByvRwv
tF2bJwlOwRGLoxasKSyDHIyUpwTfWYPq7XvjoGqQ/tDS7Khcc5WncJl0/ZEj7EKjtoGbsDbLdXEF
m/6vdcYKJzF9ghHewtV3YIU4RE3pEM4aCWWRtJwbExzeue6fI7RqURbNCAyQuSpWv0YQvzsX3ZX3
c1otrs50n1N0Sf8/rfJxq7sWMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABxy1wm0tAmHKHFkLS9RWPMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCBi
IYhGNY55FVf4wMoDU26Gg4UdqsfP0RKRbOJMRr+PaDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzA0MDQwNTEzNDVaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAvJzIUDQliGNV17QaFyeN
zJEeM2G5HH8Ph83sGjMwiV6NNIgAiCJF20bA90s6bjOMbcTVgKEQdFhBYVz7fBdmdI/WeqM/KohY
47MnEgMqBrZCiwcPmc2h2EMzd7lC3qTIdLl9kWWyY8LLf1IaKvpTogsrtQ7fFAgsA8oQLZhigaNo
lw9BCcwcypVnLIdRVYVryNY8IAD8RKdXYHjn7xBMye/8x35g+cXvJwFtIROWMF07zRrQ3Vr1ee2Z
UQSUzQ1u5ERA88+pmO/v8aQnRo04N2eAwDbjGKh8R9FQc8Ozw7pcpvZ2OMkJYDpjv/gZZJnk5LuV
5Q7yIsc9RXH4EcG14w==
--00000000000060c1f105f87bbd44--
