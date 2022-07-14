Return-Path: <linux-sh-owner@vger.kernel.org>
X-Original-To: lists+linux-sh@lfdr.de
Delivered-To: lists+linux-sh@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28799574740
	for <lists+linux-sh@lfdr.de>; Thu, 14 Jul 2022 10:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237536AbiGNIiS (ORCPT <rfc822;lists+linux-sh@lfdr.de>);
        Thu, 14 Jul 2022 04:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237121AbiGNIhg (ORCPT
        <rfc822;linux-sh@vger.kernel.org>); Thu, 14 Jul 2022 04:37:36 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B9C402CD
        for <linux-sh@vger.kernel.org>; Thu, 14 Jul 2022 01:37:26 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id r9so1312530ljp.9
        for <linux-sh@vger.kernel.org>; Thu, 14 Jul 2022 01:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=H3bGT1ZyGPu3PRQJlJHyQI9TvTjBPuNSyHjFOzNfiP0=;
        b=J0C5tcFK8Bsw7pMq1nMAL6sdoStigBR9aFqZZ+Mv4XzX+F+kt7b7xx6EPFT88UhKpI
         kBJg6m0pw05b7mYI7xFk3y27fB/wwT/6jCavLEbyVqHB+S37RGI5aNKsBEs4/0xD+4Gl
         dnrOfeidZ2Bjx3SaNbFd4ktoUgdwr7Dcs2Tcvwa7nAAsnsUMCwiG45d7U0q6bXatl+2j
         G/TCOWtyuktyu9a8WxRgq1M0J9ZJ9HxUuORsh15wLWXF5B7k7VM4JEubaWoOuGw+8Ew9
         I+DOdJn7Y4FpWZylitfSNZ47/mK7zDNBUAYRHo/WR2q5KqGUnWDh8z7oQHLUAguP0jO6
         e0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=H3bGT1ZyGPu3PRQJlJHyQI9TvTjBPuNSyHjFOzNfiP0=;
        b=Y3qkc7jvlhfDBsK02SqA+4LEsB6gSu75afaP3h3OPP6RKqHAqT+d9rLTx5E1BHbg2J
         zZ/K20496KH4l000T5wKng7HUMR69Y8uRi7Pl8u9YNd/HUHMSXrEeFOvtxoDVHtVdmzB
         E8zbWPKeZvYAmqDX/VwOtHooXYkch1bMTTXUurDMY2ii4nn/l1BX9NJ86MmvzG9xbuQO
         JlLZAR4jJAhdc2sqW89n6AcADZbeFtv8yQ7l/Zbdwd6V/CK+LIVjnG0K1jOale7rPJhW
         d1IjPfFFhkP4irPF9uxHu+s7vNz2nHsRqdPSC/DN9ViqEJHZhVvRewJ3tdGqKVpRxs3e
         HT9A==
X-Gm-Message-State: AJIora9Mk//FZVs/okXoKz3COGLHH3xfJxVHjBhRdePcaGtmBYUrEDBC
        gcTECvAdPmA6ahG/+0AwsAe3uxeX4d94hdhbPEA=
X-Google-Smtp-Source: AGRyM1thqq53eeYJvkH1/Ta7520q2hH8+3RnM5fZHteqImK/2lt+7hteHzuSn5oPP1dnqf4hz7D2JwjEVLBJgQKi7G0=
X-Received: by 2002:a2e:a9a6:0:b0:25d:601a:d3d8 with SMTP id
 x38-20020a2ea9a6000000b0025d601ad3d8mr3886457ljq.141.1657787844550; Thu, 14
 Jul 2022 01:37:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9041:0:0:0:0:0 with HTTP; Thu, 14 Jul 2022 01:37:23
 -0700 (PDT)
Reply-To: abdwabbomaddahm@gmail.com
From:   Abdwabbo Maddah <abdwabbomaddah746@gmail.com>
Date:   Thu, 14 Jul 2022 09:37:23 +0100
Message-ID: <CAFC-3icziP-G6a5x=QJeR_a=JqSdmyHCh-wuJicCvAjow3knUA@mail.gmail.com>
Subject: Get back to me... URGENT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:231 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4977]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [abdwabbomaddah746[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [abdwabbomaddah746[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sh.vger.kernel.org>
X-Mailing-List: linux-sh@vger.kernel.org

-- 
Dear,
I had sent you a mail but i don't think you received it that's why am
writing you again.It is important you get back to me as soon as you
can.
Abd-Wabbo Maddah
